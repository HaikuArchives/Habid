#include <hcb-types.h>
#include <stdio.h>

#include <app/Messenger.h>

#include <app/HCB_Handler.h>

/* begin import functions */

extern "C" {
	status_t bind_BHandler_Archive_virtual(void *bindInstPointer, be_BMessage *data, bool deep);
	void bind_BHandler_MessageReceived_virtual(void *bindInstPointer, be_BMessage *data);
	void bind_BHandler_SetNextHandler_virtual(void *bindInstPointer, be_BHandler *handler);
	void bind_BHandler_AddFilter_virtual(void *bindInstPointer, be_BMessageFilter *filter);
	bool bind_BHandler_RemoveFilter_virtual(void *bindInstPointer, be_BMessageFilter *filter);
	void bind_BHandler_SetFilterList_virtual(void *bindInstPointer, be_BList *list);
	be_BHandler * bind_BHandler_ResolveSpecifier_virtual(void *bindInstPointer, be_BMessage* msg, int32 index, be_BMessage* specifier, int32 form, const char* property);
	status_t bind_BHandler_GetSupportedSuites_virtual(void *bindInstPointer, be_BMessage *data);
	status_t bind_BHandler_Perform_virtual(void *bindInstPointer, perform_code d, void *arg);
	void bind_BHandler_SendNotices_virtual(void *bindInstPointer, uint32 what, be_BMessage *notice);

}

/* end import functions */


/* begin class BHandlerProxy */

BHandlerProxy::BHandlerProxy(void *bindInstPointer, const char* name)
: fBindInstPointer(bindInstPointer), BHandler(name), BArchivableProxy(bindInstPointer)
{ }

BHandlerProxy::BHandlerProxy(void *bindInstPointer, BMessage* data)
: fBindInstPointer(bindInstPointer), BHandler(data), BArchivableProxy(bindInstPointer)
{ }

BHandlerProxy::~BHandlerProxy()
{ }

	// Archiving
status_t BHandlerProxy::Archive(BMessage* data, bool deep) const {
	return bind_BHandler_Archive_virtual(fBindInstPointer, (be_BMessage *)data, deep);
}

status_t BHandlerProxy::Archive_super(BMessage* data, bool deep) const {
	return BHandler::Archive(data, deep);
}

	// BHandler guts.
void BHandlerProxy::MessageReceived(BMessage* message) {
	bind_BHandler_MessageReceived_virtual(fBindInstPointer, (be_BMessage *)message);
}

void BHandlerProxy::MessageReceived_super(BMessage* message) {
	BHandler::MessageReceived(message);
}

void BHandlerProxy::SetNextHandler(BHandler* handler) {
	bind_BHandler_SetNextHandler_virtual(fBindInstPointer, (be_BHandler *)handler);
}

void BHandlerProxy::SetNextHandler_super(BHandler* handler) {
	return BHandler::SetNextHandler(handler);
}

	// Message filtering
void BHandlerProxy::AddFilter(BMessageFilter* filter) {
	bind_BHandler_AddFilter_virtual(fBindInstPointer, (be_BMessageFilter *)filter);
}

void BHandlerProxy::AddFilter_super(BMessageFilter* filter) {
	BHandler::AddFilter(filter);
}

bool BHandlerProxy::RemoveFilter(BMessageFilter* filter) {
	return bind_BHandler_RemoveFilter_virtual(fBindInstPointer, (be_BMessageFilter *)filter);
}

bool BHandlerProxy::RemoveFilter_super(BMessageFilter* filter) {
	return BHandler::RemoveFilter(filter);
}

void BHandlerProxy::SetFilterList(BList* filters) {
	bind_BHandler_SetFilterList_virtual(fBindInstPointer, (be_BList *)filters);
}

void BHandlerProxy::SetFilterList_super(BList* filters) {
	BHandler::SetFilterList(filters);
}

	// Scripting
