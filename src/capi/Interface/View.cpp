/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Interface/View.h"

BViewProxy::BViewProxy(void *bindInstPtr, BMessage* archive)
: fBindInstPtr(bindInstPtr), BHandlerProxy(bindInstPtr, archive), BView(archive) { }

BViewProxy::BViewProxy(void *bindInstPtr, const char* name, uint32 flags, BLayout* layout)
: fBindInstPtr(bindInstPtr), BHandlerProxy(bindInstPtr, name), BView(name, flags, layout) { }

BViewProxy::BViewProxy(void *bindInstPtr, BRect frame, const char* name, uint32 resizeMask, uint32 flags)
: fBindInstPtr(bindInstPtr), BHandlerProxy(bindInstPtr, name), BView(frame, name, resizeMask, flags) { }

BViewProxy::~BViewProxy() { }

status_t BViewProxy::Archive(BMessage* archive, bool deep) const
{
	return bind_BView_Archive(fBindInstPtr, archive, deep);
}

status_t BViewProxy::Archive_super(BMessage* archive, bool deep) const
{
	return BView::Archive(archive, deep);
}

status_t BViewProxy::AllUnarchived(const BMessage* archive) 
{
	return bind_BView_AllUnarchived(fBindInstPtr, archive);
}

status_t BViewProxy::AllUnarchived_super(const BMessage* archive) 
{
	return BView::AllUnarchived(archive);
}

status_t BViewProxy::AllArchived(BMessage* archive) const
{
	return bind_BView_AllArchived(fBindInstPtr, archive);
}

status_t BViewProxy::AllArchived_super(BMessage* archive) const
{
	return BView::AllArchived(archive);
}

void BViewProxy::AttachedToWindow() 
{
	 bind_BView_AttachedToWindow(fBindInstPtr);
}

void BViewProxy::AttachedToWindow_super() 
{
	 BView::AttachedToWindow();
}

void BViewProxy::AllAttached() 
{
	 bind_BView_AllAttached(fBindInstPtr);
}

void BViewProxy::AllAttached_super() 
{
	 BView::AllAttached();
}

void BViewProxy::DetachedFromWindow() 
{
	 bind_BView_DetachedFromWindow(fBindInstPtr);
}

void BViewProxy::DetachedFromWindow_super() 
{
	 BView::DetachedFromWindow();
}

void BViewProxy::AllDetached() 
{
	 bind_BView_AllDetached(fBindInstPtr);
}

void BViewProxy::AllDetached_super() 
{
	 BView::AllDetached();
}

void BViewProxy::MessageReceived(BMessage* message) 
{
	 bind_BView_MessageReceived(fBindInstPtr, message);
}

void BViewProxy::MessageReceived_super(BMessage* message) 
{
	 BView::MessageReceived(message);
}

void BViewProxy::Draw(BRect updateRect) 
{
	 bind_BView_Draw(fBindInstPtr, &updateRect);
}

void BViewProxy::Draw_super(BRect updateRect) 
{
	 BView::Draw(updateRect);
}

void BViewProxy::MouseDown(BPoint where) 
{
	 bind_BView_MouseDown(fBindInstPtr, &where);
}

void BViewProxy::MouseDown_super(BPoint where) 
{
	 BView::MouseDown(where);
}

void BViewProxy::MouseUp(BPoint where) 
{
	 bind_BView_MouseUp(fBindInstPtr, &where);
}

void BViewProxy::MouseUp_super(BPoint where) 
{
	 BView::MouseUp(where);
}

void BViewProxy::MouseMoved(BPoint where, uint32 code, const BMessage* dragMessage) 
{
	 bind_BView_MouseMoved(fBindInstPtr, &where, code, dragMessage);
}

void BViewProxy::MouseMoved_super(BPoint where, uint32 code, const BMessage* dragMessage) 
{
	 BView::MouseMoved(where, code, dragMessage);
}

void BViewProxy::WindowActivated(bool state) 
{
	 bind_BView_WindowActivated(fBindInstPtr, state);
}

void BViewProxy::WindowActivated_super(bool state) 
{
	 BView::WindowActivated(state);
}

void BViewProxy::KeyDown(const char* bytes, int32 numBytes) 
{
	 bind_BView_KeyDown(fBindInstPtr, bytes, numBytes);
}

void BViewProxy::KeyDown_super(const char* bytes, int32 numBytes) 
{
	 BView::KeyDown(bytes, numBytes);
}

void BViewProxy::KeyUp(const char* bytes, int32 numBytes) 
{
	 bind_BView_KeyUp(fBindInstPtr, bytes, numBytes);
}

void BViewProxy::KeyUp_super(const char* bytes, int32 numBytes) 
{
	 BView::KeyUp(bytes, numBytes);
}

void BViewProxy::Pulse() 
{
	 bind_BView_Pulse(fBindInstPtr);
}

void BViewProxy::Pulse_super() 
{
	 BView::Pulse();
}

void BViewProxy::FrameMoved(BPoint newPosition) 
{
	 bind_BView_FrameMoved(fBindInstPtr, &newPosition);
}

void BViewProxy::FrameMoved_super(BPoint newPosition) 
{
	 BView::FrameMoved(newPosition);
}

void BViewProxy::FrameResized(float newWidth, float newHeight) 
{
	 bind_BView_FrameResized(fBindInstPtr, newWidth, newHeight);
}

void BViewProxy::FrameResized_super(float newWidth, float newHeight) 
{
	 BView::FrameResized(newWidth, newHeight);
}

void BViewProxy::TargetedByScrollView(BScrollView* scrollView) 
{
	 bind_BView_TargetedByScrollView(fBindInstPtr, scrollView);
}

void BViewProxy::TargetedByScrollView_super(BScrollView* scrollView) 
{
	 BView::TargetedByScrollView(scrollView);
}

void BViewProxy::ConstrainClippingRegion(BRegion* region) 
{
	 bind_BView_ConstrainClippingRegion(fBindInstPtr, region);
}

