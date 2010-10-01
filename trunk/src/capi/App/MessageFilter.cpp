/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/MessageFilter.h"

BMessageFilterBridge::BMessageFilterBridge(uint32 what, filter_hook func)
: BMessageFilter(what, func)
{
}
BMessageFilterBridge::BMessageFilterBridge(message_delivery delivery, message_source source, filter_hook func)
: BMessageFilter(delivery, source, func)
{
}
BMessageFilterBridge::BMessageFilterBridge(message_delivery delivery, message_source source, uint32 what, filter_hook func)
: BMessageFilter(delivery, source, what, func)
{
}
BMessageFilterBridge::BMessageFilterBridge(const BMessageFilter* filter)
: BMessageFilter(filter)
{
}
BMessageFilterBridge::~BMessageFilterBridge() { }

BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, uint32 what, filter_hook func)
: fBindInstPtr(bindInstPtr), BMessageFilterBridge(what, func) { }

BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func)
: fBindInstPtr(bindInstPtr), BMessageFilterBridge(delivery, source, func) { }

BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func)
: fBindInstPtr(bindInstPtr), BMessageFilterBridge(delivery, source, what, func) { }

BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, const BMessageFilter* filter)
: fBindInstPtr(bindInstPtr), BMessageFilterBridge(filter) { }

BMessageFilterProxy::~BMessageFilterProxy() { }

filter_result BMessageFilterProxy::Filter(BMessage* message, BHandler** _target) 
{
	return bind_BMessageFilter_Filter(fBindInstPtr, message, _target);
}

filter_result BMessageFilterProxy::Filter_super(BMessage* message, BHandler** _target) 
{
	return BMessageFilter::Filter(message, _target);
}


extern "C" {
	BMessageFilterProxy * be_BMessageFilter_ctor(void *bindInstPtr, uint32 what, filter_hook func)
	{
		return new BMessageFilterProxy(bindInstPtr, what, func);
	}

	BMessageFilterProxy * be_BMessageFilter_ctor_1(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func)
	{
		return new BMessageFilterProxy(bindInstPtr, delivery, source, func);
	}

	BMessageFilterProxy * be_BMessageFilter_ctor_2(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func)
	{
		return new BMessageFilterProxy(bindInstPtr, delivery, source, what, func);
	}

	BMessageFilterProxy * be_BMessageFilter_ctor_3(void *bindInstPtr, const BMessageFilter* filter)
	{
		return new BMessageFilterProxy(bindInstPtr, filter);
	}

	void be_BMessageFilter_dtor(BMessageFilter* self)
	{
		delete self;
	}

	BMessageFilter* be_BMessageFilter_opAssign(BMessageFilter *self, const BMessageFilter* from)
	{
		return &self->operator=(*from);
	}

	filter_result be_BMessageFilter_Filter(BMessageFilterProxy *self, BMessage* message, BHandler** _target)
	{
		return self->Filter_super(message, _target);
	}

	message_delivery be_BMessageFilter_MessageDelivery(BMessageFilterProxy *self)
	{
		return self->MessageDelivery();
	}

	message_source be_BMessageFilter_MessageSource(BMessageFilterProxy *self)
	{
		return self->MessageSource();
	}

	uint32 be_BMessageFilter_Command(BMessageFilterProxy *self)
	{
		return self->Command();
	}

	bool be_BMessageFilter_FiltersAnyCommand(BMessageFilterProxy *self)
	{
		return self->FiltersAnyCommand();
	}

	BLooper* be_BMessageFilter_Looper(BMessageFilterProxy *self)
	{
		return self->Looper();
	}

}


