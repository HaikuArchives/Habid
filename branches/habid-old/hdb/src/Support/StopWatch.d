module Support.StopWatch;

import Support.BObject;
import Support.SupportDefs;

import tango.stdc.stringz;
import tango.stdc.posix.sys.types;

import Support.types;

extern (C) extern {
	be_BStopWatch * be_BStopWatch_ctor(be_BStopWatch *, char*, bool);
	void be_BStopWatch_dtor(be_BStopWatch *);

	void be_BStopWatch_Suspend(be_BStopWatch *);
	void be_BStopWatch_Resume(be_BStopWatch *);
	bigtime_t be_BStopWatch_Lap(be_BStopWatch *);
	bigtime_t be_BStopWatch_ElapsedTime(be_BStopWatch *);
	void be_BStopWatch_Reset(be_BStopWatch *);
	char*	be_BStopWatch_Name(be_BStopWatch *);
}

final class BStopWatch
{
public:
	mixin(BObject!("be_BStopWatch", true, null));
	
	this(char [] name, bool silent = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BStopWatch_ctor(cast(be_BStopWatch *)this, toStringz(name), silent);
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
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
