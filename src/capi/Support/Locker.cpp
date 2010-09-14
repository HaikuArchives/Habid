/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <SupportDefs.h>
#include <Locker.h>



extern "C" {
	BLocker* be_BLocker_ctor(void *bindInstPtr)
	{
		return new BLocker();
	}

	BLocker* be_BLocker_ctor_1(void *bindInstPtr, const char * name)
	{
		return new BLocker(name);
	}

	BLocker* be_BLocker_ctor_2(void *bindInstPtr, bool benaphoreStyle)
	{
		return new BLocker(benaphoreStyle);
	}

	BLocker* be_BLocker_ctor_3(void *bindInstPtr, const char * name, bool benaphoreStyle)
	{
		return new BLocker(name, benaphoreStyle);
	}

	void be_BLocker_dtor(BLocker* self)
	{
		delete self;
	}

	status_t be_BLocker_InitCheck(BLocker *self)
	{
		return self->InitCheck();
	}

	bool be_BLocker_Lock(BLocker *self)
	{
		return self->Lock();
	}

	bool be_BLocker_LockWithTimeout(BLocker *self, bigtime_t timeout)
	{
		return self->LockWithTimeout(timeout);
	}

	void be_BLocker_Unlock(BLocker *self)
	{
		self->Unlock();
	}

	thread_id be_BLocker_LockingThread(BLocker *self)
	{
		return self->LockingThread();
	}

	bool be_BLocker_IsLocked(BLocker *self)
	{
		return self->IsLocked();
	}

	int32 be_BLocker_CountLocks(BLocker *self)
	{
		return self->CountLocks();
	}

	int32 be_BLocker_CountLockRequests(BLocker *self)
	{
		return self->CountLockRequests();
	}

	sem_id be_BLocker_Sem(BLocker *self)
	{
		return self->Sem();
	}

}

