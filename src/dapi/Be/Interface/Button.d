/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Button;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Handler;
import Be.App.Message;

import Be.Interface.View;

import Be.Interface.Rect;
import Be.Interface.Point;
import Be.Interface.Size;
import Be.Interface.Control;

import tango.stdc.stringz;

extern (C) extern {
	// BButtonProxy * be_BButton_ctor(void *bindInstPtr, BRect *frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags);
	void * be_BButton_ctor(void *bindInstPtr, void *frame,  char* name,  char* label, void* message, uint32 resizingMode, uint32 flags);

	// BButtonProxy * be_BButton_ctor_1(void *bindInstPtr, const char* name, const char* label, BMessage * message, uint32 flags);
	void * be_BButton_ctor_1(void *bindInstPtr, char* name,  char* label, void * message, uint32 flags);

	// BButtonProxy * be_BButton_ctor_2(void *bindInstPtr, const char* label, BMessage* message);
	void * be_BButton_ctor_2(void *bindInstPtr, char* label, void* message);

	// BButtonProxy * be_BButton_ctor_3(void *bindInstPtr, BMessage * archive);
	void * be_BButton_ctor_3(void *bindInstPtr, void * archive);

	// void be_BButton_dtor(BButton* self);
	void be_BButton_dtor(void* self);

	//BArchivable* be_BButton_Instantiate_static(BMessage* archive)
	void* be_BButton_Instantiate_static(void* archive);

	// status_t be_BButton_Archive(BButtonProxy *self, BMessage* archive, bool deep);
	status_t be_BButton_Archive(void *self, void* archive, bool deep);

	// void be_BButton_Draw(BButtonProxy *self, BRect *updateRect);
	void be_BButton_Draw(void *self, void *updateRect);

	// void be_BButton_MouseDown(BButtonProxy *self, BPoint *point);
	void be_BButton_MouseDown(void *self, void *point);

	// void be_BButton_AttachedToWindow(BButtonProxy *self);
	void be_BButton_AttachedToWindow(void *self);

	// void be_BButton_KeyDown(BButtonProxy *self, const char* bytes, int32 numBytes);
	void be_BButton_KeyDown(void *self, char* bytes, int32 numBytes);

	// void be_BButton_MakeDefault(BButtonProxy *self, bool flag);
	void be_BButton_MakeDefault(void *self, bool flag);

	// void be_BButton_SetLabel(BButtonProxy *self, const char* string);
	void be_BButton_SetLabel(void *self, char* string);

	// bool be_BButton_IsDefault(BButtonProxy *self);
	bool be_BButton_IsDefault(void *self);

	// void be_BButton_MessageReceived(BButtonProxy *self, BMessage* message);
	void be_BButton_MessageReceived(void *self, void* message);

	// void be_BButton_WindowActivated(BButtonProxy *self, bool active);
	void be_BButton_WindowActivated(void *self, bool active);

	// void be_BButton_MouseMoved(BButtonProxy *self, BPoint *point, uint32 transit, const BMessage* message);
	void be_BButton_MouseMoved(void *self, void *point, uint32 transit,  void* message);

	// void be_BButton_MouseUp(BButtonProxy *self, BPoint *point);
	void be_BButton_MouseUp(void *self, void *point);

	// void be_BButton_DetachedFromWindow(BButtonProxy *self);
	void be_BButton_DetachedFromWindow(void *self);

	// void be_BButton_SetValue(BButtonProxy *self, int32 value);
	void be_BButton_SetValue(void *self, int32 value);

	// void be_BButton_GetPreferredSize(BButtonProxy *self, float* _width, float* _height);
	void be_BButton_GetPreferredSize(void *self, float* _width, float* _height);

	// void be_BButton_ResizeToPreferred(BButtonProxy *self);
	void be_BButton_ResizeToPreferred(void *self);

	// status_t be_BButton_Invoke(BButtonProxy *self, BMessage* message);
	status_t be_BButton_Invoke(void *self, void* message);

	// void be_BButton_FrameMoved(BButtonProxy *self, BPoint *newLocation);
	void be_BButton_FrameMoved(void *self, void *newLocation);

	// void be_BButton_FrameResized(BButtonProxy *self, float width, float height);
	void be_BButton_FrameResized(void *self, float width, float height);

	// void be_BButton_MakeFocus(BButtonProxy *self, bool focused);
	void be_BButton_MakeFocus(void *self, bool focused);

	// void be_BButton_AllAttached(BButtonProxy *self);
	void be_BButton_AllAttached(void *self);

	// void be_BButton_AllDetached(BButtonProxy *self);
	void be_BButton_AllDetached(void *self);

	// BHandler* be_BButton_ResolveSpecifier(BButtonProxy *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	BHandler* be_BButton_ResolveSpecifier(void *self, void* message, int32 index, void* specifier, int32 what,  char* property);

	// status_t be_BButton_GetSupportedSuites(BButtonProxy *self, BMessage* message);
	status_t be_BButton_GetSupportedSuites(void *self, void* message);

	// status_t be_BButton_Perform(BButtonProxy *self, perform_code d, void* arg);
	status_t be_BButton_Perform(void *self, perform_code d, void* arg);

	// void be_BButton_InvalidateLayout(BButtonProxy *self, bool descendants);
	void be_BButton_InvalidateLayout(void *self, bool descendants);

	// BSize * be_BButton_MinSize(BButtonProxy *self);
	void * be_BButton_MinSize(void *self);

	// BSize * be_BButton_MaxSize(BButtonProxy *self);
	void * be_BButton_MaxSize(void *self);

	// BSize * be_BButton_PreferredSize(BButtonProxy *self);
	void * be_BButton_PreferredSize(void *self);

}


