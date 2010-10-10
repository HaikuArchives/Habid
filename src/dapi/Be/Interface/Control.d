/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Control;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;
import Be.App.Messenger;
import Be.App.Looper;
import Be.App.Handler;
import Be.App.Invoker;

import Be.Interface.Rect;
import Be.Interface.Point;
import Be.Interface.View;

import tango.stdc.stringz;

extern (C) extern {
	// BControlProxy * be_BControl_ctor(void *bindInstPtr, BRect *frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags);
	void * be_BControl_ctor(void *bindInstPtr, void *frame,  char* name,  char* label, void * message, uint32 resizingMode, uint32 flags);

	// BControlProxy * be_BControl_ctor_1(void *bindInstPtr, const char* name, const char* label, BMessage* message, uint32 flags);
	void * be_BControl_ctor_1(void *bindInstPtr, char* name,  char* label, void * message, uint32 flags);

	// BControlProxy * be_BControl_ctor_2(void *bindInstPtr, BMessage* archive);
	void * be_BControl_ctor_2(void *bindInstPtr, void * archive);

	// void be_BControl_dtor(BControl* self);
	void be_BControl_dtor(void* self);

	//BArchivable* be_BControl_Instantiate_static(BMessage* archive)
	void* be_BControl_Instantiate_static(void * archive);

	// status_t be_BControl_Archive(BControlProxy *self, BMessage* archive, bool deep);
	status_t be_BControl_Archive(void *self, void * archive, bool deep);

	// void be_BControl_WindowActivated(BControlProxy *self, bool active);
	void be_BControl_WindowActivated(void *self, bool active);

	// void be_BControl_AttachedToWindow(BControlProxy *self);
	void be_BControl_AttachedToWindow(void *self);

	// void be_BControl_DetachedFromWindow(BControlProxy *self);
	void be_BControl_DetachedFromWindow(void *self);

	// void be_BControl_AllAttached(BControlProxy *self);
	void be_BControl_AllAttached(void *self);

	// void be_BControl_AllDetached(BControlProxy *self);
	void be_BControl_AllDetached(void *self);

	// void be_BControl_MessageReceived(BControlProxy *self, BMessage* message);
	void be_BControl_MessageReceived(void *self, void * message);

	// void be_BControl_MakeFocus(BControlProxy *self, bool focused);
	void be_BControl_MakeFocus(void *self, bool focused);

	// void be_BControl_KeyDown(BControlProxy *self, const char* bytes, int32 numBytes);
	void be_BControl_KeyDown(void *self, char* bytes, int32 numBytes);

	// void be_BControl_MouseDown(BControlProxy *self, BPoint *point);
	void be_BControl_MouseDown(void *self, void *point);

	// void be_BControl_MouseUp(BControlProxy *self, BPoint *point);
	void be_BControl_MouseUp(void *self, void *point);

	// void be_BControl_MouseMoved(BControlProxy *self, BPoint *point, uint32 transit, const BMessage * message);
	void be_BControl_MouseMoved(void *self, void *point, uint32 transit, void * message);

	// void be_BControl_SetLabel(BControlProxy *self, const char* string);
	void be_BControl_SetLabel(void *self, char* string);

	// const char* be_BControl_Label(BControlProxy *self);
	char* be_BControl_Label(void *self);

	// void be_BControl_SetValue(BControlProxy *self, int32 value);
	void be_BControl_SetValue(void *self, int32 value);

	// int32 be_BControl_Value(BControlProxy *self);
	int32 be_BControl_Value(void *self);

	// void be_BControl_SetEnabled(BControlProxy *self, bool enabled);
	void be_BControl_SetEnabled(void *self, bool enabled);

	// bool be_BControl_IsEnabled(BControlProxy *self);
	bool be_BControl_IsEnabled(void *self);

	// void be_BControl_GetPreferredSize(BControlProxy *self, float* _width, float* _height);
	void be_BControl_GetPreferredSize(void *self, float* _width, float* _height);

	// void be_BControl_ResizeToPreferred(BControlProxy *self);
	void be_BControl_ResizeToPreferred(void *self);

	// status_t be_BControl_Invoke(BControlProxy *self, BMessage* message);
	status_t be_BControl_Invoke(void *self, void * message);

	// BHandler* be_BControl_ResolveSpecifier(BControlProxy *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	void * be_BControl_ResolveSpecifier(void *self, void * message, int32 index, void * specifier, int32 what,  char* property);

	// status_t be_BControl_GetSupportedSuites(BControlProxy *self, BMessage* message);
	status_t be_BControl_GetSupportedSuites(void *self, void * message);

	// status_t be_BControl_Perform(BControlProxy *self, perform_code d, void* arg);
	status_t be_BControl_Perform(void *self, perform_code d, void* arg);

}


