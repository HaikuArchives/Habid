/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.MessageRunner;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;
import Be.App.Messenger;

extern (C) extern {
	// BMessageRunner* be_BMessageRunner_ctor(void *bindInstPtr, BMessenger *target, const BMessage * message, bigtime_t interval, int32 count);
	void * be_BMessageRunner_ctor(void *bindInstPtr, void *target,  void * message, bigtime_t interval, int32 count);

	// BMessageRunner* be_BMessageRunner_ctor_1(void *bindInstPtr, BMessenger *target, const BMessage * message, bigtime_t interval, int32 count, BMessenger *replyTo);
	void * be_BMessageRunner_ctor_1(void *bindInstPtr, void *target,  void * message, bigtime_t interval, int32 count, void *replyTo);

	// void be_BMessageRunner_dtor(BMessageRunner* self);
	void be_BMessageRunner_dtor(void* self);

	// status_t be_BMessageRunner_InitCheck(BMessageRunner *self);
	status_t be_BMessageRunner_InitCheck(void *self);

	// status_t be_BMessageRunner_SetInterval(BMessageRunner *self, bigtime_t interval);
	status_t be_BMessageRunner_SetInterval(void *self, bigtime_t interval);

	// status_t be_BMessageRunner_SetCount(BMessageRunner *self, int32 count);
	status_t be_BMessageRunner_SetCount(void *self, int32 count);

	// status_t be_BMessageRunner_GetInfo(BMessageRunner *self, bigtime_t * interval, int32 * count);
	status_t be_BMessageRunner_GetInfo(void *self, bigtime_t * interval, int32 * count);

	//status_t be_BMessageRunner_StartSending_static(BMessenger *target, const BMessage * message, bigtime_t interval, int32 count)
	status_t be_BMessageRunner_StartSending_static(void *target,  void * message, bigtime_t interval, int32 count);

	//status_t be_BMessageRunner_StartSending_1_static(BMessenger *target, const BMessage * message, bigtime_t interval, int32 count, BMessenger *replyTo)
	status_t be_BMessageRunner_StartSending_1_static(void *target,  void * message, bigtime_t interval, int32 count, void *replyTo);

}


final class BMessageRunner
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BMessageRunner* be_BMessageRunner_ctor(void *bindInstPtr, BMessenger *target, const BMessage * message, bigtime_t interval, int32 count);
	this(BMessenger target, BMessage message, bigtime_t interval, int32 count) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessageRunner_ctor(cast(void *)this, target._InstPtr(), message._InstPtr(), interval, count);
			_OwnsPtr = true;
		}
	}

	// BMessageRunner* be_BMessageRunner_ctor_1(void *bindInstPtr, BMessenger *target, const BMessage * message, bigtime_t interval, int32 count, BMessenger *replyTo);
	this(BMessenger target, BMessage message, bigtime_t interval, int32 count, BMessenger replyTo) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessageRunner_ctor_1(cast(void *)this, target._InstPtr(), message._InstPtr(), interval, count, replyTo._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BMessageRunner_dtor(BMessageRunner* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BMessageRunner_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BMessageRunner_InitCheck(BMessageRunner *self);
	status_t InitCheck() {
		return be_BMessageRunner_InitCheck(_InstPtr());
	}

	// status_t be_BMessageRunner_SetInterval(BMessageRunner *self, bigtime_t interval);
	status_t SetInterval(bigtime_t interval) {
		return be_BMessageRunner_SetInterval(_InstPtr(), interval);
	}

	// status_t be_BMessageRunner_SetCount(BMessageRunner *self, int32 count);
	status_t SetCount(int32 count) {
		return be_BMessageRunner_SetCount(_InstPtr(), count);
	}

	// status_t be_BMessageRunner_GetInfo(BMessageRunner *self, bigtime_t * interval, int32 * count);
	status_t GetInfo(inout bigtime_t interval, inout int32 count) {
		return be_BMessageRunner_GetInfo(_InstPtr(), &interval, &count);
	}

	//status_t be_BMessageRunner_StartSending_static(BMessenger *target, const BMessage * message, bigtime_t interval, int32 count)
	static status_t StartSending(BMessenger target, BMessage message, bigtime_t interval, int32 count)
	{
		return be_BMessageRunner_StartSending_static(target._InstPtr(), message._InstPtr(), interval, count);
	}

	//status_t be_BMessageRunner_StartSending_1_static(BMessenger *target, const BMessage * message, bigtime_t interval, int32 count, BMessenger *replyTo)
	static status_t StartSending(BMessenger target, BMessage message, bigtime_t interval, int32 count, BMessenger replyTo)
	{
		return be_BMessageRunner_StartSending_1_static(target._InstPtr(), message._InstPtr(), interval, count, replyTo._InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


