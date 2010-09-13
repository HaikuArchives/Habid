/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Parser.ClassInfo;

import Util = tango.text.Util;

import Parser.InterfaceParser : InputFile, InterfaceParser;
import tango.io.Stdout;

enum FunctionType : uint
{
    FT_CONSTRUCTOR = 1,
    FT_DESTRUCTOR = 2,
    FT_FINAL = 4,
    FT_VIRTUAL = 8,
    FT_PURE_VIRTUAL = 16,
    FT_NONE = 32
}

struct IncludeFile
{
    char [] nameString;
    char [] typeString;
}


class InterfaceClassInfo
{
    struct Inherit
    {
        char [] nameString;
        char [] accessString;
    }

    char [] nameString;
    Inherit [] inherits;

    bool hasFinal;
    bool hasVirtual;
    bool hasPureVirtual;

    MemberFunction [] memberFunctions;

    MemberFunction getMemberFunction(char [] name) {
        foreach(memberFunc; memberFunctions)
            if(memberFunc.nameString ~ memberFunc.postfix == name)
                return memberFunc;

        return null;
    }

    char [] getInherit(int no, bool withAccess, bool bridgeType, bool proxyType) {
        char [] buffer;
        InputFile file = InterfaceParser.getInputFile(inherits[no].nameString);
        InterfaceClassInfo classInfo;

        if(file is null) {
            return "";
        }


        classInfo = file.findClass(inherits[no].nameString);

        if(classInfo !is null) {
            buffer ~= (withAccess ? inherits[no].accessString : "") ~ " " ~ inherits[no].nameString;

            if(classInfo.hasVirtual || classInfo.hasPureVirtual)
                buffer ~= "Proxy";
        }

        return buffer.dup;
    }

    char [] getInherits(bool withAccess, bool bridgeType, bool proxyType, char [] add = "") {
        char [] buffer;
        for(int i = 0; i < inherits.length; i++) {
            if(i > 0)
                buffer ~= ", ";
            buffer ~= getInherit(i, withAccess, bridgeType, proxyType) ~ add;
        }

        return buffer.dup;
    }

    int countInherits() {
        return inherits.length;
    }

    int countNames(char [] name) {
        int count;
        foreach(mf; memberFunctions) {
            if(mf.nameString == name)
                count++;
        }

        return count;
    }
}

class MemberFunction
{
    struct Argument
    {
        char [] typeString;
        char [] nameString;

        bool isPtr = false;
        bool isRef = false;
    }

    char [] nameString;
    char [] returnString;
    char [] postfix;

    char [] mod;

    Argument [] arguments;

    FunctionType functionType;

    char [] getReturnString(bool replaceRef) {
        return (replaceRef && returnIsRef()) ? Util.replace(returnString.dup, '&', '*').dup : returnString.dup;
    }

    char [] getArgument(int argno, bool withType, bool replaceRef = false) {
        if(argno > arguments.length) return null;

        char [] buffer;
        if(withType) {
            if(replaceRef && arguments[argno].isRef) {
                buffer = Util.replace(arguments[argno].typeString.dup, '&', '*') ~ " " ~ arguments[argno].nameString;
            } else {
                buffer = arguments[argno].typeString ~ " " ~ arguments[argno].nameString;
            }
        } else { /* Treat as a deref if type is not to be there */
            if(replaceRef && arguments[argno].isRef)
                buffer = "*" ~ arguments[argno].nameString;
            else
                buffer = arguments[argno].nameString;
        }

        return buffer.dup;
    }

    char [] buildArguments(bool withType, bool replaceRef = false) {
        char [] buffer;
        for(int i = 0; i < arguments.length; i++) {
            if(i > 0)
                buffer ~= ", ";
            buffer ~= getArgument(i, withType, replaceRef);
        }

        return buffer.dup;
    }

    int countArguments() {
        return arguments.length;
    }

    bool isFinal() {
        return functionType == FunctionType.FT_FINAL;
    }

    bool isVirtual() {
        return functionType == FunctionType.FT_VIRTUAL;
    }
    bool isPureVirtual() {
        return functionType == FunctionType.FT_PURE_VIRTUAL;
    }

    bool isConstructor() {
        return functionType == FunctionType.FT_CONSTRUCTOR;
    }

    bool isDestructor() {
        return functionType == FunctionType.FT_DESTRUCTOR;
    }

    bool returnIsRef() {
        if(Util.locate(returnString, '&') != returnString.length)
            return true;
        return false;
    }
}

