/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.Autolock;

import Be.Support.BObject;

import Be.Support.Locker;

import Be.App.Looper;

extern (C) extern
{
	//	BAutolock * be_BAutolock_ctor_1(BLooper *looper)
	void * be_BAutolock_ctor_1(void *looper);
	
	//	BAutolock * be_BAutolock_ctor_2(BLocker *locker)
	void * be_BAutolock_ctor_2(void *locker);
	
	//	BAutolock * be_BAutolock_ctor_3(BLocker *locker)
	void * be_BAutolock_ctor_3(void *locker);

	//	void be_BAutolock_dtor(BAutolock *self)
	void be_BAutolock_dtor(void *self);
	
	//	bool be_BAutolock_IsLocked(BAutolock *self)
	bool be_BAutolock_IsLocked(void *self);
	
	//	bool be_BAutolock_Lock(BAutolock *self)
	bool be_BAutolock_Lock(void *self);
	
	//	void be_BAutolock_Unlock(BAutolock *self)
	void be_BAutolock_Unlock(void *self);
}


final class BAutolock
{
	mixin(BObject!());
public:
	//	BAutolock * be_BAutolock_ctor_1(BLooper *looper)
	this(IBLooper looper) {
		fInstancePointer = be_BAutolock_ctor_1(looper._GetInstPtr());
		fOwnsPointer = true;
	}

	
	//	BAutolock * be_BAutolock_ctor_2(BLocker *locker)
	this(IBLocker locker) {
		fInstancePointer = be_BAutolock_ctor_2(locker._GetInstPtr());
		fOwnsPointer = true;	
	}

	
	//	void be_BAutolock_dtor(BAutolock *self)
	~this() {
		if(fInstancePointer && fOwnsPointer)
			be_BAutolock_dtor(_GetInstPtr());
		
		fInstancePointer = null;
		fOwnsPointer = false;
	}

	
	//	bool be_BAutolock_IsLocked(BAutolock *self)	
	bool IsLocked() {
		return be_BAutolock_IsLocked(_GetInstPtr());
	}


	//	bool be_BAutolock_Lock(BAutolock *self)	
	bool Lock() {
		return be_BAutolock_Lock(_GetInstPtr());
	}


	//	void be_BAutolock_Unlock(BAutolock *self)
	void Unlock() {
		be_BAutolock_Unlock(_GetInstPtr());
	}

	
	void * _GetInstPtr() {
		return fInstancePointer;
	}
}
