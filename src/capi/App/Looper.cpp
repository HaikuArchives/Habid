/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/Looper.h"

extern "C" {
	status_t bind_BLooper_Archive(void *bindInstPtr, BMessage *data, bool deep);
	void	bind_BLooper_DispatchMessage(void *bindInstPtr, BMessage* message, BHandler* handler);
	void	bind_BLooper_MessageReceived(void *bindInstPtr, BMessage* message);
	thread_id bind_BLooper_Run(void *bindInstPtr);
	void	bind_BLooper_Quit(void *bindInstPtr);
	bool	bind_BLooper_QuitRequested(void *bindInstPtr);
	BHandler * bind_BLooper_ResolveSpecifier(void *bindInstPtr, BMessage *msg,
												int32 index, BMessage *specifier,
												int32 from, const char *property);
	status_t bind_BLooper_GetSupportedSuites(void *bindInstPtr, BMessage *data);
	
	void	bind_BLooper_AddCommonFilter(void *bindInstPtr, BMessageFilter *filter);
	bool	bind_BLooper_RemoveCommonFilter(void *bindInstPtr, BMessageFilter *filter);
	void	bind_BLooper_SetCommonFilterList(void *bindInstPtr, BList *filters);
}

BLooperProxy::BLooperProxy(void *bindInstPtr, const char* name, int32 priority, int32 port_capacity)
: BLooper(name, priority, port_capacity), fBindInstPtr(bindInstPtr)
{
	
}


BLooperProxy::~BLooperProxy()
{
	
}


BLooperProxy::BLooperProxy(void *bindInstPtr, BMessage* data)
: BLooper(data), fBindInstPtr(bindInstPtr)
{

}

// 	virtual	status_t		Archive(BMessage* data, bool deep = true) const;
status_t	BLooperProxy::Archive(BMessage* data, bool deep) const
{
	return bind_BLooper_Archive(fBindInstPtr, data, deep);
}

status_t	BLooperProxy::Archive_super(BMessage* data, bool deep) const
{
	return BLooper::Archive(data, deep);
}


//	virtual	void		DispatchMessage(BMessage* message, BHandler* handler);
void		BLooperProxy::DispatchMessage(BMessage* message, BHandler* handler) {
	bind_BLooper_DispatchMessage(fBindInstPtr, message, handler);
}
	
void		BLooperProxy::DispatchMessage_super(BMessage* message, BHandler* handler) {
	BLooper::DispatchMessage(message, handler);
}


//	virtual	void		MessageReceived(BMessage* message);
void		BLooperProxy::MessageReceived(BMessage* message) {
	bind_BLooper_MessageReceived(fBindInstPtr, message);
}

void		BLooperProxy::MessageReceived_super(BMessage* message) {
	BLooper::MessageReceived(message);
}


//	virtual	thread_id		Run();
thread_id	BLooperProxy::Run() {
	return bind_BLooper_Run(fBindInstPtr);
}

thread_id	BLooperProxy::Run_super() {
	return BLooper::Run();
}


//	virtual	void			Quit();
void	BLooperProxy::Quit() {
	bind_BLooper_Quit(fBindInstPtr);
}

void	BLooperProxy::Quit_super() {
	BLooper::Quit();
}


//	virtual	bool			QuitRequested();
bool	BLooperProxy::QuitRequested() {
	return bind_BLooper_QuitRequested(fBindInstPtr);
}

bool	BLooperProxy::QuitRequested_super() {
	return BLooper::QuitRequested();
}


//	virtual BHandler*		ResolveSpecifier(BMessage* msg, int32 index,
//								BMessage* specifier, int32 form,
//								const char* property);
BHandler*	BLooperProxy::ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property)
{
	return bind_BLooper_ResolveSpecifier(fBindInstPtr, msg, index, specifier, form, property);
}

BHandler*	BLooperProxy::ResolveSpecifier_super(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property)
{
	return BLooper::ResolveSpecifier(msg, index, specifier, form, property);
}


//	virtual status_t		GetSupportedSuites(BMessage* data);
status_t	BLooperProxy::GetSupportedSuites(BMessage* data) {
	return bind_BLooper_GetSupportedSuites(fBindInstPtr, data);
}

status_t	BLooperProxy::GetSupportedSuites_super(BMessage* data) {
	return BLooper::GetSupportedSuites(data);
}


//	virtual	void			AddCommonFilter(BMessageFilter* filter);
void			BLooperProxy::AddCommonFilter(BMessageFilter* filter) {
	bind_BLooper_AddCommonFilter(fBindInstPtr, filter);
}

