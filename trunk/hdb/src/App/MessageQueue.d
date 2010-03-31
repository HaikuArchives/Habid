module App.MessageQueue;

import Support.BObject;
import Support.SupportDefs;

import App.Message;

import Support.Archivable;

import tango.stdc.posix.sys.types;

import Support.types;

extern (C) extern {
	be_BMessageQueue * be_BMessageQueue_ctor();
	
	void be_BMessageQueue_dtor(be_BMessageQueue *instPointer);
	void be_BMessageQueue_AddMessage(be_BMessageQueue *instPointer, be_BMessage* message);
	void be_BMessageQueue_RemoveMessage(be_BMessageQueue *instPointer, be_BMessage* message);

	int32 be_BMessageQueue_CountMessages(be_BMessageQueue *instPointer);
	bool be_BMessageQueue_IsEmpty(be_BMessageQueue *instPointer);

	be_BMessage* be_BMessageQueue_FindMessage_1(be_BMessageQueue *instPointer, int32 index);
	be_BMessage* be_BMessageQueue_FindMessage_2(be_BMessageQueue *instPointer, uint32 what, int32 index);

	bool be_BMessageQueue_Lock(be_BMessageQueue *instPointer);
	void be_BMessageQueue_Unlock(be_BMessageQueue *instPointer);
	bool be_BMessageQueue_IsLocked(be_BMessageQueue *instPointer);

	be_BMessage *be_BMessageQueue_NextMessage(be_BMessageQueue *instPointer);
	bool be_BMessageQueue_IsNextMessage(be_BMessageQueue *instPointer, be_BMessage* message);
}

extern (C) {
}

final class BMessageQueue
{
public:
	mixin(BObject!("be_BMessageQueue", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessageQueue_ctor();
	}
	
	~this() {
		if(fInstancePointer !is null)
			be_BMessageQueue_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	void AddMessage(BMessage message) {
		be_BMessageQueue_AddMessage(fInstancePointer, message.fInstancePointer);
	}
	
	void RemoveMessage(BMessage message) {
		be_BMessageQueue_RemoveMessage(fInstancePointer, message.fInstancePointer);
	}

	int32 CountMessages() {
		return be_BMessageQueue_CountMessages(fInstancePointer);
	}
	
	bool IsEmpty() {
		return be_BMessageQueue_IsEmpty(fInstancePointer);
	}

	BMessage FindMessage(int32 index) {
		return new BMessage(be_BMessageQueue_FindMessage_1(fInstancePointer, index), false);
	}
	
	BMessage FindMessage(uint32 what, int32 index) {
		return new BMessage(be_BMessageQueue_FindMessage_2(fInstancePointer, what, index), false);
	}

	bool Lock() {
		return be_BMessageQueue_Lock(fInstancePointer);
	}
	
	void Unlock() {
		be_BMessageQueue_Unlock(fInstancePointer);
	}
	
	bool IsLocked() {
		return be_BMessageQueue_IsLocked(fInstancePointer);
	}

	BMessage NextMessage() {
		return new BMessage(be_BMessageQueue_NextMessage(fInstancePointer), false);
	}
	
	bool IsNextMessage(BMessage message) {
		return be_BMessageQueue_IsNextMessage(fInstancePointer, message.fInstancePointer);
	}
}
