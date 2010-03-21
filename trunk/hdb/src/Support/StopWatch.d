module Support.StopWatch;

import Support.BObject;
import Support.SupportDefs;

import tango.stdc.stringz;
import tango.stdc.posix.sys.types;

extern (C) extern {
	void * be_BStopWatch_ctor(void *, char*, bool);
	void be_BStopWatch_dtor(void *);

	void be_BStopWatch_Suspend(void *);
	void be_BStopWatch_Resume(void *);
	bigtime_t be_BStopWatch_Lap(void *);
	bigtime_t be_BStopWatch_ElapsedTime(void *);
	void be_BStopWatch_Reset(void *);
	char*	be_BStopWatch_Name(void *);
}

final class BStopWatch
{
public:
	mixin BObject;
	
	this(char [] name, bool silent = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BStopWatch_ctor(cast(void *)this, toStringz(name), silent);
	}
	
	~this() {
		if(fInstancePointer !is null)
			be_BStopWatch_dtor(fInstancePointer);
		fInstancePointer = null;
	}

	void Suspend() {
		be_BStopWatch_Suspend(fInstancePointer);
	}
	
	void Resume() {
		be_BStopWatch_Resume(fInstancePointer);
	}
	
	bigtime_t Lap() {
		return be_BStopWatch_Lap(fInstancePointer);
	}
	
	bigtime_t ElaspedTime() {
		return be_BStopWatch_ElapsedTime(fInstancePointer);
	}
	
	void Reset() {
		be_BStopWatch_Reset(fInstancePointer);
	}
	
	char [] Name() {
		return fromStringz(be_BStopWatch_Name(fInstancePointer));
	}
}
