/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <MessageRunner.h>

extern "C" {
	BMessageRunner* be_BMessageRunner_ctor(void *bindInstPtr, BMessenger *target, const BMessage * message, bigtime_t interval, int32 count)
	{
		return new BMessageRunner(*target, message, interval, count);
	}

	BMessageRunner* be_BMessageRunner_ctor_1(void *bindInstPtr, BMessenger *target, const BMessage * message, bigtime_t interval, int32 count, BMessenger *replyTo)
	{
		return new BMessageRunner(*target, message, interval, count, *replyTo);
	}

	void be_BMessageRunner_dtor(BMessageRunner* self)
	{
		delete self;
	}

	status_t be_BMessageRunner_InitCheck(BMessageRunner *self)
	{
		return self->InitCheck();
	}

	status_t be_BMessageRunner_SetInterval(BMessageRunner *self, bigtime_t interval)
	{
		return self->SetInterval(interval);
	}

	status_t be_BMessageRunner_SetCount(BMessageRunner *self, int32 count)
	{
		return self->SetCount(count);
	}

	status_t be_BMessageRunner_GetInfo(BMessageRunner *self, bigtime_t * interval, int32 * count)
	{
		return self->GetInfo(interval, count);
	}

	status_t be_BMessageRunner_StartSending_static(BMessenger *target, const BMessage * message, bigtime_t interval, int32 count)
	{
		return BMessageRunner::StartSending(*target, message, interval, count);
	}

	status_t be_BMessageRunner_StartSending_1_static(BMessenger *target, const BMessage * message, bigtime_t interval, int32 count, BMessenger *replyTo)
	{
		return BMessageRunner::StartSending(*target, message, interval, count, *replyTo);
	}

}


