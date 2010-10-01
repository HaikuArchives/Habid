/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/Looper.h"

BLooperBridge::BLooperBridge(const char* name, int32 priority, int32 port_capacity)
: BLooper(name, priority, port_capacity)
{
}
BLooperBridge::BLooperBridge(BMessage* data)
: BLooper(data)
{
}
BLooperBridge::~BLooperBridge() { }

BLooperProxy::BLooperProxy(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity)
: fBindInstPtr(bindInstPtr), BHandlerProxy(bindInstPtr, name), BLooperBridge(name, priority, port_capacity) { }

BLooperProxy::BLooperProxy(void *bindInstPtr, BMessage* data)
: fBindInstPtr(bindInstPtr), BHandlerProxy(bindInstPtr, data), BLooperBridge(data) { }

BLooperProxy::~BLooperProxy() { }

status_t BLooperProxy::Archive(BMessage* data, bool deep) const
{
	return bind_BLooper_Archive(fBindInstPtr, data, deep);
}

status_t BLooperProxy::Archive_super(BMessage* data, bool deep) const
{
	return BLooper::Archive(data, deep);
}

void BLooperProxy::DispatchMessage(BMessage* message, BHandler* handler) 
{
	 bind_BLooper_DispatchMessage(fBindInstPtr, message, handler);
}

void BLooperProxy::DispatchMessage_super(BMessage* message, BHandler* handler) 
{
	 BLooper::DispatchMessage(message, handler);
}

void BLooperProxy::MessageReceived(BMessage* message) 
{
	 bind_BLooper_MessageReceived(fBindInstPtr, message);
}

void BLooperProxy::MessageReceived_super(BMessage* message) 
{
	 BLooper::MessageReceived(message);
}

thread_id BLooperProxy::Run() 
{
	return bind_BLooper_Run(fBindInstPtr);
}

thread_id BLooperProxy::Run_super() 
{
	return BLooper::Run();
}

void BLooperProxy::Quit() 
{
	 bind_BLooper_Quit(fBindInstPtr);
}

void BLooperProxy::Quit_super() 
{
	 BLooper::Quit();
}

bool BLooperProxy::QuitRequested() 
{
	return bind_BLooper_QuitRequested(fBindInstPtr);
}

bool BLooperProxy::QuitRequested_super() 
{
	return BLooper::QuitRequested();
}

BLooper* BLooperProxy::LooperForThread(thread_id thread) 
{
	return bind_BLooper_LooperForThread(fBindInstPtr, thread);
}

BLooper* BLooperProxy::LooperForThread_super(thread_id thread) 
{
	return BLooper::LooperForThread(thread);
}

BHandler* BLooperProxy::ResolveSpecifier(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return bind_BLooper_ResolveSpecifier(fBindInstPtr, msg, index, specifier, form, property);
}

BHandler* BLooperProxy::ResolveSpecifier_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return BLooper::ResolveSpecifier(msg, index, specifier, form, property);
}

status_t BLooperProxy::GetSupportedSuites(BMessage* data) 
{
	return bind_BLooper_GetSupportedSuites(fBindInstPtr, data);
}

status_t BLooperProxy::GetSupportedSuites_super(BMessage* data) 
{
	return BLooper::GetSupportedSuites(data);
}

void BLooperProxy::AddCommonFilter(BMessageFilter* filter) 
{
	 bind_BLooper_AddCommonFilter(fBindInstPtr, filter);
}

void BLooperProxy::AddCommonFilter_super(BMessageFilter* filter) 
{
	 BLooper::AddCommonFilter(filter);
}

bool BLooperProxy::RemoveCommonFilter(BMessageFilter* filter) 
{
	return bind_BLooper_RemoveCommonFilter(fBindInstPtr, filter);
}

bool BLooperProxy::RemoveCommonFilter_super(BMessageFilter* filter) 
{
	return BLooper::RemoveCommonFilter(filter);
}

void BLooperProxy::SetCommonFilterList(BList* filters) 
{
	 bind_BLooper_SetCommonFilterList(fBindInstPtr, filters);
}

void BLooperProxy::SetCommonFilterList_super(BList* filters) 
{
	 BLooper::SetCommonFilterList(filters);
}

BList* BLooperProxy::CommonFilterList() const
{
	return bind_BLooper_CommonFilterList(fBindInstPtr);
}

BList* BLooperProxy::CommonFilterList_super() const
{
	return BLooper::CommonFilterList();
}

status_t BLooperProxy::Perform(perform_code d, void* arg) 
{
	return bind_BLooper_Perform(fBindInstPtr, d, arg);
}

status_t BLooperProxy::Perform_super(perform_code d, void* arg) 
{
	return BLooper::Perform(d, arg);
}


