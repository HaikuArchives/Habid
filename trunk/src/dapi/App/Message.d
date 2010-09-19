/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module App.Message;

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

interface IBMessage
{
	
	void * _InstPtr();
}

class BMessage : IBMessage
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	
	mixin(BObject!());
public:

	void * _InstPtr() {
		return fInstancePointer;
	}
	
}
