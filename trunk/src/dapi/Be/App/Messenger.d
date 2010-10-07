/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Messenger;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Looper;
import Be.App.Handler;
import Be.App.Message;

import Be.Kernel.OS;

import tango.stdc.stringz;

extern (C) extern {
	// BMessenger* be_BMessenger_ctor(void *bindInstPtr);
	void * be_BMessenger_ctor(void *bindInstPtr);

	// BMessenger* be_BMessenger_ctor_1(void *bindInstPtr, const char * signature, team_id team, status_t * result);
	void * be_BMessenger_ctor_1(void *bindInstPtr, char * signature, team_id team, status_t * result);

	// BMessenger* be_BMessenger_ctor_2(void *bindInstPtr, const BHandler * handler, const BLooper * looper, status_t * result);
	void * be_BMessenger_ctor_2(void *bindInstPtr, void * handler,  void * looper, status_t * result);

	// BMessenger* be_BMessenger_ctor_3(void *bindInstPtr, const BMessenger * from);
	void * be_BMessenger_ctor_3(void *bindInstPtr, void * from);

	// void be_BMessenger_dtor(BMessenger* self);
	void be_BMessenger_dtor(void* self);

	// bool be_BMessenger_IsTargetLocal(BMessenger *self);
	bool be_BMessenger_IsTargetLocal(void *self);

	// BHandler * be_BMessenger_Target(BMessenger *self, BLooper ** looper);
	BHandler * be_BMessenger_Target(void *self, void ** looper);

	// bool be_BMessenger_LockTarget(BMessenger *self);
	bool be_BMessenger_LockTarget(void *self);

	// status_t be_BMessenger_LockTargetWithTimeout(BMessenger *self, bigtime_t timeout);
	status_t be_BMessenger_LockTargetWithTimeout(void *self, bigtime_t timeout);

	// status_t be_BMessenger_SendMessage(BMessenger *self, uint32 command, BHandler * replyTo);
	status_t be_BMessenger_SendMessage(void *self, uint32 command, void * replyTo);

	// status_t be_BMessenger_SendMessage_1(BMessenger *self, BMessage * message, BHandler * replyTo, bigtime_t timeout);
	status_t be_BMessenger_SendMessage_1(void *self, void * message, void * replyTo, bigtime_t timeout);

	// status_t be_BMessenger_SendMessage_2(BMessenger *self, BMessage * message, BMessenger *replyTo, bigtime_t timeout);
	status_t be_BMessenger_SendMessage_2(void *self, void * message, void *replyTo, bigtime_t timeout);

	// status_t be_BMessenger_SendMessage_3(BMessenger *self, uint32 command, BMessage * reply);
	status_t be_BMessenger_SendMessage_3(void *self, uint32 command, void * reply);

	// status_t be_BMessenger_SendMessage_4(BMessenger *self, BMessage * message, BMessage * reply, bigtime_t deliveryTimeout, bigtime_t replyTimeout);
	status_t be_BMessenger_SendMessage_4(void *self, void * message, void * reply, bigtime_t deliveryTimeout, bigtime_t replyTimeout);

	// BMessenger * be_BMessenger_opAssign(BMessenger *self, const BMessenger * from);
	void * be_BMessenger_opAssign(void *self, void * from);

	// bool be_BMessenger_opEquals(BMessenger *self, const BMessenger * other);
	bool be_BMessenger_opEquals(void *self, void * other);

	// bool be_BMessenger_IsValid(BMessenger *self);
	bool be_BMessenger_IsValid(void *self);

	// team_id be_BMessenger_Team(BMessenger *self);
	team_id be_BMessenger_Team(void *self);

}


