/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Interface/Button.h"

BButtonBridge::BButtonBridge(BRect frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags)
: BButton(frame, name, label, message, resizingMode, flags)
{
}
BButtonBridge::BButtonBridge(const char* name, const char* label, BMessage * message, uint32 flags)
: BButton(name, label, message, flags)
{
}
BButtonBridge::BButtonBridge(const char* label, BMessage* message)
: BButton(label, message)
{
}
BButtonBridge::BButtonBridge(BMessage * archive)
: BButton(archive)
{
}
BButtonBridge::~BButtonBridge() { }

BButtonProxy::BButtonProxy(void *bindInstPtr, BRect frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags)
: fBindInstPtr(bindInstPtr), BControlProxy(bindInstPtr, frame, name, label, message, resizingMode, flags), BButtonBridge(frame, name, label, message, resizingMode, flags) { }

BButtonProxy::BButtonProxy(void *bindInstPtr, const char* name, const char* label, BMessage * message, uint32 flags)
: fBindInstPtr(bindInstPtr), BControlProxy(bindInstPtr, name, label, message, flags), BButtonBridge(name, label, message, flags) { }

BButtonProxy::BButtonProxy(void *bindInstPtr, const char* label, BMessage* message)
: fBindInstPtr(bindInstPtr), BControlProxy(bindInstPtr, NULL, label, message, B_WILL_DRAW | B_NAVIGABLE | B_FULL_UPDATE_ON_RESIZE), BButtonBridge(label, message) { }

BButtonProxy::BButtonProxy(void *bindInstPtr, BMessage * archive)
: fBindInstPtr(bindInstPtr), BControlProxy(bindInstPtr, archive), BButtonBridge(archive) { }

BButtonProxy::~BButtonProxy() { }

status_t BButtonProxy::Archive(BMessage* archive, bool deep) const
{
	return bind_BButton_Archive(fBindInstPtr, archive, deep);
}

status_t BButtonProxy::Archive_super(BMessage* archive, bool deep) const
{
	return BButton::Archive(archive, deep);
}

void BButtonProxy::Draw(BRect updateRect) 
{
	 bind_BButton_Draw(fBindInstPtr, &updateRect);
}

void BButtonProxy::Draw_super(BRect updateRect) 
{
	 BButton::Draw(updateRect);
}

void BButtonProxy::MouseDown(BPoint point) 
{
	 bind_BButton_MouseDown(fBindInstPtr, &point);
}

void BButtonProxy::MouseDown_super(BPoint point) 
{
	 BButton::MouseDown(point);
}

void BButtonProxy::AttachedToWindow() 
{
	 bind_BButton_AttachedToWindow(fBindInstPtr);
}

void BButtonProxy::AttachedToWindow_super() 
{
	 BButton::AttachedToWindow();
}

void BButtonProxy::KeyDown(const char* bytes, int32 numBytes) 
{
	 bind_BButton_KeyDown(fBindInstPtr, bytes, numBytes);
}

void BButtonProxy::KeyDown_super(const char* bytes, int32 numBytes) 
{
	 BButton::KeyDown(bytes, numBytes);
}

void BButtonProxy::MakeDefault(bool flag) 
{
	 bind_BButton_MakeDefault(fBindInstPtr, flag);
}

void BButtonProxy::MakeDefault_super(bool flag) 
{
	 BButton::MakeDefault(flag);
}

void BButtonProxy::SetLabel(const char* string) 
{
	 bind_BButton_SetLabel(fBindInstPtr, string);
}

void BButtonProxy::SetLabel_super(const char* string) 
{
	 BButton::SetLabel(string);
}

void BButtonProxy::MessageReceived(BMessage* message) 
{
	 bind_BButton_MessageReceived(fBindInstPtr, message);
}

void BButtonProxy::MessageReceived_super(BMessage* message) 
{
	 BButton::MessageReceived(message);
}

void BButtonProxy::WindowActivated(bool active) 
{
	 bind_BButton_WindowActivated(fBindInstPtr, active);
}

void BButtonProxy::WindowActivated_super(bool active) 
{
	 BButton::WindowActivated(active);
}

void BButtonProxy::MouseMoved(BPoint point, uint32 transit, const BMessage* message) 
{
	 bind_BButton_MouseMoved(fBindInstPtr, &point, transit, message);
}

void BButtonProxy::MouseMoved_super(BPoint point, uint32 transit, const BMessage* message) 
{
	 BButton::MouseMoved(point, transit, message);
}

void BButtonProxy::MouseUp(BPoint point) 
{
	 bind_BButton_MouseUp(fBindInstPtr, &point);
}

void BButtonProxy::MouseUp_super(BPoint point) 
{
	 BButton::MouseUp(point);
}

void BButtonProxy::DetachedFromWindow() 
{
	 bind_BButton_DetachedFromWindow(fBindInstPtr);
}

void BButtonProxy::DetachedFromWindow_super() 
{
	 BButton::DetachedFromWindow();
}