BHandler* BHandlerProxy::ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property) {
	return (BHandler *)bind_BHandler_ResolveSpecifier_virtual(fBindInstPointer, (be_BMessage *)msg, index, (be_BMessage *)specifier, form, property);
}

BHandler* BHandlerProxy::ResolveSpecifier_super(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property) {
	return BHandler::ResolveSpecifier(msg, index, specifier, form, property);
}

status_t BHandlerProxy::GetSupportedSuites(BMessage* data) {
	return bind_BHandler_GetSupportedSuites_virtual(fBindInstPointer, (be_BMessage *)data);
}

status_t BHandlerProxy::GetSupportedSuites_super(BMessage* data) {
	return BHandler::GetSupportedSuites(data);
}

	// Reserved
status_t BHandlerProxy::Perform(perform_code d, void* arg) {
	return bind_BHandler_Perform_virtual(fBindInstPointer, d, arg);
}

status_t BHandlerProxy::Perform_super(perform_code d, void* arg) {
	return BHandler::Perform(d, arg);
}

	// Notifier calls
void BHandlerProxy::SendNotices(uint32 what, const BMessage* notice) {
	bind_BHandler_SendNotices_virtual(fBindInstPointer, what, (be_BMessage *)notice);
}

void BHandlerProxy::SendNotices_super(uint32 what, const BMessage* notice) {
	BHandler::SendNotices(what, notice);
}

/* end class BHandlerProxy */

/* begin export functions */

