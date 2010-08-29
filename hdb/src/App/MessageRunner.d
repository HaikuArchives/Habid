module App.MessageRunner;

import Support.BObject;
import Support.SupportDefs;

import App.Message;
import App.Messenger;

import tango.stdc.posix.sys.types;

import Support.types;

extern (C) extern {
	be_BMessageRunner * be_BMessageRunner_ctor_1(be_BMessenger *target, be_BMessage *message, bigtime_t interval, int32 count);

	be_BMessageRunner * be_BMessageRunner_ctor_2(be_BMessenger *target, be_BMessage *message, bigtime_t interval, int32 count, be_BMessenger *replyTo);

	void be_BMessageRunner_dtor(void *instPointer);
	
	status_t be_BMessageRunner_InitCheck(void *instPointer);

	status_t be_BMessageRunner_SetInterval(void *instPointer, bigtime_t interval);
	
	status_t be_BMessageRunner_SetCount(void *instPointer, int32 count);
	
	status_t be_BMessageRunner_GetInfo(void *instPointer, bigtime_t *interval, int32 *count);

	status_t be_BMessageRunner_StartSending_1(be_BMessenger *target, be_BMessage *message, bigtime_t interval, int32 count);
	
	status_t be_BMessageRunner_StartSending_2(be_BMessenger *target, be_BMessage *message, bigtime_t interval, int32 count, be_BMessenger *replyTo);
}

extern (C) {
}

final class BMessageRunner
{
public:
	mixin(BObject!("be_BMessageRunner", true, null));
	
	this(BMessenger target, BMessage message, bigtime_t interval, int32 count = -1) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessageRunner_ctor_1(target.fInstancePointer, message.fInstancePointer, interval, count);
	}

	this(BMessenger target, BMessage message, bigtime_t interval, int32 count, BMessenger replyTo) {
		if(fInstancePointer is null)
			fInstancePointer = be_BMessageRunner_ctor_2(target.fInstancePointer, message.fInstancePointer, interval, count, replyTo.fInstancePointer);
	}
	
	~this() {
		if(fInstancePointer !is null)
			be_BMessageRunner_dtor(fInstancePointer);
		fInstancePointer = null;
	}

	status_t InitCheck() {
		return be_BMessageRunner_InitCheck(fInstancePointer);
	}

	status_t SetInterval(bigtime_t interval) {
		return be_BMessageRunner_SetInterval(fInstancePointer, interval);
	}
	
	status_t SetCount(int32 count) {
		return be_BMessageRunner_SetCount(fInstancePointer, count);
	}
	
	status_t GetInfo(ref bigtime_t interval, ref int32 count) {
		return be_BMessageRunner_GetInfo(fInstancePointer, &interval, &count);
	}

	static status_t StartSending(BMessenger target, BMessage message, bigtime_t interval, int32 count) {
		return be_BMessageRunner_StartSending_1(target.fInstancePointer, message.fInstancePointer, interval, count);
	}
	
	static status_t StartSending(BMessenger target, BMessage message, bigtime_t interval, int32 count, BMessenger replyTo) {
		return be_BMessageRunner_StartSending_2(target.fInstancePointer, message.fInstancePointer, interval, count, replyTo.fInstancePointer);
	}

}