extern (C) {
	status_t bind_BButton_Archive(void *bindInstPtr, BMessage* archive, bool deep) {
		assert(false, "bind_BButton_Archive(void *bindInstPtr, BMessage* archive, bool deep) Unimplemented");
	}

	void bind_BButton_Draw(void *bindInstPtr, void *updateRect) {
		(cast(BButton)bindInstPtr).Draw(new BRect(updateRect, false));
	}

	void bind_BButton_MouseDown(void *bindInstPtr, void *point) {
		(cast(BButton)bindInstPtr).MouseDown(new BPoint(point, false));
	}

	void bind_BButton_AttachedToWindow(void *bindInstPtr) {
		(cast(BButton)bindInstPtr).AttachedToWindow();
	}

	void bind_BButton_KeyDown(void *bindInstPtr, char* bytes, int32 numBytes) {
		(cast(BButton)bindInstPtr).KeyDown(bytes[0..numBytes], numBytes);
	}

	void bind_BButton_MakeDefault(void *bindInstPtr, bool flag) {
		(cast(BButton)bindInstPtr).MakeDefault(flag);
	}

	void bind_BButton_SetLabel(void *bindInstPtr, char* string) {
		(cast(BButton)bindInstPtr).SetLabel(fromStringz(string));
	}

	void bind_BButton_MessageReceived(void *bindInstPtr, void *message) {
		(cast(BButton)bindInstPtr).MessageReceived(new BMessage(message, false));
	}

	void bind_BButton_WindowActivated(void *bindInstPtr, bool active) {
		(cast(BButton)bindInstPtr).WindowActivated(active);
	}

	void bind_BButton_MouseMoved(void *bindInstPtr, void *point, uint32 transit,  void* message) {
		(cast(BButton)bindInstPtr).MouseMoved(new BPoint(point, false), transit, new BMessage(message, false));
	}

	void bind_BButton_MouseUp(void *bindInstPtr, void *point) {
		(cast(BButton)bindInstPtr).MouseUp(new BPoint(point, false));
	}

	void bind_BButton_DetachedFromWindow(void *bindInstPtr) {
		(cast(BButton)bindInstPtr).DetachedFromWindow();
	}

	void bind_BButton_SetValue(void *bindInstPtr, int32 value) {
		(cast(BButton)bindInstPtr).SetValue(value);
	}

	void bind_BButton_GetPreferredSize(void *bindInstPtr, float* _width, float* _height) {
		(cast(BButton)bindInstPtr).GetPreferredSize(*_width, *_height);
	}

	void bind_BButton_ResizeToPreferred(void *bindInstPtr) {
		(cast(BButton)bindInstPtr).ResizeToPreferred();
	}

	status_t bind_BButton_Invoke(void *bindInstPtr, void* message) {
		return (cast(BButton)bindInstPtr).Invoke(new BMessage(message, false));
	}

	void bind_BButton_FrameMoved(void *bindInstPtr, void *newLocation) {
		(cast(BButton)bindInstPtr).FrameMoved(new BPoint(newLocation, false));
	}

	void bind_BButton_FrameResized(void *bindInstPtr, float width, float height) {
		(cast(BButton)bindInstPtr).FrameResized(width, height);
	}

	void bind_BButton_MakeFocus(void *bindInstPtr, bool focused) {
		(cast(BButton)bindInstPtr).MakeFocus(focused);
	}

	void bind_BButton_AllAttached(void *bindInstPtr) {
		(cast(BButton)bindInstPtr).AllAttached();
	}

	void bind_BButton_AllDetached(void *bindInstPtr) {
		(cast(BButton)bindInstPtr).AllDetached();
	}

	BHandler* bind_BButton_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 what,  char* property) {
		assert(false, "bind_BButton_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property) Unimplemented");
	}

	status_t bind_BButton_GetSupportedSuites(void *bindInstPtr, BMessage* message) {
		assert(false, "bind_BButton_GetSupportedSuites(void *bindInstPtr, BMessage* message) Unimplemented");
	}

	status_t bind_BButton_Perform(void *bindInstPtr, perform_code d, void* arg) {
		assert(false, "bind_BButton_Perform(void *bindInstPtr, perform_code d, void* arg) Unimplemented");
	}

	void bind_BButton_InvalidateLayout(void *bindInstPtr, bool descendants) {
		assert(false, "bind_BButton_InvalidateLayout(void *bindInstPtr, bool descendants) Unimplemented");
	}

	BSize * bind_BButton_MinSize(void *bindInstPtr) {
		assert(false, "bind_BButton_MinSize(void *bindInstPtr) Unimplemented");
	}

	BSize * bind_BButton_MaxSize(void *bindInstPtr) {
		assert(false, "bind_BButton_MaxSize(void *bindInstPtr) Unimplemented");
	}

	BSize * bind_BButton_PreferredSize(void *bindInstPtr) {
		assert(false, "bind_BButton_PreferredSize(void *bindInstPtr) Unimplemented");
	}

}


