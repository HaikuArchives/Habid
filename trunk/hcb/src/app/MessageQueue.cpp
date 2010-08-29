#include <hcb-types.h>
#include <stdio.h>

#include <app/MessageQueue.h>

#include <app/HCB_MessageQueue.h>

/* begin import functions */

extern "C" {
}

/* end import functions */

/* begin class BMessageQueue */
/*
BMessageQueue::BMessageQueue()
: BMessageQueue()
{ }

BMessageQueue::~BMessageQueue()
{ }

bool BMessageQueue::IsLocked() const
{
	return BMessageQueue::IsLocked();
}
*/
/* end class BMessageQueue */

/* begin export functions */

extern "C" {
	be_BMessageQueue * be_BMessageQueue_ctor() {
		return (be_BMessageQueue *)new BMessageQueue();
	}
	
	void be_BMessageQueue_dtor(be_BMessageQueue *instPointer) {
		delete (BMessageQueue *)instPointer;
	}

	void be_BMessageQueue_AddMessage(be_BMessageQueue *instPointer, be_BMessage* message) {
		((BMessageQueue *)instPointer)->AddMessage((BMessage *)message);
	}
	
	void be_BMessageQueue_RemoveMessage(be_BMessageQueue *instPointer, be_BMessage* message) {
		((BMessageQueue *)instPointer)->RemoveMessage((BMessage *)message);
	}


	int32 be_BMessageQueue_CountMessages(be_BMessageQueue *instPointer) {
		return ((BMessageQueue *)instPointer)->CountMessages();
	}

	bool be_BMessageQueue_IsEmpty(be_BMessageQueue *instPointer) {
		return ((BMessageQueue *)instPointer)->IsEmpty();
	}


	be_BMessage* be_BMessageQueue_FindMessage_1(be_BMessageQueue *instPointer, int32 index) {
		return (be_BMessage *)((BMessageQueue *)instPointer)->FindMessage(index);
	}

	be_BMessage* be_BMessageQueue_FindMessage_2(be_BMessageQueue *instPointer, uint32 what, int32 index) {
		return (be_BMessage *)((BMessageQueue *)instPointer)->FindMessage(what, index);
	}


	bool be_BMessageQueue_Lock(be_BMessageQueue *instPointer) {
		return ((BMessageQueue *)instPointer)->Lock();
	}

	void be_BMessageQueue_Unlock(be_BMessageQueue *instPointer) {
		((BMessageQueue *)instPointer)->Unlock();
	}

	/* Is this realy right? */
	bool be_BMessageQueue_IsLocked(be_BMessageQueue *instPointer) {
		return ((const BMessageQueue *)instPointer)->IsLocked();
	}


	be_BMessage *be_BMessageQueue_NextMessage(be_BMessageQueue *instPointer) {
		return (be_BMessage *)((BMessageQueue *)instPointer)->NextMessage();
	}

	bool be_BMessageQueue_IsNextMessage(be_BMessageQueue *instPointer, const be_BMessage* message) {
		return ((BMessageQueue *)instPointer)->IsNextMessage((const BMessage *)message);
	}
}

/* end export functions */

