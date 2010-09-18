module Writers.HeaderWriter;

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
char [][] bindBuffer;

void buildHeader()
{
    InputFile inputFile = InterfaceParser.getInputFile();

    licenseBuffer = inputFile.buildLicense();
    buildIncludes(inputFile);

    foreach(classInfo; inputFile.fClasses) {
        if(classInfo.hasPureVirtual || classInfo.hasVirtual) {
            buildHeaderBridgeClass(classInfo);
            buildHeaderProxyClass(classInfo);
            buildBindExports(classInfo);
        }
    }

    print();
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

void buildIncludes(InputFile inputFile) {
    foreach(include; inputFile.fIncludeFiles) {
    	if(include.isHeaderTarget()) {
	        char [] tmpBuffer = "#include ";
    	    if(Ascii.toLower(include.typeString.dup) == "system")
        	    tmpBuffer ~= "<" ~ include.nameString ~ ">";
        	else
            	tmpBuffer ~= "\"" ~ include.nameString ~ "\"";

        	includeBuffer ~= tmpBuffer.dup;
    	}
    }
}

void buildHeaderBridgeClass(InterfaceClassInfo classInfo) {
    bridgeBuffer ~= "class " ~ classInfo.nameString ~ "Bridge";
    bridgeBuffer ~= ": public " ~ classInfo.nameString;
    bridgeBuffer ~= "{{";
    bridgeBuffer ~= "public:";

    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            bridgeBuffer ~= "\t" ~ classInfo.nameString ~ "Bridge(" ~ memberFunc.buildArguments(true) ~ ");";
        } else if(memberFunc.isDestructor) {
            bridgeBuffer ~= "\t~" ~ classInfo.nameString ~ "Bridge();\n";
        }

        if(memberFunc.isPureVirtual) {
            bridgeBuffer ~= "\tvirtual " ~ memberFunc.getReturnString(false) ~ " " ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(true) ~ ") " ~ memberFunc.mod ~ ";";
        }
    }

    bridgeBuffer ~= "};\n";
}

void buildHeaderProxyClass(InterfaceClassInfo classInfo)
{
    proxyBuffer ~= "class " ~ classInfo.nameString ~ "Proxy";
    proxyBuffer ~= ": public " ~ classInfo.getInherits(false, false, true) ~ (classInfo.countInherits() > 0 ? ", public " : "") ~ classInfo.nameString ~ "Bridge";
    proxyBuffer ~= "{{";
    proxyBuffer ~= "\tvoid *fBindInstPtr;";
    proxyBuffer ~= "public:";
    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor) {
            proxyBuffer ~= "\t" ~ classInfo.nameString ~ "Proxy(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true) ~ ");";
        } else if(memberFunc.isDestructor) {
            proxyBuffer ~= "\t~" ~ classInfo.nameString ~ "Proxy();\n";
        }

        if(memberFunc.isPureVirtual || memberFunc.isVirtual) {
            proxyBuffer ~= "\tvirtual " ~ memberFunc.getReturnString(false) ~ " " ~ memberFunc.nameString ~ "(" ~ memberFunc.buildArguments(true) ~ ") " ~ memberFunc.mod ~ ";";
            proxyBuffer ~= "\tvirtual " ~ memberFunc.getReturnString(false) ~ " " ~ memberFunc.nameString ~ "_super(" ~ memberFunc.buildArguments(true) ~ ") " ~ memberFunc.mod ~ ";";
        }
    }

    proxyBuffer ~= "};\n";
}

void buildBindExports(InterfaceClassInfo classInfo) {
    bindBuffer ~= "/* " ~ classInfo.nameString ~ " */";
    bindBuffer ~= "extern \"C\" {{";
    foreach(memberFunc; classInfo.memberFunctions) {
        if(memberFunc.isConstructor || memberFunc.isDestructor)
            continue;
        if(memberFunc.isPureVirtual || memberFunc.isVirtual) {
        	bindBuffer ~= "\t" ~ memberFunc.getReturnString(true) ~ " bind_" ~ classInfo.nameString ~ "_" ~ memberFunc.nameString ~ memberFunc.postfixString ~ "(void *bindInstPtr" ~ (memberFunc.argCount > 0 ? ", " : "") ~ memberFunc.buildArguments(true, true) ~ ");";
        }
    }
    bindBuffer ~= "}";
}


void print() {
    if(licenseBuffer.length > 0) {
        foreach(line; licenseBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

	InputFile inputFile = InterfaceParser.getInputFile();

	char [] tmpBuffer = "HABID_";

	foreach(classInfo; inputFile.fClasses)
		tmpBuffer ~= classInfo.nameString ~ "_";

	Stdout.formatln("#ifndef " ~ tmpBuffer.dup);
	Stdout.formatln("#define " ~ tmpBuffer.dup);

	Stdout.newline;

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

    if(bindBuffer.length > 0) {
        foreach(line; bindBuffer)
            Stdout.formatln(line);

        Stdout.newline;
    }

    Stdout.formatln("#endif // " ~ tmpBuffer.dup ~ "\n");
}