extern (C) {
	status_t bind_BControl_Archive(void *bindInstPtr, BMessage* archive, bool deep) {
		assert(false, "bind_BControl_Archive(void *bindInstPtr, BMessage* archive, bool deep) Unimplemented");
	}

	void bind_BControl_WindowActivated(void *bindInstPtr, bool active) {
		assert(false, "bind_BControl_WindowActivated(void *bindInstPtr, bool active) Unimplemented");
	}

	void bind_BControl_AttachedToWindow(void *bindInstPtr) {
		assert(false, "bind_BControl_AttachedToWindow(void *bindInstPtr) Unimplemented");
	}

	void bind_BControl_DetachedFromWindow(void *bindInstPtr) {
		assert(false, "bind_BControl_DetachedFromWindow(void *bindInstPtr) Unimplemented");
	}

	void bind_BControl_AllAttached(void *bindInstPtr) {
		assert(false, "bind_BControl_AllAttached(void *bindInstPtr) Unimplemented");
	}

	void bind_BControl_AllDetached(void *bindInstPtr) {
		assert(false, "bind_BControl_AllDetached(void *bindInstPtr) Unimplemented");
	}

	void bind_BControl_MessageReceived(void *bindInstPtr, BMessage* message) {
		assert(false, "bind_BControl_MessageReceived(void *bindInstPtr, BMessage* message) Unimplemented");
	}

	void bind_BControl_MakeFocus(void *bindInstPtr, bool focused) {
		assert(false, "bind_BControl_MakeFocus(void *bindInstPtr, bool focused) Unimplemented");
	}

	void bind_BControl_KeyDown(void *bindInstPtr, char* bytes, int32 numBytes) {
		assert(false, "bind_BControl_KeyDown(void *bindInstPtr, const char* bytes, int32 numBytes) Unimplemented");
	}

	void bind_BControl_MouseDown(void *bindInstPtr, BPoint *point) {
		assert(false, "bind_BControl_MouseDown(void *bindInstPtr, BPoint *point) Unimplemented");
	}

	void bind_BControl_MouseUp(void *bindInstPtr, BPoint *point) {
		assert(false, "bind_BControl_MouseUp(void *bindInstPtr, BPoint *point) Unimplemented");
	}

	void bind_BControl_MouseMoved(void *bindInstPtr, BPoint *point, uint32 transit,  BMessage * message) {
		assert(false, "bind_BControl_MouseMoved(void *bindInstPtr, BPoint *point, uint32 transit, const BMessage * message) Unimplemented");
	}

	void bind_BControl_SetLabel(void *bindInstPtr, char* string) {
		assert(false, "bind_BControl_SetLabel(void *bindInstPtr, const char* string) Unimplemented");
	}

	void bind_BControl_SetValue(void *bindInstPtr, int32 value) {
		assert(false, "bind_BControl_SetValue(void *bindInstPtr, int32 value) Unimplemented");
	}

	void bind_BControl_SetEnabled(void *bindInstPtr, bool enabled) {
		assert(false, "bind_BControl_SetEnabled(void *bindInstPtr, bool enabled) Unimplemented");
	}

	void bind_BControl_GetPreferredSize(void *bindInstPtr, float* _width, float* _height) {
		assert(false, "bind_BControl_GetPreferredSize(void *bindInstPtr, float* _width, float* _height) Unimplemented");
	}

	void bind_BControl_ResizeToPreferred(void *bindInstPtr) {
		assert(false, "bind_BControl_ResizeToPreferred(void *bindInstPtr) Unimplemented");
	}

	status_t bind_BControl_Invoke(void *bindInstPtr, BMessage* message) {
		assert(false, "bind_BControl_Invoke(void *bindInstPtr, BMessage* message) Unimplemented");
	}

	void* bind_BControl_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 what,  char* property) {
		assert(false, "bind_BControl_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) Unimplemented");
	}

	status_t bind_BControl_GetSupportedSuites(void *bindInstPtr, BMessage* message) {
		assert(false, "bind_BControl_GetSupportedSuites(void *bindInstPtr, BMessage* message) Unimplemented");
	}

	status_t bind_BControl_Perform(void *bindInstPtr, perform_code d, void* arg) {
		assert(false, "bind_BControl_Perform(void *bindInstPtr, perform_code d, void* arg) Unimplemented");
	}

}


