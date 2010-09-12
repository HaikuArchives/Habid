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


class InterfaceParser
{ static:
private:
    char [] fFilename;

    InterfaceClassInfo [] fClasses;

    IncludeFile [] fIncludeFiles;
public:
    bool parse(char [] filename) {
        FilePath path = new FilePath(filename);

        if(!path.exists()) {
            Stdout.formatln("InterfaceParser::parse File doe's not exist ({})", path.toString());
            return false;
        }

        File file = new File(path.toString());

        char [] buffer = cast(char [])file.load();

        Document!(char) doc = new Document!(char);

        doc.parse(buffer);

        doc.Node node = doc.tree();

        if(node.type() != XmlNodeType.Document) {
            Stdout.formatln("InterfaceParser::parse Invalid Document ({})", fFilename);
            return false;
        }

        doc.Node rootNode = node.child();

        foreach(child; rootNode.children) {
            if(child.type() == XmlNodeType.Element) {
                char [] name = Ascii.toLower(child.name().dup);

                switch(name) {
                    case "class": {
                        InterfaceClassInfo classinfo;
                        classinfo.nameString = child.attributes.name(null, "name").value().dup;
                        parseClassNode(child, classinfo);
                        fClasses ~= classinfo;
                    } break;
                    case "includefile": {
                        IncludeFile inc;
                        inc.nameString = child.attributes.name(null, "name").value().dup;
                        inc.typeString = Ascii.toLower(child.attributes.name(null, "type").value().dup);
                        fIncludeFiles ~= inc;
                    } break;
                    default: {
                        Stdout.formatln("InterfaceParser::parse Unhandled node ({})", name);
                    }
                }
            }
        }


        return true;
    }

