/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
#include <Messenger.h>

#include "App/Handler.h"

BHandlerBridge::BHandlerBridge(const char* name)
: BHandler(name)
{
}
BHandlerBridge::BHandlerBridge(BMessage* data)
: BHandler(data)
{
}
BHandlerBridge::~BHandlerBridge() { }

BHandlerProxy::BHandlerProxy(void *bindInstPtr, const char* name)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BHandlerBridge(name) { }

BHandlerProxy::BHandlerProxy(void *bindInstPtr, BMessage* data)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr, data), BHandlerBridge(data) { }

BHandlerProxy::~BHandlerProxy() { }

status_t BHandlerProxy::Archive(BMessage* data, bool deep) const
{
	return bind_BHandler_Archive(fBindInstPtr, data, deep);
}

status_t BHandlerProxy::Archive_super(BMessage* data, bool deep) const
{
	return BHandler::Archive(data, deep);
}

void BHandlerProxy::MessageReceived(BMessage* message) 
{
	 bind_BHandler_MessageReceived(fBindInstPtr, message);
}

void BHandlerProxy::MessageReceived_super(BMessage* message) 
{
	 BHandler::MessageReceived(message);
}

void BHandlerProxy::SetNextHandler(BHandler* handler) 
{
	 bind_BHandler_SetNextHandler(fBindInstPtr, handler);
}

void BHandlerProxy::SetNextHandler_super(BHandler* handler) 
{
	 BHandler::SetNextHandler(handler);
}

void BHandlerProxy::AddFilter(BMessageFilter* filter) 
{
	 bind_BHandler_AddFilter(fBindInstPtr, filter);
}

void BHandlerProxy::AddFilter_super(BMessageFilter* filter) 
{
	 BHandler::AddFilter(filter);
}

bool BHandlerProxy::RemoveFilter(BMessageFilter* filter) 
{
	return bind_BHandler_RemoveFilter(fBindInstPtr, filter);
}

bool BHandlerProxy::RemoveFilter_super(BMessageFilter* filter) 
{
	return BHandler::RemoveFilter(filter);
}

void BHandlerProxy::SetFilterList(BList* filters) 
{
	 bind_BHandler_SetFilterList(fBindInstPtr, filters);
}

void BHandlerProxy::SetFilterList_super(BList* filters) 
{
	 BHandler::SetFilterList(filters);
}

BList* BHandlerProxy::FilterList() 
{
	return bind_BHandler_FilterList(fBindInstPtr);
}

BList* BHandlerProxy::FilterList_super() 
{
	return BHandler::FilterList();
}

BHandler* BHandlerProxy::ResolveSpecifier(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return bind_BHandler_ResolveSpecifier(fBindInstPtr, msg, index, specifier, form, property);
}

BHandler* BHandlerProxy::ResolveSpecifier_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return BHandler::ResolveSpecifier(msg, index, specifier, form, property);
}

status_t BHandlerProxy::GetSupportedSuites(BMessage* data) 
{
	return bind_BHandler_GetSupportedSuites(fBindInstPtr, data);
}

status_t BHandlerProxy::GetSupportedSuites_super(BMessage* data) 
{
	return BHandler::GetSupportedSuites(data);
}

status_t BHandlerProxy::Perform(perform_code d, void* arg) 
{
	return bind_BHandler_Perform(fBindInstPtr, d, arg);
}

status_t BHandlerProxy::Perform_super(perform_code d, void* arg) 
{
	return BHandler::Perform(d, arg);
}

void BHandlerProxy::SendNotices(uint32 what, const BMessage* notice) 
{
	 bind_BHandler_SendNotices(fBindInstPtr, what, notice);
}

void BHandlerProxy::SendNotices_super(uint32 what, const BMessage* notice) 
{
	 BHandler::SendNotices(what, notice);
}