interface IBControl
{
/*
	// BArchivable* be_BControl_Instantiate(BControl *self, BMessage* archive);
	BArchivable* Instantiate();
*/
	// status_t be_BControl_Archive(BControl *self, BMessage* archive, bool deep);
	status_t Archive(BMessage, bool);

	// void be_BControl_WindowActivated(BControl *self, bool active);
	void WindowActivated(bool);

	// void be_BControl_AttachedToWindow(BControl *self);
	void AttachedToWindow();

	// void be_BControl_DetachedFromWindow(BControl *self);
	void DetachedFromWindow();

	// void be_BControl_AllAttached(BControl *self);
	void AllAttached();

	// void be_BControl_AllDetached(BControl *self);
	void AllDetached();

	// void be_BControl_MessageReceived(BControl *self, BMessage* message);
	void MessageReceived(BMessage);

	// void be_BControl_MakeFocus(BControl *self, bool focused);
	void MakeFocus(bool);

	// void be_BControl_KeyDown(BControl *self, const char* bytes, int32 numBytes);
	void KeyDown(char [], int32);

	// void be_BControl_MouseDown(BControl *self, BPoint *point);
	void MouseDown(BPoint);

	// void be_BControl_MouseUp(BControl *self, BPoint *point);
	void MouseUp(BPoint);

	// void be_BControl_MouseMoved(BControl *self, BPoint *point, uint32 transit, const BMessage * message);
	void MouseMoved(BPoint, uint32, BMessage);

	// void be_BControl_SetLabel(BControl *self, const char* string);
	void SetLabel(char []);

	// const char* be_BControl_Label(BControl *self);
	final char [] Label();

	// void be_BControl_SetValue(BControl *self, int32 value);
	void SetValue(int32);

	// int32 be_BControl_Value(BControl *self);
	final int32 Value();

	// void be_BControl_SetEnabled(BControl *self, bool enabled);
	void SetEnabled(bool);

	// bool be_BControl_IsEnabled(BControl *self);
	final bool IsEnabled();

	// void be_BControl_GetPreferredSize(BControl *self, float* _width, float* _height);
	void GetPreferredSize(inout float, inout float);

	// void be_BControl_ResizeToPreferred(BControl *self);
	void ResizeToPreferred();

	// status_t be_BControl_Invoke(BControl *self, BMessage* message);
	status_t Invoke(BMessage);

	// BHandler* be_BControl_ResolveSpecifier(BControl *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	BHandler ResolveSpecifier(BMessage, int32, BMessage, int32, char []);

	// status_t be_BControl_GetSupportedSuites(BControl *self, BMessage* message);
	status_t GetSupportedSuites(BMessage);

