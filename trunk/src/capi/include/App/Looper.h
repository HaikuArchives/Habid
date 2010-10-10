/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BLooper_
#define HABID_BLooper_

#include <Looper.h>
#include "App/Handler.h"

class BLooperProxy
: public  BHandlerProxy, public BLooper
{
	void *fBindInstPtr;
public:
	BLooperProxy(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity);
	BLooperProxy(void *bindInstPtr, BMessage* data);
	~BLooperProxy();

	virtual status_t Archive(BMessage* data, bool deep) const;
	virtual status_t Archive_super(BMessage* data, bool deep) const;
	virtual void DispatchMessage(BMessage* message, BHandler* handler) ;
	virtual void DispatchMessage_super(BMessage* message, BHandler* handler) ;
	virtual void MessageReceived(BMessage* message) ;
	virtual void MessageReceived_super(BMessage* message) ;
	virtual thread_id Run() ;
	virtual thread_id Run_super() ;
	virtual void Quit() ;
	virtual void Quit_super() ;
	virtual bool QuitRequested() ;
	virtual bool QuitRequested_super() ;
	virtual BLooper* LooperForThread(thread_id thread) ;
	virtual BLooper* LooperForThread_super(thread_id thread) ;
	virtual BHandler* ResolveSpecifier(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual BHandler* ResolveSpecifier_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual status_t GetSupportedSuites(BMessage* data) ;
	virtual status_t GetSupportedSuites_super(BMessage* data) ;
	virtual void AddCommonFilter(BMessageFilter* filter) ;
	virtual void AddCommonFilter_super(BMessageFilter* filter) ;
	virtual bool RemoveCommonFilter(BMessageFilter* filter) ;
	virtual bool RemoveCommonFilter_super(BMessageFilter* filter) ;
	virtual void SetCommonFilterList(BList* filters) ;
	virtual void SetCommonFilterList_super(BList* filters) ;
	virtual BList* CommonFilterList() const;
	virtual BList* CommonFilterList_super() const;
	virtual status_t Perform(perform_code d, void* arg) ;
	virtual status_t Perform_super(perform_code d, void* arg) ;
};


/* BLooper */
extern "C" {
	status_t bind_BLooper_Archive(void *bindInstPtr, BMessage* data, bool deep);
	void bind_BLooper_DispatchMessage(void *bindInstPtr, BMessage* message, BHandler* handler);
	void bind_BLooper_MessageReceived(void *bindInstPtr, BMessage* message);
	thread_id bind_BLooper_Run(void *bindInstPtr);
	void bind_BLooper_Quit(void *bindInstPtr);
	bool bind_BLooper_QuitRequested(void *bindInstPtr);
	BLooper* bind_BLooper_LooperForThread(void *bindInstPtr, thread_id thread);
	BHandler* bind_BLooper_ResolveSpecifier(void *bindInstPtr, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	status_t bind_BLooper_GetSupportedSuites(void *bindInstPtr, BMessage* data);
	void bind_BLooper_AddCommonFilter(void *bindInstPtr, BMessageFilter* filter);
	bool bind_BLooper_RemoveCommonFilter(void *bindInstPtr, BMessageFilter* filter);
	void bind_BLooper_SetCommonFilterList(void *bindInstPtr, BList* filters);
	BList* bind_BLooper_CommonFilterList(void *bindInstPtr);
	status_t bind_BLooper_Perform(void *bindInstPtr, perform_code d, void* arg);
}

#endif // HABID_BLooper_

