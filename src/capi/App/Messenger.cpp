/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Messenger.h>

extern "C" {
	BMessenger* be_BMessenger_ctor(void *bindInstPtr)
	{
		return new BMessenger();
	}

	BMessenger* be_BMessenger_ctor_1(void *bindInstPtr, const char * signature, team_id team, status_t * result)
	{
		return new BMessenger(signature, team, result);
	}

	BMessenger* be_BMessenger_ctor_2(void *bindInstPtr, const BHandler * handler, const BLooper * looper, status_t * result)
	{
		return new BMessenger(handler, looper, result);
	}

	BMessenger* be_BMessenger_ctor_3(void *bindInstPtr, const BMessenger * from)
	{
		return new BMessenger(*from);
	}

	void be_BMessenger_dtor(BMessenger* self)
	{
		delete self;
	}

	bool be_BMessenger_IsTargetLocal(BMessenger *self)
	{
		return self->IsTargetLocal();
	}

	BHandler * be_BMessenger_Target(BMessenger *self, BLooper ** looper)
	{
		return self->Target(looper);
	}

	bool be_BMessenger_LockTarget(BMessenger *self)
	{
		return self->LockTarget();
	}

	status_t be_BMessenger_LockTargetWithTimeout(BMessenger *self, bigtime_t timeout)
	{
		return self->LockTargetWithTimeout(timeout);
	}

	status_t be_BMessenger_SendMessage(BMessenger *self, uint32 command, BHandler * replyTo)
	{
		return self->SendMessage(command, replyTo);
	}

	status_t be_BMessenger_SendMessage_1(BMessenger *self, BMessage * message, BHandler * replyTo, bigtime_t timeout)
	{
		return self->SendMessage(message, replyTo, timeout);
	}

	status_t be_BMessenger_SendMessage_2(BMessenger *self, BMessage * message, BMessenger *replyTo, bigtime_t timeout)
	{
		return self->SendMessage(message, *replyTo, timeout);
	}

	status_t be_BMessenger_SendMessage_3(BMessenger *self, uint32 command, BMessage * reply)
	{
		return self->SendMessage(command, reply);
	}

	status_t be_BMessenger_SendMessage_4(BMessenger *self, BMessage * message, BMessage * reply, bigtime_t deliveryTimeout, bigtime_t replyTimeout)
	{
		return self->SendMessage(message, reply, deliveryTimeout, replyTimeout);
	}

	BMessenger * be_BMessenger_opAssign(BMessenger *self, const BMessenger * from)
	{
		return &self->operator=(*from);
	}

	bool be_BMessenger_opEquals(BMessenger *self, const BMessenger * other)
	{
		return self->operator==(*other);
	}

	bool be_BMessenger_IsValid(BMessenger *self)
	{
		return self->IsValid();
	}

	team_id be_BMessenger_Team(BMessenger *self)
	{
		return self->Team();
	}

}


