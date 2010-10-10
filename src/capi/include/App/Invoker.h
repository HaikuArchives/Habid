/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BInvoker_
#define HABID_BInvoker_

#include <Invoker.h>

class BInvokerProxy
: public BInvoker
{
	void *fBindInstPtr;
public:
	BInvokerProxy(void *bindInstPtr);
	BInvokerProxy(void *bindInstPtr, BMessage* message, const BHandler* handler, const BLooper* looper);
	BInvokerProxy(void *bindInstPtr, BMessage* message, BMessenger target);
	~BInvokerProxy();

	virtual status_t SetMessage(BMessage* message) ;
	virtual status_t SetMessage_super(BMessage* message) ;
	virtual status_t SetTarget(const BHandler* handler, const BLooper* looper) ;
	virtual status_t SetTarget_super(const BHandler* handler, const BLooper* looper) ;
	virtual status_t SetTarget(BMessenger messenger) ;
	virtual status_t SetTarget_super(BMessenger messenger) ;
	virtual status_t SetHandlerForReply(BHandler* handler) ;
	virtual status_t SetHandlerForReply_super(BHandler* handler) ;
	virtual status_t Invoke(BMessage* message) ;
	virtual status_t Invoke_super(BMessage* message) ;
};


/* BInvoker */
extern "C" {
	status_t bind_BInvoker_SetMessage(void *bindInstPtr, BMessage* message);
	status_t bind_BInvoker_SetTarget(void *bindInstPtr, const BHandler* handler, const BLooper* looper);
	status_t bind_BInvoker_SetTarget_1(void *bindInstPtr, BMessenger *messenger);
	status_t bind_BInvoker_SetHandlerForReply(void *bindInstPtr, BHandler* handler);
	status_t bind_BInvoker_Invoke(void *bindInstPtr, BMessage* message);
}

#endif // HABID_BInvoker_

