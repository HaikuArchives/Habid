module App.Handler;

import Support.BObject;
import Support.SupportDefs;
import Support.List;

import App.Message;
import App.MessageFilter;
import App.Messenger;
import App.Looper;

import Support.Archivable;

import tango.stdc.posix.sys.types;
import tango.stdc.stringz;

import Support.types;

extern (C) extern {
	be_BHandler * be_BHandler_ctor_1(be_BHandler * bindInstPointer, char* name);
	be_BHandler * be_BHandler_ctor_2(be_BHandler * bindInstPointer, be_BMessage * data);
	void be_BHandler_dtor(be_BHandler * instPointer);

	// Archiving
	status_t be_BHandler_Archive_super(be_BHandler * instPointer, be_BMessage * data, bool deep);

	// BHandler guts.
	void be_BHandler_MessageReceived_super(be_BHandler * instPointer, be_BMessage * message);
	be_BLooper * be_BHandler_Looper(be_BHandler * instPointer);
	void be_BHandler_SetName(be_BHandler * instPointer, char* name);
	char* be_BHandler_Name(be_BHandler * instPointer);
	void be_BHandler_SetNextHandler_super(be_BHandler * instPointer, be_BHandler * handler);
	be_BHandler * be_BHandler_NextHandler(be_BHandler * instPointer);

	// Message filtering
	void be_BHandler_AddFilter_super(be_BHandler * instPointer, be_BMessageFilter * filter);
	bool be_BHandler_RemoveFilter_super(be_BHandler * instPointer, be_BMessageFilter * filter);
	void be_BHandler_SetFilterList_super(be_BHandler * instPointer, be_BList * filters);
	be_BList * be_BHandler_FilterList(be_BHandler * instPointer);
	bool be_BHandler_LockLooper(be_BHandler * instPointer);
	status_t be_BHandler_LockLooperWithTimeout(be_BHandler * instPointer, bigtime_t timeout);
	void be_BHandler_UnlockLooper(be_BHandler * instPointer);

	// Scripting
	be_BHandler * be_BHandler_ResolveSpecifier_super(be_BHandler * instPointer, be_BMessage * msg, int32 index, be_BMessage * specifier, int32 form, char* property);
	status_t be_BHandkler_GetSupportedSuites_super(be_BHandler * instPointer, be_BMessage * data);

	// Observer calls, inter-looper and inter-team
	status_t be_BHandler_StartWatching_1(be_BHandler * instPointer, be_BMessenger * target, uint32 what);
	status_t be_BHandler_StartWatchingAll_1(be_BHandler * instPointer, be_BMessenger * target);
	status_t be_BHandler_StopWatching_1(be_BHandler * instPointer, be_BMessenger * target, uint32 what);
	status_t be_BHandler_StopWatchingAll_1(be_BHandler * instPointer, be_BMessenger * target);

	// Observer calls for observing targets in the local team
	status_t be_BHandler_StartWatching_2(be_BHandler * instPointer, be_BHandler * observer, uint32 what);
	status_t be_BHandler_StartWatchingAll_2(be_BHandler * instPointer, be_BHandler * observer);
	status_t be_BHandler_StopWatching_2(be_BHandler * instPointer, be_BHandler * observer, uint32 what);
	status_t be_BHandler_StopWatchingAll_2(be_BHandler * instPointer, be_BHandler * observer);



	// Reserved
	status_t be_BHandler_Perform_super(be_BHandler * instPointer, perform_code d, void* arg);

	// Notifier calls
	void  be_BHandler_SendNotices_super(be_BHandler * instPointer, uint32 what, be_BMessage * notice);
	bool be_BHandler_IsWatched(be_BHandler * instPointer);
}

