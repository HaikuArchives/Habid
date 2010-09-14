/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Parser.InterfaceParser;

import Parser.ClassInfo;

import tango.io.Stdout;

import tango.io.FilePath;
import tango.io.device.File;

import tango.text.xml.Document;

import Util = tango.text.Util;
import Ascii = tango.text.Ascii;
import Integer = tango.text.convert.Integer;

class InputFile
{
    char [] fFilename;
    char [] fCppOutputFilename;
    char [] fHeaderOutputFilename;

    InterfaceClassInfo [] fClasses;

    IncludeFile [] fIncludeFiles;

    char [] fAuthor;
    char [] fAuthorEmail;
    char [] fLicense;

    InterfaceClassInfo findClass(char [] name) {
        foreach(classInfo; fClasses) {
            if(classInfo.nameString == name)
                return classInfo;
        }

        return null;
    }

    void print() {
        Stdout.formatln("InputFilename: {}", fFilename);
        Stdout.formatln("CppOutputFilename: {}", fCppOutputFilename);
        Stdout.formatln("HeaderOutputFilename: {}", fHeaderOutputFilename);
        Stdout.formatln("Author: {}", fAuthor);
        Stdout.formatln("Author Email: {}", fAuthorEmail);
        Stdout.formatln("License: {}", fLicense);

        foreach(includeFile; fIncludeFiles)
            Stdout.formatln("Includes: {}", includeFile.nameString);

        foreach(classInfo; fClasses) {
            char [] buffer;
            buffer ~= classInfo.nameString;
            if(classInfo.hasPureVirtual || classInfo.hasVirtual)
                buffer ~= " " ~ classInfo.nameString ~ "Bridge " ~ classInfo.nameString ~ "Proxy" ;

            Stdout.formatln("Builds: {}", buffer);
        }
    }

    char [][] buildLicense() {
        char [][] licenseBuffer;
        switch(Ascii.toLower(fLicense.dup)) {
            case "mit": {
                licenseBuffer ~= "/*";
                licenseBuffer ~= " * Copyright 2010 " ~ fAuthor ~ " <" ~ fAuthorEmail ~ ">";
                licenseBuffer ~= " * All rights reserved. Distributed under the terms of the MIT license.";
                licenseBuffer ~= " */";
            } break;
            default: {
                Stdout.formatln("Unsupported License format ({})", fLicense);
            }
        }

        return licenseBuffer;
    }

}

class InterfaceParser
{ static:
private:
    InputFile fInputFile;

    InputFile [] fOtherInputs;
public:
    bool parse(char [] filename, bool otherInput = false) {
        InputFile inputFile = new InputFile;

        FilePath path = new FilePath(filename);

        if(!path.exists()) {
            Stdout.formatln("InterfaceParser::parse File doe's not exist ({})", path.toString());
            return false;
        }

        File file = new File(path.toString());

        char [] buffer = cast(char [])file.load();

        Document!(char) doc = new Document!(char);

        doc.parse(buffer);

        inputFile.fFilename = filename.dup;

        doc.Node node = doc.tree();

        if(node.type() != XmlNodeType.Document) {
            Stdout.formatln("InterfaceParser::parse Invalid Document ({})", inputFile.fFilename);
            return false;
        }

        doc.Node rootNode = node.child();

        foreach(child; rootNode.children) {
            if(child.type() == XmlNodeType.Element) {
                char [] name = Ascii.toLower(child.name().dup);

                switch(name) {
                    case "headerfile": {
                        inputFile.fHeaderOutputFilename = child.attributes.name(null, "name").value().dup;
                    } break;
                    case "class": {
                        InterfaceClassInfo classinfo = new InterfaceClassInfo;
                        classinfo.nameString = child.attributes.name(null, "name").value().dup;
                        parseClassNode(child, classinfo);
                        inputFile.fClasses ~= classinfo;
                    } break;
                    case "includefile": {
                        IncludeFile inc;
                        inc.nameString = child.attributes.name(null, "name").value().dup;
                        inc.typeString = Ascii.toLower(child.attributes.name(null, "type").value().dup);
                        inc.targetString = Ascii.toLower(child.attributes.name(null, "target").value().dup);
                        inputFile.fIncludeFiles ~= inc;
                    } break;
                    case "author": {
                        inputFile.fAuthor = child.attributes.name(null, "name").value().dup;
                        inputFile.fAuthorEmail = child.attributes.name(null, "email").value().dup;
                        inputFile.fLicense = child.attributes.name(null, "license").value().dup;
                    } break;
                    default: {
                        Stdout.formatln("InterfaceParser::parse Unhandled node ({})", name);
                    }
                }
            }
        }

        if(otherInput)
            fOtherInputs ~= inputFile;
        else
            fInputFile = inputFile;

        delete doc;
        file.close();

        return true;
    }

