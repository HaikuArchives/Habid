/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Support.StopWatch;

import Support.SupportDefs;
import Support.BObject;

import tango.stdc.stringz;

extern (C) extern {
//	BStopWatch * be_BStopWatch_ctor(const char *name, bool silent);
	void * be_BStopWatch_ctor(void *bindInstPtr, char *name, bool silent);


//	void be_BStopWatch_dtor(BStopWatch *self);
	void be_BStopWatch_dtor(void *self);


//	void be_BStopWatch_Suspend(BStopWatch *self);
	void be_BStopWatch_Suspend(void *self);


//	void be_BStopWatch_Resume(BStopWatch *self);
	void be_BStopWatch_Resume(void *self);


//	bigtime_t be_BStopWatch_Lap(BStopWatch *self);
	bigtime_t be_BStopWatch_Lap(void *self);


//	bigtime_t be_BStopWatch_ElapsedTime(BStopWatch *self);
	bigtime_t be_BStopWatch_ElapsedTime(void *self);


//	void be_BStopWatch_Reset(BStopWatch *self);
	void be_BStopWatch_Reset(void *self);


//	const char * be_BStopWatch_Name(BStopWatch *self);
	char * be_BStopWatch_Name(void *self);
}

interface IBStopWatch
{
	void	Suspend();
	void	Resume();
	bigtime_t Lap();
	bigtime_t ElapsedTime();
	void Reset();
	char [] Name();
	
	void * _GetInstPtr();
}

class BStopWatch : IBStopWatch
{
	mixin(BObject!());
public:
	//	BStopWatch * be_BStopWatch_ctor(const char *name, bool silent);
	this(char [] name, bool silent = false) {
		fInstancePointer = be_BStopWatch_ctor(cast(void *)this, toStringz(name), silent);
		fOwnsPointer = true;
	}
	
	//	void be_BStopWatch_dtor(BStopWatch *self);
	~this() {
		if(fInstancePointer && fOwnsPointer)
			be_BStopWatch_dtor(_GetInstPtr());
		fInstancePointer = null;
		fOwnsPointer = false;
	}
	

	//	void be_BStopWatch_Suspend(BStopWatch *self);
	void Suspend() {
		be_BStopWatch_Suspend(_GetInstPtr());
	}


	//	void be_BStopWatch_Resume(BStopWatch *self);
	void Resume() {
		be_BStopWatch_Resume(_GetInstPtr());
	}
	

	//	bigtime_t be_BStopWatch_Lap(BStopWatch *self);
	bigtime_t Lap() {
		return be_BStopWatch_Lap(_GetInstPtr());
	}

	
	//	bigtime_t be_BStopWatch_ElapsedTime(BStopWatch *self);
	bigtime_t ElapsedTime() {
		return be_BStopWatch_ElapsedTime(_GetInstPtr());
	}
	

	//	void be_BStopWatch_Reset(BStopWatch *self);
	void Reset() {
		be_BStopWatch_Reset(_GetInstPtr());
	}
	

	//	const char * be_BStopWatch_Name(BStopWatch *self);
	char [] Name() {
		return fromStringz(be_BStopWatch_Name(_GetInstPtr()));
	}

	
	void * _GetInstPtr() {
		return fInstancePointer;
	}
}
