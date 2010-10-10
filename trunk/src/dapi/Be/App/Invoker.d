/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Invoker;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;
import Be.App.Messenger;
import Be.App.Handler;
import Be.App.Looper;


extern (C) extern {
	// BInvokerProxy * be_BInvoker_ctor(void *bindInstPtr);
	void * be_BInvoker_ctor(void *bindInstPtr);

	// BInvokerProxy * be_BInvoker_ctor_1(void *bindInstPtr, BMessage* message, const BHandler* handler, const BLooper* looper);
	void * be_BInvoker_ctor_1(void *bindInstPtr, void * message, void * handler, void * looper);

	// BInvokerProxy * be_BInvoker_ctor_2(void *bindInstPtr, BMessage* message, BMessenger *target);
	void * be_BInvoker_ctor_2(void *bindInstPtr, void * message, void *target);

	// void be_BInvoker_dtor(BInvoker* self);
	void be_BInvoker_dtor(void* self);

	// status_t be_BInvoker_SetMessage(BInvokerProxy *self, BMessage* message);
	status_t be_BInvoker_SetMessage(void *self, void * message);

	// BMessage* be_BInvoker_Message(BInvokerProxy *self);
	void * be_BInvoker_Message(void *self);

	// uint32 be_BInvoker_Command(BInvokerProxy *self);
	uint32 be_BInvoker_Command(void *self);

	// status_t be_BInvoker_SetTarget(BInvokerProxy *self, const BHandler* handler, const BLooper* looper);
	status_t be_BInvoker_SetTarget(void *self, void * handler, void * looper);

	// status_t be_BInvoker_SetTarget_1(BInvokerProxy *self, BMessenger *messenger);
	status_t be_BInvoker_SetTarget_1(void *self, void *messenger);

	// bool be_BInvoker_IsTargetLocal(BInvokerProxy *self);
	bool be_BInvoker_IsTargetLocal(void *self);

	// BHandler* be_BInvoker_Target(BInvokerProxy *self, BLooper** _looper);
	void * be_BInvoker_Target(void *self, void * _looper);

	// BMessenger * be_BInvoker_Messenger(BInvokerProxy *self);
	void * be_BInvoker_Messenger(void *self);

	// status_t be_BInvoker_SetHandlerForReply(BInvokerProxy *self, BHandler* handler);
	status_t be_BInvoker_SetHandlerForReply(void *self, void * handler);

	// BHandler* be_BInvoker_HandlerForReply(BInvokerProxy *self);
	void * be_BInvoker_HandlerForReply(void *self);

	// status_t be_BInvoker_Invoke(BInvokerProxy *self, BMessage* message);
	status_t be_BInvoker_Invoke(void *self, void * message);

	// status_t be_BInvoker_InvokeNotify(BInvokerProxy *self, BMessage* message, uint32 kind);
	status_t be_BInvoker_InvokeNotify(void *self, void * message, uint32 kind);

	// status_t be_BInvoker_SetTimeout(BInvokerProxy *self, bigtime_t timeout);
	status_t be_BInvoker_SetTimeout(void *self, bigtime_t timeout);

	// bigtime_t be_BInvoker_Timeout(BInvokerProxy *self);
	bigtime_t be_BInvoker_Timeout(void *self);

}


extern (C) {
	status_t bind_BInvoker_SetMessage(void *bindInstPtr, void* message) {
		return (cast(BInvoker)bindInstPtr).SetMessage(new BMessage(message, false));
	}

	status_t bind_BInvoker_SetTarget(void *bindInstPtr, void* handler,  void* looper) {
		return (cast(BInvoker)bindInstPtr).SetTarget(new BHandler(handler, false), new BLooper(looper, false));
	}

	status_t bind_BInvoker_SetTarget_1(void *bindInstPtr, void *messenger) {
		return (cast(BInvoker)bindInstPtr).SetTarget(new BMessenger(messenger, false));
	}

	status_t bind_BInvoker_SetHandlerForReply(void *bindInstPtr, void* handler) {
		return (cast(BInvoker)bindInstPtr).SetHandlerForReply(new BHandler(handler, false));
	}

	status_t bind_BInvoker_Invoke(void *bindInstPtr, void* message) {
		return (cast(BInvoker)bindInstPtr).Invoke(new BMessage(message, false));
	}

}


interface IBInvoker
{
	// status_t be_BInvoker_SetMessage(BInvoker *self, BMessage* message);
	status_t SetMessage(BMessage);

	// BMessage* be_BInvoker_Message(BInvoker *self);
	BMessage Message();

	// uint32 be_BInvoker_Command(BInvoker *self);
	uint32 Command();

	// status_t be_BInvoker_SetTarget(BInvoker *self, const BHandler* handler, const BLooper* looper);
	status_t SetTarget(BHandler, BLooper);

	// status_t be_BInvoker_SetTarget_1(BInvoker *self, BMessenger *messenger);
	status_t SetTarget(BMessenger);

	// bool be_BInvoker_IsTargetLocal(BInvoker *self);
	bool IsTargetLocal();

	// BHandler* be_BInvoker_Target(BInvoker *self, BLooper** _looper);
	BHandler Target(BLooper);

