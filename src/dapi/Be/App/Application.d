/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Application;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;
import Be.App.Looper;
import Be.App.Handler;
import Be.App.Cursor;

import Be.Support.Archivable;

import Be.Kernel.OS;

import tango.stdc.stringz;
import tango.stdc.stdlib;

struct app_info { }

extern (C) extern {
	// BApplicationProxy * be_BApplication_ctor(void *bindInstPtr, const char* signature);
	void * be_BApplication_ctor(void *bindInstPtr, char* signature);

	// BApplicationProxy * be_BApplication_ctor_1(void *bindInstPtr, const char* signature, status_t* error);
	void * be_BApplication_ctor_1(void *bindInstPtr, char* signature, status_t* error);

	// BApplicationProxy * be_BApplication_ctor_2(void *bindInstPtr, BMessage* data);
	void * be_BApplication_ctor_2(void *bindInstPtr, void* data);

	// void be_BApplication_dtor(BApplication* self);
	void be_BApplication_dtor(void* self);

	//BArchivable* be_BApplication_Instantiate_static(BMessage* data)
	void* be_BApplication_Instantiate_static(void* data);

	// status_t be_BApplication_Archive(BApplicationProxy *self, BMessage* data, bool deep);
	status_t be_BApplication_Archive(void *self, void* data, bool deep);

	// status_t be_BApplication_InitCheck(BApplicationProxy *self);
	status_t be_BApplication_InitCheck(void *self);

	// thread_id be_BApplication_Run(BApplicationProxy *self);
	thread_id be_BApplication_Run(void *self);

	// void be_BApplication_Quit(BApplicationProxy *self);
	void be_BApplication_Quit(void *self);

	// bool be_BApplication_QuitRequested(BApplicationProxy *self);
	bool be_BApplication_QuitRequested(void *self);

	// void be_BApplication_Pulse(BApplicationProxy *self);
	void be_BApplication_Pulse(void *self);

	// void be_BApplication_ReadyToRun(BApplicationProxy *self);
	void be_BApplication_ReadyToRun(void *self);

	// void be_BApplication_MessageReceived(BApplicationProxy *self, BMessage* message);
	void be_BApplication_MessageReceived(void *self, void* message);

	// void be_BApplication_ArgvReceived(BApplicationProxy *self, int32 argc, char** argv);
	void be_BApplication_ArgvReceived(void *self, int32 argc, char** argv);

	// void be_BApplication_AppActivated(BApplicationProxy *self, bool active);
	void be_BApplication_AppActivated(void *self, bool active);

	// void be_BApplication_RefsReceived(BApplicationProxy *self, BMessage* message);
	void be_BApplication_RefsReceived(void *self, void* message);

	// void be_BApplication_AboutRequested(BApplicationProxy *self);
	void be_BApplication_AboutRequested(void *self);

	// BHandler* be_BApplication_ResolveSpecifier(BApplicationProxy *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	void* be_BApplication_ResolveSpecifier(void *self, void* message, int32 index, void* specifier, int32 form,  char* property);

	// void be_BApplication_ShowCursor(BApplicationProxy *self);
	void be_BApplication_ShowCursor(void *self);

	// void be_BApplication_HideCursor(BApplicationProxy *self);
	void be_BApplication_HideCursor(void *self);

	// void be_BApplication_ObscureCursor(BApplicationProxy *self);
	void be_BApplication_ObscureCursor(void *self);

	// bool be_BApplication_IsCursorHidden(BApplicationProxy *self);
	bool be_BApplication_IsCursorHidden(void *self);

	// void be_BApplication_SetCursor(BApplicationProxy *self, const void* cursor);
	void be_BApplication_SetCursor(void *self, void* cursor);

	// void be_BApplication_SetCursor_1(BApplicationProxy *self, const BCursor* cursor, bool sync);
	void be_BApplication_SetCursor_1(void *self, void* cursor, bool sync);

	// int32 be_BApplication_CountWindows(BApplicationProxy *self);
	int32 be_BApplication_CountWindows(void *self);

	// BWindow * be_BApplication_WindowAt(BApplicationProxy *self, int32 index);
	void * be_BApplication_WindowAt(void *self, int32 index);

	// int32 be_BApplication_CountLoopers(BApplicationProxy *self);
	int32 be_BApplication_CountLoopers(void *self);

	// BLooper * be_BApplication_LooperAt(BApplicationProxy *self, int32 index);
	void * be_BApplication_LooperAt(void *self, int32 index);

	// bool be_BApplication_IsLaunching(BApplicationProxy *self);
	bool be_BApplication_IsLaunching(void *self);

	// status_t be_BApplication_GetAppInfo(BApplicationProxy *self, app_info* info);
	status_t be_BApplication_GetAppInfo(void *self, app_info* info);

	//BResources * be_BApplication_AppResources_static()
	void * be_BApplication_AppResources_static();

	// void be_BApplication_DispatchMessage(BApplicationProxy *self, BMessage* message, BHandler* handler);
	void be_BApplication_DispatchMessage(void *self, void* message, void* handler);

	// void be_BApplication_SetPulseRate(BApplicationProxy *self, bigtime_t rate);
	void be_BApplication_SetPulseRate(void *self, bigtime_t rate);

	// status_t be_BApplication_GetSupportedSuites(BApplicationProxy *self, BMessage* data);
	status_t be_BApplication_GetSupportedSuites(void *self, void* data);

	// status_t be_BApplication_Perform(BApplicationProxy *self, perform_code d, void* arg);
	status_t be_BApplication_Perform(void *self, perform_code d, void* arg);

}


