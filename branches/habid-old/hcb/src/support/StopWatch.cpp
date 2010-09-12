#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_StopWatch.h>

/* begin import functions */

extern "C" {
}

/* end import functions */

/* begin class BStopWatchBridge */

BStopWatchBridge::BStopWatchBridge(const char *name, bool silent)
: BStopWatch(name, silent)
{ }

BStopWatchBridge::~BStopWatchBridge()
{ }

/* end class BStopWatchBridge */

/* begin class BStopWatchProxy */

BStopWatchProxy::BStopWatchProxy(void *bindInstPointer, const char *name, bool silent)
: fBindInstPointer(bindInstPointer), BStopWatchBridge(name, silent)
{ }

BStopWatchProxy::~BStopWatchProxy()
{ }

	
/* end class BStopWatchProxy */

/* begin export functions */
 
extern "C" {
	be_BStopWatch * be_BStopWatch_ctor(void *bindInstPointer, const char* name, bool silent) {
		return (be_BStopWatch *)new BStopWatchProxy(bindInstPointer, name, silent);
	}
	
	void be_BStopWatch_dtor(be_BStopWatch *instPointer) {
		delete (BStopWatchBridge *)instPointer;
	}

	void be_BStopWatch_Suspend(be_BStopWatch *instPointer) {
		((BStopWatchBridge *)instPointer)->Suspend();
	}
	
	void be_BStopWatch_Resume(be_BStopWatch *instPointer) {
		((BStopWatchBridge *)instPointer)->Resume();
	}

	bigtime_t be_BStopWatch_Lap(be_BStopWatch *instPointer) {
		return ((BStopWatchBridge *)instPointer)->Lap();
	}

	bigtime_t be_BStopWatch_ElapsedTime(be_BStopWatch *instPointer) {
		return ((BStopWatchBridge *)instPointer)->ElapsedTime();
	}

	void be_BStopWatch_Reset(be_BStopWatch *instPointer) {
		((BStopWatchBridge *)instPointer)->Reset();
	}

	const char*	be_BStopWatch_Name(be_BStopWatch *instPointer) {
		return ((BStopWatchBridge *)instPointer)->Name();
	}

}

/* end export functions */

