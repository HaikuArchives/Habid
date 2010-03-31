module App.Looper;

import Support.BObject;
import Support.SupportDefs;

import App.Message;
import App.MessageQueue;
import App.MessageFilter;

import Support.List;

import tango.stdc.posix.sys.types;
import tango.stdc.stringz;

import Support.types;

import App.Handler;

import Kernel.OS;

extern (C) extern {
	be_BLooper *be_BLooper_ctor_1(void *bindInstPointer, char* name, int32 priority, int32 port_capacity);
	
	be_BLooper *be_BLooper_ctor_2(void *bindInstPointer, be_BMessage* data);
	
	void be_BLooper_dtor(void *instPointer);

	// Archiving
//	static	BArchivable*	Instantiate(BMessage* data);
	status_t be_BLooper_Archive_super(be_BLooper *instPointer, be_BMessage* data, bool deep);

	// Message transmission
	status_t be_BLooper_PostMessage_1(be_BLooper *instPointer, uint32 command);
	status_t be_BLooper_PostMessage_2(be_BLooper *instPointer, be_BMessage* message);
	status_t be_BLooper_PostMessage_3(be_BLooper *instPointer, uint32 command, be_BHandler* handler, be_BHandler* replyTo);
	status_t be_BLooper_PostMessage_4(be_BLooper *instPointer, be_BMessage* message, be_BHandler* handler, be_BHandler* replyTo);

	void be_BLooper_DispatchMessage_super(be_BLooper *instPointer, be_BMessage* message, be_BHandler* handler);
	void be_BLooper_MessageReceived_super(be_BLooper *instPointer, be_BMessage* message);
	be_BMessage* be_BLooper_CurrentMessage(be_BLooper *instPointer);
	be_BMessage* be_BLooper_DetachCurrentMessage(be_BLooper *instPointer);
	be_BMessageQueue* be_BLooper_MessageQueue(be_BLooper *instPointer);
	bool be_BLooper_IsMessageWaiting(be_BLooper *instPointer);

	// Message handlers
	void be_BLooper_AddHandler(be_BLooper *instPointer, be_BHandler* handler);
	bool be_BLooper_RemoveHandler(be_BLooper *instPointer, be_BHandler* handler);
	int32 be_BLooper_CountHandlers(be_BLooper *instPointer);
	be_BHandler* be_BLooper_HandlerAt(be_BLooper *instPointer, int32 index);
	int32 be_BLooper_IndexOf(be_BLooper *instPointer, be_BHandler* handler);

	be_BHandler* be_BLooper_PreferredHandler(be_BLooper *instPointer);
	void be_BLooper_SetPreferredHandler(be_BLooper *instPointer, be_BHandler* handler);

	// Loop control
	thread_id be_BLooper_Run_super(be_BLooper *instPointer);
	void be_BLooper_Quit_super(be_BLooper *instPointer);
	bool be_BLooper_QuitRequested_super(be_BLooper *instPointer);
	bool be_BLooper_Lock(be_BLooper *instPointer);
	void be_BLooper_Unlock(be_BLooper *instPointer);
	bool be_BLooper_IsLocked(be_BLooper *instPointer);
	status_t be_BLooper_LockWithTimeout(be_BLooper *instPointer, bigtime_t timeout);
	thread_id be_BLooper_Thread(be_BLooper *instPointer);
	team_id	 be_BLooper_Team(be_BLooper *instPointer);
	
	be_BLooper* be_BLooper_LooperForThread_static(thread_id thread);

	// Loop debugging
	thread_id be_BLooper_LockingThread(be_BLooper *instPointer);
	int32 be_BLooper_CountLocks(be_BLooper *instPointer);
	int32 be_BLooper_CountLockRequests(be_BLooper *instPointer);
	sem_id be_BLooper_Sem(be_BLooper *instPointer);

	// Scripting
	be_BHandler* be_BLooper_ResolveSpecifier_super(be_BLooper *instPointer, be_BMessage* msg, int32 index,
								be_BMessage* specifier, int32 form,
								char* property);

	status_t be_BLooper_GetSupportedSuites_super(be_BLooper *instPointer, be_BMessage* data);

	// Message filters (also see BHandler).
	void be_BLooper_AddCommonFilter_super(be_BLooper *instPointer, be_BMessageFilter* filter);
	bool be_BLooper_RemoveCommonFilter_super(be_BLooper *instPointer, be_BMessageFilter* filter);
	void be_BLooper_SetCommonFilterList_super(be_BLooper *instPointer, be_BList* filters);
	be_BList* be_BLooper_CommonFilterList(be_BLooper *instPointer);

	// Private or reserved
	status_t be_BLooper_Perform_super(be_BLooper *instPointer, perform_code d, void* arg);
}

