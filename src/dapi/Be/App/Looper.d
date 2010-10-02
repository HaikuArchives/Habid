/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Looper;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;
import Be.Support.Archivable;
import Be.Support.List;

import Be.App.Message;
import Be.App.MessageFilter;
import Be.App.MessageQueue;
import Be.App.Handler;

import Be.Kernel.OS;

import tango.stdc.stringz;


const int32 B_LOOPER_PORT_DEFAULT_CAPACITY = 200;


extern (C) extern {
	// BLooperProxy * be_BLooper_ctor(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity);
	void * be_BLooper_ctor(void *bindInstPtr, char* name, int32 priority, int32 port_capacity);

	// BLooperProxy * be_BLooper_ctor_1(void *bindInstPtr, BMessage* data);
	void * be_BLooper_ctor_1(void *bindInstPtr, void* data);

	// void be_BLooper_dtor(BLooper* self);
	void be_BLooper_dtor(void* self);

	//BArchivable * be_BLooper_Instantiate_static(BMessage* data)
	void * be_BLooper_Instantiate_static(void* data);

	// status_t be_BLooper_Archive(BLooperProxy *self, BMessage* data, bool deep);
	status_t be_BLooper_Archive(void *self, void* data, bool deep);

	// status_t be_BLooper_PostMessage(BLooperProxy *self, uint32 command);
	status_t be_BLooper_PostMessage(void *self, uint32 command);

	// status_t be_BLooper_PostMessage_1(BLooperProxy *self, BMessage* message);
	status_t be_BLooper_PostMessage_1(void *self, void* message);

	// status_t be_BLooper_PostMessage_2(BLooperProxy *self, uint32 command, BHandler* handler, BHandler* replyTo);
	status_t be_BLooper_PostMessage_2(void *self, uint32 command, void * handler, void * replyTo);

	// status_t be_BLooper_PostMessage_3(BLooperProxy *self, BMessage* message, BHandler* handler, BHandler* replyTo);
	status_t be_BLooper_PostMessage_3(void *self, void* message, void * handler, void * replyTo);

	// void be_BLooper_DispatchMessage(BLooperProxy *self, BMessage* message, BHandler* handler);
	void be_BLooper_DispatchMessage(void *self, void* message, void * handler);

	// void be_BLooper_MessageReceived(BLooperProxy *self, BMessage* message);
	void be_BLooper_MessageReceived(void *self, void* message);

	// BMessage* be_BLooper_CurrentMessage(BLooperProxy *self);
	void* be_BLooper_CurrentMessage(void *self);

	// BMessage* be_BLooper_DetachCurrentMessage(BLooperProxy *self);
	void* be_BLooper_DetachCurrentMessage(void *self);

	// BMessageQueue* be_BLooper_MessageQueue(BLooperProxy *self);
	void* be_BLooper_MessageQueue(void *self);

	// bool be_BLooper_IsMessageWaiting(BLooperProxy *self);
	bool be_BLooper_IsMessageWaiting(void *self);

	// void be_BLooper_AddHandler(BLooperProxy *self, BHandler* handler);
	void be_BLooper_AddHandler(void *self, void * handler);

	// bool be_BLooper_RemoveHandler(BLooperProxy *self, BHandler* handler);
	bool be_BLooper_RemoveHandler(void *self, void * handler);

	// int32 be_BLooper_CountHandlers(BLooperProxy *self);
	int32 be_BLooper_CountHandlers(void *self);

	// BHandler* be_BLooper_HandlerAt(BLooperProxy *self, int32 index);
	void * be_BLooper_HandlerAt(void *self, int32 index);

	// int32 be_BLooper_IndexOf(BLooperProxy *self, BHandler* handler);
	int32 be_BLooper_IndexOf(void *self, void * handler);

	// BHandler* be_BLooper_PreferredHandler(BLooperProxy *self);
	void * be_BLooper_PreferredHandler(void *self);

	// void be_BLooper_SetPreferredHandler(BLooperProxy *self, BHandler* handler);
	void be_BLooper_SetPreferredHandler(void *self, void * handler);

	// thread_id be_BLooper_Run(BLooperProxy *self);
	thread_id be_BLooper_Run(void *self);

	// void be_BLooper_Quit(BLooperProxy *self);
	void be_BLooper_Quit(void *self);

	// bool be_BLooper_QuitRequested(BLooperProxy *self);
	bool be_BLooper_QuitRequested(void *self);

	// bool be_BLooper_Lock(BLooperProxy *self);
	bool be_BLooper_Lock(void *self);

	// void be_BLooper_Unlock(BLooperProxy *self);
	void be_BLooper_Unlock(void *self);

	// bool be_BLooper_IsLocked(BLooperProxy *self);
	bool be_BLooper_IsLocked(void *self);

	// status_t be_BLooper_LockWithTimeout(BLooperProxy *self, bigtime_t timeout);
	status_t be_BLooper_LockWithTimeout(void *self, bigtime_t timeout);

	// thread_id be_BLooper_Thread(BLooperProxy *self);
	thread_id be_BLooper_Thread(void *self);

	// team_id be_BLooper_Team(BLooperProxy *self);
	team_id be_BLooper_Team(void *self);

	// BLooper* be_BLooper_LooperForThread(BLooperProxy *self, thread_id thread);
	BLooper* be_BLooper_LooperForThread(void *self, thread_id thread);

	// thread_id be_BLooper_LockingThread(BLooperProxy *self);
	thread_id be_BLooper_LockingThread(void *self);

	// int32 be_BLooper_CountLocks(BLooperProxy *self);
	int32 be_BLooper_CountLocks(void *self);

	// int32 be_BLooper_CountLockRequests(BLooperProxy *self);
	int32 be_BLooper_CountLockRequests(void *self);

	// sem_id be_BLooper_Sem(BLooperProxy *self);
	sem_id be_BLooper_Sem(void *self);

	// BHandler* be_BLooper_ResolveSpecifier(BLooperProxy *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	void * be_BLooper_ResolveSpecifier(void *self, void* msg, int32 index, void* specifier, int32 form,  char* property);

	// status_t be_BLooper_GetSupportedSuites(BLooperProxy *self, BMessage* data);
	status_t be_BLooper_GetSupportedSuites(void *self, void* data);

	// void be_BLooper_AddCommonFilter(BLooperProxy *self, BMessageFilter* filter);
	void be_BLooper_AddCommonFilter(void *self, void* filter);

	// bool be_BLooper_RemoveCommonFilter(BLooperProxy *self, BMessageFilter* filter);
	bool be_BLooper_RemoveCommonFilter(void *self, void* filter);

	// void be_BLooper_SetCommonFilterList(BLooperProxy *self, BList* filters);
	void be_BLooper_SetCommonFilterList(void *self, void* filters);

	// BList* be_BLooper_CommonFilterList(BLooperProxy *self);
	BList* be_BLooper_CommonFilterList(void *self);

	// status_t be_BLooper_Perform(BLooperProxy *self, perform_code d, void* arg);
	status_t be_BLooper_Perform(void *self, perform_code d, void* arg);

}


