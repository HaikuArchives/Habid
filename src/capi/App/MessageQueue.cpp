/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <MessageQueue.h>

extern "C" {
	BMessageQueue* be_BMessageQueue_ctor(void *bindInstPtr)
	{
		return new BMessageQueue();
	}

	void be_BMessageQueue_dtor(BMessageQueue* self)
	{
		delete self;
	}

	void be_BMessageQueue_AddMessage(BMessageQueue *self, BMessage* message)
	{
		self->AddMessage(message);
	}

	void be_BMessageQueue_RemoveMessage(BMessageQueue *self, BMessage* message)
	{
		self->RemoveMessage(message);
	}

	int32 be_BMessageQueue_CountMessages(BMessageQueue *self)
	{
		return self->CountMessages();
	}

	bool be_BMessageQueue_IsEmpty(BMessageQueue *self)
	{
		return self->IsEmpty();
	}

	BMessage* be_BMessageQueue_FindMessage(BMessageQueue *self, int32 index)
	{
		return self->FindMessage(index);
	}

	BMessage* be_BMessageQueue_FindMessage_1(BMessageQueue *self, uint32 what, int32 index)
	{
		return self->FindMessage(what, index);
	}

	bool be_BMessageQueue_Lock(BMessageQueue *self)
	{
		return self->Lock();
	}

	void be_BMessageQueue_Unlock(BMessageQueue *self)
	{
		self->Unlock();
	}

	bool be_BMessageQueue_IsLocked(const BMessageQueue *self)
	{
		return self->IsLocked();
	}

	BMessage * be_BMessageQueue_NextMessage(BMessageQueue *self)
	{
		return self->NextMessage();
	}

	bool be_BMessageQueue_IsNextMessage(BMessageQueue *self, const BMessage* message)
	{
		return self->IsNextMessage(message);
	}

}