    void parseClassNode(Document!(char).Node node, inout InterfaceClassInfo classInfo) {
        foreach(child; node.children) {
            if(child.type() != XmlNodeType.Element)
                continue;

            char [] name = Ascii.toLower(child.name().dup);

            switch(name) {
                case "function": {
                    MemberFunction memberFunc = new MemberFunction;
                    memberFunc.nameString = child.attributes.name(null, "name").value().dup;
                    memberFunc.returnString = child.attributes.name(null, "returns").value().dup;
                    memberFunc.mod = child.attributes.name(null, "mod").value().dup;

                    parseArguments(child.attributes.name(null, "arguments").value(), memberFunc);

                    memberFunc.functionType = parseType(child.attributes.name(null, "type").value());

                    if(memberFunc.isFinal) classInfo.hasFinal = true;
                    else if(memberFunc.isVirtual) classInfo.hasVirtual = true;
                    else if(memberFunc.isPureVirtual) classInfo.hasPureVirtual = true;

                    if(memberFunc.isConstructor)
                        memberFunc.nameString = "ctor";
                    if(memberFunc.isDestructor)
                        memberFunc.nameString = "dtor";

                    if(classInfo.countNames(memberFunc.nameString) > 0)
                        memberFunc.postfix = "_" ~ Integer.toString(classInfo.countNames(memberFunc.nameString));
                    classInfo.memberFunctions ~= memberFunc;
                } break;
                case "inherits": {
                    InterfaceClassInfo.Inherit inherit;
                    inherit.nameString = child.attributes.name(null, "name").value().dup;
                    inherit.accessString = child.attributes.name(null, "access").value().dup;
                    classInfo.inherits ~= inherit;
                } break;
                default: {
                    Stdout.formatln("InterfaceParser::parseClassNode Unhandled node ({})", name);
                }
            }
        }
    }

    void parseArguments(char [] args, inout MemberFunction memberFunc) {
        if(args == "") return;

        char [][] tokens = Util.split(args.dup, ",");

        foreach(token; tokens) {
            MemberFunction.Argument arg;
            char [] trimmedToken = Util.trim(token.dup);

            int loc = 0;
            if((loc = Util.locate(trimmedToken, '*')) != trimmedToken.length) {
                arg.isPtr = true;
                arg.typeString = Util.trim(trimmedToken[0..loc + 1]).dup;
                arg.nameString = Util.trim(trimmedToken[loc + 1..$]).dup;
            } else if((loc = Util.locate(trimmedToken, '&')) != trimmedToken.length) {
                arg.isRef = true;
                arg.typeString = Util.trim(trimmedToken[0..loc + 1]).dup;
                arg.nameString = Util.trim(trimmedToken[loc + 1..$]).dup;
            } else {
                loc = Util.locate(trimmedToken, ' ');
                arg.typeString = Util.trim(trimmedToken[0..loc + 1]).dup;
                arg.nameString = Util.trim(trimmedToken[loc + 1..$]).dup;
            }

            memberFunc.arguments ~= arg;
        }
    }

    FunctionType parseType(char [] type) {
        switch(Ascii.toLower(type.dup)) {
            case "constructor": {
                return FunctionType.FT_CONSTRUCTOR;
            } break;
            case "destructor": {
                return FunctionType.FT_DESTRUCTOR;
            } break;
            case "final": {
                return FunctionType.FT_FINAL;
            } break;
            case "virtual": {
                return FunctionType.FT_VIRTUAL;
            } break;
            case "purevirtual": {
                return FunctionType.FT_PURE_VIRTUAL;
            } break;
            default: {
                return FunctionType.FT_NONE;
            }
        }

        return FunctionType.FT_NONE;
    }

    InputFile getInputFile() {
        return fInputFile;
    }
/*
    InterfaceClassInfo [] getInterfaceClassInfo() {
        return fClasses;
    }
*/

    InputFile getInputFile(char [] name) {
        foreach(classInfo; fInputFile.fClasses)
            if(classInfo.nameString == name)
                return fInputFile;

        foreach(inputFile; fOtherInputs) {
            foreach(classInfo; inputFile.fClasses) {
               if(classInfo.nameString == name)
                    return inputFile;
            }
        }

        return null;
    }

/*
    IncludeFile [] getIncludes() {
        return fIncludeFiles;
    }

    char [] getAuthor() {
        return fAuthor;
    }

    char [] getAuthorEmail() {
        return fAuthorEmail;
    }
*/
}