interface IBButton
{
/*
	// BArchivable* be_BButton_Instantiate(BButton *self, BMessage* archive);
	BArchivable* Instantiate();

	// status_t be_BButton_Archive(BButton *self, BMessage* archive, bool deep);
	status_t Archive();

	// void be_BButton_Draw(BButton *self, BRect *updateRect);
	void Draw();

	// void be_BButton_MouseDown(BButton *self, BPoint *point);
	void MouseDown();

	// void be_BButton_AttachedToWindow(BButton *self);
	void AttachedToWindow();

	// void be_BButton_KeyDown(BButton *self, const char* bytes, int32 numBytes);
	void KeyDown();

	// void be_BButton_MakeDefault(BButton *self, bool flag);
	void MakeDefault();

	// void be_BButton_SetLabel(BButton *self, const char* string);
	void SetLabel();

	// bool be_BButton_IsDefault(BButton *self);
	final bool IsDefault();

	// void be_BButton_MessageReceived(BButton *self, BMessage* message);
	void MessageReceived();

	// void be_BButton_WindowActivated(BButton *self, bool active);
	void WindowActivated();

	// void be_BButton_MouseMoved(BButton *self, BPoint *point, uint32 transit, const BMessage* message);
	void MouseMoved();

	// void be_BButton_MouseUp(BButton *self, BPoint *point);
	void MouseUp();

	// void be_BButton_DetachedFromWindow(BButton *self);
	void DetachedFromWindow();

	// void be_BButton_SetValue(BButton *self, int32 value);
	void SetValue();

	// void be_BButton_GetPreferredSize(BButton *self, float* _width, float* _height);
	void GetPreferredSize();

	// void be_BButton_ResizeToPreferred(BButton *self);
	void ResizeToPreferred();

	// status_t be_BButton_Invoke(BButton *self, BMessage* message);
	status_t Invoke();

	// void be_BButton_FrameMoved(BButton *self, BPoint *newLocation);
	void FrameMoved();

	// void be_BButton_FrameResized(BButton *self, float width, float height);
	void FrameResized();

	// void be_BButton_MakeFocus(BButton *self, bool focused);
	void MakeFocus();

	// void be_BButton_AllAttached(BButton *self);
	void AllAttached();

	// void be_BButton_AllDetached(BButton *self);
	void AllDetached();

	// BHandler* be_BButton_ResolveSpecifier(BButton *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	BHandler* ResolveSpecifier();

	// status_t be_BButton_GetSupportedSuites(BButton *self, BMessage* message);
	status_t GetSupportedSuites();

	// status_t be_BButton_Perform(BButton *self, perform_code d, void* arg);
	status_t Perform();

	// void be_BButton_InvalidateLayout(BButton *self, bool descendants);
	void InvalidateLayout();

	// BSize * be_BButton_MinSize(BButton *self);
	BSize MinSize();

	// BSize * be_BButton_MaxSize(BButton *self);
	BSize MaxSize();

	// BSize * be_BButton_PreferredSize(BButton *self);
	BSize PreferredSize();
*/
	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BButton : BControl, IBButton
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObjectInherited!());
public:
	// BButtonProxy * be_BButton_ctor(void *bindInstPtr, BRect *frame, const char* name, const char* label, BMessage* message, uint32 resizingMode, uint32 flags);
	this(BRect frame, char [] name, char [] label, BMessage message, uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP, uint32 flags = B_WILL_DRAW | B_NAVIGABLE | B_FULL_UPDATE_ON_RESIZE) {
		message._OwnsPtr = false;
		if(_InstPtr is null) {
			_InstPtr = be_BButton_ctor(cast(void *)this, frame._InstPtr, toStringz(name), toStringz(label), message._InstPtr, resizingMode, flags);
			_OwnsPtr = true;
		}
		
		super(frame, name, label, message, resizingMode, flags);
	}

	// BButtonProxy * be_BButton_ctor_1(void *bindInstPtr, const char* name, const char* label, BMessage * message, uint32 flags);
	this(char [] name, char [] label, BMessage message, uint32 flags = B_WILL_DRAW | B_NAVIGABLE | B_FULL_UPDATE_ON_RESIZE) {
		message._OwnsPtr = false;
		if(_InstPtr is null) {
			_InstPtr = be_BButton_ctor_1(cast(void *)this, toStringz(name), toStringz(label), message._InstPtr, flags);
			_OwnsPtr = true;
		}
		
		super(name, label, message, flags);
	}

	// BButtonProxy * be_BButton_ctor_2(void *bindInstPtr, const char* label, BMessage* message);
	this(char [] label, BMessage message) {
		message._OwnsPtr = false;
		if(_InstPtr is null) {
			_InstPtr = be_BButton_ctor_2(cast(void *)this, toStringz(label), message._InstPtr);
			_OwnsPtr = true;
		}
		super(null, label, message, B_WILL_DRAW | B_NAVIGABLE | B_FULL_UPDATE_ON_RESIZE);
	}

	// BButtonProxy * be_BButton_ctor_3(void *bindInstPtr, BMessage * archive);
	this(BMessage archive) {
		if(_InstPtr is null) {
			_InstPtr = be_BButton_ctor_3(cast(void *)this, archive._InstPtr);
			_OwnsPtr = true;
		}
		
		super(archive);
	}

	// void be_BButton_dtor(BButton* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BButton_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}
