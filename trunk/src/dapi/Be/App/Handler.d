/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Handler;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Support.Archivable;
import Be.Support.List;

import Be.App.Message;
import Be.App.MessageFilter;
import Be.App.Messenger;
import Be.App.Looper;

import tango.stdc.stringz;


extern (C) extern {
	// BHandlerProxy * be_BHandler_ctor(void *bindInstPtr, const char* name);
	void * be_BHandler_ctor(void *bindInstPtr, char* name);

	// BHandlerProxy * be_BHandler_ctor_1(void *bindInstPtr, BMessage* data);
	void * be_BHandler_ctor_1(void *bindInstPtr, void* data);

	// void be_BHandler_dtor(BHandler* self);
	void be_BHandler_dtor(void* self);

	//BArchivable* be_BHandler_Instantiate_static(BMessage* data)
	void * be_BHandler_Instantiate_static(void* data);

	// status_t be_BHandler_Archive(BHandlerProxy *self, BMessage* data, bool deep);
	status_t be_BHandler_Archive(void *self, void* data, bool deep);

	// void be_BHandler_MessageReceived(BHandlerProxy *self, BMessage* message);
	void be_BHandler_MessageReceived(void *self, void* message);

	// BLooper* be_BHandler_Looper(BHandlerProxy *self);
	BLooper* be_BHandler_Looper(void *self);

	// void be_BHandler_SetName(BHandlerProxy *self, const char* name);
	void be_BHandler_SetName(void *self, char* name);

	// const char * be_BHandler_Name(BHandlerProxy *self);
	char * be_BHandler_Name(void *self);

	// void be_BHandler_SetNextHandler(BHandlerProxy *self, BHandler* handler);
	void be_BHandler_SetNextHandler(void *self, void * handler);

	// BHandler * be_BHandler_NextHandler(BHandlerProxy *self);
	void * be_BHandler_NextHandler(void *self);

	// void be_BHandler_AddFilter(BHandlerProxy *self, BMessageFilter* filter);
	void be_BHandler_AddFilter(void *self, void* filter);

	// bool be_BHandler_RemoveFilter(BHandlerProxy *self, BMessageFilter* filter);
	bool be_BHandler_RemoveFilter(void *self, void* filter);

	// void be_BHandler_SetFilterList(BHandlerProxy *self, BList* filters);
	void be_BHandler_SetFilterList(void *self, void* filters);

	// BList* be_BHandler_FilterList(BHandlerProxy *self);
	BList* be_BHandler_FilterList(void *self);

	// bool be_BHandler_LockLooper(BHandlerProxy *self);
	bool be_BHandler_LockLooper(void *self);

	// status_t be_BHandler_LockLooperWithTimeout(BHandlerProxy *self, bigtime_t timeout);
	status_t be_BHandler_LockLooperWithTimeout(void *self, bigtime_t timeout);

	// void be_BHandler_UnlockLooper(BHandlerProxy *self);
	void be_BHandler_UnlockLooper(void *self);

	// BHandler* be_BHandler_ResolveSpecifier(BHandlerProxy *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	void * be_BHandler_ResolveSpecifier(void *self, void* msg, int32 index, void* specifier, int32 form,  char* property);

	// status_t be_BHandler_GetSupportedSuites(BHandlerProxy *self, BMessage* data);
	status_t be_BHandler_GetSupportedSuites(void *self, void* data);

	// status_t be_BHandler_StartWatching(BHandlerProxy *self, BMessenger *target, uint32 what);
	status_t be_BHandler_StartWatching(void *self, void *target, uint32 what);

	// status_t be_BHandler_StartWatchingAll(BHandlerProxy *self, BMessenger *target);
	status_t be_BHandler_StartWatchingAll(void *self, void *target);

	// status_t be_BHandler_StopWatching(BHandlerProxy *self, BMessenger *target, uint32 what);
	status_t be_BHandler_StopWatching(void *self, void *target, uint32 what);

	// status_t be_BHandler_StopWatchingAll(BHandlerProxy *self, BMessenger *target);
	status_t be_BHandler_StopWatchingAll(void *self, void *target);

	// status_t be_BHandler_StartWatching_1(BHandlerProxy *self, BHandler* observer, uint32 what);
	status_t be_BHandler_StartWatching_1(void *self, void * observer, uint32 what);

	// status_t be_BHandler_StartWatchingAll_1(BHandlerProxy *self, BHandler* observer);
	status_t be_BHandler_StartWatchingAll_1(void *self, void * observer);

	// status_t be_BHandler_StopWatching_1(BHandlerProxy *self, BHandler* observer, uint32 what);
	status_t be_BHandler_StopWatching_1(void *self, void * observer, uint32 what);

	// status_t be_BHandler_StopWatchingAll_1(BHandlerProxy *self, BHandler* observer);
	status_t be_BHandler_StopWatchingAll_1(void *self, void * observer);

	// status_t be_BHandler_Perform(BHandlerProxy *self, perform_code d, void* arg);
	status_t be_BHandler_Perform(void *self, perform_code d, void* arg);

	// void be_BHandler_SendNotices(BHandlerProxy *self, uint32 what, const BMessage* notice);
	void be_BHandler_SendNotices(void *self, uint32 what,  void* notice);

	// bool be_BHandler_IsWatched(BHandlerProxy *self);
	bool be_BHandler_IsWatched(void *self);

}


