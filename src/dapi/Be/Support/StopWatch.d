/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.StopWatch;


import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Support.SupportDefs;

import tango.stdc.stringz;

extern (C) extern {
	// BStopWatch* be_BStopWatch_ctor(void *bindInstPtr, const char * name, bool silent);
	void * be_BStopWatch_ctor(void *bindInstPtr, char * name, bool silent);

	// void be_BStopWatch_dtor(BStopWatch* self);
	void be_BStopWatch_dtor(void* self);

	// void be_BStopWatch_Suspend(BStopWatch *self);
	void be_BStopWatch_Suspend(void *self);

	// void be_BStopWatch_Resume(BStopWatch *self);
	void be_BStopWatch_Resume(void *self);

	// bigtime_t be_BStopWatch_Lap(BStopWatch *self);
	bigtime_t be_BStopWatch_Lap(void *self);

	// bigtime_t be_BStopWatch_ElapsedTime(BStopWatch *self);
	bigtime_t be_BStopWatch_ElapsedTime(void *self);

	// void be_BStopWatch_Reset(BStopWatch *self);
	void be_BStopWatch_Reset(void *self);

	// const char * be_BStopWatch_Name(BStopWatch *self);
	char * be_BStopWatch_Name(void *self);

}

final class BStopWatch
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BStopWatch* be_BStopWatch_ctor(void *bindInstPtr, const char * name, bool silent);
	this(char [] name, bool silent = false) {
		if(_InstPtr is null) {
			_InstPtr = be_BStopWatch_ctor(cast(void *)this, toStringz(name), silent);
			_OwnsPtr = true;
		}
	}

	// void be_BStopWatch_dtor(BStopWatch* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BStopWatch_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// void be_BStopWatch_Suspend(BStopWatch *self);
	void Suspend() {
		be_BStopWatch_Suspend(_InstPtr());
	}

	// void be_BStopWatch_Resume(BStopWatch *self);
	void Resume() {
		be_BStopWatch_Resume(_InstPtr());
	}

	// bigtime_t be_BStopWatch_Lap(BStopWatch *self);
	bigtime_t Lap() {
		return be_BStopWatch_Lap(_InstPtr());
	}

	// bigtime_t be_BStopWatch_ElapsedTime(BStopWatch *self);
	bigtime_t ElapsedTime() {
		return be_BStopWatch_ElapsedTime(_InstPtr());
	}

	// void be_BStopWatch_Reset(BStopWatch *self);
	void Reset() {
		be_BStopWatch_Reset(_InstPtr());
	}

	// const char * be_BStopWatch_Name(BStopWatch *self);
	char [] Name() {
		return fromStringz(be_BStopWatch_Name(_InstPtr()));
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


