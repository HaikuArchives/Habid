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
	
}

/* end import functions */


/* begin class BLooperProxy */
BLooperProxy::BLooperProxy(void *bindInstPointer, const char* name, int32 priority, int32 port_capacity)
: fBindInstPointer(bindInstPointer), BLooper(name, priority, port_capacity), BHandlerProxy(bindInstPointer, name)
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

/*
BHandler*		BLooperProxy::ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
BHandler*		BLooperProxy::ResolveSpecifier_super(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
status_t		BLooperProxy::GetSupportedSuites(BMessage* data);
status_t		BLooperProxy::GetSupportedSuites_super(BMessage* data);

	// Message filters (also see BHandler).
void			BLooperProxy::AddCommonFilter(BMessageFilter* filter);
void			BLooperProxy::AddCommonFilter_super(BMessageFilter* filter);
bool			BLooperProxy::RemoveCommonFilter(BMessageFilter* filter);
bool			BLooperProxy::RemoveCommonFilter_super(BMessageFilter* filter);
void			BLooperProxy::SetCommonFilterList(BList* filters);
void			BLooperProxy::SetCommonFilterList_super(BList* filters);

	// Private or reserved
status_t		BLooperProxy::Perform(perform_code d, void* arg);
status_t		BLooperProxy::Perform_super(perform_code d, void* arg);
*/

/* end class BLooperProxy */

/* begin export functions */

extern "C" {

}

/* end export functions */

