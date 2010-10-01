/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.MessageFilter;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Looper;
import Be.App.Handler;
import Be.App.Message;

enum filter_result {
	B_SKIP_MESSAGE,
	B_DISPATCH_MESSAGE
}

typedef filter_result (*filter_hook) (void* message, void** target, void* filter);

enum message_delivery {
	B_ANY_DELIVERY,
	B_DROPPED_DELIVERY,
	B_PROGRAMMED_DELIVERY
};

enum message_source {
	B_ANY_SOURCE,
	B_REMOTE_SOURCE,
	B_LOCAL_SOURCE
};

extern (C) extern {
	// BMessageFilterProxy * be_BMessageFilter_ctor(void *bindInstPtr, uint32 what, filter_hook func);
	void * be_BMessageFilter_ctor(void *bindInstPtr, uint32 what, filter_hook func);

	// BMessageFilterProxy * be_BMessageFilter_ctor_1(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func);
	void * be_BMessageFilter_ctor_1(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func);

	// BMessageFilterProxy * be_BMessageFilter_ctor_2(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func);
	void * be_BMessageFilter_ctor_2(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func);

	// BMessageFilterProxy * be_BMessageFilter_ctor_3(void *bindInstPtr, const BMessageFilter* filter);
	void * be_BMessageFilter_ctor_3(void *bindInstPtr, void * filter);

	// void be_BMessageFilter_dtor(BMessageFilter* self);
	void be_BMessageFilter_dtor(void* self);

	// BMessageFilter* be_BMessageFilter_opAssign(BMessageFilter *self, const BMessageFilter* from);
	void * be_BMessageFilter_opAssign(void *self, void * from);

	// filter_result be_BMessageFilter_Filter(BMessageFilterProxy *self, BMessage* message, BHandler** _target);
	filter_result be_BMessageFilter_Filter(void *self, void* message, void** _target);

	// message_delivery be_BMessageFilter_MessageDelivery(BMessageFilterProxy *self);
	message_delivery be_BMessageFilter_MessageDelivery(void *self);

	// message_source be_BMessageFilter_MessageSource(BMessageFilterProxy *self);
	message_source be_BMessageFilter_MessageSource(void *self);

	// uint32 be_BMessageFilter_Command(BMessageFilterProxy *self);
	uint32 be_BMessageFilter_Command(void *self);

	// bool be_BMessageFilter_FiltersAnyCommand(BMessageFilterProxy *self);
	bool be_BMessageFilter_FiltersAnyCommand(void *self);

	// BLooper* be_BMessageFilter_Looper(BMessageFilterProxy *self);
	void* be_BMessageFilter_Looper(void *self);

}


extern (C) {
	filter_result bind_BMessageFilter_Filter(void *bindInstPtr, void* message, void** _target) {
		return (cast(BMessageFilter)bindInstPtr).Filter(new BMessage(message, false), new BHandler(*_target, false));
	}
}


interface IBMessageFilter
{

	// BMessageFilter& be_BMessageFilter_opAssign(BMessageFilter *self, const BMessageFilter& from);
	//BMessageFilter& opAssign();

	// filter_result be_BMessageFilter_Filter(BMessageFilter *self, BMessage* message, BHandler** _target);
	filter_result Filter(BMessage message, BHandler _target);

	// message_delivery be_BMessageFilter_MessageDelivery(BMessageFilter *self);
	message_delivery MessageDelivery();

	// message_source be_BMessageFilter_MessageSource(BMessageFilter *self);
	message_source MessageSource();

	// uint32 be_BMessageFilter_Command(BMessageFilter *self);
	uint32 Command();

	// bool be_BMessageFilter_FiltersAnyCommand(BMessageFilter *self);
	bool FiltersAnyCommand();

	// BLooper* be_BMessageFilter_Looper(BMessageFilter *self);
	BLooper Looper();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BMessageFilter : IBMessageFilter
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:

	// BMessageFilterProxy * be_BMessageFilter_ctor(void *bindInstPtr, uint32 what, filter_hook func);
	this(uint32 what, filter_hook func) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessageFilter_ctor(cast(void *)this, what, func);
			_OwnsPtr = true;
		}
	}

	// BMessageFilterProxy * be_BMessageFilter_ctor_1(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func);
	this(message_delivery delivery, message_source source, filter_hook func) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessageFilter_ctor_1(cast(void *)this, delivery, source, func);
			_OwnsPtr = true;
		}
	}

	// BMessageFilterProxy * be_BMessageFilter_ctor_2(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func);
	this(message_delivery delivery, message_source source, uint32 what, filter_hook func) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessageFilter_ctor_2(cast(void *)this, delivery, source, what, func);
			_OwnsPtr = true;
		}
	}

	// BMessageFilterProxy * be_BMessageFilter_ctor_3(void *bindInstPtr, const BMessageFilter* filter);
	this(BMessageFilter filter) {
		if(_InstPtr is null) {
			_InstPtr = be_BMessageFilter_ctor_3(cast(void *)this, filter._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BMessageFilter_dtor(BMessageFilter* self);
	~this() {
		if(_InstPtr !is null && fOwnsPointer) {
			be_BMessageFilter_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// BMessageFilter& be_BMessageFilter_opAssign(BMessageFilter *self, const BMessageFilter& from);
	//BMessageFilter& opAssign();

	// filter_result be_BMessageFilter_Filter(BMessageFilter *self, BMessage* message, BHandler** _target);
	filter_result Filter(BMessage message, BHandler target) {
		return be_BMessageFilter_Filter(_InstPtr(), message._InstPtr(), cast(void **)target._InstPtr());
	}

	// message_delivery be_BMessageFilter_MessageDelivery(BMessageFilter *self);
	message_delivery MessageDelivery() {
		return be_BMessageFilter_MessageDelivery(_InstPtr());
	}

	// message_source be_BMessageFilter_MessageSource(BMessageFilter *self);
	message_source MessageSource() {
		return be_BMessageFilter_MessageSource(_InstPtr());
	}

	// uint32 be_BMessageFilter_Command(BMessageFilter *self);
	uint32 Command() {
		return be_BMessageFilter_Command(_InstPtr());
	}

	// bool be_BMessageFilter_FiltersAnyCommand(BMessageFilter *self);
	bool FiltersAnyCommand() {
		return be_BMessageFilter_FiltersAnyCommand(_InstPtr());
	}

	// BLooper* be_BMessageFilter_Looper(BMessageFilter *self);
	BLooper Looper() {
		return new BLooper(be_BMessageFilter_Looper(_InstPtr()), false);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


