/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BApplication_
#define HABID_BApplication_

#include <Application.h>
#include "App/Looper.h"

class BApplicationBridge
: public BApplication
{
public:
	BApplicationBridge(const char* signature);
	BApplicationBridge(const char* signature, status_t* error);
	BApplicationBridge(BMessage* data);
	~BApplicationBridge();

};


class BApplicationProxy
: public  BLooperProxy, public BApplicationBridge
{
	void *fBindInstPtr;
public:
	BApplicationProxy(void *bindInstPtr, const char* signature);
	BApplicationProxy(void *bindInstPtr, const char* signature, status_t* error);
	BApplicationProxy(void *bindInstPtr, BMessage* data);
	~BApplicationProxy();

	virtual thread_id Run() ;
	virtual thread_id Run_super() ;
	virtual void Quit() ;
	virtual void Quit_super() ;
	virtual bool QuitRequested() ;
	virtual bool QuitRequested_super() ;
	virtual void Pulse() ;
	virtual void Pulse_super() ;
	virtual void ReadyToRun() ;
	virtual void ReadyToRun_super() ;
	virtual void MessageReceived(BMessage* message) ;
	virtual void MessageReceived_super(BMessage* message) ;
	virtual void ArgvReceived(int32 argc, char** argv) ;
	virtual void ArgvReceived_super(int32 argc, char** argv) ;
	virtual void AppActivated(bool active) ;
	virtual void AppActivated_super(bool active) ;
	virtual void RefsReceived(BMessage* message) ;
	virtual void RefsReceived_super(BMessage* message) ;
	virtual void AboutRequested() ;
	virtual void AboutRequested_super() ;
	virtual BHandler* ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual BHandler* ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual void DispatchMessage(BMessage* message, BHandler* handler) ;
	virtual void DispatchMessage_super(BMessage* message, BHandler* handler) ;
	virtual status_t GetSupportedSuites(BMessage* data) ;
	virtual status_t GetSupportedSuites_super(BMessage* data) ;
	virtual status_t Perform(perform_code d, void* arg) ;
	virtual status_t Perform_super(perform_code d, void* arg) ;
};


/* BApplication */
extern "C" {
	thread_id bind_BApplication_Run(void *bindInstPtr);
	void bind_BApplication_Quit(void *bindInstPtr);
	bool bind_BApplication_QuitRequested(void *bindInstPtr);
	void bind_BApplication_Pulse(void *bindInstPtr);
	void bind_BApplication_ReadyToRun(void *bindInstPtr);
	void bind_BApplication_MessageReceived(void *bindInstPtr, BMessage* message);
	void bind_BApplication_ArgvReceived(void *bindInstPtr, int32 argc, char** argv);
	void bind_BApplication_AppActivated(void *bindInstPtr, bool active);
	void bind_BApplication_RefsReceived(void *bindInstPtr, BMessage* message);
	void bind_BApplication_AboutRequested(void *bindInstPtr);
	BHandler* bind_BApplication_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	void bind_BApplication_DispatchMessage(void *bindInstPtr, BMessage* message, BHandler* handler);
	status_t bind_BApplication_GetSupportedSuites(void *bindInstPtr, BMessage* data);
	status_t bind_BApplication_Perform(void *bindInstPtr, perform_code d, void* arg);
}

#endif // HABID_BApplication_