extern (C) {
	status_t bind_BHandler_Archive(void *bindInstPtr, void* data, bool deep) {
		return (cast(BHandler)bindInstPtr).Archive(new BMessage(data, true), deep);
	}

	void bind_BHandler_MessageReceived(void *bindInstPtr, void* message) {
		(cast(BHandler)bindInstPtr).MessageReceived(new BMessage(message, true));
	}

	void bind_BHandler_SetNextHandler(void *bindInstPtr, void* handler) {
		(cast(BHandler)bindInstPtr).SetNextHandler(new BHandler(handler, false));
	}

	void bind_BHandler_AddFilter(void *bindInstPtr, void* filter) {
		(cast(BHandler)bindInstPtr).AddFilter(new BMessageFilter(filter, true));
	}

	bool bind_BHandler_RemoveFilter(void *bindInstPtr, void* filter) {
		return (cast(BHandler)bindInstPtr).RemoveFilter(new BMessageFilter(filter, true));
	}

	void bind_BHandler_SetFilterList(void *bindInstPtr, void* filters) {
		(cast(BHandler)bindInstPtr).SetFilterList(new BList(filters, true));
	}

	void* bind_BHandler_FilterList(void *bindInstPtr) {
		return (cast(BHandler)bindInstPtr).FilterList()._InstPtr();
	}

	void* bind_BHandler_ResolveSpecifier(void *bindInstPtr, void* msg, int32 index, void* specifier, int32 form,  char* property) {
		return (cast(BHandler)bindInstPtr).ResolveSpecifier(new BMessage(msg, true), index, new BMessage(specifier, true), form, fromStringz(property))._InstPtr();
	}

	status_t bind_BHandler_GetSupportedSuites(void *bindInstPtr, void* data) {
		return (cast(BHandler)bindInstPtr).GetSupportedSuites(new BMessage(data, true));
	}

	status_t bind_BHandler_Perform(void *bindInstPtr, perform_code d, void* arg) {
		return (cast(BHandler)bindInstPtr).Perform(d, arg);
	}

	void bind_BHandler_SendNotices(void *bindInstPtr, uint32 what,  void* notice) {
		(cast(BHandler)bindInstPtr).SendNotices(what, new BMessage(notice, true));
	}
}


interface IBHandler
{

	// BArchivable* be_BHandler_Instantiate(BHandler *self, BMessage* data);
//	BArchivable* Instantiate();

	// status_t be_BHandler_Archive(BHandler *self, BMessage* data, bool deep);
	status_t Archive(BMessage, bool);

	// void be_BHandler_MessageReceived(BHandler *self, BMessage* message);
	void MessageReceived(BMessage);

	// BLooper* be_BHandler_Looper(BHandler *self);
	BLooper Looper();

	// void be_BHandler_SetName(BHandler *self, const char* name);
	void SetName(char []);

	// const char * be_BHandler_Name(BHandler *self);
	char [] Name();

	// void be_BHandler_SetNextHandler(BHandler *self, BHandler* handler);
	void SetNextHandler(BHandler);

	// BHandler * be_BHandler_NextHandler(BHandler *self);
	BHandler NextHandler();

	// void be_BHandler_AddFilter(BHandler *self, BMessageFilter* filter);
	void AddFilter(BMessageFilter);

	// bool be_BHandler_RemoveFilter(BHandler *self, BMessageFilter* filter);
	bool RemoveFilter(BMessageFilter);

	// void be_BHandler_SetFilterList(BHandler *self, BList* filters);
	void SetFilterList(BList);

	// BList* be_BHandler_FilterList(BHandler *self);
	BList FilterList();

	// bool be_BHandler_LockLooper(BHandler *self);
	bool LockLooper();

	// status_t be_BHandler_LockLooperWithTimeout(BHandler *self, bigtime_t timeout);
	status_t LockLooperWithTimeout(bigtime_t);

