package org.meta_environment.rascal.interpreter.errors;

import org.meta_environment.rascal.ast.AbstractAST;

public class NoSuchFieldError extends Error {
	
	private static final long serialVersionUID = -7406655567412555533L;
	 
	public NoSuchFieldError(String message) {
		super("NoSuchFieldError", message);
	}
	
	public NoSuchFieldError(String message, AbstractAST node) {
		super("NoSuchFieldError", message, node);
	}
	
	public NoSuchFieldError(String message, Throwable cause) {
		super(message, cause);
	}
	
	public boolean hasCause() {
		return getCause() != null;
	}
}
