/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.Locker;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Kernel.OS;

import tango.stdc.stringz;

extern (C) extern {
	// BLocker* be_BLocker_ctor(void *bindInstPtr);
	void * be_BLocker_ctor(void *bindInstPtr);

	// BLocker* be_BLocker_ctor_1(void *bindInstPtr, const char * name);
	void * be_BLocker_ctor_1(void *bindInstPtr, char * name);

	// BLocker* be_BLocker_ctor_2(void *bindInstPtr, bool benaphoreStyle);
	void * be_BLocker_ctor_2(void *bindInstPtr, bool benaphoreStyle);

	// BLocker* be_BLocker_ctor_3(void *bindInstPtr, const char * name, bool benaphoreStyle);
	void * be_BLocker_ctor_3(void *bindInstPtr, char * name, bool benaphoreStyle);

	// void be_BLocker_dtor(BLocker* self);
	void be_BLocker_dtor(void* self);

	// status_t be_BLocker_InitCheck(BLocker *self);
	status_t be_BLocker_InitCheck(void *self);

	// bool be_BLocker_Lock(BLocker *self);
	bool be_BLocker_Lock(void *self);

	// bool be_BLocker_LockWithTimeout(BLocker *self, bigtime_t timeout);
	bool be_BLocker_LockWithTimeout(void *self, bigtime_t timeout);

	// void be_BLocker_Unlock(BLocker *self);
	void be_BLocker_Unlock(void *self);

	// thread_id be_BLocker_LockingThread(BLocker *self);
	thread_id be_BLocker_LockingThread(void *self);

	// bool be_BLocker_IsLocked(BLocker *self);
	bool be_BLocker_IsLocked(void *self);

	// int32 be_BLocker_CountLocks(BLocker *self);
	int32 be_BLocker_CountLocks(void *self);

	// int32 be_BLocker_CountLockRequests(BLocker *self);
	int32 be_BLocker_CountLockRequests(void *self);

	// sem_id be_BLocker_Sem(BLocker *self);
	sem_id be_BLocker_Sem(void *self);

}


extern (C) {
}


interface IBLocker
{
	// status_t be_BLocker_InitCheck(BLocker *self);
	status_t InitCheck();

	// bool be_BLocker_Lock(BLocker *self);
	bool Lock();

	// bool be_BLocker_LockWithTimeout(BLocker *self, bigtime_t timeout);
	bool LockWithTimeout(bigtime_t timeout);

	// void be_BLocker_Unlock(BLocker *self);
	void Unlock();

	// thread_id be_BLocker_LockingThread(BLocker *self);
	thread_id LockingThread();

	// bool be_BLocker_IsLocked(BLocker *self);
	bool IsLocked();

	// int32 be_BLocker_CountLocks(BLocker *self);
	int32 CountLocks();

	// int32 be_BLocker_CountLockRequests(BLocker *self);
	int32 CountLockRequests();

	// sem_id be_BLocker_Sem(BLocker *self);
	sem_id Sem();

	void * _InstPtr();
	bool _OwnsPtr();
}

final class BLocker : IBLocker
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BLocker* be_BLocker_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BLocker_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BLocker* be_BLocker_ctor_1(void *bindInstPtr, const char * name);
	this(char [] name) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BLocker_ctor_1(cast(void *)this, toStringz(name));
			fOwnsPointer = true;
		}
	}

	// BLocker* be_BLocker_ctor_2(void *bindInstPtr, bool benaphoreStyle);
	this(bool benaphoreStyle) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BLocker_ctor_2(cast(void *)this, benaphoreStyle);
			fOwnsPointer = true;
		}
	}

	// BLocker* be_BLocker_ctor_3(void *bindInstPtr, const char * name, bool benaphoreStyle);
	this(char [] name, bool benaphoreStyle) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BLocker_ctor_3(cast(void *)this, toStringz(name), benaphoreStyle);
			fOwnsPointer = true;
		}
	}

	// void be_BLocker_dtor(BLocker* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BLocker_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// status_t be_BLocker_InitCheck(BLocker *self);
	status_t InitCheck() {
		return be_BLocker_InitCheck(_InstPtr());
	}

	// bool be_BLocker_Lock(BLocker *self);
	bool Lock() {
		return be_BLocker_Lock(_InstPtr());
	}

	// bool be_BLocker_LockWithTimeout(BLocker *self, bigtime_t timeout);
	bool LockWithTimeout(bigtime_t timeout) {
		return be_BLocker_LockWithTimeout(_InstPtr(), timeout);
	}

	// void be_BLocker_Unlock(BLocker *self);
	void Unlock() {
		be_BLocker_Unlock(_InstPtr());
	}

	// thread_id be_BLocker_LockingThread(BLocker *self);
	thread_id LockingThread() {
		return be_BLocker_LockingThread(_InstPtr());
	}

	// bool be_BLocker_IsLocked(BLocker *self);
	bool IsLocked() {
		return be_BLocker_IsLocked(_InstPtr());
	}

	// int32 be_BLocker_CountLocks(BLocker *self);
	int32 CountLocks() {
		return be_BLocker_CountLocks(_InstPtr());
	}

	// int32 be_BLocker_CountLockRequests(BLocker *self);
	int32 CountLockRequests() {
		return be_BLocker_CountLockRequests(_InstPtr());
	}

	// sem_id be_BLocker_Sem(BLocker *self);
	sem_id Sem() {
		return be_BLocker_Sem(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


