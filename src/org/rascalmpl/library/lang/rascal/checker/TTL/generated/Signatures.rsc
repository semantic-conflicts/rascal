module lang::rascal::checker::TTL::generated::Signatures
import Type;
import lang::rascal::checker::TTL::TTLsyntax;
import lang::rascal::checker::TTL::ExpressionGenerator;
public lrel[str op, Symbol result, list[Symbol] args, bool postfix] signatures1 = fixTypeParameters([<"&&",  Symbol::\bool(), [Symbol::\bool(), Symbol::\bool()], false>,
                                                                                                    <"||",  Symbol::\bool(), [Symbol::\bool(), Symbol::\bool()], false>,
                                                                                                    <"\<==\>",  Symbol::\bool(), [Symbol::\bool(), Symbol::\bool()], false>,
                                                                                                    <"==\>",  Symbol::\bool(), [Symbol::\bool(), Symbol::\bool()], false>,
                                                                                                    <"\<",  Symbol::\bool(), [Symbol::\parameter("T", Symbol::\value()), Symbol::\parameter("T", Symbol::\value())], false>,
                                                                                                    <"\<=",  Symbol::\bool(), [Symbol::\parameter("T", Symbol::\value()), Symbol::\parameter("T", Symbol::\value())], false>,
                                                                                                    <"==",  Symbol::\bool(), [Symbol::\parameter("T", Symbol::\value()), Symbol::\parameter("T", Symbol::\value())], false>,
                                                                                                    <"\>=",  Symbol::\bool(), [Symbol::\parameter("T", Symbol::\value()), Symbol::\parameter("T", Symbol::\value())], false>,
                                                                                                    <"\>",  Symbol::\bool(), [Symbol::\parameter("T", Symbol::\value()), Symbol::\parameter("T", Symbol::\value())], false>,
                                                                                                    <"+",  Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value())), [Symbol::\parameter("L", Symbol::\num()), Symbol::\parameter("R", Symbol::\num())], false>,
                                                                                                    <"+",  Symbol::\list(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\list(Symbol::\parameter("L", Symbol::\value())), Symbol::\list(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"+",  Symbol::\list(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\list(Symbol::\parameter("L", Symbol::\value())), Symbol::\parameter("R", Symbol::\value())], false>,
                                                                                                    <"+",  Symbol::\list(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\parameter("L", Symbol::\value()), Symbol::\list(Symbol::\parameter("R", Symbol::\parameter("L", Symbol::\value())))], false>,
                                                                                                    <"+",  Symbol::\set(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\set(Symbol::\parameter("L", Symbol::\value())), Symbol::\set(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"+",  Symbol::\set(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\set(Symbol::\parameter("L", Symbol::\value())), Symbol::\parameter("R", Symbol::\value())], false>,
                                                                                                    <"+",  Symbol::\set(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\parameter("L", Symbol::\value()), Symbol::\set(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"+",  Symbol::\map(Symbol::\LUB(Symbol::\parameter("K1", Symbol::\value()),Symbol::\parameter("K2", Symbol::\value())),Symbol::\LUB(Symbol::\parameter("V1", Symbol::\value()),Symbol::\parameter("V2", Symbol::\value()))), [Symbol::\map(Symbol::\parameter("K1", Symbol::\value()),Symbol::\parameter("V1", Symbol::\value())), Symbol::\map(Symbol::\parameter("K2", Symbol::\value()),Symbol::\parameter("V2", Symbol::\value()))], false>,
                                                                                                    <"+",  Symbol::\str(), [Symbol::\str(), Symbol::\str()], false>,
                                                                                                    <"+",  Symbol::\loc(), [Symbol::\loc(), Symbol::\str()], false>,
                                                                                                    <"+",  Symbol::\tuple([Symbol::\parameter("L1", Symbol::\value()),Symbol::\parameter("L2", Symbol::\value()),Symbol::\parameter("R1", Symbol::\value()),Symbol::\parameter("R2", Symbol::\value()),Symbol::\parameter("R3", Symbol::\value())]), [Symbol::\tuple([Symbol::\parameter("L1", Symbol::\value()),Symbol::\parameter("L2", Symbol::\value())]), Symbol::\tuple([Symbol::\parameter("R1", Symbol::\value()),Symbol::\parameter("R2", Symbol::\value()),Symbol::\parameter("R3", Symbol::\value())])], false>,
                                                                                                    <"-",  Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value())), [Symbol::\parameter("L", Symbol::\num()), Symbol::\parameter("R", Symbol::\num())], false>,
                                                                                                    <"-",  Symbol::\list(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\list(Symbol::\parameter("L", Symbol::\value())), Symbol::\list(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"-",  Symbol::\set(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\set(Symbol::\parameter("L", Symbol::\value())), Symbol::\set(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"-",  Symbol::\map(Symbol::\LUB(Symbol::\parameter("K1", Symbol::\value()),Symbol::\parameter("K2", Symbol::\value())),Symbol::\LUB(Symbol::\parameter("V1", Symbol::\value()),Symbol::\parameter("V2", Symbol::\value()))), [Symbol::\map(Symbol::\parameter("K1", Symbol::\value()),Symbol::\parameter("V1", Symbol::\value())), Symbol::\map(Symbol::\parameter("K2", Symbol::\value()),Symbol::\parameter("V2", Symbol::\value()))], false>,
                                                                                                    <"*",  Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value())), [Symbol::\parameter("L", Symbol::\num()), Symbol::\parameter("R", Symbol::\num())], false>,
                                                                                                    <"*",  Symbol::\lrel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value())]), [Symbol::\list(Symbol::\parameter("L", Symbol::\value())), Symbol::\list(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"*",  Symbol::\rel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value())]), [Symbol::\set(Symbol::\parameter("L", Symbol::\value())), Symbol::\set(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"&",  Symbol::\list(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\list(Symbol::\parameter("L", Symbol::\value())), Symbol::\list(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"&",  Symbol::\set(Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value()))), [Symbol::\set(Symbol::\parameter("L", Symbol::\value())), Symbol::\set(Symbol::\parameter("R", Symbol::\value()))], false>,
                                                                                                    <"&",  Symbol::\map(Symbol::\LUB(Symbol::\parameter("K1", Symbol::\value()),Symbol::\parameter("K2", Symbol::\value())),Symbol::\LUB(Symbol::\parameter("V1", Symbol::\value()),Symbol::\parameter("V2", Symbol::\value()))), [Symbol::\map(Symbol::\parameter("K1", Symbol::\value()),Symbol::\parameter("V1", Symbol::\value())), Symbol::\map(Symbol::\parameter("K2", Symbol::\value()),Symbol::\parameter("V2", Symbol::\value()))], false>,
                                                                                                    <"%",  Symbol::\int(), [Symbol::\int(), Symbol::\int()], false>,
                                                                                                    <"/",  Symbol::\LUB(Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("R", Symbol::\value())), [Symbol::\parameter("L", Symbol::\num()), Symbol::\parameter("R", Symbol::\num())], false>,
                                                                                                    <"o",  Symbol::\lrel([Symbol::\parameter("A", Symbol::\value()),Symbol::\parameter("C", Symbol::\value())]), [Symbol::\lrel([Symbol::\parameter("A", Symbol::\value()),Symbol::\parameter("B", Symbol::\value())]), Symbol::\lrel([Symbol::\parameter("B", Symbol::\value()),Symbol::\parameter("C", Symbol::\value())])], false>,
                                                                                                    <"o",  Symbol::\rel([Symbol::\parameter("A", Symbol::\value()),Symbol::\parameter("C", Symbol::\value())]), [Symbol::\rel([Symbol::\parameter("A", Symbol::\value()),Symbol::\parameter("B", Symbol::\value())]), Symbol::\rel([Symbol::\parameter("B", Symbol::\value()),Symbol::\parameter("C", Symbol::\value())])], false>,
                                                                                                    <"o",  Symbol::\map(Symbol::\parameter("A", Symbol::\value()),Symbol::\parameter("C", Symbol::\value())), [Symbol::\map(Symbol::\parameter("A", Symbol::\value()),Symbol::\parameter("B", Symbol::\value())), Symbol::\map(Symbol::\parameter("B", Symbol::\value()),Symbol::\parameter("C", Symbol::\value()))], false>, <"!",  Symbol::\bool(), [Symbol::\bool()], false>,
<"-",  Symbol::\parameter("L", Symbol::\value()), [Symbol::\parameter("L", Symbol::\num())], false>, <"+",  Symbol::\lrel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())]), [Symbol::\lrel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())])], true>,
<"+",  Symbol::\rel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())]), [Symbol::\rel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())])], true>,
<"*",  Symbol::\lrel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())]), [Symbol::\lrel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())])], true>,
<"*",  Symbol::\rel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())]), [Symbol::\rel([Symbol::\parameter("L", Symbol::\value()),Symbol::\parameter("L", Symbol::\value())])], true>]);
          