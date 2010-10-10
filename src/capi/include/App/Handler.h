/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BHandler_
#define HABID_BHandler_

#include <Handler.h>
#include <Archivable.h>
#include "Support/Archivable.h"

class BHandlerProxy
: public  BArchivableProxy, public BHandler
{
	void *fBindInstPtr;
public:
	BHandlerProxy(void *bindInstPtr, const char* name);
	BHandlerProxy(void *bindInstPtr, BMessage* data);
	~BHandlerProxy();

	virtual status_t Archive(BMessage* data, bool deep) const;
	virtual status_t Archive_super(BMessage* data, bool deep) const;
	virtual void MessageReceived(BMessage* message) ;
	virtual void MessageReceived_super(BMessage* message) ;
	virtual void SetNextHandler(BHandler* handler) ;
	virtual void SetNextHandler_super(BHandler* handler) ;
	virtual void AddFilter(BMessageFilter* filter) ;
	virtual void AddFilter_super(BMessageFilter* filter) ;
	virtual bool RemoveFilter(BMessageFilter* filter) ;
	virtual bool RemoveFilter_super(BMessageFilter* filter) ;
	virtual void SetFilterList(BList* filters) ;
	virtual void SetFilterList_super(BList* filters) ;
	virtual BList* FilterList() ;
	virtual BList* FilterList_super() ;
	virtual BHandler* ResolveSpecifier(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual BHandler* ResolveSpecifier_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual status_t GetSupportedSuites(BMessage* data) ;
	virtual status_t GetSupportedSuites_super(BMessage* data) ;
	virtual status_t Perform(perform_code d, void* arg) ;
	virtual status_t Perform_super(perform_code d, void* arg) ;
	virtual void SendNotices(uint32 what, const BMessage* notice) ;
	virtual void SendNotices_super(uint32 what, const BMessage* notice) ;
};


/* BHandler */
extern "C" {
	status_t bind_BHandler_Archive(void *bindInstPtr, BMessage* data, bool deep);
	void bind_BHandler_MessageReceived(void *bindInstPtr, BMessage* message);
	void bind_BHandler_SetNextHandler(void *bindInstPtr, BHandler* handler);
	void bind_BHandler_AddFilter(void *bindInstPtr, BMessageFilter* filter);
	bool bind_BHandler_RemoveFilter(void *bindInstPtr, BMessageFilter* filter);
	void bind_BHandler_SetFilterList(void *bindInstPtr, BList* filters);
	BList* bind_BHandler_FilterList(void *bindInstPtr);
	BHandler* bind_BHandler_ResolveSpecifier(void *bindInstPtr, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	status_t bind_BHandler_GetSupportedSuites(void *bindInstPtr, BMessage* data);
	status_t bind_BHandler_Perform(void *bindInstPtr, perform_code d, void* arg);
	void bind_BHandler_SendNotices(void *bindInstPtr, uint32 what, const BMessage* notice);
}

#endif // HABID_BHandler_

