#include <hcb-types.h>
#include <stdio.h>

#include <app/Messenger.h>

#include <app/HCB_Looper.h>
#include <app/HCB_Handler.h>

/* begin import functions */

extern "C" {
	status_t bind_BLooper_Archive_virtual(void *bindInstPointer, be_BMessage *data, bool deep);
	void bind_BLooper_DispatchMessage_virtual(void *bindInstPointer, be_BMessage *message, be_BHandler *handler);
	void bind_BLooper_MessageReceived_virtual(void *bindInstPointer, be_BMessage *message);
	thread_id bind_BLooper_Run_virtual(void *bindInstPointer);
	void bind_BLooper_Quit_virtual(void *bindInstPointer);
	bool bind_BLooper_QuitRequested_virtual(void *bindInstPointer);

	be_BHandler * bind_BLooper_ResolveSpecifier_virtual(void *bindInstPointer, be_BMessage* msg, int32 index, be_BMessage* specifier, int32 form, const char* property);
	status_t bind_BLooper_GetSupportedSuites_virtual(void *bindInstPointer, be_BMessage *data);
	void bind_BLooper_AddCommonFilter(void *bindInstPointer, be_BMessageFilter *filter);
	bool bind_BLooper_RemoveCommonFilter(void *bindInstPointer, be_BMessageFilter *filter);
	void bind_BLooper_SetCommonFilterList(void *bindInstPointer, be_BList *filters);
	status_t bind_BLooper_Perform_virtual(void *bindInstPointer, perform_code d, void *arg);
}

/* end import functions */


/* begin class BLooperProxy */
BLooperProxy::BLooperProxy(void *bindInstPointer, const char* name, int32 priority, int32 port_capacity)
: fBindInstPointer(bindInstPointer), BLooper(name, priority, port_capacity), BHandlerProxy(bindInstPointer, name)
{ }

BLooperProxy::BLooperProxy(void *bindInstPointer, BMessage *data)
: fBindInstPointer(bindInstPointer), BLooper(data), BHandlerProxy(data)
{ }

BLooperProxy::~BLooperProxy()
{ }

	
status_t BLooperProxy::Archive(BMessage* data, bool deep) const {
	return bind_BLooper_Archive_virtual(fBindInstPointer, (be_BMessage *)data, deep);
}

status_t BLooperProxy::Archive_super(BMessage* data, bool deep) const {
	return BLooper::Archive(data, deep);
}

void BLooperProxy::DispatchMessage(BMessage* message, BHandler* handler) {
	return bind_BLooper_DispatchMessage_virtual(fBindInstPointer, (be_BMessage *)message, (be_BHandler *)handler);
}

void BLooperProxy::DispatchMessage_super(BMessage* message, BHandler* handler) {
	return BLooper::DispatchMessage(message, handler);
}


void BLooperProxy::MessageReceived(BMessage* message) {
	bind_BLooper_MessageReceived_virtual(fBindInstPointer, (be_BMessage *)message);
}

void BLooperProxy::MessageReceived_super(BMessage* message) {
	BLooper::MessageReceived(message);
}


thread_id BLooperProxy::Run() {
	return bind_BLooper_Run_virtual(fBindInstPointer);
}

thread_id BLooperProxy::Run_super() {
	return BLooper::Run();
}

void BLooperProxy::Quit() {
	bind_BLooper_Quit_virtual(fBindInstPointer);
}

void BLooperProxy::Quit_super() {
	return BLooper::Quit();
}

bool BLooperProxy::QuitRequested() {
	return bind_BLooper_QuitRequested_virtual(fBindInstPointer);
}

bool BLooperProxy::QuitRequested_super() {
	return BLooper::QuitRequested();
}


BHandler* BLooperProxy::ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property) {
	return (BHandler *)bind_BLooper_ResolveSpecifier_virtual(fBindInstPointer, (be_BMessage *)msg, index, (be_BMessage *)specifier, form, property);
}

BHandler* BLooperProxy::ResolveSpecifier_super(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property) {
	return BLooper::ResolveSpecifier(msg, index, specifier, form, property);
}

status_t BLooperProxy::GetSupportedSuites(BMessage* data) {
	return bind_BLooper_GetSupportedSuites_virtual(fBindInstPointer, (be_BMessage *)data);
}

status_t BLooperProxy::GetSupportedSuites_super(BMessage* data) {
	return BLooper::GetSupportedSuites(data);
}

	// Message filters (also see BHandler).
