/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Writers.CWriter;

import Parser.ClassInfo;

import tango.io.Stdout;

import Parser.InterfaceParser;

char [][] exportBuffer;
char [][] bindBuffer;

char [][] classBuffer;
char [][] includeBuffer;

bool buildOutput(InterfaceClassInfo [] ci) {
    buildIncludes();

    foreach(interfaceclass; ci) {
        if(interfaceclass.hasPureVirtual)
            buildBridgeClass(interfaceclass);

        if(interfaceclass.hasVirtual || interfaceclass.hasPureVirtual)
            buildProxyClass(interfaceclass);

        buildBindingExports(interfaceclass);
        buildExports(interfaceclass);
    }

/*
    }
*/
    return true;
}

void buildIncludes() {
    foreach(include; InterfaceParser.getIncludes()) {
        if(include.typeString == "system")
            includeBuffer ~= "#include <" ~ include.nameString ~ ">";
        else
            includeBuffer ~= "#include \"" ~ include.nameString ~ "\"";
    }
}

char [] buildArguments(in MemberFunction memberFunc, bool withType = true, char [] extraArg = "", bool replace = false) {
    char [] buffer;
    if(extraArg != "")
        buffer ~= extraArg;

    foreach(argno, arg; memberFunc.arguments) {
        if(argno > 0 || extraArg != "")
            buffer ~= ", ";

        if(withType)
            buffer ~= arg.typeString ~ " " ~ arg.nameString;
        else {
            if(replace) {
                if(arg.isRef)
                    buffer ~= "*" ~ arg.nameString;
                else
                    buffer ~= arg.nameString;
            }
            else
                buffer ~= arg.nameString;
        }
    }

    if(replace)
        Util.replace(buffer, '&', '*');

    return buffer.dup;
}

char [] buildInherits(in InterfaceClassInfo classInfo, MemberFunction *memberFunc = null)
{
    char [] buffer;
    foreach(inheritno, inherit; classInfo.inherits) {
        InterfaceClassInfo *otherClass = InterfaceParser.findClass(inherit.nameString);

        if(otherClass.hasVirtual || otherClass.hasPureVirtual) {
            if(inheritno > 0)
                buffer ~= ", ";
            if(memberFunc is null)
                buffer ~= inherit.accessString ~ " " ~ inherit.nameString ~ "Proxy";

            MemberFunction otherMemberFunc;
            if(memberFunc !is null) {
                foreach(mf; otherClass.memberFunctions) {
                    if(mf.nameString == memberFunc.nameString) {
                        otherMemberFunc = mf;
                        break;
                    }
                }

	            if(otherMemberFunc.arguments.length > 0) {
    	            buffer ~= inherit.nameString ~ "Proxy(" ~ buildArguments(*memberFunc, false, "bindInstPtr") ~ ")";
        	    } else {
            	    buffer ~= inherit.nameString ~ "Proxy(bindInstPtr)";
            	}
            }
        }
    }

    if(buffer.length > 0)
        buffer ~= ",";

    return buffer.dup;
}

void buildBridgeClass(InterfaceClassInfo ci) {
    classBuffer ~= "class " ~ ci.nameString ~ "Bridge : public " ~ ci.nameString;
    classBuffer ~= "{{";
    classBuffer ~= "public:";
    foreach(mf; ci.memberFunctions) {
        char [] tmpBuffer;
        if(mf.isPureVirtual || mf.isConstructor || mf.isDestructor) {
            if(mf.isConstructor) {
                tmpBuffer ~= "\t" ~ ci.nameString ~ "Bridge(" ~ buildArguments(mf) ~ ") : " ~ ci.nameString ~ "(" ~ buildArguments(mf, false) ~ ") {{ }\n";
                classBuffer ~= tmpBuffer.dup;
                continue;
            } else if(mf.isDestructor) {
                tmpBuffer ~= "\tvirtual ~" ~ ci.nameString ~ "Bridge() {{ }";
                classBuffer ~= tmpBuffer.dup;
            } else if(mf.isPureVirtual) {
                classBuffer ~= "\tvirtual " ~ mf.returnString ~ " " ~ mf.nameString ~ "(" ~ buildArguments(mf) ~ ") " ~ mf.mod ~ " {{ }\n";
            }
        }
    }
    classBuffer ~= "};\n\n";
}

