/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Parser.ClassInfo;

import Util = tango.text.Util;

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


struct InterfaceClassInfo
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

    int countNames(char [] name) {
        int count;
        foreach(mf; memberFunctions) {
            if(mf.nameString.length < name.length)
                continue;

            if(mf.nameString[0..name.length] == name)
                count++;
        }

        return count;
    }
}

struct MemberFunction
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

