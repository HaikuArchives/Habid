/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <SupportDefs.h>
#include <StopWatch.h>



extern "C" {
	BStopWatch* be_BStopWatch_ctor(void *bindInstPtr, const char * name, bool silent)
	{
		return new BStopWatch(name, silent);
	}

	void be_BStopWatch_dtor(BStopWatch* self)
	{
		delete self;
	}

	void be_BStopWatch_Suspend(BStopWatch *self)
	{
		self->Suspend();
	}

	void be_BStopWatch_Resume(BStopWatch *self)
	{
		self->Resume();
	}

	bigtime_t be_BStopWatch_Lap(BStopWatch *self)
	{
		return self->Lap();
	}

	bigtime_t be_BStopWatch_ElapsedTime(BStopWatch *self)
	{
		return self->ElapsedTime();
	}

	void be_BStopWatch_Reset(BStopWatch *self)
	{
		self->Reset();
	}

	const char * be_BStopWatch_Name(BStopWatch *self)
	{
		return self->Name();
	}

}

