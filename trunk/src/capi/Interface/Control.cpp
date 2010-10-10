/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Interface/Control.h>

BControlBridge::BControlBridge(BRect frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags)
: BControl(frame, name, label, message, resizingMode, flags)
{
}
BControlBridge::BControlBridge(const char* name, const char* label, BMessage* message, uint32 flags)
: BControl(name, label, message, flags)
{
}
BControlBridge::BControlBridge(BMessage* archive)
: BControl(archive)
{
}
BControlBridge::~BControlBridge() { }

BControlProxy::BControlProxy(void *bindInstPtr, BRect frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags)
: fBindInstPtr(bindInstPtr), BViewProxy(bindInstPtr, frame, name, resizingMode, flags), BInvokerProxy(bindInstPtr), BControlBridge(frame, name, label, message, resizingMode, flags) { }

BControlProxy::BControlProxy(void *bindInstPtr, const char* name, const char* label, BMessage* message, uint32 flags)
: fBindInstPtr(bindInstPtr), BViewProxy(bindInstPtr, name, flags, NULL), BInvokerProxy(bindInstPtr), BControlBridge(name, label, message, flags) { }

BControlProxy::BControlProxy(void *bindInstPtr, BMessage* archive)
: fBindInstPtr(bindInstPtr), BViewProxy(bindInstPtr, archive), BInvokerProxy(bindInstPtr), BControlBridge(archive) { }

BControlProxy::~BControlProxy() { }

status_t BControlProxy::Archive(BMessage* archive, bool deep) 
{
	return bind_BControl_Archive(fBindInstPtr, archive, deep);
}

status_t BControlProxy::Archive_super(BMessage* archive, bool deep) 
{
	return BControl::Archive(archive, deep);
}

void BControlProxy::WindowActivated(bool active) 
{
	 bind_BControl_WindowActivated(fBindInstPtr, active);
}

void BControlProxy::WindowActivated_super(bool active) 
{
	 BControl::WindowActivated(active);
}

void BControlProxy::AttachedToWindow() 
{
	 bind_BControl_AttachedToWindow(fBindInstPtr);
}

void BControlProxy::AttachedToWindow_super() 
{
	 BControl::AttachedToWindow();
}

void BControlProxy::DetachedFromWindow() 
{
	 bind_BControl_DetachedFromWindow(fBindInstPtr);
}

void BControlProxy::DetachedFromWindow_super() 
{
	 BControl::DetachedFromWindow();
}

void BControlProxy::AllAttached() 
{
	 bind_BControl_AllAttached(fBindInstPtr);
}

void BControlProxy::AllAttached_super() 
{
	 BControl::AllAttached();
}

void BControlProxy::AllDetached() 
{
	 bind_BControl_AllDetached(fBindInstPtr);
}

void BControlProxy::AllDetached_super() 
{
	 BControl::AllDetached();
}

void BControlProxy::MessageReceived(BMessage* message) 
{
	 bind_BControl_MessageReceived(fBindInstPtr, message);
}

void BControlProxy::MessageReceived_super(BMessage* message) 
{
	 BControl::MessageReceived(message);
}

void BControlProxy::MakeFocus(bool focused) 
{
	 bind_BControl_MakeFocus(fBindInstPtr, focused);
}

void BControlProxy::MakeFocus_super(bool focused) 
{
	 BControl::MakeFocus(focused);
}

void BControlProxy::KeyDown(const char* bytes, int32 numBytes) 
{
	 bind_BControl_KeyDown(fBindInstPtr, bytes, numBytes);
}

void BControlProxy::KeyDown_super(const char* bytes, int32 numBytes) 
{
	 BControl::KeyDown(bytes, numBytes);
}

void BControlProxy::MouseDown(BPoint point) 
{
	 bind_BControl_MouseDown(fBindInstPtr, &point);
}

void BControlProxy::MouseDown_super(BPoint point) 
{
	 BControl::MouseDown(point);
}

void BControlProxy::MouseUp(BPoint point) 
{
	 bind_BControl_MouseUp(fBindInstPtr, &point);
}

void BControlProxy::MouseUp_super(BPoint point) 
{
	 BControl::MouseUp(point);
}

void BControlProxy::MouseMoved(BPoint point, uint32 transit, const BMessage * message) 
{
	 bind_BControl_MouseMoved(fBindInstPtr, &point, transit, message);
}

void BControlProxy::MouseMoved_super(BPoint point, uint32 transit, const BMessage * message) 
{
	 BControl::MouseMoved(point, transit, message);
}

void BControlProxy::SetLabel(const char* string) 
{
	 bind_BControl_SetLabel(fBindInstPtr, string);
}

void BControlProxy::SetLabel_super(const char* string) 
{
	 BControl::SetLabel(string);
}

void BControlProxy::SetValue(int32 value) 
{
	 bind_BControl_SetValue(fBindInstPtr, value);
}

void BControlProxy::SetValue_super(int32 value) 
{
	 BControl::SetValue(value);
}

void BControlProxy::SetEnabled(bool enabled) 
{
	 bind_BControl_SetEnabled(fBindInstPtr, enabled);
}

void BControlProxy::SetEnabled_super(bool enabled) 
{
	 BControl::SetEnabled(enabled);
}

void BControlProxy::GetPreferredSize(float* _width, float* _height) 
{
	 bind_BControl_GetPreferredSize(fBindInstPtr, _width, _height);
}

void BControlProxy::GetPreferredSize_super(float* _width, float* _height) 
{
	 BControl::GetPreferredSize(_width, _height);
}

void BControlProxy::ResizeToPreferred() 
{
	 bind_BControl_ResizeToPreferred(fBindInstPtr);
}

void BControlProxy::ResizeToPreferred_super() 
{
	 BControl::ResizeToPreferred();
}

