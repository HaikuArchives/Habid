module Support.Locker;

import Support.BObject;
import Support.SupportDefs;

import Kernel.OS;

import tango.stdc.stringz;
import tango.stdc.posix.sys.types;

extern (C) extern {
	void * be_BLocker_ctor_1(void *bindInstPointer);
	void * be_BLocker_ctor_2(void *bindInstPointer, char* name);
	void * be_BLocker_ctor_3(void *bindInstPointer, bool benaphoreStyle);
	void * be_BLocker_ctor_4(void *bindInstPointer, char* name, bool benaphoreStyle);
	void be_BLocker_dtor(void *instPointer);

	status_t be_BLocker_InitCheck(void *instPointer);
	bool be_BLocker_Lock(void *instPointer);
	status_t be_BLocker_LockWithTimeout(void *instPointer, bigtime_t timeout);
	void be_BLocker_Unlock(void *instPointer);
	thread_id be_BLocker_LockingThread(void *instPointer);
	bool be_BLocker_IsLocked(void *instPointer);
	int32 be_BLocker_CountLocks(void *instPointer);
	int32 be_BLocker_CountLockRequests(void *instPointer);
	sem_id be_BLocker_Sem(void *instPointer);
}

extern (C) {

}

final class BLocker
{
public:
	mixin BObject;
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_1(cast(void *)this);	
	}
	
	this(char [] name) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_2(cast(void *)this, toStringz(name));	
	}
	
	this(bool benaphoreStyle) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_3(cast(void *)this, benaphoreStyle);	
	}
	
	this(char [] name, bool benaphoreStyle) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_4(cast(void *)this, toStringz(name), benaphoreStyle);	
	}
	
	~this() {
		if(fInstancePointer !is null)
			be_BLocker_dtor(fInstancePointer);
		fInstancePointer = null;		
	}
	
	status_t InitCheck() {
		return be_BLocker_InitCheck(fInstancePointer);
	}
	
	bool Lock() {
		return be_BLocker_Lock(fInstancePointer);
	}
	
	status_t LockWithTimeout(bigtime_t timeout) {
		return be_BLocker_LockWithTimeout(fInstancePointer, timeout);
	}
	
	void Unlock() {
		be_BLocker_Unlock(fInstancePointer);
	}
	
	thread_id LockingThread() {
		return be_BLocker_LockingThread(fInstancePointer);
	}
	
	bool IsLocked() {
		return be_BLocker_IsLocked(fInstancePointer);
	}
	
	int32 CountLocks() {
		return be_BLocker_CountLocks(fInstancePointer);
	}
	
	int32 CountLockRequests() {
		return be_BLocker_CountLockRequests(fInstancePointer);
	}
	
	sem_id Sem() {
		return be_BLocker_Sem(fInstancePointer);
	}
}