void BViewProxy::ConstrainClippingRegion_super(BRegion* region) 
{
	 BView::ConstrainClippingRegion(region);
}

void BViewProxy::SetDrawingMode(drawing_mode mode) 
{
	 bind_BView_SetDrawingMode(fBindInstPtr, mode);
}

void BViewProxy::SetDrawingMode_super(drawing_mode mode) 
{
	 BView::SetDrawingMode(mode);
}

void BViewProxy::SetPenSize(float size) 
{
	 bind_BView_SetPenSize(fBindInstPtr, size);
}

void BViewProxy::SetPenSize_super(float size) 
{
	 BView::SetPenSize(size);
}

void BViewProxy::SetViewColor(rgb_color c) 
{
	 bind_BView_SetViewColor(fBindInstPtr, c);
}

void BViewProxy::SetViewColor_super(rgb_color c) 
{
	 BView::SetViewColor(c);
}

void BViewProxy::SetHighColor(rgb_color a_color) 
{
	 bind_BView_SetHighColor(fBindInstPtr, a_color);
}

void BViewProxy::SetHighColor_super(rgb_color a_color) 
{
	 BView::SetHighColor(a_color);
}

void BViewProxy::SetLowColor(rgb_color a_color) 
{
	 bind_BView_SetLowColor(fBindInstPtr, a_color);
}

void BViewProxy::SetLowColor_super(rgb_color a_color) 
{
	 BView::SetLowColor(a_color);
}

void BViewProxy::SetFont(const BFont* font, uint32 mask) 
{
	 bind_BView_SetFont(fBindInstPtr, font, mask);
}

void BViewProxy::SetFont_super(const BFont* font, uint32 mask) 
{
	 BView::SetFont(font, mask);
}

void BViewProxy::SetFlags(uint32 flags) 
{
	 bind_BView_SetFlags(fBindInstPtr, flags);
}

void BViewProxy::SetFlags_super(uint32 flags) 
{
	 BView::SetFlags(flags);
}

void BViewProxy::SetResizingMode(uint32 mode) 
{
	 bind_BView_SetResizingMode(fBindInstPtr, mode);
}

void BViewProxy::SetResizingMode_super(uint32 mode) 
{
	 BView::SetResizingMode(mode);
}

void BViewProxy::ScrollTo(BPoint where) 
{
	 bind_BView_ScrollTo_1(fBindInstPtr, &where);
}

void BViewProxy::ScrollTo_super(BPoint where) 
{
	 BView::ScrollTo(where);
}

void BViewProxy::MakeFocus(bool focusState) 
{
	 bind_BView_MakeFocus(fBindInstPtr, focusState);
}

void BViewProxy::MakeFocus_super(bool focusState) 
{
	 BView::MakeFocus(focusState);
}

void BViewProxy::Show() 
{
	 bind_BView_Show(fBindInstPtr);
}

void BViewProxy::Show_super() 
{
	 BView::Show();
}

void BViewProxy::Hide() 
{
	 bind_BView_Hide(fBindInstPtr);
}

void BViewProxy::Hide_super() 
{
	 BView::Hide();
}

void BViewProxy::GetPreferredSize(float* width, float* height) 
{
	 bind_BView_GetPreferredSize(fBindInstPtr, width, height);
}

void BViewProxy::GetPreferredSize_super(float* width, float* height) 
{
	 BView::GetPreferredSize(width, height);
}

void BViewProxy::ResizeToPreferred() 
{
	 bind_BView_ResizeToPreferred(fBindInstPtr);
}

void BViewProxy::ResizeToPreferred_super() 
{
	 BView::ResizeToPreferred();
}

BHandler* BViewProxy::ResolveSpecifier(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return bind_BView_ResolveSpecifier(fBindInstPtr, msg, index, specifier, form, property);
}

BHandler* BViewProxy::ResolveSpecifier_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return BView::ResolveSpecifier(msg, index, specifier, form, property);
}

status_t BViewProxy::GetSupportedSuites(BMessage* data) 
{
	return bind_BView_GetSupportedSuites(fBindInstPtr, data);
}

status_t BViewProxy::GetSupportedSuites_super(BMessage* data) 
{
	return BView::GetSupportedSuites(data);
}

status_t BViewProxy::Perform(perform_code code, void* data) 
{
	return bind_BView_Perform(fBindInstPtr, code, data);
}

status_t BViewProxy::Perform_super(perform_code code, void* data) 
{
	return BView::Perform(code, data);
}

void BViewProxy::DrawAfterChildren(BRect r) 
{
	 bind_BView_DrawAfterChildren(fBindInstPtr, &r);
}

void BViewProxy::DrawAfterChildren_super(BRect r) 
{
	 BView::DrawAfterChildren(r);
}

BSize BViewProxy::MinSize() 
{
	return *bind_BView_MinSize(fBindInstPtr);
}

BSize BViewProxy::MinSize_super() 
{
	return BView::MinSize();
}

BSize BViewProxy::MaxSize() 
{
	return *bind_BView_MaxSize(fBindInstPtr);
}

BSize BViewProxy::MaxSize_super() 
{
	return BView::MaxSize();
}

BSize BViewProxy::PreferredSize() 
{
	return *bind_BView_PreferredSize(fBindInstPtr);
}

BSize BViewProxy::PreferredSize_super() 
{
	return BView::PreferredSize();
}

BAlignment BViewProxy::LayoutAlignment() 
{
	return *bind_BView_LayoutAlignment(fBindInstPtr);
}

BAlignment BViewProxy::LayoutAlignment_super() 
{
	return BView::LayoutAlignment();
}

bool BViewProxy::HasHeightForWidth() 
{
	return bind_BView_HasHeightForWidth(fBindInstPtr);
}

bool BViewProxy::HasHeightForWidth_super() 
{
	return BView::HasHeightForWidth();
}

