module Writers.DWriter;

import Parser.InterfaceParser;
import Parser.ClassInfo;

import tango.io.FilePath;
import tango.io.device.File;

import tango.io.Stdout;

import Util = tango.text.Util;
import Ascii = tango.text.Ascii;

char [][] licenseBuffer;
char [][] importBuffer;
char [][] bindBuffer;
char [][] classBuffer;

void buildD()
{
    InputFile inputFile = InterfaceParser.getInputFile();

    licenseBuffer = inputFile.buildLicense();

    foreach(classInfo; inputFile.fClasses) {
        buildBindExports(classInfo);
        buildCImports(classInfo);

        buildBasicClass(classInfo);
    }

    print();
}

char [] replaceClassNames(char [] buffer) {
    char [] tmpBuffer = buffer.dup;


    if(Util.containsPattern(tmpBuffer, "const"))
        tmpBuffer = Util.substitute(tmpBuffer, "const", "");

    if(Util.containsPattern(tmpBuffer, "unsigned"))
        tmpBuffer = Util.substitute(tmpBuffer, "unsigned", "");
    if(Util.containsPattern(tmpBuffer, "struct"))
        tmpBuffer = Util.substitute(tmpBuffer, "struct", "");

    return Util.trim(tmpBuffer).dup;
}

char [] replaceConstsNames(char [] buffer) {
    char [] tmpBuffer = buffer.dup;

    if(Util.containsPattern(tmpBuffer, "const"))
        tmpBuffer = Util.substitute(tmpBuffer, "const", "");

    return Util.trim(tmpBuffer).dup;
}

void buildLicense(InputFile inputFile) {
    switch(Ascii.toLower(inputFile.fLicense.dup)) {
        case "mit": {
            licenseBuffer ~= "/*";
            licenseBuffer ~= " * Copyright 2010 " ~ inputFile.fAuthor ~ " <" ~ inputFile.fAuthorEmail ~ ">";
            licenseBuffer ~= " * All rights reserved. Distributed under the terms of the MIT license.";
            licenseBuffer ~= " */";
        } break;
        default: {
            Stdout.formatln("Unsupported License format ({})", inputFile.fLicense);
        }
    }
}

void buildBindExports(InterfaceClassInfo classInfo) {
    bindBuffer ~= "extern (C) {{";

    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor || memberFunc.isDestructor)
            continue;
        if(memberFunc.isPureVirtual || memberFunc.isVirtual) {
        	bindBuffer ~= "\t" ~ replaceClassNames(memberFunc.getReturnString(true)) ~ " bind_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceConstsNames(replaceClassNames(memberFunc.buildArguments(true, true))) ~ ") {{";
        	bindBuffer ~= "\t\tassert(false, \"bind_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ") Unimplemented\");";
        	bindBuffer ~= "\t}\n";
        }
    }

    bindBuffer ~= "}\n";
}

