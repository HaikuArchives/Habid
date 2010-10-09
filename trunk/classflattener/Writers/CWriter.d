module Writers.CWriter;

import Parser.InterfaceParser;
import Parser.ClassInfo;

import tango.io.FilePath;
import tango.io.device.File;

import tango.io.Stdout;

import Util = tango.text.Util;
import Ascii = tango.text.Ascii;

char [][] licenseBuffer;
char [][] includeBuffer;
char [][] bridgeBuffer;
char [][] proxyBuffer;
char [][] exportBuffer;

void buildC()
{
    InputFile inputFile = InterfaceParser.getInputFile();

    licenseBuffer = inputFile.buildLicense();

    buildIncludes(inputFile);

    foreach(classInfo; inputFile.fClasses) {
        if(classInfo.hasPureVirtual || classInfo.hasVirtual) {
            buildCBridgeClass(classInfo);
            buildCProxyClass(classInfo);
        }

        buildCExports(classInfo);
    }

    print();
}

void buildIncludes(InputFile inputFile) {
    foreach(include; inputFile.fIncludeFiles) {
    	if(include.isSourceTarget()) {
        	char [] tmpBuffer = "#include ";
        	if(Ascii.toLower(include.typeString.dup) == "system")
           		tmpBuffer ~= "<" ~ include.nameString ~ ">";
        	else
            	tmpBuffer ~= "\"" ~ include.nameString ~ "\"";

        	includeBuffer ~= tmpBuffer.dup;
    	}
    }
}

void buildCBridgeClass(InterfaceClassInfo classInfo) {
    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            bridgeBuffer ~= classInfo.nameString ~ "Bridge::" ~ classInfo.nameString ~ "Bridge(" ~ memberFunc.buildArguments(true) ~ ")";
            bridgeBuffer ~= ": " ~ classInfo.nameString ~ "(" ~ memberFunc.buildArguments(false) ~ ")";
            bridgeBuffer ~= "{{";

            bridgeBuffer ~= "}";
        } else if(memberFunc.isDestructor) {
            bridgeBuffer ~= classInfo.nameString ~ "Bridge::~" ~ classInfo.nameString ~ "Bridge() {{ }";
        }

        if(memberFunc.isPureVirtual) {
            bridgeBuffer ~= memberFunc.getReturnString(false) ~ " " ~ classInfo.nameString ~ "Bridge::" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(true) ~ ")" ~ memberFunc.mod ~ "{{ }";
        }
    }
}

