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

char [][] classNames = [
    "BBufferIO",
    "BPositionIO",
    "BEntry",
    "BEntryList",
    "BString"
];

char [][] keywords = [
    "lazy",
    "with"
];

void buildD()
{
    InputFile inputFile = InterfaceParser.getInputFile();

    licenseBuffer = inputFile.buildLicense();

    foreach(classInfo; inputFile.fClasses) {
        buildBindExports(classInfo);
        buildCImports(classInfo);
    }

    print();
}

char [] replaceClassNames(char [] buffer) {
    char [] tmpBuffer = buffer.dup;

    foreach(className; classNames) {
        if(Util.containsPattern(tmpBuffer, className))
            tmpBuffer = Util.substitute(tmpBuffer, className, "void").dup;
        if(Util.containsPattern(tmpBuffer, "const"))
            tmpBuffer = Util.substitute(tmpBuffer, "const", "");
    }

    foreach(keyword; keywords) {
        if(Util.containsPattern(tmpBuffer, keyword))
            tmpBuffer = Util.substitute(tmpBuffer, keyword, "_" ~ keyword);
    }

    if(Util.containsPattern(tmpBuffer, "unsigned"))
        tmpBuffer = Util.substitute(tmpBuffer, "unsigned", "");
    return tmpBuffer.dup;
}

char [] replaceConstsNames(char [] buffer) {
    char [] tmpBuffer = buffer.dup;

    if(Util.containsPattern(tmpBuffer, "const"))
        tmpBuffer = Util.substitute(tmpBuffer, "const", "");

    return tmpBuffer.dup;
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
        	bindBuffer ~= "\t" ~ replaceClassNames(memberFunc.getReturnString(true)) ~ " bind_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceConstsNames(memberFunc.buildArguments(true, true)) ~ ") {{";
        	bindBuffer ~= "\t\tassert(false, \"bind_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ") Unimplemented\");";
        	bindBuffer ~= "\t}";
        }
    }

    bindBuffer ~= "}";
}

void buildCImports(InterfaceClassInfo classInfo) {
    importBuffer ~= "extern (C) extern {{";

    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            importBuffer ~= "\t// " ~ classInfo.nameString ~ ((classInfo.hasPureVirtual || classInfo.hasVirtual) ? "Proxy *" : "*") ~ " be_" ~ classInfo.nameString ~ "_ctor" ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
            importBuffer ~= "\tvoid * be_" ~ classInfo.nameString ~ "_ctor" ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true)) ~ ");\n";
        } else if(memberFunc.isDestructor) {
            importBuffer ~= "\t// void be_" ~ classInfo.nameString ~ "_dtor(" ~ classInfo.nameString ~ "* self);";
            importBuffer ~= "\tvoid be_" ~ classInfo.nameString ~ "_dtor(void* self);\n";
        } else if(memberFunc.isOperator) {
            importBuffer ~= "\t// " ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.getOperatorName() ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
            importBuffer ~= "\t" ~ replaceClassNames(memberFunc.getReturnString(true)) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.getOperatorName() ~ memberFunc.postfixString ~ "(void *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true)) ~ ");\n";
        } else if(memberFunc.isVariable) {
            importBuffer ~= "\t// void be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varSet(" ~ classInfo.nameString ~ " *self, " ~ memberFunc.getReturnString(true) ~ " " ~ memberFunc.nameString ~ ");";
            importBuffer ~= "\tvoid be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varSet(void *self, " ~ memberFunc.getReturnString(true) ~ " " ~ memberFunc.nameString ~ ");\n";

            importBuffer ~= "\t// " ~ memberFunc.returnString ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varGet(" ~ classInfo.nameString ~ " *self);";
            importBuffer ~= "\t" ~ replaceClassNames(memberFunc.returnString) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ "_varGet(void *self);\n";
        } else {
            if(classInfo.hasVirtual || classInfo.hasPureVirtual) {
                importBuffer ~= "\t// " ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ "Proxy *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
                importBuffer ~= "\t" ~ replaceClassNames(memberFunc.getReturnString(true)) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true)) ~ ");\n";
            } else {
                importBuffer ~= "\t// " ~ memberFunc.getReturnString(true) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(" ~ classInfo.nameString ~ " *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
                importBuffer ~= "\t" ~ replaceClassNames(memberFunc.getReturnString(true)) ~ " be_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *self" ~ (memberFunc.argCount > 0 ? ", " : "") ~ replaceClassNames(memberFunc.buildArguments(true, true)) ~ ");\n";
            }
        }
    }


    importBuffer ~= "}\n";
}

void print() {
    if(licenseBuffer.length > 0) {
        foreach(line; licenseBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

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
}