status_t BControlProxy::Invoke(BMessage* message) 
{
	return bind_BControl_Invoke(fBindInstPtr, message);
}

status_t BControlProxy::Invoke_super(BMessage* message) 
{
	return BControl::Invoke(message);
}

BHandler* BControlProxy::ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) 
{
	return bind_BControl_ResolveSpecifier(fBindInstPtr, message, index, specifier, what, property);
}

BHandler* BControlProxy::ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) 
{
	return BControl::ResolveSpecifier(message, index, specifier, what, property);
}

status_t BControlProxy::GetSupportedSuites(BMessage* message) 
{
	return bind_BControl_GetSupportedSuites(fBindInstPtr, message);
}

status_t BControlProxy::GetSupportedSuites_super(BMessage* message) 
{
	return BControl::GetSupportedSuites(message);
}

status_t BControlProxy::Perform(perform_code d, void* arg) 
{
	return bind_BControl_Perform(fBindInstPtr, d, arg);
}

status_t BControlProxy::Perform_super(perform_code d, void* arg) 
{
	return BControl::Perform(d, arg);
}


extern "C" {
	BControl *be_BControl_ctor(void *bindInstPtr, BRect *frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags)
	{
		return (BControl* )new BControlProxy(bindInstPtr, *frame, name, label, message, resizingMode, flags);
	}

	BControl *be_BControl_ctor_1(void *bindInstPtr, const char* name, const char* label, BMessage* message, uint32 flags)
	{
		return (BControl* )new BControlProxy(bindInstPtr, name, label, message, flags);
	}

	BControl *be_BControl_ctor_2(void *bindInstPtr, BMessage* archive)
	{
		return (BControl* )new BControlProxy(bindInstPtr, archive);
	}

	void be_BControl_dtor(BControl *self)
	{
		delete self;
	}

	BArchivable* be_BControl_Instantiate_static(BMessage* archive)
	{
		return BControl::Instantiate(archive);
	}

	status_t be_BControl_Archive(BControl *self, BMessage* archive, bool deep)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			return proxy->Archive_super(archive, deep);
		else
			return self->Archive(archive, deep);
	}

	void be_BControl_WindowActivated(BControl *self, bool active)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->WindowActivated_super(active);
		else
			self->WindowActivated(active);
	}

	void be_BControl_AttachedToWindow(BControl *self)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->AttachedToWindow_super();
		else
			self->AttachedToWindow();
	}

	void be_BControl_DetachedFromWindow(BControl *self)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->DetachedFromWindow_super();
		else
			self->DetachedFromWindow();
	}

	void be_BControl_AllAttached(BControl *self)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->AllAttached_super();
		else
			self->AllAttached();
	}

	void be_BControl_AllDetached(BControl *self)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->AllDetached_super();
		else
			self->AllDetached();
	}

	void be_BControl_MessageReceived(BControl *self, BMessage* message)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->MessageReceived_super(message);
		else
			self->MessageReceived(message);
	}

	void be_BControl_MakeFocus(BControl *self, bool focused)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->MakeFocus_super(focused);
		else
			self->MakeFocus(focused);
	}

	void be_BControl_KeyDown(BControl *self, const char* bytes, int32 numBytes)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->KeyDown_super(bytes, numBytes);
		else
			self->KeyDown(bytes, numBytes);
	}

	void be_BControl_MouseDown(BControl *self, BPoint *point)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->MouseDown_super(*point);
		else
			self->MouseDown(*point);
	}

	void be_BControl_MouseUp(BControl *self, BPoint *point)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->MouseUp_super(*point);
		else
			self->MouseUp(*point);
	}

	void be_BControl_MouseMoved(BControl *self, BPoint *point, uint32 transit, const BMessage * message)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->MouseMoved_super(*point, transit, message);
		else
			self->MouseMoved(*point, transit, message);
	}

	void be_BControl_SetLabel(BControl *self, const char* string)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->SetLabel_super(string);
		else
			self->SetLabel(string);
	}

	const char* be_BControl_Label(BControl *self)
	{
		return self->Label();
	}

	void be_BControl_SetValue(BControl *self, int32 value)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->SetValue_super(value);
		else
			self->SetValue(value);
	}

	int32 be_BControl_Value(BControl *self)
	{
		return self->Value();
	}

	void be_BControl_SetEnabled(BControl *self, bool enabled)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->SetEnabled_super(enabled);
		else
			self->SetEnabled(enabled);
	}

	bool be_BControl_IsEnabled(BControl *self)
	{
		return self->IsEnabled();
	}

	void be_BControl_GetPreferredSize(BControl *self, float* _width, float* _height)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->GetPreferredSize_super(_width, _height);
		else
			self->GetPreferredSize(_width, _height);
	}

	void be_BControl_ResizeToPreferred(BControl *self)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			proxy->ResizeToPreferred_super();
		else
			self->ResizeToPreferred();
	}

	status_t be_BControl_Invoke(BControl *self, BMessage* message)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			return proxy->Invoke_super(message);
		else
			return self->Invoke(message);
	}

	BHandler* be_BControl_ResolveSpecifier(BControl *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			return proxy->ResolveSpecifier_super(message, index, specifier, what, property);
		else
			return self->ResolveSpecifier(message, index, specifier, what, property);
	}

	status_t be_BControl_GetSupportedSuites(BControl *self, BMessage* message)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			return proxy->GetSupportedSuites_super(message);
		else
			return self->GetSupportedSuites(message);
	}

	status_t be_BControl_Perform(BControl *self, perform_code d, void* arg)
	{
		BControlProxy *proxy = dynamic_cast<BControlProxy *>(self);
		if(proxy)
			return proxy->Perform_super(d, arg);
		else
			return self->Perform(d, arg);
	}

}