extern (C) {
	status_t bind_BLooper_Archive(void *bindInstPtr, void* data, bool deep) {
		return (cast(BLooper)bindInstPtr).Archive(new BMessage(data, false), deep);
	}

	void bind_BLooper_DispatchMessage(void *bindInstPtr, void* message, void* handler) {
		(cast(BLooper)bindInstPtr).DispatchMessage(new BMessage(message, false), new BHandler(handler, false));
	}

	void bind_BLooper_MessageReceived(void *bindInstPtr, void* message) {
		(cast(BLooper)bindInstPtr).MessageReceived(new BMessage(message, false));
	}

	thread_id bind_BLooper_Run(void *bindInstPtr) {
		return (cast(BLooper)bindInstPtr).Run();
	}

	void bind_BLooper_Quit(void *bindInstPtr) {
		(cast(BLooper)bindInstPtr).Quit();
	}

	bool bind_BLooper_QuitRequested(void *bindInstPtr) {
		return (cast(BLooper)bindInstPtr).QuitRequested();
	}

	void* bind_BLooper_LooperForThread(void *bindInstPtr, thread_id thread) {
		return (cast(BLooper)bindInstPtr).LooperForThread(thread)._InstPtr();
	}

	void* bind_BLooper_ResolveSpecifier(void *bindInstPtr, void* msg, int32 index, void* specifier, int32 form,  char* property) {
		return (cast(BLooper)bindInstPtr).ResolveSpecifier(new BMessage(msg, false), index, new BMessage(specifier, false), form, fromStringz(property))._InstPtr();
	}

	status_t bind_BLooper_GetSupportedSuites(void *bindInstPtr, void* data) {
		return (cast(BLooper)bindInstPtr).GetSupportedSuites(new BMessage(data, false));
	}

	void bind_BLooper_AddCommonFilter(void *bindInstPtr, void* filter) {
		(cast(BLooper)bindInstPtr).AddCommonFilter(new BMessageFilter(filter, false));
	}

	bool bind_BLooper_RemoveCommonFilter(void *bindInstPtr, void* filter) {
		return (cast(BLooper)bindInstPtr).RemoveCommonFilter(new BMessageFilter(filter, false));
	}

	void bind_BLooper_SetCommonFilterList(void *bindInstPtr, void* filters) {
		(cast(BLooper)bindInstPtr).SetCommonFilterList(new BList(filters, false));
	}

	void* bind_BLooper_CommonFilterList(void *bindInstPtr) {
		return (cast(BLooper)bindInstPtr).CommonFilterList()._InstPtr();
	}

	status_t bind_BLooper_Perform(void *bindInstPtr, perform_code d, void* arg) {
		return (cast(BLooper)bindInstPtr).Perform(d, arg);
	}

}


