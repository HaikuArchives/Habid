#include <support/Locker.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_Locker.h>

/* begin import functions */

extern "C" {
}

/* end import functions */

/* begin class BLockerBridge */

BLockerBridge::BLockerBridge()
: BLocker()
{ }

BLockerBridge::BLockerBridge(const char* name)
: BLocker(name)
{ }

BLockerBridge::BLockerBridge(bool benaphoreStyle)
: BLocker(benaphoreStyle)
{ }

BLockerBridge::BLockerBridge(const char* name, bool benaphoreStyle)
: BLocker(name, benaphoreStyle)
{ }

BLockerBridge::~BLockerBridge()
{ }

/* end class BLockerBridge */

/* begin class BLockerProxy */

BLockerProxy::BLockerProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BLockerBridge()
{ }

BLockerProxy::BLockerProxy(void *bindInstPointer, const char* name)
: fBindInstPointer(bindInstPointer), BLockerBridge(name)
{ }

BLockerProxy::BLockerProxy(void *bindInstPointer, bool benaphoreStyle)
: fBindInstPointer(bindInstPointer), BLockerBridge(benaphoreStyle)
{ }

BLockerProxy::BLockerProxy(void *bindInstPointer, const char* name, bool benaphoreStyle)
: fBindInstPointer(bindInstPointer), BLockerBridge(name, benaphoreStyle)
{ }

BLockerProxy::~BLockerProxy()
{ }

/* end class BDataIOProxy */

/* begin export functions */

extern "C" {
	be_BLocker * be_BLocker_ctor_1(void *bindInstPointer) {
		return (be_BLocker *)new BLockerProxy(bindInstPointer);
	}
	
	be_BLocker * be_BLocker_ctor_2(void *bindInstPointer, const char* name) {
		return (be_BLocker *)new BLockerProxy(bindInstPointer, name);
	}

	be_BLocker * be_BLocker_ctor_3(void *bindInstPointer, bool benaphoreStyle) {
		return (be_BLocker *)new BLockerProxy(bindInstPointer, benaphoreStyle);
	}

	be_BLocker * be_BLocker_ctor_4(void *bindInstPointer, const char* name, bool benaphoreStyle) {
		return (be_BLocker *)new BLockerProxy(bindInstPointer, name, benaphoreStyle);
	}

	
	void be_BLocker_dtor(be_BLocker *instPointer) {
		delete (BLockerProxy *)instPointer;
	}
	
	status_t be_BLocker_InitCheck(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->InitCheck();
	}


	bool be_BLocker_Lock(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->Lock();
	}

	status_t be_BLocker_LockWithTimeout(be_BLocker *instPointer, bigtime_t timeout) {
		((BLockerProxy *)instPointer)->LockWithTimeout(timeout);
	}

	void be_BLocker_Unlock(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->Unlock();
	}


	thread_id be_BLocker_LockingThread(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->LockingThread();
	}

	bool be_BLocker_IsLocked(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->IsLocked();
	}

	int32 be_BLocker_CountLocks(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->CountLocks();
	}

	int32 be_BLocker_CountLockRequests(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->CountLockRequests();
	}

	sem_id be_BLocker_Sem(be_BLocker *instPointer) {
		((BLockerProxy *)instPointer)->Sem();
	}

}

/* end export functions */