void buildCImports(InterfaceClassInfo classInfo) {
    importBuffer ~= "extern (C) extern {{";

    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            importBuffer ~= "\t// " ~ classInfo.nameString ~ ((classInfo.hasPureVirtual || classInfo.hasVirtual) ? "Proxy *" : "*") ~ " be_" ~ classInfo.nameString ~ "_ctor" ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
            importBuffer ~= "\tvoid * be_" ~ classInfo.nameString ~ "_ctor" ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true, false, false, true)) ~ ");\n";
        } else if(memberFunc.isDestructor) {
            importBuffer ~= "\t// void be_" ~ classInfo.nameString ~ "_dtor(" ~ classInfo.nameString ~ "* self);";
            importBuffer ~= "\tvoid be_" ~ classInfo.nameString ~ "_dtor(void* self);\n";
        } else if(memberFunc.isOperator) {
            importBuffer ~= "\t// " ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.getOperatorName() ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
            importBuffer ~= "\t" ~ (InterfaceParser.isClass(memberFunc.getReturnString(true)) ? "void *" : replaceClassNames(memberFunc.getReturnString(true))) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.getOperatorName() ~ memberFunc.postfixString ~ "(void *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true, false, false, true)) ~ ");\n";
        } else if(memberFunc.isVariable) {
            importBuffer ~= "\t// void be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varSet(" ~ classInfo.nameString ~ " *self, " ~ memberFunc.getReturnString(true) ~ " " ~ memberFunc.nameString ~ ");";
            importBuffer ~= "\tvoid be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varSet(void *self, " ~ memberFunc.getReturnString(true) ~ " " ~ memberFunc.nameString ~ ");\n";

            importBuffer ~= "\t// " ~ memberFunc.returnString ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varGet(" ~ classInfo.nameString ~ " *self);";
            importBuffer ~= "\t" ~ replaceClassNames(memberFunc.returnString) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varGet(void *self);\n";
        } else if(memberFunc.isStatic) {
            importBuffer ~= "\t//" ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "_static(" ~ memberFunc.buildArguments(true, true) ~ ")";
            importBuffer ~= "\t" ~ (InterfaceParser.isClass(memberFunc.getReturnString(true)) ? "void *" : replaceConstsNames(memberFunc.getReturnString(true))) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "_static(" ~ replaceClassNames(memberFunc.buildArguments(true, true, false, false, true)) ~ ");\n";
        } else {
            if(classInfo.hasVirtual || classInfo.hasPureVirtual) {
                importBuffer ~= "\t// " ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ "Proxy *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
                importBuffer ~= "\t" ~ (InterfaceParser.isClass(memberFunc.getReturnString(true)) ? "void *" : replaceClassNames(memberFunc.getReturnString(true))) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true, false, false, true)) ~ ");\n";
            } else {
                importBuffer ~= "\t// " ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
                importBuffer ~= "\t" ~ (InterfaceParser.isClass(memberFunc.getReturnString(true)) ? "void *" : replaceClassNames(memberFunc.getReturnString(true))) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true, false, false, true)) ~ ");\n";
            }
        }
    }


    importBuffer ~= "}\n";
}