	// BMessenger * be_BInvoker_Messenger(BInvoker *self);
	BMessenger Messenger();

	// status_t be_BInvoker_SetHandlerForReply(BInvoker *self, BHandler* handler);
	status_t SetHandlerForReply(BHandler);

	// BHandler* be_BInvoker_HandlerForReply(BInvoker *self);
	BHandler HandlerForReply();

	// status_t be_BInvoker_Invoke(BInvoker *self, BMessage* message);
	status_t Invoke(BMessage);

	// status_t be_BInvoker_InvokeNotify(BInvoker *self, BMessage* message, uint32 kind);
	status_t InvokeNotify(BMessage, uint32);

	// status_t be_BInvoker_SetTimeout(BInvoker *self, bigtime_t timeout);
	status_t SetTimeout(bigtime_t);

	// bigtime_t be_BInvoker_Timeout(BInvoker *self);
	bigtime_t Timeout();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BInvoker : IBInvoker
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BInvokerProxy * be_BInvoker_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BInvoker_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BInvokerProxy * be_BInvoker_ctor_1(void *bindInstPtr, BMessage* message, const BHandler* handler, const BLooper* looper);
	this(BMessage message, BHandler handler, BLooper looper = null) {
		message._OwnsPtr = false;
		if(_InstPtr is null) {
			_InstPtr = be_BInvoker_ctor_1(cast(void *)this, message._InstPtr, handler._InstPtr, looper is null ? null : looper._InstPtr);
			_OwnsPtr = true;
		}
	}

	// BInvokerProxy * be_BInvoker_ctor_2(void *bindInstPtr, BMessage* message, BMessenger *target);
	this(BMessage message, BMessenger target) {
		message._OwnsPtr = false;
		if(_InstPtr is null) {
			_InstPtr = be_BInvoker_ctor_2(cast(void *)this, message._InstPtr, target._InstPtr);
			_OwnsPtr = true;
		}
	}

	// void be_BInvoker_dtor(BInvoker* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BInvoker_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BInvoker_SetMessage(BInvoker *self, BMessage* message);
	status_t SetMessage(BMessage message) {
		return be_BInvoker_SetMessage(_InstPtr(), message._InstPtr);
	}

	// BMessage* be_BInvoker_Message(BInvoker *self);
	BMessage Message() {
		return new BMessage(be_BInvoker_Message(_InstPtr()), false);
	}

	// uint32 be_BInvoker_Command(BInvoker *self);
	uint32 Command() {
		return be_BInvoker_Command(_InstPtr());
	}

	// status_t be_BInvoker_SetTarget(BInvoker *self, const BHandler* handler, const BLooper* looper);
	status_t SetTarget(BHandler handler, BLooper looper = null) {
		return be_BInvoker_SetTarget(_InstPtr(), handler is null ? null : handler._InstPtr, looper is null ? null : looper._InstPtr);
	}

	// status_t be_BInvoker_SetTarget_1(BInvoker *self, BMessenger *messenger);
	status_t SetTarget(BMessenger messenger) {
		return be_BInvoker_SetTarget_1(_InstPtr(), messenger._InstPtr);
	}

	// bool be_BInvoker_IsTargetLocal(BInvoker *self);
	bool IsTargetLocal() {
		return be_BInvoker_IsTargetLocal(_InstPtr());
	}

	// BHandler* be_BInvoker_Target(BInvoker *self, BLooper** _looper);
	BHandler Target(BLooper looper) {
		void *ptr = looper._InstPtr;
		
		return new BHandler(be_BInvoker_Target(_InstPtr(), &ptr), false);
	}

	// BMessenger * be_BInvoker_Messenger(BInvoker *self);
	BMessenger Messenger() {
		return new BMessenger(be_BInvoker_Messenger(_InstPtr()), false);
	}

	// status_t be_BInvoker_SetHandlerForReply(BInvoker *self, BHandler* handler);
	status_t SetHandlerForReply(BHandler handler) {
		return be_BInvoker_SetHandlerForReply(_InstPtr(), handler._InstPtr);
	}

	// BHandler* be_BInvoker_HandlerForReply(BInvoker *self);
	BHandler HandlerForReply() {
		return new BHandler(be_BInvoker_HandlerForReply(_InstPtr()), false);
	}

	// status_t be_BInvoker_Invoke(BInvoker *self, BMessage* message);
	status_t Invoke(BMessage message) {
		return be_BInvoker_Invoke(_InstPtr(), message._InstPtr);
	}

	// status_t be_BInvoker_InvokeNotify(BInvoker *self, BMessage* message, uint32 kind);
	status_t InvokeNotify(BMessage message, uint32 kind) {
		return be_BInvoker_InvokeNotify(_InstPtr(), message._InstPtr, kind);
	}

	// status_t be_BInvoker_SetTimeout(BInvoker *self, bigtime_t timeout);
	status_t SetTimeout(bigtime_t timeout) {
		return be_BInvoker_SetTimeout(_InstPtr(), timeout);
	}

	// bigtime_t be_BInvoker_Timeout(BInvoker *self);
	bigtime_t Timeout() {
		return be_BInvoker_Timeout(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