void BButtonProxy::SetValue(int32 value) 
{
	 bind_BButton_SetValue(fBindInstPtr, value);
}

void BButtonProxy::SetValue_super(int32 value) 
{
	 BButton::SetValue(value);
}

void BButtonProxy::GetPreferredSize(float* _width, float* _height) 
{
	 bind_BButton_GetPreferredSize(fBindInstPtr, _width, _height);
}

void BButtonProxy::GetPreferredSize_super(float* _width, float* _height) 
{
	 BButton::GetPreferredSize(_width, _height);
}

void BButtonProxy::ResizeToPreferred() 
{
	 bind_BButton_ResizeToPreferred(fBindInstPtr);
}

void BButtonProxy::ResizeToPreferred_super() 
{
	 BButton::ResizeToPreferred();
}

status_t BButtonProxy::Invoke(BMessage* message) 
{
	return bind_BButton_Invoke(fBindInstPtr, message);
}

status_t BButtonProxy::Invoke_super(BMessage* message) 
{
	return BButton::Invoke(message);
}

void BButtonProxy::FrameMoved(BPoint newLocation) 
{
	 bind_BButton_FrameMoved(fBindInstPtr, &newLocation);
}

void BButtonProxy::FrameMoved_super(BPoint newLocation) 
{
	 BButton::FrameMoved(newLocation);
}

void BButtonProxy::FrameResized(float width, float height) 
{
	 bind_BButton_FrameResized(fBindInstPtr, width, height);
}

void BButtonProxy::FrameResized_super(float width, float height) 
{
	 BButton::FrameResized(width, height);
}

void BButtonProxy::MakeFocus(bool focused) 
{
	 bind_BButton_MakeFocus(fBindInstPtr, focused);
}

void BButtonProxy::MakeFocus_super(bool focused) 
{
	 BButton::MakeFocus(focused);
}

void BButtonProxy::AllAttached() 
{
	 bind_BButton_AllAttached(fBindInstPtr);
}

void BButtonProxy::AllAttached_super() 
{
	 BButton::AllAttached();
}

void BButtonProxy::AllDetached() 
{
	 bind_BButton_AllDetached(fBindInstPtr);
}

void BButtonProxy::AllDetached_super() 
{
	 BButton::AllDetached();
}

BHandler* BButtonProxy::ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) 
{
	return bind_BButton_ResolveSpecifier(fBindInstPtr, message, index, specifier, what, property);
}

BHandler* BButtonProxy::ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) 
{
	return BButton::ResolveSpecifier(message, index, specifier, what, property);
}

status_t BButtonProxy::GetSupportedSuites(BMessage* message) 
{
	return bind_BButton_GetSupportedSuites(fBindInstPtr, message);
}

status_t BButtonProxy::GetSupportedSuites_super(BMessage* message) 
{
	return BButton::GetSupportedSuites(message);
}

status_t BButtonProxy::Perform(perform_code d, void* arg) 
{
	return bind_BButton_Perform(fBindInstPtr, d, arg);
}

status_t BButtonProxy::Perform_super(perform_code d, void* arg) 
{
	return BButton::Perform(d, arg);
}

void BButtonProxy::InvalidateLayout(bool descendants) 
{
	 bind_BButton_InvalidateLayout(fBindInstPtr, descendants);
}

void BButtonProxy::InvalidateLayout_super(bool descendants) 
{
	 BButton::InvalidateLayout(descendants);
}

BSize BButtonProxy::MinSize() 
{
	return *bind_BButton_MinSize(fBindInstPtr);
}

BSize BButtonProxy::MinSize_super() 
{
	return BButton::MinSize();
}

BSize BButtonProxy::MaxSize() 
{
	return *bind_BButton_MaxSize(fBindInstPtr);
}

BSize BButtonProxy::MaxSize_super() 
{
	return BButton::MaxSize();
}

BSize BButtonProxy::PreferredSize() 
{
	return *bind_BButton_PreferredSize(fBindInstPtr);
}

BSize BButtonProxy::PreferredSize_super() 
{
	return BButton::PreferredSize();
}