extern (C) {
	thread_id bind_BApplication_Run(void *bindInstPtr) {
		return (cast(BApplication)bindInstPtr).Run();
	}

	void bind_BApplication_Quit(void *bindInstPtr) {
		(cast(BApplication)bindInstPtr).Quit();
	}

	bool bind_BApplication_QuitRequested(void *bindInstPtr) {
		return (cast(BApplication)bindInstPtr).QuitRequested();
	}

	void bind_BApplication_Pulse(void *bindInstPtr) {
		(cast(BApplication)bindInstPtr).Pulse();
	}

	void bind_BApplication_ReadyToRun(void *bindInstPtr) {
		(cast(BApplication)bindInstPtr).ReadyToRun();
	}

	void bind_BApplication_MessageReceived(void *bindInstPtr, void* message) {
		(cast(BApplication)bindInstPtr).MessageReceived(new BMessage(message, false));
	}

	void bind_BApplication_ArgvReceived(void *bindInstPtr, int32 argc, char** argv) {
		char [][] args;
		for(int i = 0; i < argc; i++)
			args ~= fromStringz(argv[i]).dup;
			
		(cast(BApplication)bindInstPtr).ArgvReceived(argc, args);
	}

	void bind_BApplication_AppActivated(void *bindInstPtr, bool active) {
		(cast(BApplication)bindInstPtr).AppActivated(active);
	}

	void bind_BApplication_RefsReceived(void *bindInstPtr, void* message) {
		(cast(BApplication)bindInstPtr).RefsReceived(new BMessage(message, false));
	}

	void bind_BApplication_AboutRequested(void *bindInstPtr) {
		(cast(BApplication)bindInstPtr).AboutRequested();
	}

	void *bind_BApplication_ResolveSpecifier(void *bindInstPtr, void* message, int32 index, void* specifier, int32 form,  char* property) {
		return (cast(BApplication)bindInstPtr).ResolveSpecifier(new BMessage(message, false), index, new BMessage(specifier, false), form, fromStringz(property))._InstPtr;
	}

	void bind_BApplication_DispatchMessage(void *bindInstPtr, void* message, void* handler) {
		(cast(BApplication)bindInstPtr).DispatchMessage(new BMessage(message, false), new BHandler(handler, false));
	}

	status_t bind_BApplication_GetSupportedSuites(void *bindInstPtr, void* data) {
		return (cast(BApplication)bindInstPtr).GetSupportedSuites(new BMessage(data, false));
	}

	status_t bind_BApplication_Perform(void *bindInstPtr, perform_code d, void* arg) {
		return (cast(BApplication)bindInstPtr).Perform(d, arg);
	}

}


interface IBApplication
{
	// BArchivable* be_BApplication_Instantiate(BApplication *self, BMessage* data);
//	BArchivable* Instantiate();

	// status_t be_BApplication_Archive(BApplication *self, BMessage* data, bool deep);
	status_t Archive(BMessage, bool);

	// status_t be_BApplication_InitCheck(BApplication *self);
	status_t InitCheck();

	// thread_id be_BApplication_Run(BApplication *self);
	thread_id Run();

	// void be_BApplication_Quit(BApplication *self);
	void Quit();

	// bool be_BApplication_QuitRequested(BApplication *self);
	bool QuitRequested();

	// void be_BApplication_Pulse(BApplication *self);
	void Pulse();

	// void be_BApplication_ReadyToRun(BApplication *self);
	void ReadyToRun();

	// void be_BApplication_MessageReceived(BApplication *self, BMessage* message);
	void MessageReceived(BMessage);

	// void be_BApplication_ArgvReceived(BApplication *self, int32 argc, char** argv);
	void ArgvReceived(int32, char [][]);

	// void be_BApplication_AppActivated(BApplication *self, bool active);
	void AppActivated(bool);

