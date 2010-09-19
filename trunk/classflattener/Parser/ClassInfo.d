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
    FT_OPERATOR = 32,
    FT_VARIABLE = 64,
    FT_STATIC = 128,
    FT_NONE = 256
}

struct IncludeFile
{
    char [] nameString;
    char [] typeString;

    char [] targetString;

    bool isSourceTarget() {
    	if(Util.containsPattern(targetString, "source"))
    		return true;
    	return false;
    }

    bool isHeaderTarget() {
    	if(Util.containsPattern(targetString, "header"))
    		return true;
    	return false;
    }
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
            if(memberFunc.nameString ~ memberFunc.postfixString == name)
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
        static Argument opCall(char [] _typeString, char [] _nameString, char [] _funcPtrArgs = "") {
            Argument arg;

            arg.isPtr = Util.contains(_typeString, '*');
            arg.isRef = Util.contains(_typeString, '&');
            arg.isFuncPtr = (_funcPtrArgs.length > 0);

			arg.isStruct = Util.containsPattern(_typeString, "struct");

            arg.typeString = _typeString.dup;
            arg.nameString = _nameString.dup;
            arg.funcPtrArgs = _funcPtrArgs.dup;

            return arg;
        }

        char [] typeString;
        char [] nameString;
        char [] funcPtrArgs;

        bool isPtr = false;
        bool isRef = false;
        bool isFuncPtr = false;
        bool isStruct = false;

        char [] toString(bool withType, bool replaceRef = false, bool refStruct = false, bool derefStruct = false) {
            if(isFuncPtr) {
                if(withType)
                    return (((replaceRef) ? Util.replace(typeString.dup, '&', '*') : typeString) ~ " (*" ~ nameString ~ ")(" ~ funcPtrArgs ~ ")").dup;
                else
                    return nameString.dup;
            } else {
                if(withType)
                    return (((replaceRef) ? Util.replace(typeString.dup, '&', '*') : typeString) ~ " " ~ nameString).dup;
                else {
                	if(isStruct && isRef && refStruct)
                		return ("&" ~ nameString).dup;
                	else if(isStruct && isRef && !refStruct)
                		return (derefStruct ? "*" : "") ~ nameString.dup;
                	else
                    	return (((replaceRef && isRef) ? ("*" ~ nameString) : nameString)).dup;
                }
            }
        }

        static char [] getFuncPtrName(char [] funcPtrString) {
            int begin = 0;
            int end = 0;
            int p = 0;

            foreach(loc, c; funcPtrString) {
                if(c == '(') {
                   begin = loc + 1;
                   break;
                }
            }

            foreach(loc, c; funcPtrString) {
                if(c == ')') {
                    end = loc;
                   break;
                }
            }

            return funcPtrString[begin + 1..end];
        }

        static char [] getFuncPtrType(char [] funcPtrString) {
            return funcPtrString[0..Util.locate(funcPtrString, ' ')];
        }

