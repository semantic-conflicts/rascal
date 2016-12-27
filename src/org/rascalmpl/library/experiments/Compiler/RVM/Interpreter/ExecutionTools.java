package org.rascalmpl.library.experiments.Compiler.RVM.Interpreter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.rascalmpl.interpreter.DefaultTestResultListener;
import org.rascalmpl.library.experiments.Compiler.RVM.Interpreter.Instructions.Opcode;
import org.rascalmpl.library.util.PathConfig;
import org.rascalmpl.value.IBool;
import org.rascalmpl.value.IConstructor;
import org.rascalmpl.value.ISourceLocation;
import org.rascalmpl.value.IValue;
import org.rascalmpl.value.IValueFactory;
import org.rascalmpl.value.type.TypeStore;
import org.rascalmpl.values.ValueFactoryFactory;

public class ExecutionTools {

	private static IValueFactory vf = ValueFactoryFactory.getValueFactory();
	
	public static RascalExecutionContext makeRex(
	                PathConfig pcfg,
					RVMExecutable rvmExecutable,
					PrintWriter out,
					PrintWriter err,
					IBool debug, 
					IBool debugRVM, 
					IBool testsuite, 
					IBool profile, 
					IBool trace, 
					IBool coverage, 
					IBool jvm, 
					TypeStore typestore
	) {
		return RascalExecutionContextBuilder.normalContext(pcfg, out != null ? out : new PrintWriter(System.out), err != null ? err : new PrintWriter(System.err))
			.withModuleTags(rvmExecutable.getModuleTags())
			.withSymbolDefinitions(rvmExecutable.getSymbolDefinitions())
			.withTypeStore(typestore)
			.coverage(coverage.getValue())
			.debug(debug.getValue())
			.debugRVM(debugRVM.getValue())
			.jvm(jvm.getValue())
			.profile(profile.getValue())
			.testsuite(testsuite.getValue())
			.trace(trace.getValue())
			.build();
	}
	
	public static RVMExecutable linkProgram(
					 IConstructor rvmProgram,
					 IBool jvm	
    ) throws IOException {
		
		return link(rvmProgram, jvm);
	}
	
	// Read a RVMExecutable from file
	
	public static RVMExecutable load(ISourceLocation rvmExecutableLoc, TypeStore typeStore) throws IOException {
		return RVMExecutable.newRead(rvmExecutableLoc, typeStore);
	}
	
	// Create an RVMExecutable given an RVMProgram
	
	public static RVMExecutable link(
			 	IConstructor rvmProgram,
			 	IBool jvm
	) throws IOException {

		RVMLinker linker = new RVMLinker(vf);
		return linker.link(rvmProgram,	jvm.getValue());
	}
		
	public static IValue executeProgram(RVMExecutable executable, Map<String, IValue> keywordArguments, RascalExecutionContext rex){
		RVMCore rvm = rex.getJVM() ? new RVMJVM(executable, rex) : new RVMInterpreter(executable, rex);
		
		Map<IValue, IValue> moduleVariables = rex.getModuleVariables();
		
		rvm = initializedRVM(executable, rex);
		
		if(moduleVariables != null){
			for(IValue key : moduleVariables.keySet()){
				IValue newVal = moduleVariables.get(key);
				rvm.updateModuleVariable(key, newVal);
			}
		}
		
		IValue result = executeProgram(rvm, executable, keywordArguments, rex);
		rex.setModuleVariables(rvm.getModuleVariables());
		return result;
	}
	
	/**
	 * @param executable		RVM exectable
	 * @param keywordArguments	map of actual keyword parameters
	 * @param rex				Execution context
	 * @return					Result of executing program with given parameters in given context
	 */
	public static IValue executeProgram(RVMCore rvm, RVMExecutable executable, Map<String, IValue> keywordArguments, RascalExecutionContext rex){
		
		IValue[] arguments = new IValue[0];

		//try {
			//long start = Timing.getCpuTime();
			IValue result = null;
			String uid_module_init = executable.getUidModuleInit();
			if(!uid_module_init.isEmpty()){
              rvm.executeRVMProgram("INIT", executable.getUidModuleInit(), arguments, keywordArguments);
            }
			if(rex.getTestSuite()){
				/*
				 * Execute as testsuite
				 */
				result = executable.executeTests(new DefaultTestResultListener(rex.getStdOut()), rex);

			} else {
				/*
				 * Standard execution of main function
				 */
				if(executable.getUidModuleMain().equals("")) {
					throw RascalRuntimeException.noMainFunction(null);
					//throw new RuntimeException("No main function found");
				}
				String moduleName = executable.getModuleName();
//				if(!uid_module_init.isEmpty()){
//					rvm.executeRVMProgram(moduleName, executable.getUidModuleInit(), arguments, hmKeywordArguments);
//				}
				//System.out.println("Initializing: " + (Timing.getCpuTime() - start)/1000000 + "ms");
				result = rvm.executeRVMProgram(moduleName, executable.getUidModuleMain(), arguments, keywordArguments);
			}
			//long now = Timing.getCpuTime();
			MuPrimitive.exit(rvm.getStdOut());
			RascalPrimitive.exit(rex);
			Opcode.exit();
			rvm.getFrameObserver().report();

			//rex.printCacheStats();
			//System.out.println("Executing: " + (now - start)/1000000 + "ms");
			return (IValue) result;
			
//		} catch(Thrown e) {
//			e.printStackTrace(rex.getStdErr());
//			return vf.tuple(vf.string("Runtime exception: " + e.value), vf.integer(0));
//		}
	}
	
	/**
	 * @param executable	RVM exectable
	 * @return				an initialized RVM instance
	 */
	public static RVMCore initializedRVM(RVMExecutable executable, RascalExecutionContext rex){

	  RVMCore rvm = rex.getJVM() ? new RVMJVM(executable, rex) : new RVMInterpreter(executable, rex);

	  // Execute initializers of imported modules
	  for(String initializer: executable.getInitializers()){
	    rvm.executeRVMProgram(executable.getModuleName(), initializer, new IValue[0], null);
	  }

	  return rvm;
	}

	/**
	 * Create initialized RVM given a scheme and path of a compiled binary
	 * @param scheme of compiled binary
	 * @param path of compiled binary
	 * @param rex the execution context to be used
	 * @return initialized RVM
	 * @throws IOException 
	 */
	public static RVMCore initializedRVM(ISourceLocation bin,  RascalExecutionContext rex) throws IOException {
	  RVMExecutable rvmExecutable  = RVMExecutable.newRead(bin, rex.getTypeStore());

	  RVMCore rvm = rex.getJVM() ? new RVMJVM(rvmExecutable, rex) : new RVMInterpreter(rvmExecutable, rex);

	  // Execute initializers of imported modules
	  for(String initializer: rvmExecutable.getInitializers()){
	    rvm.executeRVMProgram(rvmExecutable.getModuleName(), initializer, new IValue[0], null);
	  }

	  return rvm;
	}
}