	// status_t be_BControl_Perform(BControl *self, perform_code d, void* arg);
	status_t Perform(perform_code, void *);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BControl : BView, IBInvoker, IBControl
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObjectInherited!());
public:
	// BControlProxy * be_BControl_ctor(void *bindInstPtr, BRect *frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags);
	this(BRect frame, char [] name, char [] label, BMessage message, uint32 resizingMode, uint32 flags) {
		if(_InstPtr is null) {
			_InstPtr = be_BControl_ctor(cast(void *)this, frame._InstPtr, toStringz(name), toStringz(label), message._InstPtr, resizingMode, flags);
			_OwnsPtr = true;
		}
		super(frame, name, resizingMode, flags);
	}

	// BControlProxy * be_BControl_ctor_1(void *bindInstPtr, const char* name, const char* label, BMessage* message, uint32 flags);
	this(char [] name, char [] label, BMessage message, uint32 flags) {
		if(_InstPtr is null) {
			_InstPtr = be_BControl_ctor_1(cast(void *)this, name is null ? null : toStringz(name), toStringz(label), message._InstPtr, flags);
			_OwnsPtr = true;
		}
		super();
	}

	// BControlProxy * be_BControl_ctor_2(void *bindInstPtr, BMessage* archive);
	this(BMessage archive) {
		if(_InstPtr is null) {
			_InstPtr = be_BControl_ctor_2(cast(void *)this, archive._InstPtr);
			_OwnsPtr = true;
		}
		super(archive);
	}

	// void be_BControl_dtor(BControl* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BControl_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	//BArchivable* be_BControl_Instantiate_static(BMessage* archive)
	static BControl Instantiate(BMessage* archive)
	{
		return new BControl(be_BControl_Instantiate_static(archive._InstPtr), true);
	}

	// status_t be_BControl_Archive(BControl *self, BMessage* archive, bool deep);
	status_t Archive(BMessage archive, bool deep = true) {
		return be_BControl_Archive(_InstPtr(), archive._InstPtr, deep);
	}

	// void be_BControl_WindowActivated(BControl *self, bool active);
	void WindowActivated(bool active) {
		be_BControl_WindowActivated(_InstPtr(), active);
	}

	// void be_BControl_AttachedToWindow(BControl *self);
	void AttachedToWindow() {
		be_BControl_AttachedToWindow(_InstPtr());
	}

	// void be_BControl_DetachedFromWindow(BControl *self);
	void DetachedFromWindow() {
		be_BControl_DetachedFromWindow(_InstPtr());
	}

	// void be_BControl_AllAttached(BControl *self);
	void AllAttached() {
		be_BControl_AllAttached(_InstPtr());
	}

	// void be_BControl_AllDetached(BControl *self);
	void AllDetached() {
		be_BControl_AllDetached(_InstPtr());
	}

	// void be_BControl_MessageReceived(BControl *self, BMessage* message);
	void MessageReceived(BMessage message) {
		be_BControl_MessageReceived(_InstPtr(), message._InstPtr);
	}

	// void be_BControl_MakeFocus(BControl *self, bool focused);
	void MakeFocus(bool focused) {
		be_BControl_MakeFocus(_InstPtr(), focused);
	}

	// void be_BControl_KeyDown(BControl *self, const char* bytes, int32 numBytes);
	void KeyDown(char [] bytes, int32 numBytes) {
		be_BControl_KeyDown(_InstPtr(), bytes.ptr, numBytes);
	}

	// void be_BControl_MouseDown(BControl *self, BPoint *point);
	void MouseDown(BPoint point) {
		be_BControl_MouseDown(_InstPtr(), point._InstPtr);
	}

	// void be_BControl_MouseUp(BControl *self, BPoint *point);
	void MouseUp(BPoint point) {
		be_BControl_MouseUp(_InstPtr(), point._InstPtr);
	}

	// void be_BControl_MouseMoved(BControl *self, BPoint *point, uint32 transit, const BMessage * message);
	void MouseMoved(BPoint point, uint32 transit, BMessage message) {
		be_BControl_MouseMoved(_InstPtr(), point._InstPtr, transit, message._InstPtr);
	}

	// void be_BControl_SetLabel(BControl *self, const char* string);
	void SetLabel(char [] string) {
		be_BControl_SetLabel(_InstPtr(), toStringz(string));
	}

	// const char* be_BControl_Label(BControl *self);
	final char [] Label() {
		return fromStringz(be_BControl_Label(_InstPtr())).dup;
	}

	// void be_BControl_SetValue(BControl *self, int32 value);
	void SetValue(int32 value) {
		be_BControl_SetValue(_InstPtr(), value);
	}

	// int32 be_BControl_Value(BControl *self);
	final int32 Value() {
		return be_BControl_Value(_InstPtr());
	}

	// void be_BControl_SetEnabled(BControl *self, bool enabled);
	void SetEnabled(bool enabled) {
		be_BControl_SetEnabled(_InstPtr(), enabled);
	}

	// bool be_BControl_IsEnabled(BControl *self);
	final bool IsEnabled() {
		return be_BControl_IsEnabled(_InstPtr());
	}

	// void be_BControl_GetPreferredSize(BControl *self, float* _width, float* _height);
	void GetPreferredSize(inout float width, inout float height) {
		be_BControl_GetPreferredSize(_InstPtr(), &width, &height);
	}

	// void be_BControl_ResizeToPreferred(BControl *self);
	void ResizeToPreferred() {
		be_BControl_ResizeToPreferred(_InstPtr());
	}

	// status_t be_BControl_Invoke(BControl *self, BMessage* message);
	status_t Invoke(BMessage message = null) {
		return be_BControl_Invoke(_InstPtr(), message is null ? null : message._InstPtr);
	}

	// BHandler* be_BControl_ResolveSpecifier(BControl *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	BHandler ResolveSpecifier(BMessage message, int32 index, BMessage specifier, int32 what, char [] property) {
		return new BHandler(be_BControl_ResolveSpecifier(_InstPtr(), message._InstPtr, index, specifier._InstPtr, what, toStringz(property)), false);
	}

	// status_t be_BControl_GetSupportedSuites(BControl *self, BMessage* message);
	status_t GetSupportedSuites(BMessage msg) {
		return be_BControl_GetSupportedSuites(_InstPtr(), msg._InstPtr);
	}

	// status_t be_BControl_Perform(BControl *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BControl_Perform(_InstPtr(), d, arg);
	}

	/* Stupid multiple inheritance */
	// status_t be_BInvoker_SetMessage(BInvoker *self, BMessage* message);
	status_t SetMessage(BMessage message) {
		return be_BInvoker_SetMessage(_InstPtr(), message._InstPtr);
	}

	// BMessage* be_BInvoker_Message(BInvoker *self);
	BMessage Message() {
		return new BMessage(be_BInvoker_Message(_InstPtr()), false);
	}

	// uint32 be_BInvoker_Command(BInvoker *self);
	uint32 Command() {
		return be_BInvoker_Command(_InstPtr());
	}

	// status_t be_BInvoker_SetTarget(BInvoker *self, const BHandler* handler, const BLooper* looper);
	status_t SetTarget(BHandler handler, BLooper looper = null) {
		return be_BInvoker_SetTarget(_InstPtr(), handler is null ? null : handler._InstPtr, looper is null ? null : looper._InstPtr);
	}

	// status_t be_BInvoker_SetTarget_1(BInvoker *self, BMessenger *messenger);
	status_t SetTarget(BMessenger messenger) {
		return be_BInvoker_SetTarget_1(_InstPtr(), messenger._InstPtr);
	}

	// bool be_BInvoker_IsTargetLocal(BInvoker *self);
	bool IsTargetLocal() {
		return be_BInvoker_IsTargetLocal(_InstPtr());
	}

	// BHandler* be_BInvoker_Target(BInvoker *self, BLooper** _looper);
	BHandler Target(BLooper looper) {
		void *ptr = looper._InstPtr;
		
		return new BHandler(be_BInvoker_Target(_InstPtr(), &ptr), false);
	}

	// BMessenger * be_BInvoker_Messenger(BInvoker *self);
	BMessenger Messenger() {
		return new BMessenger(be_BInvoker_Messenger(_InstPtr()), false);
	}

	// status_t be_BInvoker_SetHandlerForReply(BInvoker *self, BHandler* handler);
	status_t SetHandlerForReply(BHandler handler) {
		return be_BInvoker_SetHandlerForReply(_InstPtr(), handler._InstPtr);
	}

	// BHandler* be_BInvoker_HandlerForReply(BInvoker *self);
	BHandler HandlerForReply() {
		return new BHandler(be_BInvoker_HandlerForReply(_InstPtr()), false);
	}

	// status_t be_BInvoker_Invoke(BInvoker *self, BMessage* message);
	status_t Invoke(BMessage message) {
		return be_BInvoker_Invoke(_InstPtr(), message._InstPtr);
	}

	// status_t be_BInvoker_InvokeNotify(BInvoker *self, BMessage* message, uint32 kind);
	status_t InvokeNotify(BMessage message, uint32 kind) {
		return be_BInvoker_InvokeNotify(_InstPtr(), message._InstPtr, kind);
	}

	// status_t be_BInvoker_SetTimeout(BInvoker *self, bigtime_t timeout);
	status_t SetTimeout(bigtime_t timeout) {
		return be_BInvoker_SetTimeout(_InstPtr(), timeout);
	}

	// bigtime_t be_BInvoker_Timeout(BInvoker *self);
	bigtime_t Timeout() {
		return be_BInvoker_Timeout(_InstPtr());
	}
	
	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