	// void be_BHandler_UnlockLooper(BHandler *self);
	void UnlockLooper();

	// BHandler* be_BHandler_ResolveSpecifier(BHandler *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage, int32, BMessage, int32, char []);

	// status_t be_BHandler_GetSupportedSuites(BHandler *self, BMessage* data);
	status_t GetSupportedSuites(BMessage);

	// status_t be_BHandler_StartWatching(BHandler *self, BMessenger *target, uint32 what);
	status_t StartWatching(BMessenger, uint32);

	// status_t be_BHandler_StartWatchingAll(BHandler *self, BMessenger *target);
	status_t StartWatchingAll(BMessenger);

	// status_t be_BHandler_StopWatching(BHandler *self, BMessenger *target, uint32 what);
	status_t StopWatching(BMessenger, uint32);

	// status_t be_BHandler_StopWatchingAll(BHandler *self, BMessenger *target);
	status_t StopWatchingAll(BMessenger);

	// status_t be_BHandler_StartWatching_1(BHandler *self, BHandler* observer, uint32 what);
	status_t StartWatching(BHandler, uint32);

	// status_t be_BHandler_StartWatchingAll_1(BHandler *self, BHandler* observer);
	status_t StartWatchingAll(BHandler);

	// status_t be_BHandler_StopWatching_1(BHandler *self, BHandler* observer, uint32 what);
	status_t StopWatching(BHandler, uint32);

	// status_t be_BHandler_StopWatchingAll_1(BHandler *self, BHandler* observer);
	status_t StopWatchingAll(BHandler);

	// status_t be_BHandler_Perform(BHandler *self, perform_code d, void* arg);
	status_t Perform(perform_code, void *);

	// void be_BHandler_SendNotices(BHandler *self, uint32 what, const BMessage* notice);
	void SendNotices(uint32, BMessage);

	// bool be_BHandler_IsWatched(BHandler *self);
	bool IsWatched();

	void * _InstPtr();
	bool _OwnsPtr();
}

class BHandler : BArchivable, IBHandler
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
	char [] fname;
