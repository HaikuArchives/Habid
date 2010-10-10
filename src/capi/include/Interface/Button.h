/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BButton_
#define HABID_BButton_

#include <Button.h>
#include "Interface/Control.h"

class BButtonProxy
: public  BControlProxy, public BButton
{
	void *fBindInstPtr;
public:
	BButtonProxy(void *bindInstPtr, BRect frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags);
	BButtonProxy(void *bindInstPtr, const char* name, const char* label, BMessage * message, uint32 flags);
	BButtonProxy(void *bindInstPtr, const char* label, BMessage* message);
	BButtonProxy(void *bindInstPtr, BMessage * archive);
	~BButtonProxy();

	virtual status_t Archive(BMessage* archive, bool deep) const;
	virtual status_t Archive_super(BMessage* archive, bool deep) const;
	virtual void Draw(BRect updateRect) ;
	virtual void Draw_super(BRect updateRect) ;
	virtual void MouseDown(BPoint point) ;
	virtual void MouseDown_super(BPoint point) ;
	virtual void AttachedToWindow() ;
	virtual void AttachedToWindow_super() ;
	virtual void KeyDown(const char* bytes, int32 numBytes) ;
	virtual void KeyDown_super(const char* bytes, int32 numBytes) ;
	virtual void MakeDefault(bool flag) ;
	virtual void MakeDefault_super(bool flag) ;
	virtual void SetLabel(const char* string) ;
	virtual void SetLabel_super(const char* string) ;
	virtual void MessageReceived(BMessage* message) ;
	virtual void MessageReceived_super(BMessage* message) ;
	virtual void WindowActivated(bool active) ;
	virtual void WindowActivated_super(bool active) ;
	virtual void MouseMoved(BPoint point, uint32 transit, const BMessage* message) ;
	virtual void MouseMoved_super(BPoint point, uint32 transit, const BMessage* message) ;
	virtual void MouseUp(BPoint point) ;
	virtual void MouseUp_super(BPoint point) ;
	virtual void DetachedFromWindow() ;
	virtual void DetachedFromWindow_super() ;
	virtual void SetValue(int32 value) ;
	virtual void SetValue_super(int32 value) ;
	virtual void GetPreferredSize(float* _width, float* _height) ;
	virtual void GetPreferredSize_super(float* _width, float* _height) ;
	virtual void ResizeToPreferred() ;
	virtual void ResizeToPreferred_super() ;
	virtual status_t Invoke(BMessage* message) ;
	virtual status_t Invoke_super(BMessage* message) ;
	virtual void FrameMoved(BPoint newLocation) ;
	virtual void FrameMoved_super(BPoint newLocation) ;
	virtual void FrameResized(float width, float height) ;
	virtual void FrameResized_super(float width, float height) ;
	virtual void MakeFocus(bool focused) ;
	virtual void MakeFocus_super(bool focused) ;
	virtual void AllAttached() ;
	virtual void AllAttached_super() ;
	virtual void AllDetached() ;
	virtual void AllDetached_super() ;
	virtual BHandler* ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) ;
	virtual BHandler* ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) ;
	virtual status_t GetSupportedSuites(BMessage* message) ;
	virtual status_t GetSupportedSuites_super(BMessage* message) ;
	virtual status_t Perform(perform_code d, void* arg) ;
	virtual status_t Perform_super(perform_code d, void* arg) ;
	virtual void InvalidateLayout(bool descendants) ;
	virtual void InvalidateLayout_super(bool descendants) ;
	virtual BSize MinSize() ;
	virtual BSize MinSize_super() ;
	virtual BSize MaxSize() ;
	virtual BSize MaxSize_super() ;
	virtual BSize PreferredSize() ;
	virtual BSize PreferredSize_super() ;
};


/* BButton */
extern "C" {
	status_t bind_BButton_Archive(void *bindInstPtr, BMessage* archive, bool deep);
	void bind_BButton_Draw(void *bindInstPtr, BRect *updateRect);
	void bind_BButton_MouseDown(void *bindInstPtr, BPoint *point);
	void bind_BButton_AttachedToWindow(void *bindInstPtr);
	void bind_BButton_KeyDown(void *bindInstPtr, const char* bytes, int32 numBytes);
	void bind_BButton_MakeDefault(void *bindInstPtr, bool flag);
	void bind_BButton_SetLabel(void *bindInstPtr, const char* string);
	void bind_BButton_MessageReceived(void *bindInstPtr, BMessage* message);
	void bind_BButton_WindowActivated(void *bindInstPtr, bool active);
	void bind_BButton_MouseMoved(void *bindInstPtr, BPoint *point, uint32 transit, const BMessage* message);
	void bind_BButton_MouseUp(void *bindInstPtr, BPoint *point);
	void bind_BButton_DetachedFromWindow(void *bindInstPtr);
	void bind_BButton_SetValue(void *bindInstPtr, int32 value);
	void bind_BButton_GetPreferredSize(void *bindInstPtr, float* _width, float* _height);
	void bind_BButton_ResizeToPreferred(void *bindInstPtr);
	status_t bind_BButton_Invoke(void *bindInstPtr, BMessage* message);
	void bind_BButton_FrameMoved(void *bindInstPtr, BPoint *newLocation);
	void bind_BButton_FrameResized(void *bindInstPtr, float width, float height);
	void bind_BButton_MakeFocus(void *bindInstPtr, bool focused);
	void bind_BButton_AllAttached(void *bindInstPtr);
	void bind_BButton_AllDetached(void *bindInstPtr);
	BHandler* bind_BButton_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	status_t bind_BButton_GetSupportedSuites(void *bindInstPtr, BMessage* message);
	status_t bind_BButton_Perform(void *bindInstPtr, perform_code d, void* arg);
	void bind_BButton_InvalidateLayout(void *bindInstPtr, bool descendants);
	BSize * bind_BButton_MinSize(void *bindInstPtr);
	BSize * bind_BButton_MaxSize(void *bindInstPtr);
	BSize * bind_BButton_PreferredSize(void *bindInstPtr);
}

#endif // HABID_BButton_

