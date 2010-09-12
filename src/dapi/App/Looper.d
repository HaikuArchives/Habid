/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module App.Looper;

import Support.BObject;

import Kernel.OS;

import Support.SupportDefs;

import tango.stdc.stringz;

extern (C) extern
{

}

extern (C)
{
	
}

interface IBLooper
{
	
	void * _GetInstPtr();
}

class BLooper : IBLooper
{
	mixin(BObject!());
public:

	void * _GetInstPtr() {
		return fInstancePointer;
	}
	
}
