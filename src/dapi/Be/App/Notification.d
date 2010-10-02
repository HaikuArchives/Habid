/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Notification;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Support.String;

import Be.Storage.Entry;

// import Be.Interface.Bitmap;

import tango.stdc.stringz;

// notification types
enum notification_type {
	B_INFORMATION_NOTIFICATION,
	B_IMPORTANT_NOTIFICATION,
	B_ERROR_NOTIFICATION,
	B_PROGRESS_NOTIFICATION
}

extern (C) extern {
	// BNotification* be_BNotification_ctor(void *bindInstPtr, notification_type type);
	void * be_BNotification_ctor(void *bindInstPtr, notification_type type);

	// void be_BNotification_dtor(BNotification* self);
	void be_BNotification_dtor(void* self);

	// notification_type be_BNotification_Type(BNotification *self);
	notification_type be_BNotification_Type(void *self);

	// const char* be_BNotification_Application(BNotification *self);
	char* be_BNotification_Application(void *self);

	// void be_BNotification_SetApplication(BNotification *self, const BString* app);
	void be_BNotification_SetApplication(void *self, void* app);

	// const char* be_BNotification_Title(BNotification *self);
	char* be_BNotification_Title(void *self);

	// void be_BNotification_SetTitle(BNotification *self, const BString* title);
	void be_BNotification_SetTitle(void *self, void* title);

	// const char* be_BNotification_Content(BNotification *self);
	char* be_BNotification_Content(void *self);

	// void be_BNotification_SetContent(BNotification *self, const BString* content);
	void be_BNotification_SetContent(void *self, void* content);

	// const char* be_BNotification_MessageID(BNotification *self);
	char* be_BNotification_MessageID(void *self);

	// void be_BNotification_SetMessageID(BNotification *self, const BString* id);
	void be_BNotification_SetMessageID(void *self, void* id);

	// float be_BNotification_Progress(BNotification *self);
	float be_BNotification_Progress(void *self);

	// void be_BNotification_SetProgress(BNotification *self, float progress);
	void be_BNotification_SetProgress(void *self, float progress);

	// const char* be_BNotification_OnClickApp(BNotification *self);
	char* be_BNotification_OnClickApp(void *self);

	// void be_BNotification_SetOnClickApp(BNotification *self, const BString* app);
	void be_BNotification_SetOnClickApp(void *self, void* app);

	// const entry_ref* be_BNotification_OnClickFile(BNotification *self);
	entry_ref* be_BNotification_OnClickFile(void *self);

	// status_t be_BNotification_SetOnClickFile(BNotification *self, const entry_ref* file);
	status_t be_BNotification_SetOnClickFile(void *self, entry_ref* file);

	// status_t be_BNotification_AddOnClickRef(BNotification *self, const entry_ref* ref);
	status_t be_BNotification_AddOnClickRef(void *self, entry_ref* _ref);

	// int32 be_BNotification_CountOnClickRefs(BNotification *self);
	int32 be_BNotification_CountOnClickRefs(void *self);

	// const entry_ref* be_BNotification_OnClickRefAt(BNotification *self, int32 index);
	entry_ref* be_BNotification_OnClickRefAt(void *self, int32 index);

	// status_t be_BNotification_AddOnClickArg(BNotification *self, const BString* arg);
	status_t be_BNotification_AddOnClickArg(void *self, void* arg);

	// int32 be_BNotification_CountOnClickArgs(BNotification *self);
	int32 be_BNotification_CountOnClickArgs(void *self);

	// const char* be_BNotification_OnClickArgAt(BNotification *self, int32 index);
	char* be_BNotification_OnClickArgAt(void *self, int32 index);

	// const BBitmap* be_BNotification_Icon(BNotification *self);
	void* be_BNotification_Icon(void *self);

	// status_t be_BNotification_SetIcon(BNotification *self, const BBitmap* icon);
	status_t be_BNotification_SetIcon(void *self, void* icon);

}


extern (C) {
}


interface IBNotification
{
	// notification_type be_BNotification_Type(BNotification *self);
	notification_type Type();

	// const char* be_BNotification_Application(BNotification *self);
	char [] Application();

	// void be_BNotification_SetApplication(BNotification *self, const BString& app);
	void SetApplication(BString);

	// const char* be_BNotification_Title(BNotification *self);
	char [] Title();

	// void be_BNotification_SetTitle(BNotification *self, const BString& title);
	void SetTitle(BString);

	// const char* be_BNotification_Content(BNotification *self);
	char [] Content();

	// void be_BNotification_SetContent(BNotification *self, const BString& content);
	void SetContent(BString);

	// const char* be_BNotification_MessageID(BNotification *self);
	char [] MessageID();

	// void be_BNotification_SetMessageID(BNotification *self, const BString& id);
	void SetMessageID(BString);

	// float be_BNotification_Progress(BNotification *self);
	float Progress();

	// void be_BNotification_SetProgress(BNotification *self, float progress);
	void SetProgress(float);

	// const char* be_BNotification_OnClickApp(BNotification *self);
	char [] OnClickApp();

	// void be_BNotification_SetOnClickApp(BNotification *self, const BString& app);
	void SetOnClickApp(BString);

	// const entry_ref* be_BNotification_OnClickFile(BNotification *self);
	entry_ref OnClickFile();

	// status_t be_BNotification_SetOnClickFile(BNotification *self, const entry_ref* file);
	status_t SetOnClickFile(in entry_ref);

	// status_t be_BNotification_AddOnClickRef(BNotification *self, const entry_ref* ref);
	status_t AddOnClickRef(in entry_ref);

	// int32 be_BNotification_CountOnClickRefs(BNotification *self);
	int32 CountOnClickRefs();