void buildCProxyClass(InterfaceClassInfo classInfo) {
    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            proxyBuffer ~= classInfo.nameString ~ "Proxy::" ~ classInfo.nameString ~ "Proxy(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? (", " ~ memberFunc.buildArguments(true)) : "") ~ ")";
            char [] tmpBuffer;
            if(classInfo.countInherits() > 0) {
                foreach(inheritno, inherit; classInfo.inherits) {
                    InputFile file = InterfaceParser.getInputFile(inherit.nameString);

                    if(file !is null) {
                        if(inheritno > 0)
                            tmpBuffer ~= ", ";

                        InterfaceClassInfo otherClass = file.findClass(inherit.nameString);


                        if(otherClass !is null) {
                            MemberFunction func = otherClass.getMemberFunction(memberFunc.nameString ~ memberFunc.postfixString);

							if(func is null)
								func = otherClass.getMemberFunction(memberFunc.nameString);

                            if(func !is null) {
                                if(otherClass.hasPureVirtual || otherClass.hasVirtual)
                                    tmpBuffer ~= otherClass.nameString ~ "Proxy(bindInstPtr" ~ (func.argCount > 0 ? (", " ~ func.buildArguments(false)) : "") ~ ")";
                            }
                        }
                    } else {
                        if(inheritno > 0)
                            tmpBuffer ~= ", ";

                        if(InterfaceParser.getInputFile(inherit.nameString) !is InterfaceParser.getInputFile()) {
                            assert(false, "No reference to " ~ inherit.nameString ~ " Anywhere :/");
                        }
                        else
                            tmpBuffer ~= inherit.nameString ~ "Proxy(bindInstPtr" ~ (memberFunc.argCount > 0 ? (", " ~ memberFunc.buildArguments(false)) : "") ~ ")";

                    }
                }

                if(tmpBuffer.length > 0)
                    tmpBuffer ~= ", ";

                proxyBuffer ~= ": fBindInstPtr(bindInstPtr), " ~ tmpBuffer.dup ~ classInfo.nameString ~ "Bridge(" ~ memberFunc.buildArguments(false) ~ ") {{ }\n";
            }
            else
                proxyBuffer ~= ": fBindInstPtr(bindInstPtr), " ~ classInfo.nameString ~ "Bridge(" ~ memberFunc.buildArguments(false) ~ ") {{ }\n";

        } else if(memberFunc.isDestructor) {
            proxyBuffer ~= classInfo.nameString ~ "Proxy::~" ~ classInfo.nameString ~ "Proxy() {{ }\n";
        }

        if(memberFunc.isPureVirtual || memberFunc.isVirtual) {
            proxyBuffer ~= memberFunc.getReturnString(false) ~ " " ~ classInfo.nameString ~ "Proxy::" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(true) ~ ") " ~ memberFunc.mod;
            proxyBuffer ~= "{{";
            proxyBuffer ~= "\t" ~ (memberFunc.returnString == "void" ? "" : "return") ~ " bind_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(fBindInstPtr" ~ (memberFunc.argCount > 0 ? ", " :  "") ~ memberFunc.buildArguments(false, true, true) ~ ");";
            proxyBuffer ~= "}\n";

            proxyBuffer ~= memberFunc.getReturnString(false) ~ " " ~ classInfo.nameString ~ "Proxy::" ~ memberFunc.nameString ~ "_super(" ~ memberFunc.buildArguments(true) ~ ") " ~ memberFunc.mod;
            proxyBuffer ~= "{{";
            proxyBuffer ~= "\t" ~ (memberFunc.returnString == "void" ? "" : "return") ~ " " ~ classInfo.nameString ~ (memberFunc.isPureVirtual ? "Bridge" : "") ~ "::" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(false, false, false) ~ ");";
            proxyBuffer ~= "}\n";
        }
    }
}

