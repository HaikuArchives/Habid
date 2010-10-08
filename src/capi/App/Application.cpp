/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/Application.h"

#include <string.h>
#include <typeinfo>

const char* kRegistrarSignature = "application/x-vnd.haiku-registrar";

static const char *
looper_name_for(const char *signature)
{
 	if (signature && !strcasecmp(signature, kRegistrarSignature))
 		return "system:roster";
 	return "AppLooperPort";
}

BApplicationBridge::BApplicationBridge(const char* signature)
: BApplication(signature)
{
}
BApplicationBridge::BApplicationBridge(const char* signature, status_t* error)
: BApplication(signature, error)
{
}
BApplicationBridge::BApplicationBridge(BMessage* data)
: BApplication(data)
{
}
BApplicationBridge::~BApplicationBridge() { }

BApplicationProxy::BApplicationProxy(void *bindInstPtr, const char* signature)
: fBindInstPtr(bindInstPtr), BLooperProxy(bindInstPtr, looper_name_for(signature), B_NORMAL_PRIORITY, B_LOOPER_PORT_DEFAULT_CAPACITY), BApplicationBridge(signature) { }

BApplicationProxy::BApplicationProxy(void *bindInstPtr, const char* signature, status_t* error)
: fBindInstPtr(bindInstPtr), BLooperProxy(bindInstPtr, looper_name_for(signature), B_NORMAL_PRIORITY, B_LOOPER_PORT_DEFAULT_CAPACITY), BApplicationBridge(signature, error) { }

BApplicationProxy::BApplicationProxy(void *bindInstPtr, BMessage* data)
: fBindInstPtr(bindInstPtr), BLooperProxy(bindInstPtr, data), BApplicationBridge(data) { }

BApplicationProxy::~BApplicationProxy() { }

thread_id BApplicationProxy::Run() 
{
	return bind_BApplication_Run(fBindInstPtr);
}

thread_id BApplicationProxy::Run_super() 
{
	return BApplication::Run();
}

void BApplicationProxy::Quit() 
{
	 bind_BApplication_Quit(fBindInstPtr);
}

void BApplicationProxy::Quit_super() 
{
	 BApplication::Quit();
}

bool BApplicationProxy::QuitRequested() 
{
	return bind_BApplication_QuitRequested(fBindInstPtr);
}

bool BApplicationProxy::QuitRequested_super() 
{
	return BApplication::QuitRequested();
}

void BApplicationProxy::Pulse() 
{
	 bind_BApplication_Pulse(fBindInstPtr);
}

void BApplicationProxy::Pulse_super() 
{
	 BApplication::Pulse();
}

void BApplicationProxy::ReadyToRun() 
{
	 bind_BApplication_ReadyToRun(fBindInstPtr);
}

void BApplicationProxy::ReadyToRun_super() 
{
	 BApplication::ReadyToRun();
}

void BApplicationProxy::MessageReceived(BMessage* message) 
{
	 bind_BApplication_MessageReceived(fBindInstPtr, message);
}

void BApplicationProxy::MessageReceived_super(BMessage* message) 
{
	 BApplication::MessageReceived(message);
}

void BApplicationProxy::ArgvReceived(int32 argc, char** argv) 
{
	 bind_BApplication_ArgvReceived(fBindInstPtr, argc, argv);
}

void BApplicationProxy::ArgvReceived_super(int32 argc, char** argv) 
{
	 BApplication::ArgvReceived(argc, argv);
}

void BApplicationProxy::AppActivated(bool active) 
{
	 bind_BApplication_AppActivated(fBindInstPtr, active);
}

void BApplicationProxy::AppActivated_super(bool active) 
{
	 BApplication::AppActivated(active);
}

void BApplicationProxy::RefsReceived(BMessage* message) 
{
	 bind_BApplication_RefsReceived(fBindInstPtr, message);
}

void BApplicationProxy::RefsReceived_super(BMessage* message) 
{
	 BApplication::RefsReceived(message);
}

void BApplicationProxy::AboutRequested() 
{
	 bind_BApplication_AboutRequested(fBindInstPtr);
}

void BApplicationProxy::AboutRequested_super() 
{
	 BApplication::AboutRequested();
}

BHandler* BApplicationProxy::ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return bind_BApplication_ResolveSpecifier(fBindInstPtr, message, index, specifier, form, property);
}

BHandler* BApplicationProxy::ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return BApplication::ResolveSpecifier(message, index, specifier, form, property);
}

void BApplicationProxy::DispatchMessage(BMessage* message, BHandler* handler) 
{
	 bind_BApplication_DispatchMessage(fBindInstPtr, message, handler);
}

void BApplicationProxy::DispatchMessage_super(BMessage* message, BHandler* handler) 
{
	 BApplication::DispatchMessage(message, handler);
}

status_t BApplicationProxy::GetSupportedSuites(BMessage* data) 
{
	return bind_BApplication_GetSupportedSuites(fBindInstPtr, data);
}

status_t BApplicationProxy::GetSupportedSuites_super(BMessage* data) 
{
	return BApplication::GetSupportedSuites(data);
}

status_t BApplicationProxy::Perform(perform_code d, void* arg) 
{
	return bind_BApplication_Perform(fBindInstPtr, d, arg);
}