extern "C" {
	BButton *be_BButton_ctor(void *bindInstPtr, BRect *frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags)
	{
		return (BButton* )new BButtonProxy(bindInstPtr, *frame, name, label, message, resizingMode, flags);
	}

	BButton *be_BButton_ctor_1(void *bindInstPtr, const char* name, const char* label, BMessage * message, uint32 flags)
	{
		return (BButton* )new BButtonProxy(bindInstPtr, name, label, message, flags);
	}

	BButton *be_BButton_ctor_2(void *bindInstPtr, const char* label, BMessage* message)
	{
		return (BButton* )new BButtonProxy(bindInstPtr, label, message);
	}

	BButton *be_BButton_ctor_3(void *bindInstPtr, BMessage * archive)
	{
		return (BButton* )new BButtonProxy(bindInstPtr, archive);
	}

	void be_BButton_dtor(BButton *self)
	{
		delete self;
	}

	BArchivable* be_BButton_Instantiate_static(BMessage* archive)
	{
		return BButton::Instantiate(archive);
	}

	status_t be_BButton_Archive(BButton *self, BMessage* archive, bool deep)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return proxy->Archive_super(archive, deep);
		else
			return self->Archive(archive, deep);
	}

	void be_BButton_Draw(BButton *self, BRect *updateRect)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->Draw_super(*updateRect);
		else
			self->Draw(*updateRect);
	}

	void be_BButton_MouseDown(BButton *self, BPoint *point)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->MouseDown_super(*point);
		else
			self->MouseDown(*point);
	}

	void be_BButton_AttachedToWindow(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->AttachedToWindow_super();
		else
			self->AttachedToWindow();
	}

	void be_BButton_KeyDown(BButton *self, const char* bytes, int32 numBytes)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->KeyDown_super(bytes, numBytes);
		else
			self->KeyDown(bytes, numBytes);
	}

	void be_BButton_MakeDefault(BButton *self, bool flag)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->MakeDefault_super(flag);
		else
			self->MakeDefault(flag);
	}

	void be_BButton_SetLabel(BButton *self, const char* string)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->SetLabel_super(string);
		else
			self->SetLabel(string);
	}

	bool be_BButton_IsDefault(BButton *self)
	{
		return self->IsDefault();
	}

	void be_BButton_MessageReceived(BButton *self, BMessage* message)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->MessageReceived_super(message);
		else
			self->MessageReceived(message);
	}

	void be_BButton_WindowActivated(BButton *self, bool active)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->WindowActivated_super(active);
		else
			self->WindowActivated(active);
	}

	void be_BButton_MouseMoved(BButton *self, BPoint *point, uint32 transit, const BMessage* message)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->MouseMoved_super(*point, transit, message);
		else
			self->MouseMoved(*point, transit, message);
	}

	void be_BButton_MouseUp(BButton *self, BPoint *point)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->MouseUp_super(*point);
		else
			self->MouseUp(*point);
	}

	void be_BButton_DetachedFromWindow(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->DetachedFromWindow_super();
		else
			self->DetachedFromWindow();
	}

	void be_BButton_SetValue(BButton *self, int32 value)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->SetValue_super(value);
		else
			self->SetValue(value);
	}

	void be_BButton_GetPreferredSize(BButton *self, float* _width, float* _height)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->GetPreferredSize_super(_width, _height);
		else
			self->GetPreferredSize(_width, _height);
	}

	void be_BButton_ResizeToPreferred(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->ResizeToPreferred_super();
		else
			self->ResizeToPreferred();
	}

	status_t be_BButton_Invoke(BButton *self, BMessage* message)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return proxy->Invoke_super(message);
		else
			return self->Invoke(message);
	}

	void be_BButton_FrameMoved(BButton *self, BPoint *newLocation)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->FrameMoved_super(*newLocation);
		else
			self->FrameMoved(*newLocation);
	}

	void be_BButton_FrameResized(BButton *self, float width, float height)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->FrameResized_super(width, height);
		else
			self->FrameResized(width, height);
	}

	void be_BButton_MakeFocus(BButton *self, bool focused)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->MakeFocus_super(focused);
		else
			self->MakeFocus(focused);
	}

	void be_BButton_AllAttached(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->AllAttached_super();
		else
			self->AllAttached();
	}

	void be_BButton_AllDetached(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->AllDetached_super();
		else
			self->AllDetached();
	}

	BHandler* be_BButton_ResolveSpecifier(BButton *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return proxy->ResolveSpecifier_super(message, index, specifier, what, property);
		else
			return self->ResolveSpecifier(message, index, specifier, what, property);
	}

	status_t be_BButton_GetSupportedSuites(BButton *self, BMessage* message)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return proxy->GetSupportedSuites_super(message);
		else
			return self->GetSupportedSuites(message);
	}

	status_t be_BButton_Perform(BButton *self, perform_code d, void* arg)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return proxy->Perform_super(d, arg);
		else
			return self->Perform(d, arg);
	}

	void be_BButton_InvalidateLayout(BButton *self, bool descendants)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			proxy->InvalidateLayout_super(descendants);
		else
			self->InvalidateLayout(descendants);
	}

	BSize * be_BButton_MinSize(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return new BSize(proxy->MinSize_super());
		else
			return new BSize(self->MinSize());
	}

	BSize * be_BButton_MaxSize(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return new BSize(proxy->MaxSize_super());
		else
			return new BSize(self->MaxSize());
	}

	BSize * be_BButton_PreferredSize(BButton *self)
	{
		BButtonProxy *proxy = dynamic_cast<BButtonProxy *>(self);
		if(proxy)
			return new BSize(proxy->PreferredSize_super());
		else
			return new BSize(self->PreferredSize());
	}

}