interface IBLooper
{
	// BArchivable * be_BLooper_Instantiate(BLooper *self, BMessage* data);
//	BArchivable Instantiate(BMessage);

	// status_t be_BLooper_Archive(BLooper *self, BMessage* data, bool deep);
	status_t Archive(BMessage, bool);

	// status_t be_BLooper_PostMessage(BLooper *self, uint32 command);
	status_t PostMessage(uint32);

	// status_t be_BLooper_PostMessage_1(BLooper *self, BMessage* message);
	status_t PostMessage(BMessage);

	// status_t be_BLooper_PostMessage_2(BLooper *self, uint32 command, BHandler* handler, BHandler* replyTo);
	status_t PostMessage(uint32, BHandler, BHandler);

	// status_t be_BLooper_PostMessage_3(BLooper *self, BMessage* message, BHandler* handler, BHandler* replyTo);
	status_t PostMessage(BMessage, BHandler, BHandler);

	// void be_BLooper_DispatchMessage(BLooper *self, BMessage* message, BHandler* handler);
	void DispatchMessage(BMessage, BHandler);

	// void be_BLooper_MessageReceived(BLooper *self, BMessage* message);
	void MessageReceived(BMessage);

	// BMessage* be_BLooper_CurrentMessage(BLooper *self);
	BMessage CurrentMessage();

	// BMessage* be_BLooper_DetachCurrentMessage(BLooper *self);
	BMessage DetachCurrentMessage();

	// BMessageQueue* be_BLooper_MessageQueue(BLooper *self);
	BMessageQueue MessageQueue();

	// bool be_BLooper_IsMessageWaiting(BLooper *self);
	bool IsMessageWaiting();

	// void be_BLooper_AddHandler(BLooper *self, BHandler* handler);
	void AddHandler(BHandler);

	// bool be_BLooper_RemoveHandler(BLooper *self, BHandler* handler);
	bool RemoveHandler(BHandler);

	// int32 be_BLooper_CountHandlers(BLooper *self);
	int32 CountHandlers();

	// BHandler* be_BLooper_HandlerAt(BLooper *self, int32 index);
	BHandler HandlerAt(int32);