void buildCExports(InterfaceClassInfo classInfo) {
    exportBuffer ~= "extern \"C\" {{";

    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            exportBuffer ~= "\t" ~ classInfo.nameString ~" *be_" ~ classInfo.nameString ~ "_ctor" ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ")";
            exportBuffer ~= "\t{{";
            exportBuffer ~= "\t\treturn (" ~ classInfo.nameString ~ "* )new " ~ classInfo.nameString ~ ((classInfo.hasPureVirtual || classInfo.hasVirtual) ? ("Proxy(bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "")) : "(") ~ memberFunc.buildArguments(false, true) ~ ");";
            exportBuffer ~= "\t}\n";
        } else if(memberFunc.isDestructor) {
            exportBuffer ~= "\tvoid be_" ~ classInfo.nameString ~ "_dtor(" ~ classInfo.nameString ~ " *self)";
            exportBuffer ~= "\t{{";
            exportBuffer ~= "\t\tdelete self;";
            exportBuffer ~= "\t}\n";
        } else if(memberFunc.isOperator) {
            exportBuffer ~= "\t" ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.getOperatorName() ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ")";
            exportBuffer ~= "\t{{";
            if(InterfaceParser.isClass(memberFunc.returnString) && !Util.contains(memberFunc.returnString, '&') && !Util.contains(memberFunc.returnString, '*'))
            	exportBuffer ~= "\t\t return new " ~ memberFunc.returnString ~ "("  ~ (memberFunc.returnIsRef() ? "&" : "") ~ "self->" ~ memberFunc.nameString ~ ((memberFunc.isVirtual || memberFunc.isPureVirtual) ? "_super" : "") ~ "(" ~ memberFunc.buildArguments(false, true) ~ "));";
            else
            	exportBuffer ~= "\t\t" ~ (memberFunc.returnString == "void" ? "" : "return ") ~ (memberFunc.returnIsRef() ? "&" : "") ~ "self->" ~ memberFunc.nameString ~ ((memberFunc.isVirtual || memberFunc.isPureVirtual) ? "_super" : "") ~ "(" ~ memberFunc.buildArguments(false, true) ~ ");";
            exportBuffer ~= "\t}\n";
        } else if(memberFunc.isVariable) {
            exportBuffer ~= "\tvoid be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varSet(" ~ classInfo.nameString ~ " *self, " ~ memberFunc.getReturnString(true) ~ " " ~ memberFunc.nameString ~ ")";
            exportBuffer ~= "\t{{";
            exportBuffer ~= "\t\tself->" ~ memberFunc.nameString ~ " = " ~ memberFunc.nameString ~ ";";
            exportBuffer ~= "\t}\n";

            exportBuffer ~= "\t" ~ memberFunc.returnString ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varGet(" ~ classInfo.nameString ~ " *self)";
            exportBuffer ~= "\t{{";
            exportBuffer ~= "\t\treturn self->" ~ memberFunc.nameString ~ ";";
            exportBuffer ~= "\t}";
        } else if(memberFunc.isStatic) {
            exportBuffer ~= "\t" ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "_static(" ~ memberFunc.buildArguments(true, true) ~ ")";
            exportBuffer ~= "\t{{";
            exportBuffer ~= "\t\t" ~ (memberFunc.returnString == "void" ? "" : "return ") ~ classInfo.nameString ~ "::" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(false, true, false, true) ~ ");";
            exportBuffer ~= "\t}\n";
        } else {
            if(memberFunc.isVirtual || memberFunc.isPureVirtual) {
                exportBuffer ~= "\t" ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ")";
                exportBuffer ~= "\t{{";
                exportBuffer ~= "\t\t" ~ classInfo.nameString ~ "Proxy *proxy = dynamic_cast<" ~ classInfo.nameString ~ "Proxy *>(self);";
                if(InterfaceParser.isClass(memberFunc.returnString) && !Util.contains(memberFunc.returnString, '&') && !Util.contains(memberFunc.returnString, '*'))
                    exportBuffer ~= "\t\t" ~ "return new " ~ memberFunc.returnString ~ "(" ~ (memberFunc.returnIsRef() ? "&" : "") ~ "self->" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(false, true) ~ "));";
                else {
                    exportBuffer ~= "\t\tif(proxy)";
                    exportBuffer ~= "\t\t\t"~ (memberFunc.returnString == "void" ? "" : "return ") ~ (memberFunc.returnIsRef() ? "&" : "") ~ "proxy->" ~ memberFunc.nameString ~ "_super(" ~ memberFunc.buildArguments(false, true, false, true) ~ ");";
                    exportBuffer ~= "\t\telse";
                    exportBuffer ~= "\t\t\t"~ (memberFunc.returnString == "void" ? "" : "return ") ~ (memberFunc.returnIsRef() ? "&" : "") ~ "self->" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(false, true, false, true) ~ ");";
                //    exportBuffer ~= "\t\t" ~ (memberFunc.returnString == "void" ? "" : "return ") ~ (memberFunc.returnIsRef() ? "&" : "") ~ "self->" ~ memberFunc.nameString ~ ((memberFunc.isVirtual || memberFunc.isPureVirtual) ? "_super" : "") ~ "(" ~ memberFunc.buildArguments(false, true, false, true) ~ ");";
                }
                exportBuffer ~= "\t}\n";
            } else {
                exportBuffer ~= "\t" ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ")";
                exportBuffer ~= "\t{{";
                if(InterfaceParser.isClass(memberFunc.returnString) && !Util.contains(memberFunc.returnString, '&') && !Util.contains(memberFunc.returnString, '*'))
                    exportBuffer ~= "\t\t" ~ "return new " ~ memberFunc.returnString ~ "(" ~ (memberFunc.returnIsRef() ? "&" : "") ~ "self->" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(false, true) ~ "));";
                else
                    exportBuffer ~= "\t\t" ~ (memberFunc.returnString == "void" ? "" : "return ") ~ (memberFunc.returnIsRef() ? "&" : "") ~ "self->" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(false, true) ~ ");";
                exportBuffer ~= "\t}\n";
            }
        }
    }

    exportBuffer ~= "}\n";
}

void print() {
    if(licenseBuffer.length > 0) {
        foreach(line; licenseBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

    if(includeBuffer.length > 0) {
        foreach(line; includeBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

    if(bridgeBuffer.length > 0) {
        foreach(line; bridgeBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

    if(proxyBuffer.length > 0) {
        foreach(line; proxyBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

    if(exportBuffer.length > 0) {
        foreach(line; exportBuffer)
            Stdout.formatln(line);
    }

    Stdout.newline;
}
