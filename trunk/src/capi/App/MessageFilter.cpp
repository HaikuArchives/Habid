/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/MessageFilter.h"


BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, uint32 what, filter_hook func)
: fBindInstPtr(bindInstPtr), BMessageFilter(what, func) { }

BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func)
: fBindInstPtr(bindInstPtr), BMessageFilter(delivery, source, func) { }

BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func)
: fBindInstPtr(bindInstPtr), BMessageFilter(delivery, source, what, func) { }

BMessageFilterProxy::BMessageFilterProxy(void *bindInstPtr, const BMessageFilter* filter)
: fBindInstPtr(bindInstPtr), BMessageFilter(filter) { }

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
	BMessageFilter * be_BMessageFilter_ctor(void *bindInstPtr, uint32 what, filter_hook func)
	{
		return (BMessageFilter *)new BMessageFilterProxy(bindInstPtr, what, func);
	}

	BMessageFilter * be_BMessageFilter_ctor_1(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func)
	{
		return (BMessageFilter *)new BMessageFilterProxy(bindInstPtr, delivery, source, func);
	}

	BMessageFilter * be_BMessageFilter_ctor_2(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func)
	{
		return (BMessageFilter *)new BMessageFilterProxy(bindInstPtr, delivery, source, what, func);
	}

	BMessageFilter * be_BMessageFilter_ctor_3(void *bindInstPtr, const BMessageFilter* filter)
	{
		return (BMessageFilter *)new BMessageFilterProxy(bindInstPtr, filter);
	}

	void be_BMessageFilter_dtor(BMessageFilter* self)
	{
		delete self;
	}

	BMessageFilter* be_BMessageFilter_opAssign(BMessageFilter *self, const BMessageFilter* from)
	{
		return &self->operator=(*from);
	}

	filter_result be_BMessageFilter_Filter(BMessageFilter *self, BMessage* message, BHandler** _target)
	{
		BMessageFilterProxy *proxy = dynamic_cast<BMessageFilterProxy *>(self);
		if(proxy)
			return proxy->Filter_super(message, _target);
		else
			return self->Filter(message, _target);
	}

	message_delivery be_BMessageFilter_MessageDelivery(BMessageFilter *self)
	{
		return self->MessageDelivery();
	}

	message_source be_BMessageFilter_MessageSource(BMessageFilter *self)
	{
		return self->MessageSource();
	}

	uint32 be_BMessageFilter_Command(BMessageFilter *self)
	{
		return self->Command();
	}

	bool be_BMessageFilter_FiltersAnyCommand(BMessageFilter *self)
	{
		return self->FiltersAnyCommand();
	}

	BLooper* be_BMessageFilter_Looper(BMessageFilter *self)
	{
		return self->Looper();
	}

}