extern "C" {
	BHandler * be_BHandler_ctor(void *bindInstPtr, const char* name)
	{
		return (BHandler *)new BHandlerProxy(bindInstPtr, name);
	}

	BHandler * be_BHandler_ctor_1(void *bindInstPtr, BMessage* data)
	{
		return (BHandler *)new BHandlerProxy(bindInstPtr, data);
	}

	void be_BHandler_dtor(BHandler* self)
	{
		delete self;
	}

	BArchivable* be_BHandler_Instantiate_static(BMessage* data)
	{
		return BHandler::Instantiate(data);
	}

	status_t be_BHandler_Archive(BHandlerProxy *self, BMessage* data, bool deep)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			return proxy->Archive_super(data, deep);
		else
			return self->Archive(data, deep);
	}

	void be_BHandler_MessageReceived(BHandler *self, BMessage* message)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			proxy->MessageReceived_super(message);
		else
			self->MessageReceived(message);
	}

	BLooper* be_BHandler_Looper(BHandler *self)
	{
		return self->Looper();
	}

	void be_BHandler_SetName(BHandler *self, const char* name)
	{
		self->SetName(name);
	}

	const char * be_BHandler_Name(BHandler *self)
	{
		return self->Name();
	}

	void be_BHandler_SetNextHandler(BHandler *self, BHandler* handler)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			proxy->SetNextHandler_super(handler);
		else
			self->SetNextHandler(handler);
	}

	BHandler * be_BHandler_NextHandler(BHandler *self)
	{
		return self->NextHandler();
	}

	void be_BHandler_AddFilter(BHandler *self, BMessageFilter* filter)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			proxy->AddFilter_super(filter);
		else
			self->AddFilter(filter);
	}

	bool be_BHandler_RemoveFilter(BHandler *self, BMessageFilter* filter)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			return proxy->RemoveFilter_super(filter);
		else
			return self->RemoveFilter(filter);
	}

	void be_BHandler_SetFilterList(BHandler *self, BList* filters)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			proxy->SetFilterList_super(filters);
		else
			self->SetFilterList(filters);
	}

	BList* be_BHandler_FilterList(BHandler *self)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			return proxy->FilterList_super();
		else
			return self->FilterList();
	}

	bool be_BHandler_LockLooper(BHandler *self)
	{
		return self->LockLooper();
	}

	status_t be_BHandler_LockLooperWithTimeout(BHandler *self, bigtime_t timeout)
	{
		return self->LockLooperWithTimeout(timeout);
	}

	void be_BHandler_UnlockLooper(BHandler *self)
	{
		self->UnlockLooper();
	}

	BHandler* be_BHandler_ResolveSpecifier(BHandler *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			return proxy->ResolveSpecifier_super(msg, index, specifier, form, property);
		else
			return self->ResolveSpecifier(msg, index, specifier, form, property);
	}

	status_t be_BHandler_GetSupportedSuites(BHandler *self, BMessage* data)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			return proxy->GetSupportedSuites_super(data);
		else
			return self->GetSupportedSuites(data);
	}

	status_t be_BHandler_StartWatching(BHandler *self, BMessenger *target, uint32 what)
	{
		return self->StartWatching(*target, what);
	}

	status_t be_BHandler_StartWatchingAll(BHandler *self, BMessenger *target)
	{
		return self->StartWatchingAll(*target);
	}

	status_t be_BHandler_StopWatching(BHandler *self, BMessenger *target, uint32 what)
	{
		return self->StopWatching(*target, what);
	}

	status_t be_BHandler_StopWatchingAll(BHandler *self, BMessenger *target)
	{
		return self->StopWatchingAll(*target);
	}

	status_t be_BHandler_StartWatching_1(BHandler *self, BHandler* observer, uint32 what)
	{
		return self->StartWatching(observer, what);
	}

	status_t be_BHandler_StartWatchingAll_1(BHandler *self, BHandler* observer)
	{
		return self->StartWatchingAll(observer);
	}

	status_t be_BHandler_StopWatching_1(BHandler *self, BHandler* observer, uint32 what)
	{
		return self->StopWatching(observer, what);
	}

	status_t be_BHandler_StopWatchingAll_1(BHandler *self, BHandler* observer)
	{
		return self->StopWatchingAll(observer);
	}

	status_t be_BHandler_Perform(BHandler *self, perform_code d, void* arg)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			return proxy->Perform_super(d, arg);
		else
			return self->Perform(d, arg);
	}

	void be_BHandler_SendNotices(BHandler *self, uint32 what, const BMessage* notice)
	{
		BHandlerProxy *proxy = dynamic_cast<BHandlerProxy *>(self);
		if(proxy)
			proxy->SendNotices_super(what, notice);
		else
			self->SendNotices(what, notice);
	}

	bool be_BHandler_IsWatched(BHandler *self)
	{
		return self->IsWatched();
	}

}