	// const entry_ref* be_BNotification_OnClickRefAt(BNotification *self, int32 index);
	entry_ref OnClickRefAt(int32);

	// status_t be_BNotification_AddOnClickArg(BNotification *self, const BString& arg);
	status_t AddOnClickArg(BString);

	// int32 be_BNotification_CountOnClickArgs(BNotification *self);
	int32 CountOnClickArgs();

	// const char* be_BNotification_OnClickArgAt(BNotification *self, int32 index);
	char [] OnClickArgAt(int32);

	// const BBitmap* be_BNotification_Icon(BNotification *self);
//	BBitmap Icon();

	// status_t be_BNotification_SetIcon(BNotification *self, const BBitmap* icon);
//	status_t SetIcon(BBitmap);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

final class BNotification : IBNotification
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BNotification* be_BNotification_ctor(void *bindInstPtr, notification_type type);
	this(notification_type type) {
		if(_InstPtr is null) {
			_InstPtr = be_BNotification_ctor(cast(void *)this, type);
			_OwnsPtr = true;
		}
	}

	// void be_BNotification_dtor(BNotification* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BNotification_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// notification_type be_BNotification_Type(BNotification *self);
	notification_type Type() {
		return be_BNotification_Type(_InstPtr());
	}

	// const char* be_BNotification_Application(BNotification *self);
	char [] Application() {
		return fromStringz(be_BNotification_Application(_InstPtr()));
	}

	// void be_BNotification_SetApplication(BNotification *self, const BString& app);
	void SetApplication(BString app) {
		be_BNotification_SetApplication(_InstPtr(), app._InstPtr);
	}

	// const char* be_BNotification_Title(BNotification *self);
	char [] Title() {
		return fromStringz(be_BNotification_Title(_InstPtr()));
	}

	// void be_BNotification_SetTitle(BNotification *self, const BString& title);
	void SetTitle(BString title) {
		be_BNotification_SetTitle(_InstPtr(), title._InstPtr);
	}

	// const char* be_BNotification_Content(BNotification *self);
	char [] Content() {
		return fromStringz(be_BNotification_Content(_InstPtr()));
	}

	// void be_BNotification_SetContent(BNotification *self, const BString& content);
	void SetContent(BString content) {
		be_BNotification_SetContent(_InstPtr(), content._InstPtr);
	}

	// const char* be_BNotification_MessageID(BNotification *self);
	char [] MessageID() {
		return fromStringz(be_BNotification_MessageID(_InstPtr()));
	}

	// void be_BNotification_SetMessageID(BNotification *self, const BString& id);
	void SetMessageID(BString id) {
		be_BNotification_SetMessageID(_InstPtr(), id._InstPtr);
	}

	// float be_BNotification_Progress(BNotification *self);
	float Progress() {
		return be_BNotification_Progress(_InstPtr());
	}

	// void be_BNotification_SetProgress(BNotification *self, float progress);
	void SetProgress(float progress) {
		be_BNotification_SetProgress(_InstPtr(), progress);
	}

	// const char* be_BNotification_OnClickApp(BNotification *self);
	char [] OnClickApp() {
		return fromStringz(be_BNotification_OnClickApp(_InstPtr()));
	}

	// void be_BNotification_SetOnClickApp(BNotification *self, const BString& app);
	void SetOnClickApp(BString app) {
		be_BNotification_SetOnClickApp(_InstPtr(), app._InstPtr);
	}

	// const entry_ref* be_BNotification_OnClickFile(BNotification *self);
	entry_ref OnClickFile() {
		return *be_BNotification_OnClickFile(_InstPtr());
	}

	// status_t be_BNotification_SetOnClickFile(BNotification *self, const entry_ref* file);
	status_t SetOnClickFile(in entry_ref file) {
		return be_BNotification_SetOnClickFile(_InstPtr(), &file);
	}

	// status_t be_BNotification_AddOnClickRef(BNotification *self, const entry_ref* ref);
	status_t AddOnClickRef(in entry_ref _ref) {
		return be_BNotification_AddOnClickRef(_InstPtr(), &_ref);
	}

	// int32 be_BNotification_CountOnClickRefs(BNotification *self);
	int32 CountOnClickRefs() {
		return be_BNotification_CountOnClickRefs(_InstPtr());
	}

	// const entry_ref* be_BNotification_OnClickRefAt(BNotification *self, int32 index);
	entry_ref OnClickRefAt(int32 index) {
		return *be_BNotification_OnClickRefAt(_InstPtr(), index);
	}

	// status_t be_BNotification_AddOnClickArg(BNotification *self, const BString& arg);
	status_t AddOnClickArg(BString arg) {
		return be_BNotification_AddOnClickArg(_InstPtr(), arg._InstPtr);
	}

	// int32 be_BNotification_CountOnClickArgs(BNotification *self);
	int32 CountOnClickArgs() {
		return be_BNotification_CountOnClickArgs(_InstPtr());
	}

	// const char* be_BNotification_OnClickArgAt(BNotification *self, int32 index);
	char [] OnClickArgAt(int32 index) {
		return fromStringz(be_BNotification_OnClickArgAt(_InstPtr(), index));
	}
/*
	// const BBitmap* be_BNotification_Icon(BNotification *self);
	BBitmap Icon() {
		return new BBitmap(be_BNotification_Icon(_InstPtr()), false);
	}

	// status_t be_BNotification_SetIcon(BNotification *self, const BBitmap* icon);
	status_t SetIcon(BBitmap icon) {
		return be_BNotification_SetIcon(_InstPtr(), icon._InstPtr);
	}
*/
	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