extern (C) {
	status_t bind_BHandler_Archive_virtual(be_BHandler * bindInstPointer, be_BMessage * data, bool deep) {
		BMessage msg = new BMessage(data, false);
		
		return (cast(BHandler)bindInstPointer).Archive(msg, deep);
	}
	
	void bind_BHandler_MessageReceived_virtual(be_BHandler * bindInstPointer, be_BMessage * data) {
		BMessage msg = new BMessage(data, false);
		
		(cast(BHandler)bindInstPointer).MessageReceived(msg);
	}

	void bind_BHandler_SetNextHandler_virtual(be_BHandler * bindInstPointer, be_BHandler * handler) {
		BHandler tmpHandler = new BHandler(handler, false);
		
		(cast(BHandler)bindInstPointer).SetNextHandler(tmpHandler);
	}

	void bind_BHandler_AddFilter_virtual(be_BHandler * bindInstPointer, be_BMessageFilter * filter) {
		BMessageFilter tmpFilter = new BMessageFilter(filter, false);
		
		return (cast(BHandler)bindInstPointer).AddFilter(tmpFilter);
	}

	bool bind_BHandler_RemoveFilter_virtual(be_BHandler * bindInstPointer, be_BMessageFilter * filter) {
		BMessageFilter tmpFilter = new BMessageFilter(filter, false);
		
		return (cast(BHandler)bindInstPointer).RemoveFilter(tmpFilter);
	}

	void bind_BHandler_SetFilterList_virtual(be_BHandler * bindInstPointer, be_BList * list) {
		BList tmpList = new BList(list, false);
		
		(cast(BHandler)bindInstPointer).SetFilterList(tmpList);
	}

	be_BHandler * bind_BHandler_ResolveSpecifier_virtual(be_BHandler * bindInstPointer, be_BMessage * msg, int32 index, be_BMessage * specifier, int32 form, char* property) {
		BMessage tmpMsg = new BMessage(msg, false);
		BMessage tmpSpecifier = new BMessage(specifier, false);
		
		return (cast(BHandler)bindInstPointer).ResolveSpecifier(tmpMsg, index, tmpSpecifier, form, fromStringz(property)).fInstancePointer;
	}

	status_t bind_BHandler_GetSupportedSuites_virtual(be_BHandler * bindInstPointer, be_BMessage * data) {
		BMessage tmpData = new BMessage(data, false);
		
		return (cast(BHandler)bindInstPointer).GetSupportedSuites(tmpData);
	}

	status_t bind_BHandler_Perform_virtual(be_BHandler * bindInstPointer, perform_code d, void *arg) {
		return (cast(BHandler)bindInstPointer).Perform(d, arg);
	}

	void bind_BHandler_SendNotices_virtual(be_BHandler * bindInstPointer, uint32 what, be_BMessage * notice) {
		BMessage tmpNotice = new BMessage(notice, false);
		
		(cast(BHandler)bindInstPointer).SendNotices(what, tmpNotice);
	}
}

class BHandler : public BArchivable
{
public:
	mixin(BObject!("be_BHandler", false, "be_BArchivable"));
	
	/* Constructor for assigning pointer */
	this(char [] name) {
		if(fInstancePointer is null)
			fInstancePointer = be_BHandler_ctor_1(cast(be_BHandler *)this, toStringz(name));
	}
	
