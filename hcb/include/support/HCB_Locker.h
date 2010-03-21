#ifndef __LOCKER_H__
#define __LOCKER_H__

#include <support/Locker.h>

class BLockerBridge : public BLocker
{
public:
	BLockerBridge();
	BLockerBridge(const char* name);
	BLockerBridge(bool benaphoreStyle);
	BLockerBridge(const char* name, bool benaphoreStyle);
	virtual ~BLockerBridge();

};


class BLockerProxy : public BLockerBridge
{
private:
	void *fBindInstPointer;
public:
	BLockerProxy(void *bindInstPointer);
	BLockerProxy(void *bindInstPointer, const char* name);
	BLockerProxy(void *bindInstPointer, bool benaphoreStyle);
	BLockerProxy(void *bindInstPointer, const char* name, bool benaphoreStyle);

	virtual ~BLockerProxy();
	
};

#endif
