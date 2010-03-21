#ifndef __STOPWATCH_H__
#define __STOPWATCH_H__

#include <support/StopWatch.h>

/* begin class BStopWatchBridge */

class BStopWatchBridge : public BStopWatch
{
public:
	BStopWatchBridge(const char *name, bool silent = false);
	virtual ~BStopWatchBridge();
};

/* end class BStopWatchBridge */

/* begin class BStopWatchProxy */

class BStopWatchProxy : public BStopWatchBridge
{
private:
	void *fBindInstPointer;
public:
	BStopWatchProxy(void *bindInstPointer, const char *name, bool silent = false);
	virtual ~BStopWatchProxy();
};

/* end class BStopWatchProxy */

#endif