void buildProxyClass(InterfaceClassInfo ci) {
    classBuffer ~= "class " ~ ci.nameString ~ "Proxy : ";
    if(ci.hasPureVirtual)
        classBuffer ~= buildInherits(ci) ~ " public " ~ ci.nameString ~ "Bridge";
    else if(ci.hasVirtual)
        classBuffer ~= buildInherits(ci) ~ " public " ~ ci.nameString;

    classBuffer ~= "{{";
    classBuffer ~= "private: ";
    classBuffer ~= "\tvoid *fBindInstPtr;";
    classBuffer ~= "public:";
    foreach(mf; ci.memberFunctions) {
        if(mf.isPureVirtual || mf.isVirtual || mf.isConstructor || mf.isDestructor) {
            if(mf.isConstructor) {
                if(ci.hasPureVirtual) {
                    classBuffer ~= "\t" ~ ci.nameString ~ "Proxy(" ~ buildArguments(mf, true, "void *bindInstPtr") ~ ") : fBindInstPtr(bindInstPtr), " ~ buildInherits(ci, &mf) ~ ci.nameString ~ "Bridge(" ~ buildArguments(mf, false) ~ ") {{";
                    classBuffer ~= "\t}\n";
                } else if(ci.hasVirtual) {
                    classBuffer ~= "\t" ~ ci.nameString ~ "Proxy(" ~ buildArguments(mf, true, "void *bindInstPtr") ~ ") : fBindInstPtr(bindInstPtr), " ~ buildInherits(ci, &mf) ~ ci.nameString ~ "(" ~ buildArguments(mf, false) ~ ") {{";
                    classBuffer ~= "\t}\n";
                } else {
                    classBuffer ~= "\t" ~ ci.nameString ~ "Proxy(" ~ buildArguments(mf) ~ ") : " ~ ci.nameString ~ "(" ~ buildArguments(mf, false) ~ ") {{ }\n";
                }
            } else if(mf.isDestructor) {
                classBuffer ~= "\tvirtual ~" ~ ci.nameString ~ "Proxy() {{ }";
            } else if(mf.isVirtual) {
                classBuffer ~= "\tvirtual " ~ mf.returnString ~ " " ~ mf.nameString ~ "(" ~ buildArguments(mf) ~ ") " ~ mf.mod ~ " {{";
                if(mf.returnString == "void")
                    classBuffer ~= "\t\tbind_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, false, "fBindInstPtr", true) ~ ");";
                else {
                    if(Util.contains(mf.returnString, '&'))
                        classBuffer ~= "\t\treturn *bind_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, false, "fBindInstPtr", true) ~ ");";
                    else
                        classBuffer ~= "\t\treturn bind_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, false, "fBindInstPtr", true) ~ ");";

                }
                classBuffer ~= "\t}\n";

                classBuffer ~= "\tvirtual " ~ mf.returnString ~ " " ~ mf.nameString ~ "_super(" ~ buildArguments(mf) ~ ") " ~ mf.mod ~ " {{";
                if(mf.returnString == "void")
                    classBuffer ~= "\t\t" ~ ci.nameString ~ "::" ~ mf.nameString ~ "(" ~ buildArguments(mf, false) ~ ");";
                else
                    classBuffer ~= "\t\treturn " ~ ci.nameString ~ "::" ~ mf.nameString ~ "(" ~ buildArguments(mf, false) ~ ");";
                classBuffer ~= "\t}\n";
            }
        }
    }
    classBuffer ~= "};\n\n";
}