    void parseClassNode(Document!(char).Node node, inout InterfaceClassInfo classInfo) {
        foreach(child; node.children) {
            if(child.type() != XmlNodeType.Element)
                continue;

            char [] name = Ascii.toLower(child.name().dup);

            switch(name) {
                case "function": {
                    MemberFunction memberFunc;
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

        char [][] tokens = Util.split(args, ",");

        foreach(token; tokens) {
            MemberFunction.Argument arg;
            char [] trimmedToken = Util.trim(token);

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

    InterfaceClassInfo [] getInterfaceClassInfo() {
        return fClasses;
    }

    InterfaceClassInfo *findClass(char [] name) {
    	int classno = 0;
        for(int i = 0; i < fClasses.length; i++)
            if(fClasses[i].nameString == name) {
            	classno = i;
                break;
            }

        return &fClasses[classno];
    }

    IncludeFile [] getIncludes() {
        return fIncludeFiles;
    }
}
/*
class InterfaceParser
{
private:
    char [] fFilename;

    InterfaceClassInfo [] fClasses;
public:
    this(char [] filename) {
        fFilename = filename.dup;
    }

    bool parse() {
        if(fFilename.length < 0) {
            Stdout.formatln("InterfaceParser::parse Invlid filename");
            return false;
        }

        FilePath path = new FilePath(fFilename);

        if(!path.exists()) {
            Stdout.formatln("InteraceParser::parse File does not exist ({})", fFilename);
            return false;
        }

        File file = new File(path.toString());

        char [] buffer = cast(char [])file.load();

        Document!(char) doc = new Document!(char);

        doc.parse(buffer);

        doc.Node node = doc.tree();

        if(node.type() != XmlNodeType.Document) {
            Stdout.formatln("InterfaceParser::parse Invalid Document ({})", fFilename);
            return false;
        }

        doc.Node rootNode = node.child();

        foreach(child; rootNode.children) {
            if(child.type() == XmlNodeType.Element) {
                char [] name = Ascii.toLower(child.name().dup);

                switch(name) {
                    case "class": {
                        parseClassNode(child);
                    } break;

                    default: {
                        Stdout.formatln("InterfaceParser::parse Unhandled node ({})", name);
                    }
                }
            }
        }

        return true;
    }

    void parseClassNode(Document!(char).Node node) {
        InterfaceClassInfo ci;
        ci.nameString = node.attributes.name(null, "name").value().dup;

        foreach(child; node.children) {
            if(child.type() == XmlNodeType.Element) {
                char [] name = Ascii.toLower(child.name().dup);

                switch(name) {
                    case "inherits": {
                        InterfaceClassInfo.Inherit inherit;
                        inherit.name = child.attributes.name(null, "name").value().dup;
                        inherit.access = child.attributes.name(null, "access").value().dup;
                        ci.inherits ~= inherit;
                    } break;
                    case "hasfinal": {
                        ci.hasFinal = child.attributes.name(null, "value").value() == "true" ? true : false;
                    } break;
                    case "hasvirtual": {
                        ci.hasVirtual = child.attributes.name(null, "value").value() == "true" ? true : false;
                    } break;
                    case "haspurevirtual": {
                        ci.hasPureVirtual = child.attributes.name(null, "value").value() == "true" ? true : false;
                    } break;
                    case "constructor": {
                        parseConstructor(child, ci);
                    } break;
                    case "memberfunction": {
                        parseMemberFunction(child, ci);
                    } break;
                    default: {
                        Stdout.formatln("InterfaceParser::parseClassNode Unhandled node ({})", name);
                    }
                }
            }
        }

        fClasses ~= ci;
    }

    void parseConstructor(Document!(char).Node node, inout InterfaceClassInfo ci) {
        MemberFunction mf;

        mf.isConstructor = true;
        mf.nameString = "ctor";
        mf.returnString = ci.nameString ~ " *";

        foreach(child; node.children()) {
            if(child.type() != XmlNodeType.Element)
                continue;

            char [] name = Ascii.toLower(child.name().dup);

            switch(name) {
                case "arg": {
                    MemberFunction.Argument arg;
                    arg.nameString = child.attributes.name(null, "name").value().dup;
                    arg.typeString = child.attributes.name(null, "type").value().dup;
                    mf.arguments ~= arg;
                } break;
                default: {
                    Stdout.formatln("InterfaceParser::parseConstructor Unhandled node ({})", name);
                }
            }
        }

        int funcNo = ci.countNames(mf.nameString);

        if(funcNo > 0)
            mf.postfix = "_" ~ Integer.toString(funcNo);

        ci.memberFunctions ~= mf;

        MemberFunction dtor;
        dtor.nameString = "dtor";
        dtor.returnString = "void";
        dtor.isDestructor = true;

        ci.memberFunctions ~= dtor;
    }

    void parseMemberFunction(Document!(char).Node node, inout InterfaceClassInfo ci) {
        MemberFunction mf;

        mf.nameString = node.attributes.name(null, "name").value().dup;

        char [] typeString;
        typeString = Ascii.toLower(node.attributes.name(null, "type").value().dup);

        switch(typeString) {
            case "final": {
                mf.isFinal = true;
            } break;
            case "virtual": {
                mf.isVirtual = true;
            } break;
            case "purevirtual": {
                mf.isPureVirtual = true;
            } break;
            default: {
                Stdout.formatln("InterfaceParser::parseMemberFunction Invalid type ({}) for function ({})", typeString, mf.nameString);
            }
        }

        mf.returnString = node.attributes.name(null, "returns").value().dup;

        foreach(child; node.children()) {
            if(child.type() != XmlNodeType.Element)
                continue;

            char [] name = Ascii.toLower(child.name().dup);

            switch(name) {
                case "arg": {
                    MemberFunction.Argument arg;
                    arg.nameString = child.attributes.name(null, "name").value().dup;
                    arg.typeString = child.attributes.name(null, "type").value().dup;
                    mf.arguments ~= arg;
                } break;
                default: {
                    Stdout.formatln("InterfaceParser::parseConstructor Unhandled node ({})", name);
                }
            }
        }

        int funcNo = ci.countNames(mf.nameString);

        if(funcNo > 0)
            mf.postfix = "_" ~ Integer.toString(funcNo);

        ci.memberFunctions ~= mf;
    }

    void print() {
        foreach(cl; fClasses) {
            Stdout.formatln("Class {}", cl.nameString);
            foreach(inherit; cl.inherits)
                Stdout.formatln("Inherits From: {} Access: {}", inherit.name, inherit.access);

            Stdout.formatln("HasFinal {}", cl.hasFinal);
            Stdout.formatln("HasVirtual {}", cl.hasVirtual);
            Stdout.formatln("HasPureVirtual {}", cl.hasPureVirtual);

            foreach(mf; cl.memberFunctions) {
                if(mf.isConstructor)
                    Stdout.formatln("\tMemberFunction Constructor");
                else
                    Stdout.formatln("\tMemberFunction: {}", mf.nameString ~ mf.postfix);

                foreach(arg; mf.arguments) {
                    Stdout.formatln("\t\tArgument: {} Type: {}", arg.nameString, arg.typeString);
                }
            }
        }
    }

    InterfaceClassInfo [] getInterfaceClassInfo() {
        return fClasses;
    }
}
*/