	// void be_BApplication_RefsReceived(BApplication *self, BMessage* message);
	void RefsReceived(BMessage);

	// void be_BApplication_AboutRequested(BApplication *self);
	void AboutRequested();

	// BHandler* be_BApplication_ResolveSpecifier(BApplication *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage, int32, BMessage, int32, char []);

	// void be_BApplication_ShowCursor(BApplication *self);
	void ShowCursor();

	// void be_BApplication_HideCursor(BApplication *self);
	void HideCursor();

	// void be_BApplication_ObscureCursor(BApplication *self);
	void ObscureCursor();

	// bool be_BApplication_IsCursorHidden(BApplication *self);
	bool IsCursorHidden();

	// void be_BApplication_SetCursor(BApplication *self, const void* cursor);
	void SetCursor(void []);

	// void be_BApplication_SetCursor_1(BApplication *self, const BCursor* cursor, bool sync);
	void SetCursor(BCursor, bool);

	// int32 be_BApplication_CountWindows(BApplication *self);
	int32 CountWindows();

	// BWindow * be_BApplication_WindowAt(BApplication *self, int32 index);
//	BWindow WindowAt(int32);

	// int32 be_BApplication_CountLoopers(BApplication *self);
	int32 CountLoopers();

	// BLooper * be_BApplication_LooperAt(BApplication *self, int32 index);
	BLooper LooperAt(int32);

	// bool be_BApplication_IsLaunching(BApplication *self);
	bool IsLaunching();

	// status_t be_BApplication_GetAppInfo(BApplication *self, app_info* info);
	status_t GetAppInfo(inout app_info);

	// BResources * be_BApplication_AppResources(BApplication *self);
//	BResources AppResources();

	// void be_BApplication_DispatchMessage(BApplication *self, BMessage* message, BHandler* handler);
	void DispatchMessage(BMessage, BHandler);

	// void be_BApplication_SetPulseRate(BApplication *self, bigtime_t rate);
	void SetPulseRate(bigtime_t);

	// status_t be_BApplication_GetSupportedSuites(BApplication *self, BMessage* data);
	status_t GetSupportedSuites(BMessage);

	// status_t be_BApplication_Perform(BApplication *self, perform_code d, void* arg);
	status_t Perform(perform_code, void *);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BApplication : IBApplication
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BApplicationProxy * be_BApplication_ctor(void *bindInstPtr, const char* signature);
	this(char [] signature) {
		if(_InstPtr is null) {
			_InstPtr = be_BApplication_ctor(cast(void *)this, toStringz(signature));
			_OwnsPtr = true;
		}
	}

	// BApplicationProxy * be_BApplication_ctor_1(void *bindInstPtr, const char* signature, status_t* error);
	this(char [] signature, inout status_t error) {
		if(_InstPtr is null) {
			_InstPtr = be_BApplication_ctor_1(cast(void *)this, toStringz(signature), &error);
			_OwnsPtr = true;
		}
	}

	// BApplicationProxy * be_BApplication_ctor_2(void *bindInstPtr, BMessage* data);
	this(BMessage data) {
		if(_InstPtr is null) {
			_InstPtr = be_BApplication_ctor_2(cast(void *)this, data._InstPtr);
			_OwnsPtr = true;
		}
	}

	// void be_BApplication_dtor(BApplication* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BApplication_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	//BArchivable* be_BApplication_Instantiate_static(BMessage* data)
	static IBArchivable Instantiate(BMessage* data)
	{
		return new BArchivable(be_BApplication_Instantiate_static(data._InstPtr), true);
	}

	// status_t be_BApplication_Archive(BApplication *self, BMessage* data, bool deep);
	status_t Archive(BMessage data, bool deep = true) {
		return be_BApplication_Archive(_InstPtr(), data._InstPtr, deep);
	}

	// status_t be_BApplication_InitCheck(BApplication *self);
	status_t InitCheck() {
		return be_BApplication_InitCheck(_InstPtr());
	}

	// thread_id be_BApplication_Run(BApplication *self);
	thread_id Run() {
		return be_BApplication_Run(_InstPtr());
	}

	// void be_BApplication_Quit(BApplication *self);
	void Quit() {
		be_BApplication_Quit(_InstPtr());
	}

	// bool be_BApplication_QuitRequested(BApplication *self);
	bool QuitRequested() {
		return be_BApplication_QuitRequested(_InstPtr());
	}

	// void be_BApplication_Pulse(BApplication *self);
	void Pulse() {
		be_BApplication_Pulse(_InstPtr());
	}

	// void be_BApplication_ReadyToRun(BApplication *self);
	void ReadyToRun() {
		be_BApplication_ReadyToRun(_InstPtr());
	}

