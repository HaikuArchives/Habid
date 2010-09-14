/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Support.Locker;

import Support.BObject;

import Kernel.OS;

import Support.SupportDefs;

import tango.stdc.stringz;

extern (C) extern
{
	// BLocker * be_BLocker_ctor_1();
	void * be_BLocker_ctor(void *bindInstPtr);
	
	// BLocker * be_BLocker_ctor_2(const char *name);
	void * be_BLocker_ctor_1(void *bindInstPtr, char *name);
	
	//	BLocker * be_BLocker_ctor_3(bool benaphoreStyle);
	void * be_BLocker_ctor_2(void *bindInstPtr, bool benaphoreStyle);
	
	// BLocker * be_BLocker_ctor_4(const char *name, bool benaphoreStyle);
	void * be_BLocker_ctor_3(void *bindInstPtr, char *name, bool benaphoreStyle);
	
	//	void be_BLocker_dtor(BLocker *self);
	void be_BLocker_dtor(void *self);
	
	//	status_t be_BLocker_InitCheck(BLocker *self);
	status_t be_BLocker_InitCheck(void *self);
	
	//	bool be_BLocker_Lock(BLocker *self);
	bool be_BLocker_Lock(void *self);
	
	//	bool be_BLocker_LockWithTimeout(BLocker *self, bigtime_t timeout);
	bool be_BLocker_LockWithTimeout(void *self, bigtime_t timeout);
	
	//	void be_BLocker_Unlock(BLocker *self);
	void be_BLocker_Unlock(void *self);
	
	//	thread_id be_BLocker_LockingThread(BLocker *self);
	thread_id be_BLocker_LockingThread(void *self);
	
	//	bool be_BLocker_IsLocked(BLocker *self);
	bool be_BLocker_IsLocked(void *self);
	
	//	int32 be_BLocker_CountLocks(BLocker *self);
	int32 be_BLocker_CountLocks(void *self);
	
	//	int32 be_BLocker_CountLockRequests(BLocker *self);
	int32 be_BLocker_CountLockRequests(void *self);
	
	//	sem_id be_BLocker_Sem(BLocker *self);
	sem_id be_BLocker_Sem(void *self);
}

extern (C)
{
	
}

interface IBLocker
{
	
	void * _GetInstPtr();
}

final class BLocker : IBLocker
{
	mixin(BObject!());
public:
	// BLocker * be_BLocker_ctor_1();
	this() {
		fInstancePointer = be_BLocker_ctor(cast(void *)this);
		fOwnsPointer = true;
	}


	// BLocker * be_BLocker_ctor_2(const char *name);
	this(char [] name) {
		fInstancePointer = be_BLocker_ctor_1(cast(void *)this, toStringz(name));
		fOwnsPointer = true;
	}

	
	//	BLocker * be_BLocker_ctor_3(bool benaphoreStyle);
	this(bool benophoreStyle) {
		fInstancePointer = be_BLocker_ctor_2(cast(void *)this, benophoreStyle);
		fOwnsPointer = true;
	}

	
	// BLocker * be_BLocker_ctor_4(const char *name, bool benaphoreStyle);
	this(char [] name, bool benophoreStyle) {
		fInstancePointer = be_BLocker_ctor_3(cast(void *)this, toStringz(name), benophoreStyle);
		fOwnsPointer = true;
	}

	
	//	void be_BLocker_dtor(BLocker *self);
	~this() {
		be_BLocker_dtor(_GetInstPtr());
		fInstancePointer = null;
		fOwnsPointer = false;
	}

	
	//	status_t be_BLocker_InitCheck(BLocker *self);
	status_t InitCheck() {
		return be_BLocker_InitCheck(_GetInstPtr());
	}

	
	//	bool be_BLocker_Lock(BLocker *self);
	bool Lock() {
		return be_BLocker_Lock(_GetInstPtr());
	}

	
	//	bool be_BLocker_LockWithTimeout(BLocker *self, bigtime_t timeout);
	bool LockWithTimeout(bigtime_t timeout) {
		return be_BLocker_LockWithTimeout(_GetInstPtr(), timeout);
	}

	
	//	void be_BLocker_Unlock(BLocker *self);
	void Unlock() {
		be_BLocker_Unlock(_GetInstPtr());
	}

	
	//	thread_id be_BLocker_LockingThread(BLocker *self);
	thread_id LockingThread() {
		return be_BLocker_LockingThread(_GetInstPtr());
	}

	
	//	bool be_BLocker_IsLocked(BLocker *self);
	bool IsLocked() {
		return be_BLocker_IsLocked(_GetInstPtr());
	}

	
	//	int32 be_BLocker_CountLocks(BLocker *self);
	int32 CountLocks() {
		return be_BLocker_CountLocks(_GetInstPtr());
	}

	
	//	int32 be_BLocker_CountLockRequests(BLocker *self);
	int32 CountLockRequests() {
		return be_BLocker_CountLockRequests(_GetInstPtr());
	}

	
	//	sem_id be_BLocker_Sem(BLocker *self);
	sem_id Sem() {
		return be_BLocker_Sem(_GetInstPtr());
	}

	
	void * _GetInstPtr() {
		return fInstancePointer;
	}
	
}