final class BMessenger
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BMessenger* be_BMessenger_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BMessenger_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BMessenger* be_BMessenger_ctor_1(void *bindInstPtr, const char * signature, team_id team, status_t * result);
	this(char [] signature, team_id team, status_t result) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessenger_ctor_1(cast(void *)this, toStringz(signature), team, &result);
			_OwnsPtr = true;
		}
	}

	// BMessenger* be_BMessenger_ctor_2(void *bindInstPtr, const BHandler * handler, const BLooper * looper, status_t * result);
	this(BHandler handler, BLooper looper, inout status_t result) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessenger_ctor_2(cast(void *)this, handler._InstPtr(), looper is null ? null : looper._InstPtr(), &result);
			_OwnsPtr = true;
		}
	}

	// BMessenger* be_BMessenger_ctor_3(void *bindInstPtr, const BMessenger * from);
	this(BMessenger from) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessenger_ctor_3(cast(void *)this, from._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BMessenger_dtor(BMessenger* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BMessenger_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// bool be_BMessenger_IsTargetLocal(BMessenger *self);
	bool IsTargetLocal() {
		return be_BMessenger_IsTargetLocal(_InstPtr());
	}

	// BHandler * be_BMessenger_Target(BMessenger *self, BLooper ** looper);
	BHandler Target(BLooper looper) {
		return new BHandler(be_BMessenger_Target(_InstPtr(), cast(void **)looper._InstPtr()), false);
	}

	// bool be_BMessenger_LockTarget(BMessenger *self);
	bool LockTarget() {
		return be_BMessenger_LockTarget(_InstPtr());
	}

	// status_t be_BMessenger_LockTargetWithTimeout(BMessenger *self, bigtime_t timeout);
	status_t LockTargetWithTimeout(bigtime_t timeout) {
		return be_BMessenger_LockTargetWithTimeout(_InstPtr(), timeout);
	}

	// status_t be_BMessenger_SendMessage(BMessenger *self, uint32 command, BHandler * replyTo);
	status_t SendMessage(uint32 command, BHandler replyTo = null) {
		return be_BMessenger_SendMessage(_InstPtr(), command, replyTo is null ? null : replyTo._InstPtr());
	}

	// status_t be_BMessenger_SendMessage_1(BMessenger *self, BMessage * message, BHandler * replyTo, bigtime_t timeout);
	status_t SendMessage(BMessage message, BHandler replyTo = null, bigtime_t timeout = B_INFINITE_TIMEOUT) {
		return be_BMessenger_SendMessage_1(_InstPtr(), message._InstPtr(), replyTo is null ? null : replyTo._InstPtr(), timeout);
	}

	// status_t be_BMessenger_SendMessage_2(BMessenger *self, BMessage * message, BMessenger *replyTo, bigtime_t timeout);
	status_t SendMessage(BMessage message, BMessenger replyTo, bigtime_t timeout  = B_INFINITE_TIMEOUT) {
		return be_BMessenger_SendMessage_2(_InstPtr(), message._InstPtr(), replyTo._InstPtr(), timeout);
	}

	// status_t be_BMessenger_SendMessage_3(BMessenger *self, uint32 command, BMessage * reply);
	status_t SendMessage(uint32 command, BMessage reply) {
		return be_BMessenger_SendMessage_3(_InstPtr(), command, reply._InstPtr());
	}

	// status_t be_BMessenger_SendMessage_4(BMessenger *self, BMessage * message, BMessage * reply, bigtime_t deliveryTimeout, bigtime_t replyTimeout);
	status_t SendMessage(BMessage message, BMessage reply, bigtime_t deliveryTimeout = B_INFINITE_TIMEOUT, bigtime_t replyTimeout = B_INFINITE_TIMEOUT) {
		return be_BMessenger_SendMessage_4(_InstPtr(), message._InstPtr(), reply._InstPtr(), deliveryTimeout, replyTimeout);
	}

	// BMessenger & be_BMessenger_opAssign(BMessenger *self, const BMessenger & from);
	//BMessenger & opAssign();

	// bool be_BMessenger_opEquals(BMessenger *self, const BMessenger & other);
	//bool opEquals();

	// bool be_BMessenger_IsValid(BMessenger *self);
	bool IsValid() {
		return be_BMessenger_IsValid(_InstPtr());
	}

	// team_id be_BMessenger_Team(BMessenger *self);
	team_id Team() {
		return be_BMessenger_Team(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


