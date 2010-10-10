/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/Looper.h"


BLooperProxy::BLooperProxy(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity)
: fBindInstPtr(bindInstPtr), BHandlerProxy(bindInstPtr, name), BLooper(name, priority, port_capacity) { }

BLooperProxy::BLooperProxy(void *bindInstPtr, BMessage* data)
: fBindInstPtr(bindInstPtr), BHandlerProxy(bindInstPtr, data), BLooper(data) { }

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
	BLooper * be_BLooper_ctor(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity)
	{
		return (BLooper *)new BLooperProxy(bindInstPtr, name, priority, port_capacity);
	}

	BLooper * be_BLooper_ctor_1(void *bindInstPtr, BMessage* data)
	{
		return (BLooper *)new BLooperProxy(bindInstPtr, data);
	}

	void be_BLooper_dtor(BLooper* self)
	{
		delete self;
	}

	BArchivable * be_BLooper_Instantiate_static(BMessage* data)
	{
		return BLooper::Instantiate(data);
	}

	status_t be_BLooper_Archive(BLooper *self, BMessage* data, bool deep)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->Archive_super(data, deep);
		else
			return self->Archive(data, deep);
	}

	status_t be_BLooper_PostMessage(BLooper *self, uint32 command)
	{
		return self->PostMessage(command);
	}

	status_t be_BLooper_PostMessage_1(BLooper *self, BMessage* message)
	{
		return self->PostMessage(message);
	}

	status_t be_BLooper_PostMessage_2(BLooper *self, uint32 command, BHandler* handler, BHandler* replyTo)
	{
		return self->PostMessage(command, handler, replyTo);
	}

	status_t be_BLooper_PostMessage_3(BLooper *self, BMessage* message, BHandler* handler, BHandler* replyTo)
	{
		return self->PostMessage(message, handler, replyTo);
	}

	void be_BLooper_DispatchMessage(BLooper *self, BMessage* message, BHandler* handler)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			proxy->DispatchMessage_super(message, handler);
		else
			self->DispatchMessage(message, handler);
	}

	void be_BLooper_MessageReceived(BLooper *self, BMessage* message)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			proxy->MessageReceived_super(message);
		else
			self->MessageReceived(message);
	}

	BMessage* be_BLooper_CurrentMessage(BLooper *self)
	{
		return self->CurrentMessage();
	}

	BMessage* be_BLooper_DetachCurrentMessage(BLooper *self)
	{
		return self->DetachCurrentMessage();
	}

	BMessageQueue* be_BLooper_MessageQueue(BLooper *self)
	{
		return self->MessageQueue();
	}

	bool be_BLooper_IsMessageWaiting(BLooper *self)
	{
		return self->IsMessageWaiting();
	}

	void be_BLooper_AddHandler(BLooper *self, BHandler* handler)
	{
		self->AddHandler(handler);
	}

	bool be_BLooper_RemoveHandler(BLooper *self, BHandler* handler)
	{
		return self->RemoveHandler(handler);
	}

	int32 be_BLooper_CountHandlers(BLooper *self)
	{
		return self->CountHandlers();
	}

	BHandler* be_BLooper_HandlerAt(BLooper *self, int32 index)
	{
		return self->HandlerAt(index);
	}

	int32 be_BLooper_IndexOf(BLooper *self, BHandler* handler)
	{
		return self->IndexOf(handler);
	}

	BHandler* be_BLooper_PreferredHandler(BLooper *self)
	{
		return self->PreferredHandler();
	}

	void be_BLooper_SetPreferredHandler(BLooper *self, BHandler* handler)
	{
		self->SetPreferredHandler(handler);
	}

	thread_id be_BLooper_Run(BLooper *self)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->Run_super();
		else
			return self->Run();
	}

	void be_BLooper_Quit(BLooper *self)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			proxy->Quit_super();
		else
			self->Quit();
	}

	bool be_BLooper_QuitRequested(BLooper *self)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->QuitRequested_super();
		else
			return self->QuitRequested();
	}

	bool be_BLooper_Lock(BLooper *self)
	{
		return self->Lock();
	}

	void be_BLooper_Unlock(BLooper *self)
	{
		self->Unlock();
	}

	bool be_BLooper_IsLocked(BLooper *self)
	{
		return self->IsLocked();
	}

	status_t be_BLooper_LockWithTimeout(BLooper *self, bigtime_t timeout)
	{
		return self->LockWithTimeout(timeout);
	}

	thread_id be_BLooper_Thread(BLooper *self)
	{
		return self->Thread();
	}

	team_id be_BLooper_Team(BLooper *self)
	{
		return self->Team();
	}

	BLooper* be_BLooper_LooperForThread(BLooper *self, thread_id thread)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->LooperForThread_super(thread);
		else
			return self->LooperForThread(thread);
	}

	thread_id be_BLooper_LockingThread(BLooper *self)
	{
		return self->LockingThread();
	}

	int32 be_BLooper_CountLocks(BLooper *self)
	{
		return self->CountLocks();
	}

	int32 be_BLooper_CountLockRequests(BLooper *self)
	{
		return self->CountLockRequests();
	}

	sem_id be_BLooper_Sem(BLooper *self)
	{
		return self->Sem();
	}

	BHandler* be_BLooper_ResolveSpecifier(BLooper *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->ResolveSpecifier_super(msg, index, specifier, form, property);
		else
			return self->ResolveSpecifier(msg, index, specifier, form, property);
	}

	status_t be_BLooper_GetSupportedSuites(BLooper *self, BMessage* data)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->GetSupportedSuites_super(data);
		else
			return self->GetSupportedSuites(data);
	}

	void be_BLooper_AddCommonFilter(BLooper *self, BMessageFilter* filter)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			proxy->AddCommonFilter_super(filter);
		else
			self->AddCommonFilter(filter);
	}

	bool be_BLooper_RemoveCommonFilter(BLooper *self, BMessageFilter* filter)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->RemoveCommonFilter_super(filter);
		else
			return self->RemoveCommonFilter(filter);
	}

	void be_BLooper_SetCommonFilterList(BLooper *self, BList* filters)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			proxy->SetCommonFilterList_super(filters);
		else
			self->SetCommonFilterList(filters);
	}

	BList* be_BLooper_CommonFilterList(BLooper *self)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->CommonFilterList_super();
		else
			return self->CommonFilterList();
	}

	status_t be_BLooper_Perform(BLooper *self, perform_code d, void* arg)
	{
		BLooperProxy *proxy = dynamic_cast<BLooperProxy *>(self);
		if(proxy)
			return proxy->Perform_super(d, arg);
		else
			return self->Perform(d, arg);
	}

}


