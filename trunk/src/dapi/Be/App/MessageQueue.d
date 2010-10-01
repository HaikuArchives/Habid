/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.MessageQueue;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;

extern (C) extern {
	// BMessageQueue* be_BMessageQueue_ctor(void *bindInstPtr);
	void * be_BMessageQueue_ctor(void *bindInstPtr);

	// void be_BMessageQueue_dtor(BMessageQueue* self);
	void be_BMessageQueue_dtor(void* self);

	// void be_BMessageQueue_AddMessage(BMessageQueue *self, BMessage* message);
	void be_BMessageQueue_AddMessage(void *self, void* message);

	// void be_BMessageQueue_RemoveMessage(BMessageQueue *self, BMessage* message);
	void be_BMessageQueue_RemoveMessage(void *self, void* message);

	// int32 be_BMessageQueue_CountMessages(BMessageQueue *self);
	int32 be_BMessageQueue_CountMessages(void *self);

	// bool be_BMessageQueue_IsEmpty(BMessageQueue *self);
	bool be_BMessageQueue_IsEmpty(void *self);

	// BMessage* be_BMessageQueue_FindMessage(BMessageQueue *self, int32 index);
	void* be_BMessageQueue_FindMessage(void *self, int32 index);

	// BMessage* be_BMessageQueue_FindMessage_1(BMessageQueue *self, uint32 what, int32 index);
	void* be_BMessageQueue_FindMessage_1(void *self, uint32 what, int32 index);

	// bool be_BMessageQueue_Lock(BMessageQueue *self);
	bool be_BMessageQueue_Lock(void *self);

	// void be_BMessageQueue_Unlock(BMessageQueue *self);
	void be_BMessageQueue_Unlock(void *self);

	// bool be_BMessageQueue_IsLocked(BMessageQueue *self);
	bool be_BMessageQueue_IsLocked(void *self);

	// BMessage * be_BMessageQueue_NextMessage(BMessageQueue *self);
	BMessage * be_BMessageQueue_NextMessage(void *self);

	// bool be_BMessageQueue_IsNextMessage(BMessageQueue *self, const BMessage* message);
	bool be_BMessageQueue_IsNextMessage(void *self, void* message);

}


extern (C) {
}


interface IBMessageQueue
{
	// void be_BMessageQueue_AddMessage(BMessageQueue *self, BMessage* message);
	void AddMessage(BMessage);

	// void be_BMessageQueue_RemoveMessage(BMessageQueue *self, BMessage* message);
	void RemoveMessage(BMessage);

	// int32 be_BMessageQueue_CountMessages(BMessageQueue *self);
	int32 CountMessages();

	// bool be_BMessageQueue_IsEmpty(BMessageQueue *self);
	bool IsEmpty();

	// BMessage* be_BMessageQueue_FindMessage(BMessageQueue *self, int32 index);
	BMessage FindMessage(int32);

	// BMessage* be_BMessageQueue_FindMessage_1(BMessageQueue *self, uint32 what, int32 index);
	BMessage FindMessage(uint32, int32);

	// bool be_BMessageQueue_Lock(BMessageQueue *self);
	bool Lock();

	// void be_BMessageQueue_Unlock(BMessageQueue *self);
	void Unlock();

	// bool be_BMessageQueue_IsLocked(BMessageQueue *self);
	bool IsLocked();

	// BMessage * be_BMessageQueue_NextMessage(BMessageQueue *self);
	BMessage NextMessage();

	// bool be_BMessageQueue_IsNextMessage(BMessageQueue *self, const BMessage* message);
	bool IsNextMessage(BMessage);
	
	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

final class BMessageQueue : IBMessageQueue
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BMessageQueue* be_BMessageQueue_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BMessageQueue_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// void be_BMessageQueue_dtor(BMessageQueue* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BMessageQueue_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// void be_BMessageQueue_AddMessage(BMessageQueue *self, BMessage* message);
	void AddMessage(BMessage message) {
		be_BMessageQueue_AddMessage(_InstPtr(), message._InstPtr());
	}

	// void be_BMessageQueue_RemoveMessage(BMessageQueue *self, BMessage* message);
	void RemoveMessage(BMessage message) {
		be_BMessageQueue_RemoveMessage(_InstPtr(), message._InstPtr());
	}

	// int32 be_BMessageQueue_CountMessages(BMessageQueue *self);
	int32 CountMessages() {
		return be_BMessageQueue_CountMessages(_InstPtr());
	}

	// bool be_BMessageQueue_IsEmpty(BMessageQueue *self);
	bool IsEmpty() {
		return be_BMessageQueue_IsEmpty(_InstPtr());
	}

	// BMessage* be_BMessageQueue_FindMessage(BMessageQueue *self, int32 index);
	BMessage FindMessage(int32 index) {
		return new BMessage(be_BMessageQueue_FindMessage(_InstPtr(), index), false);
	}

	// BMessage* be_BMessageQueue_FindMessage_1(BMessageQueue *self, uint32 what, int32 index);
	BMessage FindMessage(uint32 what, int32 index = 0) {
		return new BMessage(be_BMessageQueue_FindMessage_1(_InstPtr(), what, index), false);
	}

	// bool be_BMessageQueue_Lock(BMessageQueue *self);
	bool Lock() {
		return be_BMessageQueue_Lock(_InstPtr());
	}

	// void be_BMessageQueue_Unlock(BMessageQueue *self);
	void Unlock() {
		be_BMessageQueue_Unlock(_InstPtr());
	}

	// bool be_BMessageQueue_IsLocked(BMessageQueue *self);
	bool IsLocked() {
		return be_BMessageQueue_IsLocked(_InstPtr());
	}

	// BMessage * be_BMessageQueue_NextMessage(BMessageQueue *self);
	BMessage NextMessage() {
		return new BMessage(be_BMessageQueue_NextMessage(_InstPtr()), false);
	}

	// bool be_BMessageQueue_IsNextMessage(BMessageQueue *self, const BMessage* message);
	bool IsNextMessage(BMessage message) {
		return be_BMessageQueue_IsNextMessage(_InstPtr(), message._InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