extern (C) {
	status_t bind_BLooper_Archive_virtual(void *bindInstPointer, be_BMessage *data, bool deep) {
		auto x = new BMessage(data, false);
		return (cast(BLooper)bindInstPointer).Archive(x, deep);
	}
	
	void bind_BLooper_DispatchMessage_virtual(void *bindInstPointer, be_BMessage *message, be_BHandler *handler) {
		(cast(BLooper)bindInstPointer).DispatchMessage(new BMessage(message, false), new BHandler(handler, false));
	}

	void bind_BLooper_MessageReceived_virtual(void *bindInstPointer, be_BMessage *message) {
		auto x = new BMessage(message, false);
		(cast(BLooper)bindInstPointer).MessageReceived(x);
	}

	thread_id bind_BLooper_Run_virtual(void *bindInstPointer) {
		return (cast(BLooper)bindInstPointer).Run();
	}

	void bind_BLooper_Quit_virtual(void *bindInstPointer) {
		(cast(BLooper)bindInstPointer).Quit();
	}

	bool bind_BLooper_QuitRequested_virtual(void *bindInstPointer) {
		return (cast(BLooper)bindInstPointer).QuitRequested();
	}


	be_BHandler * bind_BLooper_ResolveSpecifier_virtual(void *bindInstPointer, be_BMessage* msg, int32 index, be_BMessage* specifier, int32 form, char* property) {
		return (cast(BLooper)bindInstPointer).ResolveSpecifier(new BMessage(msg, false),
															   index,
															   new BMessage(specifier, false),
															   form,
															   fromStringz(property)).fInstancePointer;
	}

	status_t bind_BLooper_GetSupportedSuites_virtual(void *bindInstPointer, be_BMessage *data) {
		auto x = new BMessage(data, false);
		return (cast(BLooper)bindInstPointer).GetSupportedSuites(x);
	}

	void bind_BLooper_AddCommonFilter(void *bindInstPointer, be_BMessageFilter *filter) {
		(cast(BLooper)bindInstPointer).AddCommonFilter(new BMessageFilter(filter, false));
	}

	bool bind_BLooper_RemoveCommonFilter(void *bindInstPointer, be_BMessageFilter *filter) {
		return (cast(BLooper)bindInstPointer).RemoveCommonFilter(new BMessageFilter(filter, false));
	}

	void bind_BLooper_SetCommonFilterList(void *bindInstPointer, be_BList *filters) {
		(cast(BLooper)bindInstPointer).SetCommonFilterList(new BList(filters, false));
	}

	status_t bind_BLooper_Perform_virtual(void *bindInstPointer, perform_code d, void *arg) {
		return (cast(BLooper)bindInstPointer).Perform(d, arg);
	}
}

const int32 B_LOOPER_PORT_DEFAULT_CAPACITY = 200;

class BLooper : public BHandler
{
public:
	mixin(BObject!("be_BLooper", false, "be_BHandler"));
	
	this(char [] name = null, int32 priority = B_NORMAL_PRIORITY, int32 port_capacity = B_LOOPER_PORT_DEFAULT_CAPACITY) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLooper_ctor_1(cast(be_BLooper *)this, toStringz(name), priority, port_capacity);
		super(name);
	}

	this(BMessage data) {
		if(fInstancePointer is null)
			fInstancePointer = be_BLooper_ctor_2(cast(be_BLooper *)this, data.fInstancePointer);
		super(data);
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BLooper_dtor(fInstancePointer);
		fInstancePointer = null;
	}

	// Archiving
