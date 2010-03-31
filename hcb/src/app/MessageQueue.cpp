#include <hcb-types.h>
#include <stdio.h>

#include <app/MessageQueue.h>

#include <app/HCB_MessageQueue.h>

/* begin import functions */

extern "C" {
}

/* end import functions */

/* begin class BMessageQueueBridge */

BMessageQueueBridge::BMessageQueueBridge()
: BMessageQueue()
{ }

BMessageQueueBridge::~BMessageQueueBridge()
{ }

bool BMessageQueueBridge::IsLocked() const
{
	return BMessageQueue::IsLocked();
}

/* end class BMessageQueueBridge */

/* begin export functions */

extern "C" {
	be_BMessageQueue * be_BMessageQueue_ctor() {
		return (be_BMessageQueue *)new BMessageQueueBridge();
	}
	
	void be_BMessageQueue_dtor(be_BMessageQueue *instPointer) {
		delete (BMessageQueueBridge *)instPointer;
	}

	void be_BMessageQueue_AddMessage(be_BMessageQueue *instPointer, be_BMessage* message) {
		((BMessageQueueBridge *)instPointer)->AddMessage((BMessage *)message);
	}
	
	void be_BMessageQueue_RemoveMessage(be_BMessageQueue *instPointer, be_BMessage* message) {
		((BMessageQueueBridge *)instPointer)->RemoveMessage((BMessage *)message);
	}


	int32 be_BMessageQueue_CountMessages(be_BMessageQueue *instPointer) {
		return ((BMessageQueueBridge *)instPointer)->CountMessages();
	}

	bool be_BMessageQueue_IsEmpty(be_BMessageQueue *instPointer) {
		return ((BMessageQueueBridge *)instPointer)->IsEmpty();
	}


	be_BMessage* be_BMessageQueue_FindMessage_1(be_BMessageQueue *instPointer, int32 index) {
		return (be_BMessage *)((BMessageQueueBridge *)instPointer)->FindMessage(index);
	}

	be_BMessage* be_BMessageQueue_FindMessage_2(be_BMessageQueue *instPointer, uint32 what, int32 index) {
		return (be_BMessage *)((BMessageQueueBridge *)instPointer)->FindMessage(what, index);
	}


	bool be_BMessageQueue_Lock(be_BMessageQueue *instPointer) {
		return ((BMessageQueueBridge *)instPointer)->Lock();
	}

	void be_BMessageQueue_Unlock(be_BMessageQueue *instPointer) {
		((BMessageQueueBridge *)instPointer)->Unlock();
	}

	bool be_BMessageQueue_IsLocked(be_BMessageQueue *instPointer) {
		return ((BMessageQueueBridge *)instPointer)->IsLocked();
	}


	be_BMessage *be_BMessageQueue_NextMessage(be_BMessageQueue *instPointer) {
		return (be_BMessage *)((BMessageQueueBridge *)instPointer)->NextMessage();
	}

	bool be_BMessageQueue_IsNextMessage(be_BMessageQueue *instPointer, const be_BMessage* message) {
		return ((BMessageQueueBridge *)instPointer)->IsNextMessage((const BMessage *)message);
	}
}

/* end export functions */