/*
	//BArchivable* be_BButton_Instantiate_static(BMessage* archive)
	static BArchivable* Instantiate(BMessage* archive)
	{
	}
*/
	// status_t be_BButton_Archive(BButton *self, BMessage* archive, bool deep);
	status_t Archive(BMessage archive, bool deep = true) {
		return be_BButton_Archive(_InstPtr(), archive._InstPtr, deep);
	}

	// void be_BButton_Draw(BButton *self, BRect *updateRect);
	void Draw(BRect updateRect) {
		be_BButton_Draw(_InstPtr(), updateRect._InstPtr);
	}

	// void be_BButton_MouseDown(BButton *self, BPoint *point);
	void MouseDown(BPoint point) {
		be_BButton_MouseDown(_InstPtr(), point._InstPtr);
	}

	// void be_BButton_AttachedToWindow(BButton *self);
	void AttachedToWindow() {
		be_BButton_AttachedToWindow(_InstPtr());
	}

	// void be_BButton_KeyDown(BButton *self, const char* bytes, int32 numBytes);
	void KeyDown(char [] bytes, int32 numBytes) {
		be_BButton_KeyDown(_InstPtr(), bytes.ptr, numBytes);
	}

	// void be_BButton_MakeDefault(BButton *self, bool flag);
	void MakeDefault(bool flag) {
		be_BButton_MakeDefault(_InstPtr(), flag);
	}

	// void be_BButton_SetLabel(BButton *self, const char* string);
	void SetLabel(char [] string) {
		be_BButton_SetLabel(_InstPtr(), toStringz(string));
	}

	// bool be_BButton_IsDefault(BButton *self);
	final bool IsDefault() {
		return be_BButton_IsDefault(_InstPtr());
	}

	// void be_BButton_MessageReceived(BButton *self, BMessage* message);
	void MessageReceived(BMessage message) {
		be_BButton_MessageReceived(_InstPtr(), message._InstPtr);
	}

	// void be_BButton_WindowActivated(BButton *self, bool active);
	void WindowActivated(bool active) {
		be_BButton_WindowActivated(_InstPtr(), active);
	}

	// void be_BButton_MouseMoved(BButton *self, BPoint *point, uint32 transit, const BMessage* message);
	void MouseMoved(BPoint point, uint32 transit, BMessage message) {
		be_BButton_MouseMoved(_InstPtr(), point._InstPtr, transit, message._InstPtr);
	}

	// void be_BButton_MouseUp(BButton *self, BPoint *point);
	void MouseUp(BPoint point) {
		be_BButton_MouseUp(_InstPtr(), point._InstPtr);
	}

	// void be_BButton_DetachedFromWindow(BButton *self);
	void DetachedFromWindow() {
		be_BButton_DetachedFromWindow(_InstPtr());
	}

	// void be_BButton_SetValue(BButton *self, int32 value);
	void SetValue(int32 value) {
		be_BButton_SetValue(_InstPtr(), value);
	}

	// void be_BButton_GetPreferredSize(BButton *self, float* _width, float* _height);
	void GetPreferredSize(inout float width, inout float height) {
		be_BButton_GetPreferredSize(_InstPtr(), &width, &height);
	}

	// void be_BButton_ResizeToPreferred(BButton *self);
	void ResizeToPreferred() {
		be_BButton_ResizeToPreferred(_InstPtr());
	}

	// status_t be_BButton_Invoke(BButton *self, BMessage* message);
	status_t Invoke(BMessage message) {
		return be_BButton_Invoke(_InstPtr(), message._InstPtr);
	}

	// void be_BButton_FrameMoved(BButton *self, BPoint *newLocation);
	void FrameMoved(BPoint newLocation) {
		be_BButton_FrameMoved(_InstPtr(), newLocation._InstPtr);
	}

	// void be_BButton_FrameResized(BButton *self, float width, float height);
	void FrameResized(float width, float height) {
		be_BButton_FrameResized(_InstPtr(), width, height);
	}

	// void be_BButton_MakeFocus(BButton *self, bool focused);
	void MakeFocus(bool focused) {
		be_BButton_MakeFocus(_InstPtr(), focused);
	}

	// void be_BButton_AllAttached(BButton *self);
	void AllAttached() {
		be_BButton_AllAttached(_InstPtr());
	}

	// void be_BButton_AllDetached(BButton *self);
	void AllDetached() {
		be_BButton_AllDetached(_InstPtr());
	}

	// BHandler* be_BButton_ResolveSpecifier(BButton *self, BMessage* message, int32 index, BMessage* specifier, int32 what, const char* property);
	BHandler ResolveSpecifier(BMessage msg, int32 index, BMessage specifier, int32 what, char [] property) {
		return new BHandler(be_BButton_ResolveSpecifier(_InstPtr(), msg._InstPtr, index, specifier._InstPtr, what, toStringz(property)), false);
	}

	// status_t be_BButton_GetSupportedSuites(BButton *self, BMessage* message);
	status_t GetSupportedSuites(BMessage message) {
		return be_BButton_GetSupportedSuites(_InstPtr(), message._InstPtr);
	}

	// status_t be_BButton_Perform(BButton *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BButton_Perform(_InstPtr(), d, arg);
	}

	// void be_BButton_InvalidateLayout(BButton *self, bool descendants);
	void InvalidateLayout(bool descendants) {
		be_BButton_InvalidateLayout(_InstPtr(), descendants);
	}

	// BSize * be_BButton_MinSize(BButton *self);
	BSize MinSize() {
		return new BSize(be_BButton_MinSize(_InstPtr()), false);
	}

	// BSize * be_BButton_MaxSize(BButton *self);
	BSize MaxSize() {
		return new BSize(be_BButton_MaxSize(_InstPtr()), false);
	}

	// BSize * be_BButton_PreferredSize(BButton *self);
	BSize PreferredSize() {
		return new BSize(be_BButton_PreferredSize(_InstPtr()), false);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


