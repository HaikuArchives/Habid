module App.Messenger;

import Support.BObject;
import Support.SupportDefs;

import App.Message;
import App.Handler;
import App.Looper;

import Kernel.OS;

import Support.Archivable;

import tango.stdc.posix.sys.types;
import tango.stdc.stringz;

import Support.types;

extern (C) extern {
	be_BMessenger *be_BMessenger_ctor_1();
	
	be_BMessenger *be_BMessenger_ctor_2(char *signature, team_id team, status_t *result);
	
	be_BMessenger *be_BMessenger_ctor_3(be_BHandler *handler, be_BLooper *looper, status_t *result);
	
	be_BMessenger *be_BMessenger_ctor_4(be_BMessenger *from);
	
	void be_BMessenger_dtor(be_BMessenger *instPointer);

	// Target

	bool be_BMessenger_IsTargetLocal(be_BMessenger *instPointer);
	
	be_BHandler *be_BMessenger_Target(be_BMessenger *instPointer, be_BLooper **looper);
	
	bool be_BMessenger_LockTarget(be_BMessenger *instPointer);
	
	status_t be_BMessenger_LockTargetWithTimeout(be_BMessenger *instPointer, bigtime_t timeout);
	

	// Message sending

	status_t be_BMessenger_SendMessage_1(be_BMessenger *instPointer, uint32 command, be_BHandler *replyTo);
	
	status_t be_BMessenger_SendMessage_2(be_BMessenger *instPointer, be_BMessage *message, be_BHandler *replyTo, bigtime_t timeout);

	status_t be_BMessenger_SendMessage_3(be_BMessenger *instPointer, be_BMessage *message, be_BMessenger *replyTo, bigtime_t timeout);
	
	status_t be_BMessenger_SendMessage_4(be_BMessenger *instPointer, uint32 command, be_BMessage *reply);
	
	status_t be_BMessenger_SendMessage_5(be_BMessenger *instPointer, be_BMessage *message, be_BMessage *reply, bigtime_t deliveryTimeout, bigtime_t replyTimeout);
	
	// Operators and misc
/*
	BMessenger &operator=(const BMessenger &from);
	bool operator==(const BMessenger &other) const;
*/

	bool be_BMessenger_IsValid(be_BMessenger *instPointer);
	
	team_id be_BMessenger_Team(be_BMessenger *instPointer);
}

extern (C) {
}

class BMessenger
{
public:
	mixin(BObject!("be_BMessenger", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessenger_ctor_1();
	}
	
	this(char [] signature, team_id team, inout status_t result) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessenger_ctor_2(toStringz(signature), team, &result);
	}

	this(BHandler handler, BLooper looper, inout status_t result) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessenger_ctor_3(handler.fInstancePointer, looper.fInstancePointer, &result);
	}

	this(BMessenger from) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessenger_ctor_4(from.fInstancePointer);
	}
	
	~this() {
		be_BMessenger_dtor(fInstancePointer);
	}

	// Target

	bool IsTargetLocal() {
		return be_BMessenger_IsTargetLocal(fInstancePointer);
	}
	
	BHandler Target(BLooper looper) {
		return new BHandler(be_BMessenger_Target(fInstancePointer, &looper.fInstancePointer), false);
	}

	bool LockTarget() {
		return be_BMessenger_LockTarget(fInstancePointer);
	}
	
	status_t LockTargetWithTimeout(bigtime_t timeout) {
		return be_BMessenger_LockTargetWithTimeout(fInstancePointer, timeout);
	}
	

	// Message sending

	status_t SendMessage(uint32 command, BHandler replyTo = null) {
		return be_BMessenger_SendMessage_1(fInstancePointer, command, replyTo is null ? null : replyTo.fInstancePointer);
	}
	
	status_t SendMessage(BMessage message, BHandler replyTo = null, bigtime_t timeout = B_INFINITE_TIMEOUT) {
		return be_BMessenger_SendMessage_2(fInstancePointer, message.fInstancePointer, replyTo is null ? null : replyTo.fInstancePointer, timeout);
	}

	status_t SendMessage(BMessage message, BMessenger replyTo, bigtime_t timeout = B_INFINITE_TIMEOUT) {
		return be_BMessenger_SendMessage_3(fInstancePointer, message.fInstancePointer, replyTo.fInstancePointer, timeout);
	}
	
	status_t SendMessage(uint32 command, BMessage reply) {
		return be_BMessenger_SendMessage_4(fInstancePointer, command, reply.fInstancePointer);
	}
	
	status_t SendMessage(BMessage message, BMessage reply, bigtime_t deliveryTimeout = B_INFINITE_TIMEOUT, bigtime_t replyTimeout = B_INFINITE_TIMEOUT) {
		return be_BMessenger_SendMessage_5(fInstancePointer, message.fInstancePointer, reply.fInstancePointer, deliveryTimeout, replyTimeout);
	}
	
	// Operators and misc
/*
	BMessenger &operator=(const BMessenger &from);
	bool operator==(const BMessenger &other) const;
*/

	bool IsValid() {
		return be_BMessenger_IsValid(fInstancePointer);
	}
	
	team_id Team() {
		return be_BMessenger_Team(fInstancePointer);
	}
}