	// int32 be_BLooper_IndexOf(BLooper *self, BHandler* handler);
	int32 IndexOf(BHandler);

	// BHandler* be_BLooper_PreferredHandler(BLooper *self);
	BHandler PreferredHandler();

	// void be_BLooper_SetPreferredHandler(BLooper *self, BHandler* handler);
	void SetPreferredHandler(BHandler);

	// thread_id be_BLooper_Run(BLooper *self);
	thread_id Run();

	// void be_BLooper_Quit(BLooper *self);
	void Quit();

	// bool be_BLooper_QuitRequested(BLooper *self);
	bool QuitRequested();

	// bool be_BLooper_Lock(BLooper *self);
	bool Lock();

	// void be_BLooper_Unlock(BLooper *self);
	void Unlock();

	// bool be_BLooper_IsLocked(BLooper *self);
	bool IsLocked();

	// status_t be_BLooper_LockWithTimeout(BLooper *self, bigtime_t timeout);
	status_t LockWithTimeout(bigtime_t);

	// thread_id be_BLooper_Thread(BLooper *self);
	thread_id Thread();

	// team_id be_BLooper_Team(BLooper *self);
	team_id Team();

	// BLooper* be_BLooper_LooperForThread(BLooper *self, thread_id thread);
	BLooper LooperForThread(thread_id);

	// thread_id be_BLooper_LockingThread(BLooper *self);
	thread_id LockingThread();

	// int32 be_BLooper_CountLocks(BLooper *self);
	int32 CountLocks();

	// int32 be_BLooper_CountLockRequests(BLooper *self);
	int32 CountLockRequests();

	// sem_id be_BLooper_Sem(BLooper *self);
	sem_id Sem();

	// BHandler* be_BLooper_ResolveSpecifier(BLooper *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage, int32, BMessage, int32, char []);

	// status_t be_BLooper_GetSupportedSuites(BLooper *self, BMessage* data);
	status_t GetSupportedSuites(BMessage);

	// void be_BLooper_AddCommonFilter(BLooper *self, BMessageFilter* filter);
	void AddCommonFilter(BMessageFilter);

	// bool be_BLooper_RemoveCommonFilter(BLooper *self, BMessageFilter* filter);
	bool RemoveCommonFilter(BMessageFilter);

	// void be_BLooper_SetCommonFilterList(BLooper *self, BList* filters);
	void SetCommonFilterList(BList);

	// BList* be_BLooper_CommonFilterList(BLooper *self);
	BList CommonFilterList();

	// status_t be_BLooper_Perform(BLooper *self, perform_code d, void* arg);
	status_t Perform(perform_code, void *);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BLooper : public BHandler, IBLooper
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	this() {
		super();	
	}
	
	// BLooperProxy * be_BLooper_ctor(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity);
	this(char [] name, int32 priority = B_NORMAL_PRIORITY, int32 port_capacity = B_LOOPER_PORT_DEFAULT_CAPACITY) {
		if(_InstPtr() is null) {
			_InstPtr = be_BLooper_ctor(cast(void *)this, toStringz(name), priority, port_capacity);
			_OwnsPtr = true;
		}

		super(name);
	}

	// BLooperProxy * be_BLooper_ctor_1(void *bindInstPtr, BMessage* data);
	this(BMessage data) {
		if(_InstPtr() is null) {
			_InstPtr = be_BLooper_ctor_1(cast(void *)this, data._InstPtr());
			_OwnsPtr = true;
		}

		super(data);
	}