        static char [] getFuncPtrArgs(char [] funcPtrString) {
            int begin = 0;
            int end = 0;
            int p = 0;

            foreach(loc, c; funcPtrString) {
                if(c == '(')
                   begin = loc + 1;
                if(c == ')')
                    end = loc;
            }


            return funcPtrString[begin..end];

        }
    }

    char [] nameString;
    char [] returnString;
    char [] postfixString;
    char [] argString;
    int argCount = 0;

    char [] mod;

    FunctionType functionType;

    char [][] splitArguments() {
        char [][] args;
        int paranthesis = 0;
        uint lastLoc = 0;

        foreach(loc, c; argString) {
            if(c == '(') paranthesis++;
            else if(c == ')') paranthesis--;

            if((c == ',' && paranthesis == 0)) {
                args ~= argString[lastLoc..loc];
                lastLoc = loc + 1;
            } else if(loc == argString.length - 1) {
                args ~= argString[lastLoc..loc + 1];
                lastLoc = loc;
            }
        }

        return args.dup;
    }

    int opApply(int delegate(ref Argument argument) dg) {
        int result = 0;
        char [][] tokens = splitArguments(); // Util.split(argString.dup, ",");

        foreach(token; tokens) {
            int ArgLoc = 0;
            if(token.length == 0) continue;

            if(Util.contains(token, '*')) ArgLoc = Util.locatePrior(token, '*');
            else if(Util.contains(token, '&')) ArgLoc = Util.locatePrior(token, '&');
            else ArgLoc = Util.locatePrior(token, ' ');

            if((result = dg(Argument(Util.trim(token[0..ArgLoc + 1].dup), Util.trim(token[ArgLoc + 1..$].dup)))) != 0)
                break;
        }

        return result;
    }

    int opApply(int delegate(ref uint index, ref Argument argument) dg) {
        int result = 0;

        char [][] tokens = splitArguments(); // Util.split(argString.dup, ",");

        foreach(i, token; tokens) {
            int ArgLoc = 0;

            if(token.length == 0) continue;

            if(Util.contains(token, '(')) {
                if((result = dg(i, Argument(Util.trim(MemberFunction.Argument.getFuncPtrType(token)),
                                            Util.trim(MemberFunction.Argument.getFuncPtrName(token)),
                                            Util.trim(MemberFunction.Argument.getFuncPtrArgs(token))))) != 0)
                    break;

            } else {
                if(Util.contains(token, '*')) ArgLoc = Util.locatePrior(token, '*');
                else if(Util.contains(token, '&')) ArgLoc = Util.locatePrior(token, '&');
                else ArgLoc = Util.locatePrior(token, ' ');

                if((result = dg(i, Argument(Util.trim(token[0..ArgLoc + 1].dup), Util.trim(token[ArgLoc + 1..$].dup)))) != 0)
                    break;
            }
        }

        return result;
    }

    uint countArgs() {
        if(argString.length > 0)
            argCount = splitArguments().length;

        return argCount;
    }

    char [] getOperatorName() {
        switch(Util.chopl(nameString.dup, "operator")) {
            case "+": {
                return "opAdd";
            } break;
            case "-": {
                return "opSub";
            } break;
            case "*": {
                return "opMul";
            } break;
            case "/": {
                return "opDiv";
            } break;
            case "%": {
                return "opMod";
            } break;
            case "==": {
                return "opEquals";
            } break;
            case "!=": {
                return "opNotEquals";
            } break;
            case "<": {
                return "opCmpLess";
            } break;
            case "<=": {
                return "opCmpLessEqual";
            } break;
            case ">": {
                return "opCmpGreater";
            } break;
            case ">=": {
                return "opCmpGreaterEqual";
            } break;
            case "=": {
                return "opAssign";
            } break;
            case "+=": {
                return "opAddAssign";
            } break;
            case "-=": {
                return "opSubAssign";
            } break;
            case "[]": {
            	return "opIndex";
            } break;
            case "<<": {
            	return "opShl";
            } break;
            case ">>": {
            	return "opShr";
            } break;
            default: {
                assert(false, "Invalid operator name: " ~ nameString);
            }
        }
    }

    char [] getReturnString(bool replaceRef) {
        return (replaceRef && returnIsRef()) ? Util.replace(returnString.dup, '&', '*').dup : returnString.dup;
    }

    char [] buildArguments(bool withType, bool replaceRef = false, bool refStruct = false, bool derefStruct = false) {
        char [] buffer;
        foreach(argno, arg; this) {
            if(argno > 0)
                buffer ~= ", ";
            buffer ~= arg.toString(withType, replaceRef, refStruct, derefStruct);
        }

        return buffer.dup;
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

    bool isOperator() {
        return functionType == FunctionType.FT_OPERATOR;
    }

    bool isVariable() {
        return functionType == FunctionType.FT_VARIABLE;
    }

    bool isStatic() {
        return functionType == FunctionType.FT_STATIC;
    }

    bool returnIsRef() {
        if(Util.locate(returnString, '&') != returnString.length)
            return true;
        return false;
    }
}

