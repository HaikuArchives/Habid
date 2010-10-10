/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BControl_
#define HABID_BControl_

#include <Control.h>
#include "Interface/View.h"
#include "App/Invoker.h"

class BControlProxy
: public  BViewProxy,  BInvokerProxy, public BControl
{
	void *fBindInstPtr;
public:
	BControlProxy(void *bindInstPtr, BRect frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags);
	BControlProxy(void *bindInstPtr, const char* name, const char* label, BMessage* message, uint32 flags);
	BControlProxy(void *bindInstPtr, BMessage* archive);
	~BControlProxy();

	virtual status_t Archive(BMessage* archive, bool deep) ;
	virtual status_t Archive_super(BMessage* archive, bool deep) ;
	virtual void WindowActivated(bool active) ;
	virtual void WindowActivated_super(bool active) ;
	virtual void AttachedToWindow() ;
	virtual void AttachedToWindow_super() ;
	virtual void DetachedFromWindow() ;
	virtual void DetachedFromWindow_super() ;
	virtual void AllAttached() ;
	virtual void AllAttached_super() ;
	virtual void AllDetached() ;
	virtual void AllDetached_super() ;
	virtual void MessageReceived(BMessage* message) ;
	virtual void MessageReceived_super(BMessage* message) ;
	virtual void MakeFocus(bool focused) ;
	virtual void MakeFocus_super(bool focused) ;
	virtual void KeyDown(const char* bytes, int32 numBytes) ;
	virtual void KeyDown_super(const char* bytes, int32 numBytes) ;
	virtual void MouseDown(BPoint point) ;
	virtual void MouseDown_super(BPoint point) ;
	virtual void MouseUp(BPoint point) ;
	virtual void MouseUp_super(BPoint point) ;
	virtual void MouseMoved(BPoint point, uint32 transit, const BMessage * message) ;
	virtual void MouseMoved_super(BPoint point, uint32 transit, const BMessage * message) ;
	virtual void SetLabel(const char* string) ;
	virtual void SetLabel_super(const char* string) ;
	virtual void SetValue(int32 value) ;
	virtual void SetValue_super(int32 value) ;
	virtual void SetEnabled(bool enabled) ;
	virtual void SetEnabled_super(bool enabled) ;
	virtual void GetPreferredSize(float* _width, float* _height) ;
	virtual void GetPreferredSize_super(float* _width, float* _height) ;
	virtual void ResizeToPreferred() ;
	virtual void ResizeToPreferred_super() ;
	virtual status_t Invoke(BMessage* message) ;
	virtual status_t Invoke_super(BMessage* message) ;
	virtual BHandler* ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) ;
	virtual BHandler* ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) ;
	virtual status_t GetSupportedSuites(BMessage* message) ;
	virtual status_t GetSupportedSuites_super(BMessage* message) ;
	virtual status_t Perform(perform_code d, void* arg) ;
	virtual status_t Perform_super(perform_code d, void* arg) ;
};


/* BControl */
extern "C" {
	status_t bind_BControl_Archive(void *bindInstPtr, BMessage* archive, bool deep);
	void bind_BControl_WindowActivated(void *bindInstPtr, bool active);
	void bind_BControl_AttachedToWindow(void *bindInstPtr);
	void bind_BControl_DetachedFromWindow(void *bindInstPtr);
	void bind_BControl_AllAttached(void *bindInstPtr);
	void bind_BControl_AllDetached(void *bindInstPtr);
	void bind_BControl_MessageReceived(void *bindInstPtr, BMessage* message);
	void bind_BControl_MakeFocus(void *bindInstPtr, bool focused);
	void bind_BControl_KeyDown(void *bindInstPtr, const char* bytes, int32 numBytes);
	void bind_BControl_MouseDown(void *bindInstPtr, BPoint *point);
	void bind_BControl_MouseUp(void *bindInstPtr, BPoint *point);
	void bind_BControl_MouseMoved(void *bindInstPtr, BPoint *point, uint32 transit, const BMessage * message);
	void bind_BControl_SetLabel(void *bindInstPtr, const char* string);
	void bind_BControl_SetValue(void *bindInstPtr, int32 value);
	void bind_BControl_SetEnabled(void *bindInstPtr, bool enabled);
	void bind_BControl_GetPreferredSize(void *bindInstPtr, float* _width, float* _height);
	void bind_BControl_ResizeToPreferred(void *bindInstPtr);
	status_t bind_BControl_Invoke(void *bindInstPtr, BMessage* message);
	BHandler* bind_BControl_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	status_t bind_BControl_GetSupportedSuites(void *bindInstPtr, BMessage* message);
	status_t bind_BControl_Perform(void *bindInstPtr, perform_code d, void* arg);
}

#endif // HABID_BControl_