public:
	this() {
		super();
	}
	
	// BHandlerProxy * be_BHandler_ctor(void *bindInstPtr, const char* name);
	this(char [] name) {
		if(_InstPtr() is null) {
			fname = name.dup;
			fInstancePointer = be_BHandler_ctor(cast(void *)this, toStringz(name));
			fOwnsPointer = true;
		}
		super();
	}

	// BHandlerProxy * be_BHandler_ctor_1(void *bindInstPtr, BMessage* data);
	this(BMessage data) {
		if(_InstPtr() is null) {
			fInstancePointer = be_BHandler_ctor_1(cast(void *)this, data._InstPtr());
			fOwnsPointer = true;
		}
		super();
	}

	// void be_BHandler_dtor(BHandler* self);
	~this() {
		if(_InstPtr() !is null && _OwnsPtr()) {
			be_BHandler_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	//BArchivable* be_BHandler_Instantiate_static(BMessage* data)
	static IBArchivable Instantiate(BMessage data)
	{
		return new BArchivable(be_BHandler_Instantiate_static(data._InstPtr()), true);
	}

	// status_t be_BHandler_Archive(BHandler *self, BMessage* data, bool deep);
	status_t Archive(BMessage data, bool deep = true) {
		return be_BHandler_Archive(_InstPtr(), data._InstPtr(), deep);
	}

	// void be_BHandler_MessageReceived(BHandler *self, BMessage* message);
	void MessageReceived(BMessage message) {
		be_BHandler_MessageReceived(_InstPtr(), message._InstPtr());
	}

	// BLooper* be_BHandler_Looper(BHandler *self);
	BLooper Looper() {
		return new BLooper(be_BHandler_Looper(_InstPtr()), false);
	}

	// void be_BHandler_SetName(BHandler *self, const char* name);
	void SetName(char [] name) {
		be_BHandler_SetName(_InstPtr(), toStringz(name));
	}

	// const char * be_BHandler_Name(BHandler *self);
	char [] Name() {
		return fromStringz(be_BHandler_Name(_InstPtr()));
	}

	// void be_BHandler_SetNextHandler(BHandler *self, BHandler* handler);
	void SetNextHandler(BHandler handler) {
		be_BHandler_SetNextHandler(_InstPtr(), handler._InstPtr());
	}

	// BHandler * be_BHandler_NextHandler(BHandler *self);
	BHandler NextHandler() {
		return new BHandler(be_BHandler_NextHandler(_InstPtr()), false);
	}

	// void be_BHandler_AddFilter(BHandler *self, BMessageFilter* filter);
	void AddFilter(BMessageFilter filter) {
		be_BHandler_AddFilter(_InstPtr(), filter._InstPtr());
	}

	// bool be_BHandler_RemoveFilter(BHandler *self, BMessageFilter* filter);
	bool RemoveFilter(BMessageFilter filter) {
		return be_BHandler_RemoveFilter(_InstPtr(), filter._InstPtr());
	}

	// void be_BHandler_SetFilterList(BHandler *self, BList* filters);
	void SetFilterList(BList filters) {
		be_BHandler_SetFilterList(_InstPtr(), filters._InstPtr());
	}

	// BList* be_BHandler_FilterList(BHandler *self);
	BList FilterList() {
		return new BList(be_BHandler_FilterList(_InstPtr()), true);
	}

	// bool be_BHandler_LockLooper(BHandler *self);
	bool LockLooper() {
		return be_BHandler_LockLooper(_InstPtr());
	}

	// status_t be_BHandler_LockLooperWithTimeout(BHandler *self, bigtime_t timeout);
	status_t LockLooperWithTimeout(bigtime_t timeout) {
		return be_BHandler_LockLooperWithTimeout(_InstPtr(), timeout);
	}

	// void be_BHandler_UnlockLooper(BHandler *self);
	void UnlockLooper() {
		be_BHandler_UnlockLooper(_InstPtr());
	}

	// BHandler* be_BHandler_ResolveSpecifier(BHandler *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage msg, int32 index, BMessage specifier, int32 form, char [] property) {
		return new BHandler(be_BHandler_ResolveSpecifier(_InstPtr(), msg._InstPtr(), index, specifier._InstPtr(), form, toStringz(property)), false);
	}

	// status_t be_BHandler_GetSupportedSuites(BHandler *self, BMessage* data);
	status_t GetSupportedSuites(BMessage data) {
		return be_BHandler_GetSupportedSuites(_InstPtr(), data._InstPtr());
	}

	// status_t be_BHandler_StartWatching(BHandler *self, BMessenger *target, uint32 what);
	status_t StartWatching(BMessenger target, uint32 what) {
		return be_BHandler_StartWatching(_InstPtr(), target._InstPtr(), what);
	}

	// status_t be_BHandler_StartWatchingAll(BHandler *self, BMessenger *target);
	status_t StartWatchingAll(BMessenger target) {
		return be_BHandler_StartWatchingAll(_InstPtr(), target._InstPtr());
	}

	// status_t be_BHandler_StopWatching(BHandler *self, BMessenger *target, uint32 what);
	status_t StopWatching(BMessenger target, uint32 what) {
		return be_BHandler_StopWatching(_InstPtr(), target._InstPtr(), what);
	}

	// status_t be_BHandler_StopWatchingAll(BHandler *self, BMessenger *target);
	status_t StopWatchingAll(BMessenger target) {
		return be_BHandler_StopWatchingAll(_InstPtr(), target._InstPtr());
	}

	// status_t be_BHandler_StartWatching_1(BHandler *self, BHandler* observer, uint32 what);
	status_t StartWatching(BHandler handler, uint32 what) {
		return be_BHandler_StartWatching_1(_InstPtr(), handler._InstPtr(), what);
	}

	// status_t be_BHandler_StartWatchingAll_1(BHandler *self, BHandler* observer);
	status_t StartWatchingAll(BHandler observer) {
		return be_BHandler_StartWatchingAll_1(_InstPtr(), observer._InstPtr());
	}

	// status_t be_BHandler_StopWatching_1(BHandler *self, BHandler* observer, uint32 what);
	status_t StopWatching(BHandler observer, uint32 what) {
		return be_BHandler_StopWatching_1(_InstPtr(), observer._InstPtr(), what);
	}

	// status_t be_BHandler_StopWatchingAll_1(BHandler *self, BHandler* observer);
	status_t StopWatchingAll(BHandler observer) {
		return be_BHandler_StopWatchingAll_1(_InstPtr(), observer._InstPtr());
	}

	// status_t be_BHandler_Perform(BHandler *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BHandler_Perform(_InstPtr(), d, arg);
	}

	// void be_BHandler_SendNotices(BHandler *self, uint32 what, const BMessage* notice);
	void SendNotices(uint32 what, BMessage notice) {
		be_BHandler_SendNotices(_InstPtr(), what, notice._InstPtr());
	}

	// bool be_BHandler_IsWatched(BHandler *self);
	bool IsWatched() {
		return be_BHandler_IsWatched(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