void buildBasicClass(InterfaceClassInfo classInfo)
{
    classBuffer ~= "interface I" ~ classInfo.nameString;
    classBuffer ~= "{{";
    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            continue;
        } else if(memberFunc.isDestructor) {
            continue;
        } else if(memberFunc.isOperator) {
            classBuffer ~= "\t// " ~ memberFunc.getReturnString(false) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.getOperatorName() ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, false) ~ ");";
            classBuffer ~= "\t//" ~ replaceConstsNames(memberFunc.returnString) ~ " " ~ memberFunc.getOperatorName() ~ "();\n";
        } else if(memberFunc.isVariable) {

        } else {
            classBuffer ~= "\t// " ~ memberFunc.getReturnString(false) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, false) ~ ");";
            classBuffer ~= "\t" ~ replaceConstsNames(memberFunc.returnString) ~ " " ~ memberFunc.nameString ~ "();\n";
        }
    }

    classBuffer ~= "\tvoid * _InstPtr();";
    classBuffer ~= "\tbool _OwnsPtr();";
    classBuffer ~= "}\n";

    classBuffer ~= ((classInfo.hasPureVirtual || classInfo.hasVirtual) ? "" : "final ") ~ "class " ~ classInfo.nameString ~ " : I" ~ classInfo.nameString;
    classBuffer ~= "{{";
    classBuffer ~= "private:";
    classBuffer ~= "\tvoid *fInstancePointer = null;";
    classBuffer ~= "\tbool fOwnsPointer = false;";
    classBuffer ~= "\tmixin(BObject!());";
    classBuffer ~= "public:";
    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            classBuffer ~= "\t// " ~ classInfo.nameString ~ ((classInfo.hasPureVirtual || classInfo.hasVirtual) ? "Proxy *" : "*") ~ " be_" ~ classInfo.nameString ~ "_ctor" ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
            classBuffer ~= "\tthis() {{";
            classBuffer ~= "\t\tif(fInstancePointer is null) {{";
            classBuffer ~= "\t\t\tfInstancePointer = be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(cast(void *)this);";
            classBuffer ~= "\t\t\tfOwnsPointer = true;";
            classBuffer ~= "\t\t}";
            classBuffer ~= "\t}\n";
        } else if(memberFunc.isDestructor) {
            classBuffer ~= "\t// void be_" ~ classInfo.nameString ~ "_dtor(" ~ classInfo.nameString ~ "* self);";
            classBuffer ~= "\t~this() {{";
            classBuffer ~= "\t\tif(fInstancePointer !is null && fOwnsPointer) {{";
            classBuffer ~= "\t\t\tbe_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "(_InstPtr());";
            classBuffer ~= "\t\t\tfInstancePointer = null;";
            classBuffer ~= "\t\t\tfOwnsPointer = false;";
            classBuffer ~= "\t\t}";
            classBuffer ~= "\t}\n";
        } else if(memberFunc.isOperator) {
            classBuffer ~= "\t// " ~ memberFunc.getReturnString(false) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.getOperatorName() ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, false) ~ ");";
            classBuffer ~= "\t//" ~ replaceConstsNames(memberFunc.returnString) ~ " " ~ memberFunc.getOperatorName() ~ "();\n";
        } else if(memberFunc.isVariable) {
            classBuffer ~= "\t//void be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varSet(" ~ classInfo.nameString ~ " *self, " ~ memberFunc.getReturnString(true) ~ " " ~ memberFunc.nameString ~ ")";
            classBuffer ~= "\tvoid " ~ memberFunc.nameString ~ "(" ~ memberFunc.getReturnString(true) ~ " _" ~ memberFunc.nameString ~ ") {{";
            classBuffer ~= "\t\tbe_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varSet(_InstPtr(), _" ~ memberFunc.nameString ~ ");";
            classBuffer ~= "\t}\n";

            classBuffer ~= "\t//" ~ memberFunc.returnString ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varGet(" ~ classInfo.nameString ~ " *self)";
            classBuffer ~= "\t" ~ memberFunc.returnString ~ " " ~ memberFunc.nameString ~ "() {{";
            classBuffer ~= "\t\treturn be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varGet(_GetInstPtr());";
            classBuffer ~= "\t}\n";
        } else if(memberFunc.isStatic) {
            classBuffer ~= "\t//" ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "_static(" ~ memberFunc.buildArguments(true, true) ~ ")";
            classBuffer ~= "\tstatic " ~ memberFunc.getReturnString(true) ~ " " ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(true, true) ~ ")";
            classBuffer ~= "\t{{";
            // importBuffer ~= "\t\t" ~ (memberFunc.returnString == "void" ? "" : "return ") ~ classInfo.nameString ~ "::" ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(false, true, false, true) ~ ");";
            classBuffer ~= "\t}\n";
        } else {
            classBuffer ~= "\t// " ~ memberFunc.getReturnString(false) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, false) ~ ");";
            classBuffer ~= "\t" ~ replaceConstsNames(memberFunc.returnString) ~ " " ~ memberFunc.nameString ~ "() {{";
            classBuffer ~= "\t\t" ~ (memberFunc.returnString == "void" ? "" : "return ") ~ "be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(_InstPtr());";

            classBuffer ~= "\t}\n";
        }
    }

    classBuffer ~= "\tvoid * _InstPtr() {{ return fInstancePointer; }";
    classBuffer ~= "\tbool _OwnsPtr() {{ return fOwnsPointer; }";
    classBuffer ~= "}\n";

}
void print() {
    if(licenseBuffer.length > 0) {
        foreach(line; licenseBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

	Stdout.formatln("import Support.SupportDefs;");
	Stdout.formatln("import Support.types;");
	Stdout.formatln("import Support.BObject;").newline;

    if(importBuffer.length > 0) {
        foreach(line; importBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

    if(bindBuffer.length > 0) {
        foreach(line; bindBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

    if(classBuffer.length > 0) {
        foreach(line; classBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

}