	this(BMessage data) {
		if(fInstancePointer is null)
			fInstancePointer = be_BHandler_ctor_2(cast(be_BHandler *)this, data.fInstancePointer);
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BHandler_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	// Archiving
	override status_t Archive(inout BMessage data, bool deep = true) {
		return be_BHandler_Archive_super(fInstancePointer, data.fInstancePointer, deep);
	}

	// BHandler guts.
	void MessageReceived(inout BMessage message) {
		be_BHandler_MessageReceived_super(fInstancePointer, message.fInstancePointer);
	}
	
	final BLooper Looper() {
		be_BLooper * looperPtr = be_BHandler_Looper(fInstancePointer);
		
		if(looperPtr !is null)
			return new BLooper(looperPtr, false);
		
		return null;
	}
	
	final void SetName(char [] name) {
		be_BHandler_SetName(fInstancePointer, toStringz(name));
	}
	
	final char [] Name() {
		return fromStringz(be_BHandler_Name(fInstancePointer));
	}
	
	void SetNextHandler(BHandler handler) {
		be_BHandler_SetNextHandler_super(fInstancePointer, handler.fInstancePointer);
	}
	
	final BHandler NextHandler() {
		be_BHandler * handlerPtr = be_BHandler_NextHandler(fInstancePointer);
		
		if(handlerPtr !is null)
			return new BHandler(handlerPtr, false);
		
		return null;
	}

	// Message filtering
	void AddFilter(BMessageFilter filter) {
		be_BHandler_AddFilter_super(fInstancePointer, filter.fInstancePointer);
	}
	
	bool RemoveFilter(BMessageFilter filter) {
		return be_BHandler_RemoveFilter_super(fInstancePointer, filter.fInstancePointer);
	}
	
	void SetFilterList(BList filters) {
		be_BHandler_SetFilterList_super(fInstancePointer, filters.fInstancePointer);
	}
	
	final BList FilterList() {
		be_BList * listPtr = be_BHandler_FilterList(fInstancePointer);
		
		if(listPtr !is null)
			return new BList(listPtr, false);
		
		return null;
	}
	
	final bool LockLooper() {
		return be_BHandler_LockLooper(fInstancePointer);
	}
	
	final status_t LockLooperWithTimeout(bigtime_t timeout) {
		return be_BHandler_LockLooperWithTimeout(fInstancePointer, timeout);
	}
	
	final void UnlockLooper() {
		be_BHandler_UnlockLooper(fInstancePointer);
	}

	// Scripting
	BHandler ResolveSpecifier(BMessage msg, int32 index, BMessage specifier, int32 form, char [] property) {
		be_BHandler * handlerPtr = be_BHandler_ResolveSpecifier_super(fInstancePointer,
																msg.fInstancePointer,
																index,
																specifier.fInstancePointer,
																form, 
																toStringz(property));
		
		if(handlerPtr !is null)
			return new BHandler(handlerPtr, false);
		
		return null;
	}

	status_t GetSupportedSuites(inout BMessage data) {
		return be_BHandkler_GetSupportedSuites_super(fInstancePointer, data.fInstancePointer);
	}

	// Observer calls, inter-looper and inter-team
	final status_t StartWatching(BMessenger target, uint32 what) {
		return be_BHandler_StartWatching_1(fInstancePointer, target.fInstancePointer, what);
	}
	
	final status_t StartWatchingAll(BMessenger target) {
		return be_BHandler_StartWatchingAll_1(fInstancePointer, target.fInstancePointer);
	}
	
	final status_t StopWatching(BMessenger target, uint32 what) {
		return be_BHandler_StopWatching_1(fInstancePointer, target.fInstancePointer, what);
	}
	
	final status_t StopWatchingAll(BMessenger target) {
		return be_BHandler_StopWatchingAll_1(fInstancePointer, target.fInstancePointer);
	}

	// Observer calls for observing targets in the local team
	final status_t StartWatching(BHandler observer, uint32 what) {
		return be_BHandler_StartWatching_2(fInstancePointer, observer.fInstancePointer, what);
	}
	
	final status_t StartWatchingAll(BHandler observer) {
		return be_BHandler_StartWatchingAll_2(fInstancePointer, observer.fInstancePointer);
	}
	
	final status_t StopWatching(BHandler observer, uint32 what) {
		return be_BHandler_StopWatching_2(fInstancePointer, observer.fInstancePointer, what);
	}
	
	final status_t StopWatchingAll(BHandler observer) {
		return be_BHandler_StopWatchingAll_2(fInstancePointer, observer.fInstancePointer);
	}



	// Reserved
	status_t Perform(perform_code d, void *arg) {
		return be_BHandler_Perform_super(fInstancePointer, d, arg);
	}

	// Notifier calls
	void SendNotices(uint32 what, BMessage notice) {
		be_BHandler_SendNotices_super(fInstancePointer, what, notice.fInstancePointer);
	}
	
	final bool IsWatched() {
		return be_BHandler_IsWatched(fInstancePointer);
	}
}