void			BLooperProxy::AddCommonFilter(BMessageFilter* filter) {
	bind_BLooper_AddCommonFilter(fBindInstPointer, (be_BMessageFilter *)filter);
}

void			BLooperProxy::AddCommonFilter_super(BMessageFilter* filter) {
	BLooper::AddCommonFilter(filter);
}

bool			BLooperProxy::RemoveCommonFilter(BMessageFilter* filter) {
	return bind_BLooper_RemoveCommonFilter(fBindInstPointer, (be_BMessageFilter *)filter);
}

bool			BLooperProxy::RemoveCommonFilter_super(BMessageFilter* filter) {
	return BLooper::RemoveCommonFilter(filter);
}

void			BLooperProxy::SetCommonFilterList(BList* filters) {
	bind_BLooper_SetCommonFilterList(fBindInstPointer, (be_BList *)filters);
}

void			BLooperProxy::SetCommonFilterList_super(BList* filters) {
	BLooper::SetCommonFilterList(filters);
}

	// Private or reserved
status_t		BLooperProxy::Perform(perform_code d, void* arg) {
	return bind_BLooper_Perform_virtual(fBindInstPointer, d, arg);
}

status_t		BLooperProxy::Perform_super(perform_code d, void* arg) {
	return BLooper::Perform(d, arg);
}

/* end class BLooperProxy */

/* begin export functions */

