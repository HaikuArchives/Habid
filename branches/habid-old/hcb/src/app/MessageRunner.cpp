#include <hcb-types.h>
#include <stdio.h>

#include <app/MessageRunner.h>

/* begin import functions */

extern "C" {
}

/* end import functions */

/* begin class BMessageQueue */


/* end class BMessageQueue */

/* begin export functions */

extern "C" {
	be_BMessageRunner * be_BMessageRunner_ctor_1(BMessenger *target, const BMessage *message, bigtime_t interval, int32 count) {
		return (be_BMessageRunner *)new BMessageRunner(*target, message, interval, count);
	}

	be_BMessageRunner * be_BMessageRunner_ctor_2(BMessenger *target, const BMessage *message, bigtime_t interval, int32 count, BMessenger *replyTo) {
		return (be_BMessageRunner *)new BMessageRunner(*target, message, interval, count, *replyTo);
	}

	void be_BMessageRunner_dtor(void *instPointer) {
		delete (BMessageRunner *)instPointer;
	}
	
	status_t be_BMessageRunner_InitCheck(void *instPointer) {
		return ((BMessageRunner *)instPointer)->InitCheck();
	}

	status_t be_BMessageRunner_SetInterval(void *instPointer, bigtime_t interval) {
		return ((BMessageRunner *)instPointer)->SetInterval(interval);
	}
	
	status_t be_BMessageRunner_SetCount(void *instPointer, int32 count) {
		return ((BMessageRunner *)instPointer)->SetCount(count);
	}
	
	status_t be_BMessageRunner_GetInfo(void *instPointer, bigtime_t *interval, int32 *count) {
		return ((BMessageRunner *)instPointer)->GetInfo(interval, count);
	}

	status_t be_BMessageRunner_StartSending_1(BMessenger *target, const BMessage *message, bigtime_t interval, int32 count) {
		return BMessageRunner::StartSending(*target, message, interval, count);
	}
	
	status_t be_BMessageRunner_StartSending_2(BMessenger *target, const BMessage *message, bigtime_t interval, int32 count, BMessenger *replyTo) {
		return BMessageRunner::StartSending(*target, message, interval, count, *replyTo);
	}

}

/* end export functions */