	// void be_BApplication_MessageReceived(BApplication *self, BMessage* message);
	void MessageReceived(BMessage message) {
		be_BApplication_MessageReceived(_InstPtr(), message._InstPtr);
	}

	// void be_BApplication_ArgvReceived(BApplication *self, int32 argc, char** argv);
	void ArgvReceived(int32 argc, char [][] argv) {
		char **args = cast(char **)malloc(argc + 1);
		
		foreach(argno, arg; argv)
			args[argno] = toStringz(arg);
			
		be_BApplication_ArgvReceived(_InstPtr(), argc, args);
	}

	// void be_BApplication_AppActivated(BApplication *self, bool active);
	void AppActivated(bool active) {
		be_BApplication_AppActivated(_InstPtr(), active);
	}

	// void be_BApplication_RefsReceived(BApplication *self, BMessage* message);
	void RefsReceived(BMessage message) {
		be_BApplication_RefsReceived(_InstPtr(), message._InstPtr);
	}

	// void be_BApplication_AboutRequested(BApplication *self);
	void AboutRequested() {
		be_BApplication_AboutRequested(_InstPtr());
	}

	// BHandler* be_BApplication_ResolveSpecifier(BApplication *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage message, int32 index, BMessage specifier, int32 form, char [] property) {
		return new BHandler(be_BApplication_ResolveSpecifier(_InstPtr(), message._InstPtr, index, specifier._InstPtr, form, toStringz(property)), false);
	}

	// void be_BApplication_ShowCursor(BApplication *self);
	void ShowCursor() {
		be_BApplication_ShowCursor(_InstPtr());
	}

	// void be_BApplication_HideCursor(BApplication *self);
	void HideCursor() {
		be_BApplication_HideCursor(_InstPtr());
	}

	// void be_BApplication_ObscureCursor(BApplication *self);
	void ObscureCursor() {
		be_BApplication_ObscureCursor(_InstPtr());
	}

	// bool be_BApplication_IsCursorHidden(BApplication *self);
	bool IsCursorHidden() {
		return be_BApplication_IsCursorHidden(_InstPtr());
	}

	// void be_BApplication_SetCursor(BApplication *self, const void* cursor);
	void SetCursor(void [] cursor) {
		be_BApplication_SetCursor(_InstPtr(), cursor.ptr);
	}

	// void be_BApplication_SetCursor_1(BApplication *self, const BCursor* cursor, bool sync);
	void SetCursor(BCursor cursor, bool sync = true) {
		be_BApplication_SetCursor_1(_InstPtr(), cursor._InstPtr, sync);
	}

	// int32 be_BApplication_CountWindows(BApplication *self);
	int32 CountWindows() {
		return be_BApplication_CountWindows(_InstPtr());
	}
/*
	// BWindow * be_BApplication_WindowAt(BApplication *self, int32 index);
	BWindow WindowAt(int32 index) {
		return be_BApplication_WindowAt(_InstPtr(), index);
	}
*/
	// int32 be_BApplication_CountLoopers(BApplication *self);
	int32 CountLoopers() {
		return be_BApplication_CountLoopers(_InstPtr());
	}

	// BLooper * be_BApplication_LooperAt(BApplication *self, int32 index);
	BLooper LooperAt(int32 index) {
		return new BLooper(be_BApplication_LooperAt(_InstPtr(), index), false);
	}

	// bool be_BApplication_IsLaunching(BApplication *self);
	bool IsLaunching() {
		return be_BApplication_IsLaunching(_InstPtr());
	}

	// status_t be_BApplication_GetAppInfo(BApplication *self, app_info* info);
	status_t GetAppInfo(inout app_info info) {
		return be_BApplication_GetAppInfo(_InstPtr(), &info);
	}
/*
	//BResources * be_BApplication_AppResources_static()
	static BResources AppResources()
	{
	}
*/
	// void be_BApplication_DispatchMessage(BApplication *self, BMessage* message, BHandler* handler);
	void DispatchMessage(BMessage message, BHandler handler) {
		be_BApplication_DispatchMessage(_InstPtr(), message._InstPtr, handler._InstPtr);
	}

	// void be_BApplication_SetPulseRate(BApplication *self, bigtime_t rate);
	void SetPulseRate(bigtime_t rate) {
		be_BApplication_SetPulseRate(_InstPtr(), rate);
	}

	// status_t be_BApplication_GetSupportedSuites(BApplication *self, BMessage* data);
	status_t GetSupportedSuites(BMessage data) {
		return be_BApplication_GetSupportedSuites(_InstPtr(), data._InstPtr);
	}

	// status_t be_BApplication_Perform(BApplication *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BApplication_Perform(_InstPtr(), d, arg);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