extern "C" {
	be_BLooper *be_BLooper_ctor_1(void *bindInstPointer, const char* name, int32 priority, int32 port_capacity) {
		return (be_BLooper *)new BLooperProxy(bindInstPointer, name, priority, port_capacity);
	}
	
	be_BLooper *be_BLooper_ctor_2(void *bindInstPointer, be_BMessage* data) {
		return (be_BLooper *)new BLooperProxy(bindInstPointer, (BMessage *)data);
	}
	
	void be_BLooper_dtor(void *instPointer) {
		delete (BLooperProxy *)instPointer;
	}

	// Archiving
//	static	BArchivable*	Instantiate(BMessage* data);
	status_t be_BLooper_Archive_super(be_BLooper *instPointer, be_BMessage* data, bool deep) {
		return ((BLooperProxy *)instPointer)->Archive_super((BMessage *)data, deep);
	}

	// Message transmission
	status_t be_BLooper_PostMessage_1(be_BLooper *instPointer, uint32 command) {
		return ((BLooperProxy *)instPointer)->PostMessage(command);
	}

	status_t be_BLooper_PostMessage_2(be_BLooper *instPointer, be_BMessage* message) {
		return ((BLooperProxy *)instPointer)->PostMessage((BMessage *)message);
	}

	status_t be_BLooper_PostMessage_3(be_BLooper *instPointer, uint32 command, be_BHandler* handler, be_BHandler* replyTo) {
		return ((BLooperProxy *)instPointer)->PostMessage(command, (BHandler *)handler, (BHandler *)replyTo);
	}

	status_t be_BLooper_PostMessage_4(be_BLooper *instPointer, be_BMessage* message, be_BHandler* handler, be_BHandler* replyTo) {
		return ((BLooperProxy *)instPointer)->PostMessage((BMessage *)message, (BHandler *)handler, (BHandler *)replyTo);
	}


	void be_BLooper_DispatchMessage_super(be_BLooper *instPointer, be_BMessage* message, be_BHandler* handler) {
		((BLooperProxy *)instPointer)->DispatchMessage_super((BMessage *)message, (BHandler *)handler);
	}

	void be_BLooper_MessageReceived_super(be_BLooper *instPointer, be_BMessage* message) {
		((BLooperProxy *)instPointer)->MessageReceived_super((BMessage *)message);
	}

	be_BMessage* be_BLooper_CurrentMessage(be_BLooper *instPointer) {
		return (be_BMessage *)((BLooperProxy *)instPointer)->CurrentMessage();
	}

	be_BMessage* be_BLooper_DetachCurrentMessage(be_BLooper *instPointer) {
		return (be_BMessage *)((BLooperProxy *)instPointer)->DetachCurrentMessage();
	}

	be_BMessageQueue* be_BLooper_MessageQueue(be_BLooper *instPointer) {
		return (be_BMessageQueue *)((BLooperProxy *)instPointer)->MessageQueue();
	}

	bool be_BLooper_IsMessageWaiting(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->IsMessageWaiting();
	}


	// Message handlers
	void be_BLooper_AddHandler(be_BLooper *instPointer, be_BHandler* handler) {
		((BLooperProxy *)instPointer)->AddHandler((BHandler *)handler);
	}

	bool be_BLooper_RemoveHandler(be_BLooper *instPointer, be_BHandler* handler) {
		return ((BLooperProxy *)instPointer)->RemoveHandler((BHandler *)handler);
	}

	int32 be_BLooper_CountHandlers(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->CountHandlers();
	}

	be_BHandler* be_BLooper_HandlerAt(be_BLooper *instPointer, int32 index) {
		return (be_BHandler *)((BLooperProxy *)instPointer)->HandlerAt(index);
	}

	int32 be_BLooper_IndexOf(be_BLooper *instPointer, be_BHandler* handler) {
		return ((BLooperProxy *)instPointer)->IndexOf((BHandler *)handler);
	}


	be_BHandler* be_BLooper_PreferredHandler(be_BLooper *instPointer) {
		return (be_BHandler *)((BLooperProxy *)instPointer)->PreferredHandler();
	}

	void be_BLooper_SetPreferredHandler(be_BLooper *instPointer, be_BHandler* handler) {
		((BLooperProxy *)instPointer)->SetPreferredHandler((BHandler *)handler);
	}


	// Loop control
	thread_id be_BLooper_Run_super(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->Run_super();
	}

	void be_BLooper_Quit_super(be_BLooper *instPointer) {
		((BLooperProxy *)instPointer)->Quit_super();
	}

	bool be_BLooper_QuitRequested_super(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->QuitRequested();
	}

	bool be_BLooper_Lock(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->Lock();
	}

	void be_BLooper_Unlock(be_BLooper *instPointer) {
		((BLooperProxy *)instPointer)->Unlock();
	}

	bool be_BLooper_IsLocked(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->IsLocked();
	}

	status_t be_BLooper_LockWithTimeout(be_BLooper *instPointer, bigtime_t timeout) {
		return ((BLooperProxy *)instPointer)->LockWithTimeout(timeout);
	}

	thread_id be_BLooper_Thread(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->Thread();
	}

	team_id	 be_BLooper_Team(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->Team();
	}

	
	be_BLooper* be_BLooper_LooperForThread_static(thread_id thread) {
		return (be_BLooper *)BLooper::LooperForThread(thread);
	}

	// Loop debugging
	thread_id be_BLooper_LockingThread(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->LockingThread();
	}

	int32 be_BLooper_CountLocks(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->CountLocks();
	}

	int32 be_BLooper_CountLockRequests(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->CountLockRequests();
	}

	sem_id be_BLooper_Sem(be_BLooper *instPointer) {
		return ((BLooperProxy *)instPointer)->Sem();
	}


	// Scripting
	be_BHandler* be_BLooper_ResolveSpecifier_super(be_BLooper *instPointer, be_BMessage* msg, int32 index,
								be_BMessage* specifier, int32 form,
								const char* property) {
		return (be_BHandler *)((BLooperProxy *)instPointer)->ResolveSpecifier_super((BMessage *)msg, index, (BMessage *)specifier, form, property);
	}

	status_t be_BLooper_GetSupportedSuites_super(be_BLooper *instPointer, be_BMessage* data) {
		return ((BLooperProxy *)instPointer)->GetSupportedSuites_super((BMessage *)data);
	}


	// Message filters (also see BHandler).
	void be_BLooper_AddCommonFilter_super(be_BLooper *instPointer, be_BMessageFilter* filter) {
		((BLooperProxy *)instPointer)->AddCommonFilter_super((BMessageFilter *)filter);
	}

	bool be_BLooper_RemoveCommonFilter_super(be_BLooper *instPointer, be_BMessageFilter* filter) {
		return ((BLooperProxy *)instPointer)->RemoveCommonFilter_super((BMessageFilter *)filter);
	}

	void be_BLooper_SetCommonFilterList_super(be_BLooper *instPointer, be_BList* filters) {
		((BLooperProxy *)instPointer)->SetCommonFilterList_super((BList *)filters);
	}

	be_BList* be_BLooper_CommonFilterList(be_BLooper *instPointer) {
		return (be_BList *)((BLooperProxy *)instPointer)->CommonFilterList();
	}


	// Private or reserved
	status_t be_BLooper_Perform_super(be_BLooper *instPointer, perform_code d, void* arg) {
		return ((BLooperProxy *)instPointer)->Perform_super(d, arg);
	}

}

/* end export functions */