void buildBindingExports(InterfaceClassInfo ci) {
    bindBuffer ~= "/* " ~ ci.nameString ~ " */";
    bindBuffer ~= "extern \"C\" {{";
    foreach(mf; ci.memberFunctions) {
        if(mf.isConstructor || mf.isDestructor || mf.isFinal)
            continue;

        bindBuffer ~= "\t" ~ Util.replace(mf.returnString.dup, '&', '*') ~ " bind_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, true, "void *bindInstPtr", true) ~ ");";
    }
    bindBuffer ~= "}\n";
}

void buildExports(InterfaceClassInfo ci) {
    exportBuffer ~= "/* " ~ ci.nameString ~ " */";
    exportBuffer ~= "extern \"C\" {{";
    foreach(mf; ci.memberFunctions) {
        if(mf.isConstructor) {
            if(ci.hasVirtual || ci.hasPureVirtual) {
                exportBuffer ~= "\t" ~ ci.nameString ~ "Proxy * be_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, true, "void *bindInstPtr", true) ~ ") {{";
                exportBuffer ~= "\t\treturn new " ~ ci.nameString ~ "Proxy(" ~ buildArguments(mf, false, "bindInstPtr") ~ ");";
            } else {
                exportBuffer ~= "\t" ~ ci.nameString ~ "* be_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, true, "", true) ~ ") {{";
                exportBuffer ~= "\t\treturn new " ~ ci.nameString ~ "(" ~ buildArguments(mf, false, "", true) ~ ");";
            }
//            exportBuffer ~= "\t\treturn new " ~ ci.nameString ~ (ci.hasVirtual ? "Bridge(" : "(") ~ buildArguments(mf, false, ci.hasVirtual ? "bindInstPtr" : "") ~ ");";
            exportBuffer ~= "\t}\n";
        }
        if(mf.isDestructor) {
            exportBuffer ~= "\tvoid be_" ~ ci.nameString ~ "_" ~ mf.nameString ~ "(" ~ ci.nameString ~ " *self) {{";
            exportBuffer ~= "\t\tdelete self;";
            exportBuffer ~= "\t}\n";
        }
        if(mf.isVirtual) {
            exportBuffer ~= "\t" ~ Util.replace(mf.returnString.dup, '&', '*') ~ " be_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, true, ci.nameString ~ "Proxy *self", true) ~ ") {{";
            if(mf.returnString == "void")
                exportBuffer ~= "\t\tself->" ~ mf.nameString ~ "_super(" ~ buildArguments(mf, false, "", true) ~ ");";
            else {
                if(Util.contains(mf.returnString, '&'))
                    exportBuffer ~= "\t\treturn &self->" ~ mf.nameString ~ "_super(" ~ buildArguments(mf, false, "", true) ~ ");";
                else
                    exportBuffer ~= "\t\treturn self->" ~ mf.nameString ~ "_super(" ~ buildArguments(mf, false, "", true) ~ ");";
            }
            exportBuffer ~= "\t}\n";
        }

        if(mf.isFinal) {
            exportBuffer ~= "\t" ~ mf.returnString ~ " be_" ~ ci.nameString ~ "_" ~ mf.nameString ~ mf.postfix ~ "(" ~ buildArguments(mf, true, ci.nameString ~ " *self", true) ~ ") {{";
            if(mf.returnString == "void")
                exportBuffer ~= "\t\tself->" ~ mf.nameString ~ "(" ~ buildArguments(mf, false, "", true) ~ ");";
            else
                exportBuffer ~= "\t\treturn self->" ~ mf.nameString ~ "(" ~ buildArguments(mf, false) ~ ");";
            exportBuffer ~= "\t}\n";
        }

    }
    exportBuffer ~= "}\n";

}

void print() {
    foreach(include; includeBuffer)
        Stdout.formatln(include);

    foreach(line; bindBuffer)
        Stdout.formatln(line);
    foreach(line; classBuffer)
        Stdout.formatln(line);
    foreach(line; exportBuffer)
        Stdout.formatln(line);
}