	// void be_BLooper_dtor(BLooper* self);
	~this() {
		if(_InstPtr() !is null && _OwnsPtr()) {
			be_BLooper_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	//BArchivable * be_BLooper_Instantiate_static(BMessage* data)
	static BArchivable Instantiate(BMessage* data)
	{
		return new BArchivable(be_BLooper_Instantiate_static(data._InstPtr()), true);
	}

	// status_t be_BLooper_Archive(BLooper *self, BMessage* data, bool deep);
	status_t Archive(BMessage data, bool deep = true) {
		return be_BLooper_Archive(_InstPtr(), data._InstPtr(), deep);
	}

	// status_t be_BLooper_PostMessage(BLooper *self, uint32 command);
	status_t PostMessage(uint32 command) {
		return be_BLooper_PostMessage(_InstPtr(), command);
	}

	// status_t be_BLooper_PostMessage_1(BLooper *self, BMessage* message);
	status_t PostMessage(BMessage message) {
		return be_BLooper_PostMessage_1(_InstPtr(), message._InstPtr());
	}

	// status_t be_BLooper_PostMessage_2(BLooper *self, uint32 command, BHandler* handler, BHandler* replyTo);
	status_t PostMessage(uint32 command, BHandler handler, BHandler replyTo) {
		return be_BLooper_PostMessage_2(_InstPtr(), command, handler._InstPtr(), replyTo._InstPtr());
	}

	// status_t be_BLooper_PostMessage_3(BLooper *self, BMessage* message, BHandler* handler, BHandler* replyTo);
	status_t PostMessage(BMessage message, BHandler handler, BHandler replyTo) {
		return be_BLooper_PostMessage_3(_InstPtr(), message._InstPtr(), handler._InstPtr(), replyTo._InstPtr());
	}

	// void be_BLooper_DispatchMessage(BLooper *self, BMessage* message, BHandler* handler);
	void DispatchMessage(BMessage message, BHandler handler) {
		be_BLooper_DispatchMessage(_InstPtr(), message._InstPtr(), handler._InstPtr());
	}

	// void be_BLooper_MessageReceived(BLooper *self, BMessage* message);
	void MessageReceived(BMessage message) {
		be_BLooper_MessageReceived(_InstPtr(), message._InstPtr());
	}

	// BMessage* be_BLooper_CurrentMessage(BLooper *self);
	BMessage CurrentMessage() {
		return new BMessage(be_BLooper_CurrentMessage(_InstPtr()), true);
	}

	// BMessage* be_BLooper_DetachCurrentMessage(BLooper *self);
	BMessage DetachCurrentMessage() {
		return new BMessage(be_BLooper_DetachCurrentMessage(_InstPtr()), true);
	}

	// BMessageQueue* be_BLooper_MessageQueue(BLooper *self);
	BMessageQueue MessageQueue() {
		return new BMessageQueue(be_BLooper_MessageQueue(_InstPtr()), false);
	}

	// bool be_BLooper_IsMessageWaiting(BLooper *self);
	bool IsMessageWaiting() {
		return be_BLooper_IsMessageWaiting(_InstPtr());
	}

	// void be_BLooper_AddHandler(BLooper *self, BHandler* handler);
	void AddHandler(BHandler handler) {
		be_BLooper_AddHandler(_InstPtr(), handler._InstPtr());
	}

	// bool be_BLooper_RemoveHandler(BLooper *self, BHandler* handler);
	bool RemoveHandler(BHandler handler) {
		return be_BLooper_RemoveHandler(_InstPtr(), handler._InstPtr());
	}

	// int32 be_BLooper_CountHandlers(BLooper *self);
	int32 CountHandlers() {
		return be_BLooper_CountHandlers(_InstPtr());
	}

	// BHandler* be_BLooper_HandlerAt(BLooper *self, int32 index);
	BHandler HandlerAt(int32 index) {
		return new BHandler(be_BLooper_HandlerAt(_InstPtr(), index), false);
	}

	// int32 be_BLooper_IndexOf(BLooper *self, BHandler* handler);
	int32 IndexOf(BHandler handler) {
		return be_BLooper_IndexOf(_InstPtr(), handler._InstPtr());
	}

	// BHandler* be_BLooper_PreferredHandler(BLooper *self);
	BHandler PreferredHandler() {
		return new BHandler(be_BLooper_PreferredHandler(_InstPtr()), false);
	}

	// void be_BLooper_SetPreferredHandler(BLooper *self, BHandler* handler);
	void SetPreferredHandler(BHandler handler) {
		be_BLooper_SetPreferredHandler(_InstPtr(), handler._InstPtr());
	}

	// thread_id be_BLooper_Run(BLooper *self);
	thread_id Run() {
		return be_BLooper_Run(_InstPtr());
	}

	// void be_BLooper_Quit(BLooper *self);
	void Quit() {
		be_BLooper_Quit(_InstPtr());
	}

	// bool be_BLooper_QuitRequested(BLooper *self);
	bool QuitRequested() {
		return be_BLooper_QuitRequested(_InstPtr());
	}

	// bool be_BLooper_Lock(BLooper *self);
	bool Lock() {
		return be_BLooper_Lock(_InstPtr());
	}

	// void be_BLooper_Unlock(BLooper *self);
	void Unlock() {
		be_BLooper_Unlock(_InstPtr());
	}

	// bool be_BLooper_IsLocked(BLooper *self);
	bool IsLocked() {
		return be_BLooper_IsLocked(_InstPtr());
	}

	// status_t be_BLooper_LockWithTimeout(BLooper *self, bigtime_t timeout);
	status_t LockWithTimeout(bigtime_t timeout) {
		return be_BLooper_LockWithTimeout(_InstPtr(), timeout);
	}

	// thread_id be_BLooper_Thread(BLooper *self);
	thread_id Thread() {
		return be_BLooper_Thread(_InstPtr());
	}

	// team_id be_BLooper_Team(BLooper *self);
	team_id Team() {
		return be_BLooper_Team(_InstPtr());
	}

	// BLooper* be_BLooper_LooperForThread(BLooper *self, thread_id thread);
	BLooper LooperForThread(thread_id thread) {
		return new BLooper(be_BLooper_LooperForThread(_InstPtr(), thread), false);
	}

	// thread_id be_BLooper_LockingThread(BLooper *self);
	thread_id LockingThread() {
		return be_BLooper_LockingThread(_InstPtr());
	}

	// int32 be_BLooper_CountLocks(BLooper *self);
	int32 CountLocks() {
		return be_BLooper_CountLocks(_InstPtr());
	}

	// int32 be_BLooper_CountLockRequests(BLooper *self);
	int32 CountLockRequests() {
		return be_BLooper_CountLockRequests(_InstPtr());
	}

	// sem_id be_BLooper_Sem(BLooper *self);
	sem_id Sem() {
		return be_BLooper_Sem(_InstPtr());
	}

	// BHandler* be_BLooper_ResolveSpecifier(BLooper *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage msg, int32 index, BMessage specifier, int32 form, char [] property) {
		return new BHandler(be_BLooper_ResolveSpecifier(_InstPtr(), msg._InstPtr(), index, specifier._InstPtr(), form, toStringz(property)), true);
	}

	// status_t be_BLooper_GetSupportedSuites(BLooper *self, BMessage* data);
	status_t GetSupportedSuites(BMessage data) {
		return be_BLooper_GetSupportedSuites(_InstPtr(), data._InstPtr());
	}

	// void be_BLooper_AddCommonFilter(BLooper *self, BMessageFilter* filter);
	void AddCommonFilter(BMessageFilter filter) {
		be_BLooper_AddCommonFilter(_InstPtr(), filter._InstPtr());
	}

	// bool be_BLooper_RemoveCommonFilter(BLooper *self, BMessageFilter* filter);
	bool RemoveCommonFilter(BMessageFilter filter) {
		return be_BLooper_RemoveCommonFilter(_InstPtr(), filter._InstPtr());
	}

	// void be_BLooper_SetCommonFilterList(BLooper *self, BList* filters);
	void SetCommonFilterList(BList filters) {
		be_BLooper_SetCommonFilterList(_InstPtr(), filters._InstPtr());
	}

	// BList* be_BLooper_CommonFilterList(BLooper *self);
	BList CommonFilterList() {
		return new BList(be_BLooper_CommonFilterList(_InstPtr()), false);
	}

	// status_t be_BLooper_Perform(BLooper *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BLooper_Perform(_InstPtr(), d, arg);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


