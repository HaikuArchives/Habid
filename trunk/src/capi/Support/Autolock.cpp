/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


#include <Autolock.h>

extern "C" {
	BAutolock * be_BAutolock_ctor_1(BLooper *looper)
	{
		return new BAutolock(looper);
	}

	BAutolock * be_BAutolock_ctor_2(BLocker *locker)
	{
		return new BAutolock(locker);
	}

	BAutolock * be_BAutolock_ctor_3(BLocker *locker)
	{
		return new BAutolock(*locker);
	}

	void be_BAutolock_dtor(BAutolock *self)
	{
		delete self;
	}

	bool be_BAutolock_IsLocked(BAutolock *self)
	{
		return self->IsLocked();
	}

	bool be_BAutolock_Lock(BAutolock *self)
	{
		return self->Lock();
	}

	void be_BAutolock_Unlock(BAutolock *self)
	{
		return self->Unlock();
	}
}