extern "C" {
	BLooperProxy * be_BLooper_ctor(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity)
	{
		return new BLooperProxy(bindInstPtr, name, priority, port_capacity);
	}

	BLooperProxy * be_BLooper_ctor_1(void *bindInstPtr, BMessage* data)
	{
		return new BLooperProxy(bindInstPtr, data);
	}

	void be_BLooper_dtor(BLooper* self)
	{
		delete self;
	}

	BArchivable * be_BLooper_Instantiate_static(BMessage* data)
	{
		return BLooper::Instantiate(data);
	}

	status_t be_BLooper_Archive(BLooperProxy *self, BMessage* data, bool deep)
	{
		return self->Archive_super(data, deep);
	}

	status_t be_BLooper_PostMessage(BLooperProxy *self, uint32 command)
	{
		return self->PostMessage(command);
	}

	status_t be_BLooper_PostMessage_1(BLooperProxy *self, BMessage* message)
	{
		return self->PostMessage(message);
	}

	status_t be_BLooper_PostMessage_2(BLooperProxy *self, uint32 command, BHandler* handler, BHandler* replyTo)
	{
		return self->PostMessage(command, handler, replyTo);
	}

	status_t be_BLooper_PostMessage_3(BLooperProxy *self, BMessage* message, BHandler* handler, BHandler* replyTo)
	{
		return self->PostMessage(message, handler, replyTo);
	}

	void be_BLooper_DispatchMessage(BLooperProxy *self, BMessage* message, BHandler* handler)
	{
		self->DispatchMessage_super(message, handler);
	}

	void be_BLooper_MessageReceived(BLooperProxy *self, BMessage* message)
	{
		self->MessageReceived_super(message);
	}

	BMessage* be_BLooper_CurrentMessage(BLooperProxy *self)
	{
		return self->CurrentMessage();
	}

	BMessage* be_BLooper_DetachCurrentMessage(BLooperProxy *self)
	{
		return self->DetachCurrentMessage();
	}

	BMessageQueue* be_BLooper_MessageQueue(BLooperProxy *self)
	{
		return self->MessageQueue();
	}

	bool be_BLooper_IsMessageWaiting(BLooperProxy *self)
	{
		return self->IsMessageWaiting();
	}

	void be_BLooper_AddHandler(BLooperProxy *self, BHandler* handler)
	{
		self->AddHandler(handler);
	}

	bool be_BLooper_RemoveHandler(BLooperProxy *self, BHandler* handler)
	{
		return self->RemoveHandler(handler);
	}

	int32 be_BLooper_CountHandlers(BLooperProxy *self)
	{
		return self->CountHandlers();
	}

	BHandler* be_BLooper_HandlerAt(BLooperProxy *self, int32 index)
	{
		return self->HandlerAt(index);
	}

	int32 be_BLooper_IndexOf(BLooperProxy *self, BHandler* handler)
	{
		return self->IndexOf(handler);
	}

	BHandler* be_BLooper_PreferredHandler(BLooperProxy *self)
	{
		return self->PreferredHandler();
	}

	void be_BLooper_SetPreferredHandler(BLooperProxy *self, BHandler* handler)
	{
		self->SetPreferredHandler(handler);
	}

	thread_id be_BLooper_Run(BLooperProxy *self)
	{
		return self->Run_super();
	}

	void be_BLooper_Quit(BLooperProxy *self)
	{
		self->Quit_super();
	}

	bool be_BLooper_QuitRequested(BLooperProxy *self)
	{
		return self->QuitRequested_super();
	}

	bool be_BLooper_Lock(BLooperProxy *self)
	{
		return self->Lock();
	}

	void be_BLooper_Unlock(BLooperProxy *self)
	{
		self->Unlock();
	}

	bool be_BLooper_IsLocked(BLooperProxy *self)
	{
		return self->IsLocked();
	}

	status_t be_BLooper_LockWithTimeout(BLooperProxy *self, bigtime_t timeout)
	{
		return self->LockWithTimeout(timeout);
	}

	thread_id be_BLooper_Thread(BLooperProxy *self)
	{
		return self->Thread();
	}

	team_id be_BLooper_Team(BLooperProxy *self)
	{
		return self->Team();
	}

	BLooper* be_BLooper_LooperForThread(BLooperProxy *self, thread_id thread)
	{
		return self->LooperForThread_super(thread);
	}

	thread_id be_BLooper_LockingThread(BLooperProxy *self)
	{
		return self->LockingThread();
	}

	int32 be_BLooper_CountLocks(BLooperProxy *self)
	{
		return self->CountLocks();
	}

	int32 be_BLooper_CountLockRequests(BLooperProxy *self)
	{
		return self->CountLockRequests();
	}

	sem_id be_BLooper_Sem(BLooperProxy *self)
	{
		return self->Sem();
	}

	BHandler* be_BLooper_ResolveSpecifier(BLooperProxy *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property)
	{
		return self->ResolveSpecifier_super(msg, index, specifier, form, property);
	}

	status_t be_BLooper_GetSupportedSuites(BLooperProxy *self, BMessage* data)
	{
		return self->GetSupportedSuites_super(data);
	}

	void be_BLooper_AddCommonFilter(BLooperProxy *self, BMessageFilter* filter)
	{
		self->AddCommonFilter_super(filter);
	}

	bool be_BLooper_RemoveCommonFilter(BLooperProxy *self, BMessageFilter* filter)
	{
		return self->RemoveCommonFilter_super(filter);
	}

	void be_BLooper_SetCommonFilterList(BLooperProxy *self, BList* filters)
	{
		self->SetCommonFilterList_super(filters);
	}

	BList* be_BLooper_CommonFilterList(BLooperProxy *self)
	{
		return self->CommonFilterList_super();
	}

	status_t be_BLooper_Perform(BLooperProxy *self, perform_code d, void* arg)
	{
		return self->Perform_super(d, arg);
	}

}