//	static	BArchivable*	Instantiate(BMessage* data);
	status_t Archive(inout BMessage data, bool deep = true) {
		return be_BLooper_Archive_super(fInstancePointer, data.fInstancePointer, deep);
	}

	// Message transmission
	final status_t PostMessage(uint32 command) {
		return be_BLooper_PostMessage_1(fInstancePointer, command);
	}
	
	final status_t PostMessage(BMessage message) {
		return be_BLooper_PostMessage_2(fInstancePointer, message.fInstancePointer);
	}
	
	final status_t PostMessage(uint32 command, BHandler handler, BHandler replyTo = null) {
		return be_BLooper_PostMessage_3(fInstancePointer, command, handler.fInstancePointer, replyTo is null ? null : replyTo.fInstancePointer);
	}
	
	final status_t PostMessage(BMessage message, BHandler handler, BHandler replyTo = null) {
		return be_BLooper_PostMessage_4(fInstancePointer, message.fInstancePointer, handler.fInstancePointer, replyTo is null ? null : replyTo.fInstancePointer);
	}


	void DispatchMessage(BMessage message, BHandler handler) {
		be_BLooper_DispatchMessage_super(fInstancePointer, message.fInstancePointer, handler.fInstancePointer);
	}
	
	void MessageReceived(BMessage message) {
		be_BLooper_MessageReceived_super(fInstancePointer, message.fInstancePointer);
	}

	final BMessage CurrentMessage() {
		return new BMessage(be_BLooper_CurrentMessage(fInstancePointer), false);
	}

	final BMessage DetachCurrentMessage() {
		return new BMessage(be_BLooper_DetachCurrentMessage(fInstancePointer), false);
	}
	
	final BMessageQueue MessageQueue() {
		return new BMessageQueue(be_BLooper_MessageQueue(fInstancePointer), false);
	}

	final bool IsMessageWaiting() {
		return be_BLooper_IsMessageWaiting(fInstancePointer);
	}

	// Message handlers
	final void AddHandler(BHandler handler) {
		be_BLooper_AddHandler(fInstancePointer, handler.fInstancePointer);
	}
	
	final bool RemoveHandler(BHandler handler) {
		return be_BLooper_RemoveHandler(fInstancePointer, handler.fInstancePointer);
	}
	
	final int32 CountHandlers() {
		return be_BLooper_CountHandlers(fInstancePointer);
	}
	
	final BHandler HandlerAt(int32 index) {
		return new BHandler(be_BLooper_HandlerAt(fInstancePointer, index), false);
	}
	
	final int32 IndexOf(BHandler handler) {
		return be_BLooper_IndexOf(fInstancePointer, handler.fInstancePointer);
	}

	final BHandler PreferredHandler() {
		return new BHandler(be_BLooper_PreferredHandler(fInstancePointer), false);
	}
	
	final void SetPreferredHandler(BHandler handler) {
		be_BLooper_SetPreferredHandler(fInstancePointer, handler.fInstancePointer);
	}

	// Loop control
	thread_id Run() {
		return be_BLooper_Run_super(fInstancePointer);
	}
	
	void Quit() {
		be_BLooper_Quit_super(fInstancePointer);
	}
	
	bool QuitRequested() {
		return be_BLooper_QuitRequested_super(fInstancePointer);
	}
	
	final bool Lock() {
		return be_BLooper_Lock(fInstancePointer);
	}
	
	final void Unlock() {
		be_BLooper_Unlock(fInstancePointer);
	}
	
	final bool IsLocked() {
		return be_BLooper_IsLocked(fInstancePointer);
	}
	
	final status_t LockWithTimeout(bigtime_t timeout) {
		return be_BLooper_LockWithTimeout(fInstancePointer, timeout);
	}
	
	final thread_id Thread() {
		return be_BLooper_Thread(fInstancePointer);
	}
	
	final team_id	Team() {
		return be_BLooper_Team(fInstancePointer);
	}
	
	static BLooper LooperForThread(thread_id thread) {
		return new BLooper(be_BLooper_LooperForThread_static(thread), false);
	}
	
	// Loop debugging
	final thread_id LockingThread() {
		return be_BLooper_LockingThread(fInstancePointer);
	}
	
	final int32 CountLocks() {
		return be_BLooper_CountLocks(fInstancePointer);
	}
	
	final int32 CountLockRequests() {
		return be_BLooper_CountLockRequests(fInstancePointer);
	}
	
	final sem_id Sem() {
		return be_BLooper_Sem(fInstancePointer);
	}

	// Scripting
	BHandler ResolveSpecifier(BMessage msg, int32 index, BMessage specifier, int32 form, char [] property) {
		return new BHandler(be_BLooper_ResolveSpecifier_super(fInstancePointer,
															  msg.fInstancePointer,
															  index,
															  specifier.fInstancePointer,
															  form,
															  toStringz(property)), false);
	}

	status_t GetSupportedSuites(inout BMessage data) {
		return be_BLooper_GetSupportedSuites_super(fInstancePointer, data.fInstancePointer);
	}

	// Message filters (also see BHandler).
	void AddCommonFilter(BMessageFilter filter) {
		be_BLooper_AddCommonFilter_super(fInstancePointer, filter.fInstancePointer);
	}
	
	bool RemoveCommonFilter(BMessageFilter filter) {
		return be_BLooper_RemoveCommonFilter_super(fInstancePointer, filter.fInstancePointer);
	}
	
	void SetCommonFilterList(BList filters) {
		be_BLooper_SetCommonFilterList_super(fInstancePointer, filters.fInstancePointer);
	}
	
	final BList CommonFilterList() {
		return new BList(be_BLooper_CommonFilterList(fInstancePointer), false);
	}

	// Private or reserved
	status_t Perform(perform_code d, void *arg) {
		return be_BLooper_Perform_super(fInstancePointer, d, arg);
	}

}