void BViewProxy::GetHeightForWidth(float width, float* min, float* max, float* preferred) 
{
	 bind_BView_GetHeightForWidth(fBindInstPtr, width, min, max, preferred);
}

void BViewProxy::GetHeightForWidth_super(float width, float* min, float* max, float* preferred) 
{
	 BView::GetHeightForWidth(width, min, max, preferred);
}

void BViewProxy::SetLayout(BLayout* layout) 
{
	 bind_BView_SetLayout(fBindInstPtr, layout);
}

void BViewProxy::SetLayout_super(BLayout* layout) 
{
	 BView::SetLayout(layout);
}

void BViewProxy::InvalidateLayout(bool descendants) 
{
	 bind_BView_InvalidateLayout(fBindInstPtr, descendants);
}

void BViewProxy::InvalidateLayout_super(bool descendants) 
{
	 BView::InvalidateLayout(descendants);
}


extern "C" {
	BView * be_BView_ctor(void *bindInstPtr, BMessage* archive)
	{
		return (BView *)new BViewProxy(bindInstPtr, archive);
	}

	BView * be_BView_ctor_1(void *bindInstPtr, const char* name, uint32 flags, BLayout* layout)
	{
		return (BView *)new BViewProxy(bindInstPtr, name, flags, layout);
	}

	BView * be_BView_ctor_2(void *bindInstPtr, BRect *frame, const char* name, uint32 resizeMask, uint32 flags)
	{
		return (BView *)new BViewProxy(bindInstPtr, *frame, name, resizeMask, flags);
	}

	void be_BView_dtor(BView* self)
	{
		delete self;
	}

	BArchivable* be_BView_Instantiate_static(BMessage* archive)
	{
		return BView::Instantiate(archive);
	}

	status_t be_BView_Archive(BView *self, BMessage* archive, bool deep)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			return proxy->Archive_super(archive, deep);
		else
			return self->Archive(archive, deep);
	}

	status_t be_BView_AllUnarchived(BView *self, const BMessage* archive)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			return proxy->AllUnarchived_super(archive);
		else
			return self->AllUnarchived(archive);
	}

	status_t be_BView_AllArchived(BView *self, BMessage* archive)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			return proxy->AllArchived_super(archive);
		else
			return self->AllArchived(archive);
	}

	void be_BView_AttachedToWindow(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->AttachedToWindow_super();
		else
			self->AttachedToWindow();
	}

	void be_BView_AllAttached(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->AllAttached_super();
		else
			self->AllAttached();
	}

	void be_BView_DetachedFromWindow(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->DetachedFromWindow_super();
		else
			self->DetachedFromWindow();
	}

	void be_BView_AllDetached(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->AllDetached_super();
		else
			self->AllDetached();
	}

	void be_BView_MessageReceived(BView *self, BMessage* message)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->MessageReceived_super(message);
		else
			self->MessageReceived(message);
	}

	void be_BView_AddChild(BView *self, BView* child, BView* before)
	{
		self->AddChild(child, before);
	}

	bool be_BView_AddChild_1(BView *self, BLayoutItem* child)
	{
		return self->AddChild(child);
	}

	bool be_BView_RemoveChild(BView *self, BView* child)
	{
		return self->RemoveChild(child);
	}

	int32 be_BView_CountChildren(BView *self)
	{
		return self->CountChildren();
	}

	BView* be_BView_ChildAt(BView *self, int32 index)
	{
		return self->ChildAt(index);
	}

	BView* be_BView_NextSibling(BView *self)
	{
		return self->NextSibling();
	}

	BView* be_BView_PreviousSibling(BView *self)
	{
		return self->PreviousSibling();
	}

	bool be_BView_RemoveSelf(BView *self)
	{
		return self->RemoveSelf();
	}

	BWindow* be_BView_Window(BView *self)
	{
		return self->Window();
	}

	void be_BView_Draw(BView *self, BRect *updateRect)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->Draw_super(*updateRect);
		else
			self->Draw(*updateRect);
	}

	void be_BView_MouseDown(BView *self, BPoint *where)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->MouseDown_super(*where);
		else
			self->MouseDown(*where);
	}

	void be_BView_MouseUp(BView *self, BPoint *where)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->MouseUp_super(*where);
		else
			self->MouseUp(*where);
	}

	void be_BView_MouseMoved(BView *self, BPoint *where, uint32 code, const BMessage* dragMessage)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->MouseMoved_super(*where, code, dragMessage);
		else
			self->MouseMoved(*where, code, dragMessage);
	}

	void be_BView_WindowActivated(BView *self, bool state)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->WindowActivated_super(state);
		else
			self->WindowActivated(state);
	}

	void be_BView_KeyDown(BView *self, const char* bytes, int32 numBytes)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->KeyDown_super(bytes, numBytes);
		else
			self->KeyDown(bytes, numBytes);
	}

	void be_BView_KeyUp(BView *self, const char* bytes, int32 numBytes)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->KeyUp_super(bytes, numBytes);
		else
			self->KeyUp(bytes, numBytes);
	}

	void be_BView_Pulse(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->Pulse_super();
		else
			self->Pulse();
	}

	void be_BView_FrameMoved(BView *self, BPoint *newPosition)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->FrameMoved_super(*newPosition);
		else
			self->FrameMoved(*newPosition);
	}

	void be_BView_FrameResized(BView *self, float newWidth, float newHeight)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->FrameResized_super(newWidth, newHeight);
		else
			self->FrameResized(newWidth, newHeight);
	}

	void be_BView_TargetedByScrollView(BView *self, BScrollView* scrollView)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->TargetedByScrollView_super(scrollView);
		else
			self->TargetedByScrollView(scrollView);
	}

	void be_BView_BeginRectTracking(BView *self, BRect *startRect, uint32 style)
	{
		self->BeginRectTracking(*startRect, style);
	}

	void be_BView_EndRectTracking(BView *self)
	{
		self->EndRectTracking();
	}

	void be_BView_GetMouse(BView *self, BPoint* location, uint32* buttons, bool checkMessageQueue)
	{
		self->GetMouse(location, buttons, checkMessageQueue);
	}

	void be_BView_DragMessage(BView *self, BMessage* message, BRect *dragRect, BHandler* replyTo)
	{
		self->DragMessage(message, *dragRect, replyTo);
	}

	void be_BView_DragMessage_1(BView *self, BMessage* message, BBitmap* bitmap, BPoint *offset, BHandler* replyTo)
	{
		self->DragMessage(message, bitmap, *offset, replyTo);
	}

	void be_BView_DragMessage_2(BView *self, BMessage* message, BBitmap* bitmap, drawing_mode dragMode, BPoint *offset, BHandler* replyTo)
	{
		self->DragMessage(message, bitmap, dragMode, *offset, replyTo);
	}

	BView* be_BView_FindView(BView *self, const char* name)
	{
		return self->FindView(name);
	}

	BView* be_BView_Parent(BView *self)
	{
		return self->Parent();
	}

	BRect * be_BView_Bounds(BView *self)
	{
		return new BRect(self->Bounds());
	}

	BRect * be_BView_Frame(BView *self)
	{
		return new BRect(self->Frame());
	}

	void be_BView_ConvertToScreen(BView *self, BPoint* pt)
	{
		self->ConvertToScreen(pt);
	}

	BPoint * be_BView_ConvertToScreen_1(BView *self, BPoint *pt)
	{
		return new BPoint(self->ConvertToScreen(*pt));
	}

	void be_BView_ConvertFromScreen(BView *self, BPoint* pt)
	{
		self->ConvertFromScreen(pt);
	}

	BPoint * be_BView_ConvertFromScreen_1(BView *self, BPoint *pt)
	{
		return new BPoint(self->ConvertFromScreen(*pt));
	}

	void be_BView_ConvertToScreen_2(BView *self, BRect* r)
	{
		self->ConvertToScreen(r);
	}

	BRect * be_BView_ConvertToScreen_3(BView *self, BRect *r)
	{
		return new BRect(self->ConvertToScreen(*r));
	}

	void be_BView_ConvertFromScreen_2(BView *self, BRect* r)
	{
		self->ConvertFromScreen(r);
	}

	BRect * be_BView_ConvertFromScreen_3(BView *self, BRect *r)
	{
		return new BRect(self->ConvertFromScreen(*r));
	}

	void be_BView_ConvertToParent(BView *self, BPoint* pt)
	{
		self->ConvertToParent(pt);
	}

	BPoint * be_BView_ConvertToParent_1(BView *self, BPoint *pt)
	{
		return new BPoint(self->ConvertToParent(*pt));
	}

	void be_BView_ConvertFromParent(BView *self, BPoint* pt)
	{
		self->ConvertFromParent(pt);
	}

	BPoint * be_BView_ConvertFromParent_1(BView *self, BPoint *pt)
	{
		return new BPoint(self->ConvertFromParent(*pt));
	}

	void be_BView_ConvertToParent_2(BView *self, BRect* r)
	{
		self->ConvertToParent(r);
	}

	BRect * be_BView_ConvertToParent_3(BView *self, BRect *r)
	{
		return new BRect(self->ConvertToParent(*r));
	}

	void be_BView_ConvertFromParent_2(BView *self, BRect* r)
	{
		self->ConvertFromParent(r);
	}

	BRect * be_BView_ConvertFromParent_3(BView *self, BRect *r)
	{
		return new BRect(self->ConvertFromParent(*r));
	}

	BPoint * be_BView_LeftTop(BView *self)
	{
		return new BPoint(self->LeftTop());
	}

	void be_BView_GetClippingRegion(BView *self, BRegion* region)
	{
		self->GetClippingRegion(region);
	}

	void be_BView_ConstrainClippingRegion(BView *self, BRegion* region)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->ConstrainClippingRegion_super(region);
		else
			self->ConstrainClippingRegion(region);
	}

	void be_BView_ClipToPicture(BView *self, BPicture* picture, BPoint *where, bool sync)
	{
		self->ClipToPicture(picture, *where, sync);
	}

	void be_BView_ClipToPicture_1(BView *self, BPicture* picture, BPoint *where, bool sync)
	{
		self->ClipToPicture(picture, *where, sync);
	}

	void be_BView_SetDrawingMode(BView *self, drawing_mode mode)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetDrawingMode_super(mode);
		else
			self->SetDrawingMode(mode);
	}

	drawing_mode be_BView_DrawingMode(BView *self)
	{
		return self->DrawingMode();
	}

	void be_BView_SetBlendingMode(BView *self, source_alpha srcAlpha, alpha_function alphaFunc)
	{
		self->SetBlendingMode(srcAlpha, alphaFunc);
	}

	void be_BView_GetBlendingMode(BView *self, source_alpha* srcAlpha, alpha_function* alphaFunc)
	{
		self->GetBlendingMode(srcAlpha, alphaFunc);
	}

	void be_BView_SetPenSize(BView *self, float size)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetPenSize_super(size);
		else
			self->SetPenSize(size);
	}

	float be_BView_PenSize(BView *self)
	{
		return self->PenSize();
	}

	void be_BView_SetViewCursor(BView *self, const BCursor* cursor, bool sync)
	{
		self->SetViewCursor(cursor, sync);
	}

	void be_BView_SetViewColor(BView *self, rgb_color c)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetViewColor_super(c);
		else
			self->SetViewColor(c);
	}

	void be_BView_SetViewColor_1(BView *self, uchar r, uchar g, uchar b, uchar a)
	{
		self->SetViewColor(r, g, b, a);
	}

	rgb_color be_BView_ViewColor(BView *self)
	{
		return self->ViewColor();
	}

	void be_BView_SetViewBitmap(BView *self, const BBitmap* bitmap, BRect *srcRect, BRect *dstRect, uint32 followFlags, uint32 options)
	{
		self->SetViewBitmap(bitmap, *srcRect, *dstRect, followFlags, options);
	}

	void be_BView_SetViewBitmap_1(BView *self, const BBitmap* bitmap, uint32 followFlags, uint32 options)
	{
		self->SetViewBitmap(bitmap, followFlags, options);
	}

	void be_BView_ClearViewBitmap(BView *self)
	{
		self->ClearViewBitmap();
	}

	status_t be_BView_SetViewOverlay(BView *self, const BBitmap* overlay, BRect *srcRect, BRect *dstRect, rgb_color* colorKey, uint32 followFlags, uint32 options)
	{
		return self->SetViewOverlay(overlay, *srcRect, *dstRect, colorKey, followFlags, options);
	}

	status_t be_BView_SetViewOverlay_1(BView *self, const BBitmap* overlay, rgb_color* colorKey, uint32 followFlags, uint32 options)
	{
		return self->SetViewOverlay(overlay, colorKey, followFlags, options);
	}

	void be_BView_ClearViewOverlay(BView *self)
	{
		self->ClearViewOverlay();
	}

	void be_BView_SetHighColor(BView *self, rgb_color a_color)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetHighColor_super(a_color);
		else
			self->SetHighColor(a_color);
	}

	void be_BView_SetHighColor_1(BView *self, uchar r, uchar g, uchar b, uchar a)
	{
		self->SetHighColor(r, g, b, a);
	}

	rgb_color be_BView_HighColor(BView *self)
	{
		return self->HighColor();
	}

	void be_BView_SetLowColor(BView *self, rgb_color a_color)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetLowColor_super(a_color);
		else
			self->SetLowColor(a_color);
	}

	void be_BView_SetLowColor_1(BView *self, uchar r, uchar g, uchar b, uchar a)
	{
		self->SetLowColor(r, g, b, a);
	}

	rgb_color be_BView_LowColor(BView *self)
	{
		return self->LowColor();
	}

	void be_BView_SetLineMode(BView *self, cap_mode lineCap, join_mode lineJoin, float miterLimit)
	{
		self->SetLineMode(lineCap, lineJoin, miterLimit);
	}

	join_mode be_BView_LineJoinMode(BView *self)
	{
		return self->LineJoinMode();
	}

	cap_mode be_BView_LineCapMode(BView *self)
	{
		return self->LineCapMode();
	}

	float be_BView_LineMiterLimit(BView *self)
	{
		return self->LineMiterLimit();
	}

	void be_BView_SetOrigin(BView *self, BPoint *pt)
	{
		self->SetOrigin(*pt);
	}

	void be_BView_SetOrigin_1(BView *self, float x, float y)
	{
		self->SetOrigin(x, y);
	}

	BPoint * be_BView_Origin(BView *self)
	{
		return new BPoint(self->Origin());
	}

	void be_BView_PushState(BView *self)
	{
		self->PushState();
	}

	void be_BView_PopState(BView *self)
	{
		self->PopState();
	}

	void be_BView_MovePenTo(BView *self, BPoint *pt)
	{
		self->MovePenTo(*pt);
	}

	void be_BView_MovePenTo_1(BView *self, float x, float y)
	{
		self->MovePenTo(x, y);
	}

	void be_BView_MovePenBy(BView *self, float x, float y)
	{
		self->MovePenBy(x, y);
	}

	BPoint * be_BView_PenLocation(BView *self)
	{
		return new BPoint(self->PenLocation());
	}

	void be_BView_StrokeLine(BView *self, BPoint *toPt, pattern p)
	{
		self->StrokeLine(*toPt, p);
	}

	void be_BView_StrokeLine_1(BView *self, BPoint *a, BPoint *b, pattern p)
	{
		self->StrokeLine(*a, *b, p);
	}

	void be_BView_BeginLineArray(BView *self, int32 count)
	{
		self->BeginLineArray(count);
	}

	void be_BView_AddLine(BView *self, BPoint *a, BPoint *b, rgb_color color)
	{
		self->AddLine(*a, *b, color);
	}

	void be_BView_EndLineArray(BView *self)
	{
		self->EndLineArray();
	}

	void be_BView_StrokePolygon(BView *self, const BPolygon* polygon, bool closed, pattern p)
	{
		self->StrokePolygon(polygon, closed, p);
	}

	void be_BView_StrokePolygon_1(BView *self, const BPoint* ptArray, int32 numPts, bool closed, pattern p)
	{
		self->StrokePolygon(ptArray, numPts, closed, p);
	}

	void be_BView_StrokePolygon_2(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, bool closed)
	{
		self->StrokePolygon(ptArray, numPts, *bounds, closed);
	}

	void be_BView_FillPolygon(BView *self, const BPolygon* polygon, pattern p)
	{
		self->FillPolygon(polygon, p);
	}

	void be_BView_FillPolygon_1(BView *self, const BPoint* ptArray, int32 numPts, pattern p)
	{
		self->FillPolygon(ptArray, numPts, p);
	}

	void be_BView_FillPolygon_2(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, pattern p)
	{
		self->FillPolygon(ptArray, numPts, *bounds, p);
	}

	void be_BView_FillPolygon_3(BView *self, const BPolygon* polygon, const BGradient* gradient)
	{
		self->FillPolygon(polygon, *gradient);
	}

	void be_BView_FillPolygon_4(BView *self, const BPoint* ptArray, int32 numPts, const BGradient* gradient)
	{
		self->FillPolygon(ptArray, numPts, *gradient);
	}

	void be_BView_FillPolygon_5(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, const BGradient* gradient)
	{
		self->FillPolygon(ptArray, numPts, *bounds, *gradient);
	}

	void be_BView_StrokeRect(BView *self, BRect *r, pattern p)
	{
		self->StrokeRect(*r, p);
	}

	void be_BView_FillRect(BView *self, BRect *r, pattern p)
	{
		self->FillRect(*r, p);
	}

	void be_BView_FillRect_1(BView *self, BRect *r, const BGradient* gradient)
	{
		self->FillRect(*r, *gradient);
	}

	void be_BView_FillRegion(BView *self, BRegion* region, pattern p)
	{
		self->FillRegion(region, p);
	}

	void be_BView_FillRegion_1(BView *self, BRegion* region, const BGradient* gradient)
	{
		self->FillRegion(region, *gradient);
	}

	void be_BView_InvertRect(BView *self, BRect *r)
	{
		self->InvertRect(*r);
	}

	void be_BView_StrokeRoundRect(BView *self, BRect *r, float xRadius, float yRadius, pattern p)
	{
		self->StrokeRoundRect(*r, xRadius, yRadius, p);
	}

	void be_BView_FillRoundRect(BView *self, BRect *r, float xRadius, float yRadius, pattern p)
	{
		self->FillRoundRect(*r, xRadius, yRadius, p);
	}

	void be_BView_FillRoundRect_1(BView *self, BRect *r, float xRadius, float yRadius, const BGradient* gradient)
	{
		self->FillRoundRect(*r, xRadius, yRadius, *gradient);
	}

	void be_BView_StrokeEllipse(BView *self, BPoint *center, float xRadius, float yRadius, pattern p)
	{
		self->StrokeEllipse(*center, xRadius, yRadius, p);
	}

	void be_BView_StrokeEllipse_1(BView *self, BRect *r, pattern p)
	{
		self->StrokeEllipse(*r, p);
	}

	void be_BView_FillEllipse(BView *self, BPoint *center, float xRadius, float yRadius, pattern p)
	{
		self->FillEllipse(*center, xRadius, yRadius, p);
	}

	void be_BView_FillEllipse_1(BView *self, BRect *r, pattern p)
	{
		self->FillEllipse(*r, p);
	}

	void be_BView_FillEllipse_2(BView *self, BPoint *center, float xRadius, float yRadius, const BGradient* gradient)
	{
		self->FillEllipse(*center, xRadius, yRadius, *gradient);
	}

	void be_BView_FillEllipse_3(BView *self, BRect *r, const BGradient* gradient)
	{
		self->FillEllipse(*r, *gradient);
	}

	void be_BView_StrokeArc(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p)
	{
		self->StrokeArc(*center, xRadius, yRadius, startAngle, arcAngle, p);
	}

	void be_BView_StrokeArc_1(BView *self, BRect *r, float startAngle, float arcAngle, pattern p)
	{
		self->StrokeArc(*r, startAngle, arcAngle, p);
	}

	void be_BView_FillArc(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p)
	{
		self->FillArc(*center, xRadius, yRadius, startAngle, arcAngle, p);
	}

	void be_BView_FillArc_1(BView *self, BRect *r, float startAngle, float arcAngle, pattern p)
	{
		self->FillArc(*r, startAngle, arcAngle, p);
	}

	void be_BView_FillArc_2(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, const BGradient* gradient)
	{
		self->FillArc(*center, xRadius, yRadius, startAngle, arcAngle, *gradient);
	}

	void be_BView_FillArc_3(BView *self, BRect *r, float startAngle, float arcAngle, const BGradient* gradient)
	{
		self->FillArc(*r, startAngle, arcAngle, *gradient);
	}

	void be_BView_StrokeBezier(BView *self, BPoint* controlPoints, pattern p)
	{
		self->StrokeBezier(controlPoints, p);
	}

	void be_BView_FillBezier(BView *self, BPoint* controlPoints, pattern p)
	{
		self->FillBezier(controlPoints, p);
	}

	void be_BView_FillBezier_1(BView *self, BPoint* controlPoints, const BGradient* gradient)
	{
		self->FillBezier(controlPoints, *gradient);
	}

	void be_BView_StrokeShape(BView *self, BShape* shape, pattern p)
	{
		self->StrokeShape(shape, p);
	}

	void be_BView_FillShape(BView *self, BShape* shape, pattern p)
	{
		self->FillShape(shape, p);
	}

	void be_BView_FillShape_1(BView *self, BShape* shape, const BGradient* gradien)
	{
		self->FillShape(shape, *gradien);
	}

	void be_BView_CopyBits(BView *self, BRect *src, BRect *dst)
	{
		self->CopyBits(*src, *dst);
	}

	void be_BView_DrawBitmapAsync(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options)
	{
		self->DrawBitmapAsync(aBitmap, *bitmapRect, *viewRect, options);
	}

	void be_BView_DrawBitmapAsync_1(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect)
	{
		self->DrawBitmapAsync(aBitmap, *bitmapRect, *viewRect);
	}

	void be_BView_DrawBitmapAsync_2(BView *self, const BBitmap* aBitmap, BRect *viewRec)
	{
		self->DrawBitmapAsync(aBitmap, *viewRec);
	}

	void be_BView_DrawBitmapAsync_3(BView *self, const BBitmap* aBitmap, BPoint *where)
	{
		self->DrawBitmapAsync(aBitmap, *where);
	}

	void be_BView_DrawBitmapAsync_4(BView *self, const BBitmap* aBitmap)
	{
		self->DrawBitmapAsync(aBitmap);
	}

	void be_BView_DrawBitmap(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options)
	{
		self->DrawBitmap(aBitmap, *bitmapRect, *viewRect, options);
	}

	void be_BView_DrawBitmap_1(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect)
	{
		self->DrawBitmap(aBitmap, *bitmapRect, *viewRect);
	}

	void be_BView_DrawBitmap_2(BView *self, const BBitmap* aBitmap, BRect *viewRect)
	{
		self->DrawBitmap(aBitmap, *viewRect);
	}

	void be_BView_DrawBitmap_3(BView *self, const BBitmap* aBitmap, BPoint *where)
	{
		self->DrawBitmap(aBitmap, *where);
	}

	void be_BView_DrawBitmap_4(BView *self, const BBitmap* aBitmap)
	{
		self->DrawBitmap(aBitmap);
	}

	void be_BView_DrawChar(BView *self, char aChar)
	{
		self->DrawChar(aChar);
	}

	void be_BView_DrawChar_1(BView *self, char aChar, BPoint *location)
	{
		self->DrawChar(aChar, *location);
	}

	void be_BView_DrawString(BView *self, const char* string, escapement_delta* delta)
	{
		self->DrawString(string, delta);
	}

	void be_BView_DrawString_1(BView *self, const char* string, BPoint *location, escapement_delta* delta)
	{
		self->DrawString(string, *location, delta);
	}

	void be_BView_DrawString_2(BView *self, const char* string, int32 length, escapement_delta* delta)
	{
		self->DrawString(string, length, delta);
	}

	void be_BView_DrawString_3(BView *self, const char* string, int32 length, BPoint *location, escapement_delta* delta)
	{
		self->DrawString(string, length, *location, delta);
	}

	void be_BView_DrawString_4(BView *self, const char* string, const BPoint* locations, int32 locationCount)
	{
		self->DrawString(string, locations, locationCount);
	}

	void be_BView_DrawString_5(BView *self, const char* string, int32 length, const BPoint* locations, int32 locationCount)
	{
		self->DrawString(string, length, locations, locationCount);
	}

	void be_BView_SetFont(BView *self, const BFont* font, uint32 mask)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetFont_super(font, mask);
		else
			self->SetFont(font, mask);
	}

	void be_BView_GetFont(BView *self, BFont* font)
	{
		self->GetFont(font);
	}

	void be_BView_TruncateString(BView *self, BString* in_out, uint32 mode, float width)
	{
		self->TruncateString(in_out, mode, width);
	}

	float be_BView_StringWidth(BView *self, const char* string)
	{
		return self->StringWidth(string);
	}

	float be_BView_StringWidth_1(BView *self, const char* string, int32 length)
	{
		return self->StringWidth(string, length);
	}

	void be_BView_GetStringWidths(BView *self, char* stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[])
	{
		self->GetStringWidths(stringArray, lengthArray, numStrings, widthArray);
	}

	void be_BView_SetFontSize(BView *self, float size)
	{
		self->SetFontSize(size);
	}

	void be_BView_ForceFontAliasing(BView *self, bool enable)
	{
		self->ForceFontAliasing(enable);
	}

	void be_BView_GetFontHeight(BView *self, font_height* height)
	{
		self->GetFontHeight(height);
	}

	void be_BView_Invalidate(BView *self, BRect *invalRect)
	{
		self->Invalidate(*invalRect);
	}

	void be_BView_Invalidate_1(BView *self, const BRegion* invalRegion)
	{
		self->Invalidate(invalRegion);
	}

	void be_BView_Invalidate_2(BView *self)
	{
		self->Invalidate();
	}

	void be_BView_SetDiskMode(BView *self, char* filename, long offset)
	{
		self->SetDiskMode(filename, offset);
	}

	void be_BView_BeginPicture(BView *self, BPicture* a_picture)
	{
		self->BeginPicture(a_picture);
	}

	void be_BView_AppendToPicture(BView *self, BPicture* a_picture)
	{
		self->AppendToPicture(a_picture);
	}

	BPicture* be_BView_EndPicture(BView *self)
	{
		return self->EndPicture();
	}

	void be_BView_DrawPicture(BView *self, const BPicture* a_picture)
	{
		self->DrawPicture(a_picture);
	}

	void be_BView_DrawPicture_1(BView *self, const BPicture* a_picture, BPoint *where)
	{
		self->DrawPicture(a_picture, *where);
	}

	void be_BView_DrawPicture_2(BView *self, const char* filename, long offset, BPoint *where)
	{
		self->DrawPicture(filename, offset, *where);
	}

	void be_BView_DrawPictureAsync(BView *self, const BPicture* a_picture)
	{
		self->DrawPictureAsync(a_picture);
	}

	void be_BView_DrawPictureAsync_1(BView *self, const BPicture* a_picture, BPoint *where)
	{
		self->DrawPictureAsync(a_picture, *where);
	}

	void be_BView_DrawPictureAsync_2(BView *self, const char* filename, long offset, BPoint *where)
	{
		self->DrawPictureAsync(filename, offset, *where);
	}

	status_t be_BView_SetEventMask(BView *self, uint32 mask, uint32 options)
	{
		return self->SetEventMask(mask, options);
	}

	uint32 be_BView_EventMask(BView *self)
	{
		return self->EventMask();
	}

	status_t be_BView_SetMouseEventMask(BView *self, uint32 mask, uint32 options)
	{
		return self->SetMouseEventMask(mask, options);
	}

	void be_BView_SetFlags(BView *self, uint32 flags)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetFlags_super(flags);
		else
			self->SetFlags(flags);
	}

	uint32 be_BView_Flags(BView *self)
	{
		return self->Flags();
	}

	void be_BView_SetResizingMode(BView *self, uint32 mode)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetResizingMode_super(mode);
		else
			self->SetResizingMode(mode);
	}

	uint32 be_BView_ResizingMode(BView *self)
	{
		return self->ResizingMode();
	}

	void be_BView_MoveBy(BView *self, float dh, float dv)
	{
		self->MoveBy(dh, dv);
	}

	void be_BView_MoveTo(BView *self, BPoint *where)
	{
		self->MoveTo(*where);
	}

	void be_BView_MoveTo_1(BView *self, float x, float y)
	{
		self->MoveTo(x, y);
	}

	void be_BView_ResizeBy(BView *self, float dh, float dv)
	{
		self->ResizeBy(dh, dv);
	}

	void be_BView_ResizeTo(BView *self, float width, float height)
	{
		self->ResizeTo(width, height);
	}

	void be_BView_ResizeTo_1(BView *self, BSize *size)
	{
		self->ResizeTo(*size);
	}

	void be_BView_ScrollBy(BView *self, float dh, float dv)
	{
		self->ScrollBy(dh, dv);
	}

	void be_BView_ScrollTo(BView *self, float x, float y)
	{
		self->ScrollTo(x, y);
	}

	void be_BView_ScrollTo_1(BView *self, BPoint *where)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->ScrollTo_super(*where);
		else
			self->ScrollTo(*where);
	}

	void be_BView_MakeFocus(BView *self, bool focusState)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->MakeFocus_super(focusState);
		else
			self->MakeFocus(focusState);
	}

	bool be_BView_IsFocus(BView *self)
	{
		return self->IsFocus();
	}

	void be_BView_Show(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->Show_super();
		else
			self->Show();
	}

	void be_BView_Hide(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->Hide_super();
		else
			self->Hide();
	}

	bool be_BView_IsHidden(BView *self)
	{
		return self->IsHidden();
	}

	bool be_BView_IsHidden_1(BView *self, const BView* looking_from)
	{
		return self->IsHidden(looking_from);
	}

	void be_BView_Flush(BView *self)
	{
		self->Flush();
	}

	void be_BView_Sync(BView *self)
	{
		self->Sync();
	}

	void be_BView_GetPreferredSize(BView *self, float* width, float* height)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->GetPreferredSize_super(width, height);
		else
			self->GetPreferredSize(width, height);
	}

	void be_BView_ResizeToPreferred(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->ResizeToPreferred_super();
		else
			self->ResizeToPreferred();
	}

	BScrollBar* be_BView_ScrollBar(BView *self, orientation posture)
	{
		return self->ScrollBar(posture);
	}

	BHandler* be_BView_ResolveSpecifier(BView *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			return proxy->ResolveSpecifier_super(msg, index, specifier, form, property);
		else
			return self->ResolveSpecifier(msg, index, specifier, form, property);
	}

	status_t be_BView_GetSupportedSuites(BView *self, BMessage* data)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			return proxy->GetSupportedSuites_super(data);
		else
			return self->GetSupportedSuites(data);
	}

	bool be_BView_IsPrinting(BView *self)
	{
		return self->IsPrinting();
	}

	void be_BView_SetScale(BView *self, float scale)
	{
		self->SetScale(scale);
	}

	float be_BView_Scale(BView *self)
	{
		return self->Scale();
	}

	status_t be_BView_Perform(BView *self, perform_code code, void* data)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			return proxy->Perform_super(code, data);
		else
			return self->Perform(code, data);
	}

	void be_BView_DrawAfterChildren(BView *self, BRect *r)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->DrawAfterChildren_super(*r);
		else
			self->DrawAfterChildren(*r);
	}

	BSize * be_BView_MinSize(BView *self)
	{
		return new BSize(self->MinSize());
	}

	BSize * be_BView_MaxSize(BView *self)
	{
		return new BSize(self->MaxSize());
	}

	BSize * be_BView_PreferredSize(BView *self)
	{
		return new BSize(self->PreferredSize());
	}

	BAlignment * be_BView_LayoutAlignment(BView *self)
	{
		return new BAlignment(self->LayoutAlignment());
	}

	void be_BView_SetExplicitMinSize(BView *self, BSize *size)
	{
		self->SetExplicitMinSize(*size);
	}

	void be_BView_SetExplicitMaxSize(BView *self, BSize *size)
	{
		self->SetExplicitMaxSize(*size);
	}

	void be_BView_SetExplicitPreferredSize(BView *self, BSize *size)
	{
		self->SetExplicitPreferredSize(*size);
	}

	void be_BView_SetExplicitAlignment(BView *self, BAlignment *alignment)
	{
		self->SetExplicitAlignment(*alignment);
	}

	BSize * be_BView_ExplicitMinSize(BView *self)
	{
		return new BSize(self->ExplicitMinSize());
	}

	BSize * be_BView_ExplicitMaxSize(BView *self)
	{
		return new BSize(self->ExplicitMaxSize());
	}

	BSize * be_BView_ExplicitPreferredSize(BView *self)
	{
		return new BSize(self->ExplicitPreferredSize());
	}

	BAlignment * be_BView_ExplicitAlignment(BView *self)
	{
		return new BAlignment(self->ExplicitAlignment());
	}

	bool be_BView_HasHeightForWidth(BView *self)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			return proxy->HasHeightForWidth_super();
		else
			return self->HasHeightForWidth();
	}

	void be_BView_GetHeightForWidth(BView *self, float width, float* min, float* max, float* preferred)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->GetHeightForWidth_super(width, min, max, preferred);
		else
			self->GetHeightForWidth(width, min, max, preferred);
	}

	void be_BView_SetLayout(BView *self, BLayout* layout)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->SetLayout_super(layout);
		else
			self->SetLayout(layout);
	}

	BLayout* be_BView_GetLayout(BView *self)
	{
		return self->GetLayout();
	}

	void be_BView_InvalidateLayout(BView *self, bool descendants)
	{
		BViewProxy *proxy = dynamic_cast<BViewProxy *>(self);
		if(proxy)
			proxy->InvalidateLayout_super(descendants);
		else
			self->InvalidateLayout(descendants);
	}

	void be_BView_EnableLayoutInvalidation(BView *self)
	{
		self->EnableLayoutInvalidation();
	}

	void be_BView_DisableLayoutInvalidation(BView *self)
	{
		self->DisableLayoutInvalidation();
	}

	bool be_BView_IsLayoutValid(BView *self)
	{
		return self->IsLayoutValid();
	}

	void be_BView_ResetLayoutInvalidation(BView *self)
	{
		self->ResetLayoutInvalidation();
	}

	BLayoutContext* be_BView_LayoutContext(BView *self)
	{
		return self->LayoutContext();
	}

	void be_BView_Layout(BView *self, bool force)
	{
		self->Layout(force);
	}

	void be_BView_Relayout(BView *self)
	{
		self->Relayout();
	}

}


