/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BView_
#define HABID_BView_

#include <View.h>
#include "App/Handler.h"


class BViewProxy
: public  BHandlerProxy, public BView
{
	void *fBindInstPtr;
public:
	BViewProxy(void *bindInstPtr, BMessage* archive);
	BViewProxy(void *bindInstPtr, const char* name, uint32 flags, BLayout* layout);
	BViewProxy(void *bindInstPtr, BRect frame, const char* name, uint32 resizeMask, uint32 flags);
	~BViewProxy();

	virtual status_t Archive(BMessage* archive, bool deep) const;
	virtual status_t Archive_super(BMessage* archive, bool deep) const;
	virtual status_t AllUnarchived(const BMessage* archive) ;
	virtual status_t AllUnarchived_super(const BMessage* archive) ;
	virtual status_t AllArchived(BMessage* archive) const;
	virtual status_t AllArchived_super(BMessage* archive) const;
	virtual void AttachedToWindow() ;
	virtual void AttachedToWindow_super() ;
	virtual void AllAttached() ;
	virtual void AllAttached_super() ;
	virtual void DetachedFromWindow() ;
	virtual void DetachedFromWindow_super() ;
	virtual void AllDetached() ;
	virtual void AllDetached_super() ;
	virtual void MessageReceived(BMessage* message) ;
	virtual void MessageReceived_super(BMessage* message) ;
	virtual void Draw(BRect updateRect) ;
	virtual void Draw_super(BRect updateRect) ;
	virtual void MouseDown(BPoint where) ;
	virtual void MouseDown_super(BPoint where) ;
	virtual void MouseUp(BPoint where) ;
	virtual void MouseUp_super(BPoint where) ;
	virtual void MouseMoved(BPoint where, uint32 code, const BMessage* dragMessage) ;
	virtual void MouseMoved_super(BPoint where, uint32 code, const BMessage* dragMessage) ;
	virtual void WindowActivated(bool state) ;
	virtual void WindowActivated_super(bool state) ;
	virtual void KeyDown(const char* bytes, int32 numBytes) ;
	virtual void KeyDown_super(const char* bytes, int32 numBytes) ;
	virtual void KeyUp(const char* bytes, int32 numBytes) ;
	virtual void KeyUp_super(const char* bytes, int32 numBytes) ;
	virtual void Pulse() ;
	virtual void Pulse_super() ;
	virtual void FrameMoved(BPoint newPosition) ;
	virtual void FrameMoved_super(BPoint newPosition) ;
	virtual void FrameResized(float newWidth, float newHeight) ;
	virtual void FrameResized_super(float newWidth, float newHeight) ;
	virtual void TargetedByScrollView(BScrollView* scrollView) ;
	virtual void TargetedByScrollView_super(BScrollView* scrollView) ;
	virtual void ConstrainClippingRegion(BRegion* region) ;
	virtual void ConstrainClippingRegion_super(BRegion* region) ;
	virtual void SetDrawingMode(drawing_mode mode) ;
	virtual void SetDrawingMode_super(drawing_mode mode) ;
	virtual void SetPenSize(float size) ;
	virtual void SetPenSize_super(float size) ;
	virtual void SetViewColor(rgb_color c) ;
	virtual void SetViewColor_super(rgb_color c) ;
	virtual void SetHighColor(rgb_color a_color) ;
	virtual void SetHighColor_super(rgb_color a_color) ;
	virtual void SetLowColor(rgb_color a_color) ;
	virtual void SetLowColor_super(rgb_color a_color) ;
	virtual void SetFont(const BFont* font, uint32 mask) ;
	virtual void SetFont_super(const BFont* font, uint32 mask) ;
	virtual void SetFlags(uint32 flags) ;
	virtual void SetFlags_super(uint32 flags) ;
	virtual void SetResizingMode(uint32 mode) ;
	virtual void SetResizingMode_super(uint32 mode) ;
	virtual void ScrollTo(BPoint where) ;
	virtual void ScrollTo_super(BPoint where) ;
	virtual void MakeFocus(bool focusState) ;
	virtual void MakeFocus_super(bool focusState) ;
	virtual void Show() ;
	virtual void Show_super() ;
	virtual void Hide() ;
	virtual void Hide_super() ;
	virtual void GetPreferredSize(float* width, float* height) ;
	virtual void GetPreferredSize_super(float* width, float* height) ;
	virtual void ResizeToPreferred() ;
	virtual void ResizeToPreferred_super() ;
	virtual BHandler* ResolveSpecifier(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual BHandler* ResolveSpecifier_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual status_t GetSupportedSuites(BMessage* data) ;
	virtual status_t GetSupportedSuites_super(BMessage* data) ;
	virtual status_t Perform(perform_code code, void* data) ;
	virtual status_t Perform_super(perform_code code, void* data) ;
	virtual void DrawAfterChildren(BRect r) ;
	virtual void DrawAfterChildren_super(BRect r) ;
	virtual BSize MinSize() ;
	virtual BSize MinSize_super() ;
	virtual BSize MaxSize() ;
	virtual BSize MaxSize_super() ;
	virtual BSize PreferredSize() ;
	virtual BSize PreferredSize_super() ;
	virtual BAlignment LayoutAlignment() ;
	virtual BAlignment LayoutAlignment_super() ;
	virtual bool HasHeightForWidth() ;
	virtual bool HasHeightForWidth_super() ;
	virtual void GetHeightForWidth(float width, float* min, float* max, float* preferred) ;
	virtual void GetHeightForWidth_super(float width, float* min, float* max, float* preferred) ;
	virtual void SetLayout(BLayout* layout) ;
	virtual void SetLayout_super(BLayout* layout) ;
	virtual void InvalidateLayout(bool descendants) ;
	virtual void InvalidateLayout_super(bool descendants) ;
};


/* BView */
extern "C" {
	status_t bind_BView_Archive(void *bindInstPtr, BMessage* archive, bool deep);
	status_t bind_BView_AllUnarchived(void *bindInstPtr, const BMessage* archive);
	status_t bind_BView_AllArchived(void *bindInstPtr, BMessage* archive);
	void bind_BView_AttachedToWindow(void *bindInstPtr);
	void bind_BView_AllAttached(void *bindInstPtr);
	void bind_BView_DetachedFromWindow(void *bindInstPtr);
	void bind_BView_AllDetached(void *bindInstPtr);
	void bind_BView_MessageReceived(void *bindInstPtr, BMessage* message);
	void bind_BView_Draw(void *bindInstPtr, BRect *updateRect);
	void bind_BView_MouseDown(void *bindInstPtr, BPoint *where);
	void bind_BView_MouseUp(void *bindInstPtr, BPoint *where);
	void bind_BView_MouseMoved(void *bindInstPtr, BPoint *where, uint32 code, const BMessage* dragMessage);
	void bind_BView_WindowActivated(void *bindInstPtr, bool state);
	void bind_BView_KeyDown(void *bindInstPtr, const char* bytes, int32 numBytes);
	void bind_BView_KeyUp(void *bindInstPtr, const char* bytes, int32 numBytes);
	void bind_BView_Pulse(void *bindInstPtr);
	void bind_BView_FrameMoved(void *bindInstPtr, BPoint *newPosition);
	void bind_BView_FrameResized(void *bindInstPtr, float newWidth, float newHeight);
	void bind_BView_TargetedByScrollView(void *bindInstPtr, BScrollView* scrollView);
	void bind_BView_ConstrainClippingRegion(void *bindInstPtr, BRegion* region);
	void bind_BView_SetDrawingMode(void *bindInstPtr, drawing_mode mode);
	void bind_BView_SetPenSize(void *bindInstPtr, float size);
	void bind_BView_SetViewColor(void *bindInstPtr, rgb_color c);
	void bind_BView_SetHighColor(void *bindInstPtr, rgb_color a_color);
	void bind_BView_SetLowColor(void *bindInstPtr, rgb_color a_color);
	void bind_BView_SetFont(void *bindInstPtr, const BFont* font, uint32 mask);
	void bind_BView_SetFlags(void *bindInstPtr, uint32 flags);
	void bind_BView_SetResizingMode(void *bindInstPtr, uint32 mode);
	void bind_BView_ScrollTo_1(void *bindInstPtr, BPoint *where);
	void bind_BView_MakeFocus(void *bindInstPtr, bool focusState);
	void bind_BView_Show(void *bindInstPtr);
	void bind_BView_Hide(void *bindInstPtr);
	void bind_BView_GetPreferredSize(void *bindInstPtr, float* width, float* height);
	void bind_BView_ResizeToPreferred(void *bindInstPtr);
	BHandler* bind_BView_ResolveSpecifier(void *bindInstPtr, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	status_t bind_BView_GetSupportedSuites(void *bindInstPtr, BMessage* data);
	status_t bind_BView_Perform(void *bindInstPtr, perform_code code, void* data);
	void bind_BView_DrawAfterChildren(void *bindInstPtr, BRect *r);
	BSize * bind_BView_MinSize(void *bindInstPtr);
	BSize * bind_BView_MaxSize(void *bindInstPtr);
	BSize * bind_BView_PreferredSize(void *bindInstPtr);
	BAlignment * bind_BView_LayoutAlignment(void *bindInstPtr);
	bool bind_BView_HasHeightForWidth(void *bindInstPtr);
	void bind_BView_GetHeightForWidth(void *bindInstPtr, float width, float* min, float* max, float* preferred);
	void bind_BView_SetLayout(void *bindInstPtr, BLayout* layout);
	void bind_BView_InvalidateLayout(void *bindInstPtr, bool descendants);
}

#endif // HABID_BView_

