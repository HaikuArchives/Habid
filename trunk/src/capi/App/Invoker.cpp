/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/Invoker.h"

BInvokerBridge::BInvokerBridge()
: BInvoker()
{
}
BInvokerBridge::BInvokerBridge(BMessage* message, const BHandler* handler, const BLooper* looper)
: BInvoker(message, handler, looper)
{
}
BInvokerBridge::BInvokerBridge(BMessage* message, BMessenger target)
: BInvoker(message, target)
{
}
BInvokerBridge::~BInvokerBridge() { }

BInvokerProxy::BInvokerProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BInvokerBridge() { }

BInvokerProxy::BInvokerProxy(void *bindInstPtr, BMessage* message, const BHandler* handler, const BLooper* looper)
: fBindInstPtr(bindInstPtr), BInvokerBridge(message, handler, looper) { }

BInvokerProxy::BInvokerProxy(void *bindInstPtr, BMessage* message, BMessenger target)
: fBindInstPtr(bindInstPtr), BInvokerBridge(message, target) { }

BInvokerProxy::~BInvokerProxy() { }

status_t BInvokerProxy::SetMessage(BMessage* message) 
{
	return bind_BInvoker_SetMessage(fBindInstPtr, message);
}

status_t BInvokerProxy::SetMessage_super(BMessage* message) 
{
	return BInvoker::SetMessage(message);
}

status_t BInvokerProxy::SetTarget(const BHandler* handler, const BLooper* looper) 
{
	return bind_BInvoker_SetTarget(fBindInstPtr, handler, looper);
}

status_t BInvokerProxy::SetTarget_super(const BHandler* handler, const BLooper* looper) 
{
	return BInvoker::SetTarget(handler, looper);
}

status_t BInvokerProxy::SetTarget(BMessenger messenger) 
{
	return bind_BInvoker_SetTarget_1(fBindInstPtr, &messenger);
}

status_t BInvokerProxy::SetTarget_super(BMessenger messenger) 
{
	return BInvoker::SetTarget(messenger);
}

status_t BInvokerProxy::SetHandlerForReply(BHandler* handler) 
{
	return bind_BInvoker_SetHandlerForReply(fBindInstPtr, handler);
}

status_t BInvokerProxy::SetHandlerForReply_super(BHandler* handler) 
{
	return BInvoker::SetHandlerForReply(handler);
}

status_t BInvokerProxy::Invoke(BMessage* message) 
{
	return bind_BInvoker_Invoke(fBindInstPtr, message);
}

status_t BInvokerProxy::Invoke_super(BMessage* message) 
{
	return BInvoker::Invoke(message);
}


extern "C" {
	BInvokerProxy * be_BInvoker_ctor(void *bindInstPtr)
	{
		return new BInvokerProxy(bindInstPtr);
	}

	BInvokerProxy * be_BInvoker_ctor_1(void *bindInstPtr, BMessage* message, const BHandler* handler, const BLooper* looper)
	{
		return new BInvokerProxy(bindInstPtr, message, handler, looper);
	}

	BInvokerProxy * be_BInvoker_ctor_2(void *bindInstPtr, BMessage* message, BMessenger *target)
	{
		return new BInvokerProxy(bindInstPtr, message, *target);
	}

	void be_BInvoker_dtor(BInvoker* self)
	{
		delete self;
	}

	status_t be_BInvoker_SetMessage(BInvokerProxy *self, BMessage* message)
	{
		return self->SetMessage_super(message);
	}

	BMessage* be_BInvoker_Message(BInvokerProxy *self)
	{
		return self->Message();
	}

	uint32 be_BInvoker_Command(BInvokerProxy *self)
	{
		return self->Command();
	}

	status_t be_BInvoker_SetTarget(BInvokerProxy *self, const BHandler* handler, const BLooper* looper)
	{
		return self->SetTarget_super(handler, looper);
	}

	status_t be_BInvoker_SetTarget_1(BInvokerProxy *self, BMessenger *messenger)
	{
		return self->SetTarget_super(*messenger);
	}

	bool be_BInvoker_IsTargetLocal(BInvokerProxy *self)
	{
		return self->IsTargetLocal();
	}

	BHandler* be_BInvoker_Target(BInvokerProxy *self, BLooper** _looper)
	{
		return self->Target(_looper);
	}

	BMessenger * be_BInvoker_Messenger(BInvokerProxy *self)
	{
		return new BMessenger(self->Messenger());
	}

	status_t be_BInvoker_SetHandlerForReply(BInvokerProxy *self, BHandler* handler)
	{
		return self->SetHandlerForReply_super(handler);
	}

	BHandler* be_BInvoker_HandlerForReply(BInvokerProxy *self)
	{
		return self->HandlerForReply();
	}

	status_t be_BInvoker_Invoke(BInvokerProxy *self, BMessage* message)
	{
		return self->Invoke_super(message);
	}

	status_t be_BInvoker_InvokeNotify(BInvokerProxy *self, BMessage* message, uint32 kind)
	{
		return self->InvokeNotify(message, kind);
	}

	status_t be_BInvoker_SetTimeout(BInvokerProxy *self, bigtime_t timeout)
	{
		return self->SetTimeout(timeout);
	}

	bigtime_t be_BInvoker_Timeout(BInvokerProxy *self)
	{
		return self->Timeout();
	}

}


