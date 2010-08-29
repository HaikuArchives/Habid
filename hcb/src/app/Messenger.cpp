#include <hcb-types.h>
#include <stdio.h>

#include <app/Messenger.h>

/* begin import functions */

extern "C" {
}

/* end import functions */

/* begin class BMessageQueue */


/* end class BMessageQueue */

/* begin export functions */

extern "C" {
	be_BMessenger *be_BMessenger_ctor_1() {
		return (be_BMessenger *)new BMessenger();
	}
	
	be_BMessenger *be_BMessenger_ctor_2(const char *signature, team_id team, status_t *result) {
		return (be_BMessenger *)new BMessenger(signature, team, result);
	}
	
	be_BMessenger *be_BMessenger_ctor_3(const BHandler *handler, const BLooper *looper, status_t *result) {
		return (be_BMessenger *)new BMessenger(handler, looper, result);
	}
	
	be_BMessenger *be_BMessenger_ctor_4(const BMessenger *from) {
		return (be_BMessenger *)new BMessenger(*from);
	}
	
	void be_BMessenger_dtor(be_BMessenger *instPointer) {
		delete (BMessenger *)instPointer;
	}

	// Target

	bool be_BMessenger_IsTargetLocal(be_BMessenger *instPointer) {
		return ((BMessenger *)instPointer)->IsTargetLocal();
	}
	
	BHandler *be_BMessenger_Target(be_BMessenger *instPointer, BLooper **looper) {
		return ((BMessenger *)instPointer)->Target(looper);
	}
	
	bool be_BMessenger_LockTarget(be_BMessenger *instPointer) {
		return ((BMessenger *)instPointer)->LockTarget();
	}
	
	status_t be_BMessenger_LockTargetWithTimeout(be_BMessenger *instPointer, bigtime_t timeout) {
		return ((BMessenger *)instPointer)->LockTargetWithTimeout(timeout);
	}
	

	// Message sending

	status_t be_BMessenger_SendMessage_1(be_BMessenger *instPointer, uint32 command, BHandler *replyTo) {
		return ((BMessenger *)instPointer)->SendMessage(command, replyTo);
	}
	
	status_t be_BMessenger_SendMessage_2(be_BMessenger *instPointer, BMessage *message, BHandler *replyTo, bigtime_t timeout) {
		return ((BMessenger *)instPointer)->SendMessage(message, replyTo, timeout);
	}

	status_t be_BMessenger_SendMessage_3(be_BMessenger *instPointer, BMessage *message, BMessenger *replyTo, bigtime_t timeout) {
		return ((BMessenger *)instPointer)->SendMessage(message, *replyTo, timeout);
	}
	
	status_t be_BMessenger_SendMessage_4(be_BMessenger *instPointer, uint32 command, BMessage *reply) {
		return ((BMessenger *)instPointer)->SendMessage(command, reply);
	}
	
	status_t be_BMessenger_SendMessage_5(be_BMessenger *instPointer, BMessage *message, BMessage *reply, bigtime_t deliveryTimeout, bigtime_t replyTimeout) {
		return ((BMessenger *)instPointer)->SendMessage(message, reply, deliveryTimeout, replyTimeout);
	}
	
	// Operators and misc
/*
	BMessenger &operator=(const BMessenger &from);
	bool operator==(const BMessenger &other) const;
*/

	bool be_BMessenger_IsValid(be_BMessenger *instPointer) {
		return ((BMessenger *)instPointer)->IsValid();
	}
	
	team_id be_BMessenger_Team(be_BMessenger *instPointer) {
		return ((BMessenger *)instPointer)->Team();
	}


}

/* end export functions */

