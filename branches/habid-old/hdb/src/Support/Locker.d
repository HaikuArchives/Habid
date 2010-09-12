module Support.Locker;

import Support.BObject;
import Support.SupportDefs;

import Kernel.OS;

import tango.stdc.stringz;
import tango.stdc.posix.sys.types;

import Support.types;

extern (C) extern {
	be_BLocker * be_BLocker_ctor_1(be_BLocker * bindInstPointer);
	be_BLocker * be_BLocker_ctor_2(be_BLocker * bindInstPointer, char* name);
	be_BLocker * be_BLocker_ctor_3(be_BLocker * bindInstPointer, bool benaphoreStyle);
	be_BLocker * be_BLocker_ctor_4(be_BLocker * bindInstPointer, char* name, bool benaphoreStyle);
	void be_BLocker_dtor(be_BLocker * instPointer);

	status_t be_BLocker_InitCheck(be_BLocker * instPointer);
	bool be_BLocker_Lock(be_BLocker * instPointer);
	status_t be_BLocker_LockWithTimeout(be_BLocker * instPointer, bigtime_t timeout);
	void be_BLocker_Unlock(be_BLocker * instPointer);
	thread_id be_BLocker_LockingThread(be_BLocker * instPointer);
	bool be_BLocker_IsLocked(be_BLocker * instPointer);
	int32 be_BLocker_CountLocks(be_BLocker * instPointer);
	int32 be_BLocker_CountLockRequests(be_BLocker * instPointer);
	sem_id be_BLocker_Sem(be_BLocker * instPointer);
}

extern (C) {

}

final class BLocker
{
public:
	mixin(BObject!("be_BLocker", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_1(cast(be_BLocker *)this);	
	}
	
	this(char [] name) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_2(cast(be_BLocker *)this, toStringz(name));	
	}
	
	this(bool benaphoreStyle) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_3(cast(be_BLocker *)this, benaphoreStyle);	
	}
	
	this(char [] name, bool benaphoreStyle) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLocker_ctor_4(cast(be_BLocker *)this, toStringz(name), benaphoreStyle);	
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
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