status_t BApplicationProxy::Perform_super(perform_code d, void* arg) 
{
	return BApplication::Perform(d, arg);
}


extern "C" {
	BApplication * be_BApplication_ctor(void *bindInstPtr, const char* signature)
	{
		return (BApplication *)new BApplicationProxy(bindInstPtr, signature);
	}

	BApplication * be_BApplication_ctor_1(void *bindInstPtr, const char* signature, status_t* error)
	{
		return (BApplication *)new BApplicationProxy(bindInstPtr, signature, error);
	}

	BApplication * be_BApplication_ctor_2(void *bindInstPtr, BMessage* data)
	{
		return (BApplication *)new BApplicationProxy(bindInstPtr, data);
	}

	void be_BApplication_dtor(BApplication* self)
	{
		delete self;
	}

	BArchivable* be_BApplication_Instantiate_static(BMessage* data)
	{
		return BApplication::Instantiate(data);
	}

	status_t be_BApplication_Archive(BApplication *self, BMessage* data, bool deep)
	{
		return self->Archive(data, deep);
	}

	status_t be_BApplication_InitCheck(BApplication *self)
	{
		return self->InitCheck();
	}

	thread_id be_BApplication_Run(BApplication *self)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			return proxy->Run_super();
		else
			return self->Run();
	}

	void be_BApplication_Quit(BApplication *self)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->Quit_super();
		else
			self->Quit();
	}

	bool be_BApplication_QuitRequested(BApplication *self)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			return proxy->QuitRequested_super();
		else
			return self->QuitRequested();
	}

	void be_BApplication_Pulse(BApplication *self)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->Pulse_super();
		else
			self->Pulse();
	}

	void be_BApplication_ReadyToRun(BApplication *self)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->ReadyToRun_super();
		else
			self->ReadyToRun();
	}

	void be_BApplication_MessageReceived(BApplication *self, BMessage* message)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->MessageReceived_super(message);
		else
			self->MessageReceived(message);
	}

	void be_BApplication_ArgvReceived(BApplication *self, int32 argc, char** argv)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->ArgvReceived_super(argc, argv);
		else
			self->ArgvReceived(argc, argv);
	}

	void be_BApplication_AppActivated(BApplication *self, bool active)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->AppActivated_super(active);
		else
			self->AppActivated(active);
	}

	void be_BApplication_RefsReceived(BApplication *self, BMessage* message)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->RefsReceived_super(message);
		else
			self->RefsReceived(message);
	}

	void be_BApplication_AboutRequested(BApplication *self)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->AboutRequested_super();
		else
			self->AboutRequested();
	}

	BHandler* be_BApplication_ResolveSpecifier(BApplication *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			return proxy->ResolveSpecifier_super(message, index, specifier, form, property);
		else
			return self->ResolveSpecifier(message, index, specifier, form, property);
	}

	void be_BApplication_ShowCursor(BApplication *self)
	{
		self->ShowCursor();
	}

	void be_BApplication_HideCursor(BApplication *self)
	{
		self->HideCursor();
	}

	void be_BApplication_ObscureCursor(BApplication *self)
	{
		self->ObscureCursor();
	}

	bool be_BApplication_IsCursorHidden(BApplication *self)
	{
		return self->IsCursorHidden();
	}

	void be_BApplication_SetCursor(BApplication *self, const void* cursor)
	{
		self->SetCursor(cursor);
	}

	void be_BApplication_SetCursor_1(BApplication *self, const BCursor* cursor, bool sync)
	{
		self->SetCursor(cursor, sync);
	}

	int32 be_BApplication_CountWindows(BApplication *self)
	{
		return self->CountWindows();
	}

	BWindow * be_BApplication_WindowAt(BApplication *self, int32 index)
	{
		return self->WindowAt(index);
	}

	int32 be_BApplication_CountLoopers(BApplication *self)
	{
		return self->CountLoopers();
	}

	BLooper * be_BApplication_LooperAt(BApplication *self, int32 index)
	{
		return self->LooperAt(index);
	}

	bool be_BApplication_IsLaunching(BApplication *self)
	{
		return self->IsLaunching();
	}

	status_t be_BApplication_GetAppInfo(BApplication *self, app_info* info)
	{
		return self->GetAppInfo(info);
	}

	BResources * be_BApplication_AppResources_static()
	{
		return BApplication::AppResources();
	}

	void be_BApplication_DispatchMessage(BApplication *self, BMessage* message, BHandler* handler)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			proxy->DispatchMessage_super(message, handler);
		else
			self->DispatchMessage(message, handler);
	}

	void be_BApplication_SetPulseRate(BApplication *self, bigtime_t rate)
	{
		self->SetPulseRate(rate);
	}

	status_t be_BApplication_GetSupportedSuites(BApplication *self, BMessage* data)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			return proxy->GetSupportedSuites_super(data);
		else
			return self->GetSupportedSuites(data);
	}

	status_t be_BApplication_Perform(BApplication *self, perform_code d, void* arg)
	{
		BApplicationProxy *proxy = dynamic_cast<BApplicationProxy *>(self);
		if(proxy)
			return proxy->Perform_super(d, arg);
		else
			return self->Perform(d, arg);
	}
	
	BMessenger * get_be_app_messenger() {
		return &be_app_messenger;	
	}
	
	BApplication * get_be_app() {
		return be_app;	
	}
}