extern "C" {
	be_BHandler *be_BHandler_ctor_1(void *bindInstPointer, const char* name) {
		return (be_BHandler *)new BHandlerProxy(bindInstPointer, name);
	}
	
	be_BHandler *be_BHandler_ctor_2(void *bindInstPointer, be_BMessage* data) {
		return (be_BHandler *)new BHandlerProxy(bindInstPointer, (BMessage *)data);
	}
	
	void be_BHandler_dtor(be_BHandler *instPointer) {
		delete (BHandlerProxy *)instPointer;
	}

	// Archiving
	status_t be_BHandler_Archive_super(be_BHandler *instPointer, be_BMessage* data, bool deep) {
		return ((BHandlerProxy *)instPointer)->Archive_super((BMessage *)data, deep);
	}

	// BHandler guts.
	void be_BHandler_MessageReceived_super(be_BHandler *instPointer, be_BMessage* message) {
		return ((BHandlerProxy *)instPointer)->MessageReceived_super((BMessage *)message);
	}
	
	be_BLooper* be_BHandler_Looper(be_BHandler *instPointer) {
		return (be_BLooper *)((BHandlerProxy *)instPointer)->Looper();
	}
	
	void be_BHandler_SetName(be_BHandler *instPointer, const char* name) {
		((BHandlerProxy *)instPointer)->SetName(name);
	}
	
	const char* be_BHandler_Name(be_BHandler *instPointer) {
		return ((BHandlerProxy *)instPointer)->Name();
	}
	
	void be_BHandler_SetNextHandler_super(be_BHandler *instPointer, be_BHandler* handler) {
		return ((BHandlerProxy *)instPointer)->SetNextHandler_super((BHandler *)handler);
	}
	
	be_BHandler* be_BHandler_NextHandler(be_BHandler *instPointer) {
		return (be_BHandler *)((BHandlerProxy *)instPointer)->NextHandler();
	}

	// Message filtering
	void be_BHandler_AddFilter_super(be_BHandler *instPointer, be_BMessageFilter* filter) {
		return ((BHandlerProxy *)instPointer)->AddFilter_super((BMessageFilter *)filter);
	}
	
	bool be_BHandler_RemoveFilter_super(be_BHandler *instPointer, be_BMessageFilter* filter) {
		return ((BHandlerProxy *)instPointer)->RemoveFilter_super((BMessageFilter *)filter);
	}
	
	void be_BHandler_SetFilterList_super(be_BHandler *instPointer, be_BList* filters) {
		return ((BHandlerProxy *)instPointer)->SetFilterList_super((BList *)filters);
	}
	
	be_BList* be_BHandler_FilterList(be_BHandler *instPointer) {
		return (be_BList *)((BHandlerProxy *)instPointer)->FilterList();
	}

	bool be_BHandler_LockLooper(be_BHandler *instPointer) {
		return ((BHandlerProxy *)instPointer)->LockLooper();
	}
	
	status_t be_BHandler_LockLooperWithTimeout(be_BHandler *instPointer, bigtime_t timeout) {
		return ((BHandlerProxy *)instPointer)->LockLooperWithTimeout(timeout);
	}
	
	void be_BHandler_UnlockLooper(be_BHandler *instPointer) {
		return ((BHandlerProxy *)instPointer)->UnlockLooper();
	}

	// Scripting
	be_BHandler* be_BHandler_ResolveSpecifier_super(be_BHandler *instPointer, be_BMessage* msg, int32 index, be_BMessage* specifier, int32 form, const char* property) {
		return (be_BHandler *)((BHandlerProxy *)instPointer)->ResolveSpecifier_super((BMessage *)msg, index, (BMessage *)specifier, form, property);
	}
	
	status_t be_BHandkler_GetSupportedSuites_super(be_BHandler *instPointer, be_BMessage* data) {
		return ((BHandlerProxy *)instPointer)->GetSupportedSuites_super((BMessage *)data);
	}

	// Observer calls, inter-looper and inter-team
	status_t be_BHandler_StartWatching_1(be_BHandler *instPointer, be_BMessenger *target, uint32 what) {
		return ((BHandlerProxy *)instPointer)->StartWatching(*(BMessenger *)target, what);
	}

	status_t be_BHandler_StartWatchingAll_1(be_BHandler *instPointer, be_BMessenger *target) {
		return ((BHandlerProxy *)instPointer)->StartWatchingAll(*(BMessenger *)target);
	}

	status_t be_BHandler_StopWatching_1(be_BHandler *instPointer, be_BMessenger *target, uint32 what) {
		return ((BHandlerProxy *)instPointer)->StopWatching(*(BMessenger *)target, what);
	}

	status_t be_BHandler_StopWatchingAll_1(be_BHandler *instPointer, be_BMessenger *target) {
		return ((BHandlerProxy *)instPointer)->StopWatchingAll(*(BMessenger *)target);
	}


	// Observer calls for observing targets in the local team
	status_t be_BHandler_StartWatching_2(be_BHandler *instPointer, be_BHandler* observer, uint32 what) {
		return ((BHandlerProxy *)instPointer)->StartWatching((BHandler *)observer, what);
	}

	status_t be_BHandler_StartWatchingAll_2(be_BHandler *instPointer, be_BHandler* observer) {
		return ((BHandlerProxy *)instPointer)->StartWatchingAll((BHandler *)observer);
	}

	status_t be_BHandler_StopWatching_2(be_BHandler *instPointer, be_BHandler* observer, uint32 what) {
		return ((BHandlerProxy *)instPointer)->StopWatching((BHandler *)observer, what);
	}

	status_t be_BHandler_StopWatchingAll_2(be_BHandler *instPointer, be_BHandler* observer) {
		return ((BHandlerProxy *)instPointer)->StopWatchingAll((BHandler *)observer);
	}



	// Reserved
	status_t be_BHandler_Perform_super(be_BHandler *instPointer, perform_code d, void* arg) {
		return ((BHandlerProxy *)instPointer)->Perform_super(d, arg);
	}


	// Notifier calls
	void  be_BHandler_SendNotices_super(be_BHandler *instPointer, uint32 what, const be_BMessage* notice) {
		return ((BHandlerProxy *)instPointer)->SendNotices_super(what, (BMessage *)notice);
	}

	bool be_BHandler_IsWatched(be_BHandler *instPointer) {
		return ((BHandlerProxy *)instPointer)->IsWatched();
	}

}

/* end export functions */