void			BLooperProxy::AddCommonFilter_super(BMessageFilter* filter) {
	BLooper::AddCommonFilter(filter);
}

//	virtual	bool			RemoveCommonFilter(BMessageFilter* filter);
bool			BLooperProxy::RemoveCommonFilter(BMessageFilter* filter) {
	return bind_BLooper_RemoveCommonFilter(fBindInstPtr, filter);
}

bool			BLooperProxy::RemoveCommonFilter_super(BMessageFilter* filter) {
	return BLooper::RemoveCommonFilter(filter);
}

//	virtual	void			SetCommonFilterList(BList* filters);
void			BLooperProxy::SetCommonFilterList(BList* filters) {
	bind_BLooper_SetCommonFilterList(fBindInstPtr, filters);
}

void			BLooperProxy::SetCommonFilterList_super(BList* filters) {
	BLooper::SetCommonFilterList(filters);
}


extern "C" {
/*
	BLooperProxy(void *bindInstPtr, const char* name = NULL,
					int32 priority = B_NORMAL_PRIORITY,
					int32 port_capacity = B_LOOPER_PORT_DEFAULT_CAPACITY);
*/
	BLooper * be_BLooper_ctor_1(void *bindInstPtr, const char *name,
								int32 priority, int32 port_capacity)
	{
		return new BLooperProxy(bindInstPtr, name, priority, port_capacity);
	}


//	BLooperProxy(void *bindInstPtr, BMessage* data);	
	BLooper * be_BLooper_ctor_2(void *bindInstPtr, BMessage *data) {
		return new BLooperProxy(bindInstPtr, data);
	}


//	virtual	~BLooperProxy();
	void be_BLooper_dtor(BLooperProxy *self) {
		delete self;
	}


//	virtual status_t	Archive(BMessage* data, bool deep = true) const;
	status_t be_BLooper_Archive_super(BLooperProxy *self, BMessage *data, bool deep) {
		return self->Archive_super(data, deep);
	}


//	status_t		PostMessage(uint32 command);
	status_t be_BLooper_PostMessage_1(BLooperProxy *self, uint32 command) {
		return self->PostMessage(command);
	}


//	status_t		PostMessage(BMessage* message);
	status_t be_BLooper_PostMessage_2(BLooperProxy *self, BMessage *message) {
		return self->PostMessage(message);
	}
	
	
//	status_t		PostMessage(uint32 command, BHandler* handler, BHandler* replyTo = NULL);
	status_t be_BLooper_PostMessage_3(BLooperProxy *self, uint32 command, BHandler *handler, BHandler *replyTo) {
		return self->PostMessage(command, handler, replyTo);
	}
	
	
//	status_t		PostMessage(BMessage* message, BHandler* handler, BHandler* replyTo = NULL);
	status_t be_BLooper_PostMessage_4(BLooperProxy *self, BMessage *message, BHandler *handler, BHandler *replyTo) {
		return self->PostMessage(message, handler, replyTo);
	}

	
//	virtual	void			DispatchMessage(BMessage* message, BHandler* handler);
	void be_BLooper_DispatchMessage(BLooperProxy *self, BMessage *message, BHandler *handler) {
		return self->DispatchMessage_super(message, handler);
	}
	
	
//	virtual	void			MessageReceived(BMessage* message);
	void be_BLooper_MessageReceived(BLooperProxy *self, BMessage *message) {
		return self->MessageReceived_super(message);
	}
	

//	BMessage*		CurrentMessage() const;
	BMessage * be_BLooper_CurrentMessage(BLooperProxy *self) {
		return self->CurrentMessage();
	}
	
	
//	BMessage*		DetachCurrentMessage();
	BMessage * be_BLooper_DetachCurrentMessage(BLooperProxy *self) {
		return self->DetachCurrentMessage();
	}
	
	
//	BMessageQueue*	MessageQueue() const;
	BMessageQueue * be_BLooper_MessageQueue(BLooperProxy *self) {
		return self->MessageQueue();
	}
	
	
//	bool			IsMessageWaiting() const;
	bool be_BLooper_IsMessageWaiting(BLooperProxy *self) {
		return self->IsMessageWaiting();
	}

	
//	void			AddHandler(BHandler* handler);
	void be_BLooper_AddHandler(BLooperProxy *self, BHandler *handler) {
		self->AddHandler(handler);
	}
	
	
//	bool			RemoveHandler(BHandler* handler);
	bool be_BLooper_RemoveHandler(BLooperProxy *self, BHandler *handler) {
		return self->RemoveHandler(handler);
	}
	
	
//	int32			CountHandlers() const;
	int32 be_BLooper_CountHandlers(BLooperProxy *self) {
		return self->CountHandlers();
	}
	
	
//	BHandler*		HandlerAt(int32 index) const;
	BHandler * be_BLooper_HandlerAt(BLooperProxy *self, int32 index) {
		return self->HandlerAt(index);
	}
	
	
//	int32			IndexOf(BHandler* handler) const;
	int32 be_BLooper_IndexOf(BLooperProxy *self, BHandler *handler) {
		return self->IndexOf(handler);
	}
	
	
//	BHandler*		PreferredHandler() const;
	BHandler * be_BLooper_PreferredHandler(BLooperProxy *self) {
		return self->PreferredHandler();
	}
	
	
//	void			SetPreferredHandler(BHandler* handler);
	void be_BLooper_SetPreferredHandler(BLooperProxy *self, BHandler *handler) {
		self->SetPreferredHandler(handler);
	}
	
//	virtual	thread_id		Run();
	thread_id be_BLooper_Run(BLooperProxy *self) {
		return self->Run_super();
	}


//	virtual	void			Quit();
	void be_BLooper_Quit(BLooperProxy *self) {
		return self->Quit_super();
	}
	
	
//	virtual	bool			QuitRequested();
	bool be_BLooper_QuitRequested(BLooperProxy *self) {
		return self->QuitRequested_super();
	}
	
	
//	bool			Lock();
	bool be_BLooper_Lock(BLooperProxy *self) {
		return self->Lock();
	}
	
	
//	void			Unlock();
	void be_BLooper_Unlock(BLooperProxy *self) {
		self->Unlock();
	}
	
	
//	bool			IsLocked() const;
	bool be_BLooper_IsLocked(BLooperProxy *self) {
		return self->IsLocked();
	}
	
	
//	status_t		LockWithTimeout(bigtime_t timeout);
	status_t be_BLooper_LockWithTimeout(BLooperProxy *self, bigtime_t timeout) {
		return self->LockWithTimeout(timeout);
	}
	
	
//	thread_id		Thread() const;
	thread_id be_BLooper_Thread(BLooperProxy *self) {
		return self->Thread();
	}
	
	
//	team_id			Team() const;
	team_id be_BLooper_Team(BLooperProxy *self) {
		return self->Team();
	}
	

//	thread_id		LockingThread() const;
	thread_id be_BLooper_LockingThread(BLooperProxy *self) {
		return self->LockingThread();
	}
	
	
//	int32			CountLocks() const;
	int32 be_BLooper_CountLocks(BLooperProxy *self) {
		return self->CountLocks();
	}
	
	
//	int32			CountLockRequests() const;
	int32 be_BLooper_CountLockRequests(BLooperProxy *self) {
		return self->CountLockRequests();
	}
	
//	sem_id			Sem() const;
	sem_id be_BLooper_Sem(BLooperProxy *self) {
		return self->Sem();
	}
	
/*
	virtual BHandler*		ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
*/
	BHandler * be_BLooper_ResolveSpecifier(BLooperProxy *self, BMessage *msg,
											int32 index, BMessage *specifier,
											int32 from, const char *property)
	{
		return self->ResolveSpecifier_super(msg, index, specifier, from, property);
	}
	
	
//	virtual status_t		GetSupportedSuites(BMessage* data);
	status_t be_BLooper_GetSupportedSuites(BLooperProxy *self, BMessage *data) {
		return self->GetSupportedSuites_super(data);
	}
	
	
//	virtual	void			AddCommonFilter(BMessageFilter* filter);
	void be_BLooper_AddCommonFilter(BLooperProxy *self, BMessageFilter *filter) {
		self->AddCommonFilter_super(filter);
	}
	
	
//	virtual	bool			RemoveCommonFilter(BMessageFilter* filter);
	bool be_BLooper_RemoveCommonFilter(BLooperProxy *self, BMessageFilter *filter) {
		return self->RemoveCommonFilter_super(filter);
	}
	
	
//	virtual	void			SetCommonFilterList(BList* filters);
	void be_BLooper_SetCommonFilterList(BLooperProxy *self, BList *filters) {
		self->SetCommonFilterList_super(filters);
	}
	
	
//	BList*			CommonFilterList() const;
	BList * be_BLooper_CommonFilterList(BLooperProxy *self) {
		return self->CommonFilterList();
	}
}
