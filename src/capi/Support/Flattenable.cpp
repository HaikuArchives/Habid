/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Support/Flattenable.h"

BFlattenableBridge::BFlattenableBridge()
: BFlattenable()
{
}
BFlattenableBridge::~BFlattenableBridge() { }
bool BFlattenableBridge::IsFixedSize()const{ }
type_code BFlattenableBridge::TypeCode()const{ }
ssize_t BFlattenableBridge::FlattenedSize()const{ }
status_t BFlattenableBridge::Flatten(void * buffer, ssize_t size)const{ }
bool BFlattenableBridge::AllowsTypeCode(type_code code)const{ }
status_t BFlattenableBridge::Unflatten(type_code code, const void * buffer, ssize_t size){ }

BFlattenableProxy::BFlattenableProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BFlattenableBridge() { }

BFlattenableProxy::~BFlattenableProxy() { }

bool BFlattenableProxy::IsFixedSize() const
{
	return bind_BFlattenable_IsFixedSize(fBindInstPtr);
}

bool BFlattenableProxy::IsFixedSize_super() const
{
	return BFlattenableBridge::IsFixedSize();
}

type_code BFlattenableProxy::TypeCode() const
{
	return bind_BFlattenable_TypeCode(fBindInstPtr);
}

type_code BFlattenableProxy::TypeCode_super() const
{
	return BFlattenableBridge::TypeCode();
}

ssize_t BFlattenableProxy::FlattenedSize() const
{
	return bind_BFlattenable_FlattenedSize(fBindInstPtr);
}

ssize_t BFlattenableProxy::FlattenedSize_super() const
{
	return BFlattenableBridge::FlattenedSize();
}

status_t BFlattenableProxy::Flatten(void * buffer, ssize_t size) const
{
	return bind_BFlattenable_Flatten(fBindInstPtr, buffer, size);
}

status_t BFlattenableProxy::Flatten_super(void * buffer, ssize_t size) const
{
	return BFlattenableBridge::Flatten(buffer, size);
}

bool BFlattenableProxy::AllowsTypeCode(type_code code) const
{
	return bind_BFlattenable_AllowsTypeCode(fBindInstPtr, code);
}

bool BFlattenableProxy::AllowsTypeCode_super(type_code code) const
{
	return BFlattenableBridge::AllowsTypeCode(code);
}

status_t BFlattenableProxy::Unflatten(type_code code, const void * buffer, ssize_t size) 
{
	return bind_BFlattenable_Unflatten(fBindInstPtr, code, buffer, size);
}

status_t BFlattenableProxy::Unflatten_super(type_code code, const void * buffer, ssize_t size) 
{
	return BFlattenableBridge::Unflatten(code, buffer, size);
}


extern "C" {
	BFlattenable * be_BFlattenable_ctor(void *bindInstPtr)
	{
		return (BFlattenable *)new BFlattenableProxy(bindInstPtr);
	}

	void be_BFlattenable_dtor(BFlattenable* self)
	{
		delete self;
	}

	bool be_BFlattenable_IsFixedSize(BFlattenable *self)
	{
		BFlattenableProxy *proxy = dynamic_cast<BFlattenableProxy *>(self);
		if(proxy)
			return proxy->IsFixedSize_super();
		else
			return self->IsFixedSize();
	}

	type_code be_BFlattenable_TypeCode(BFlattenable *self)
	{
		BFlattenableProxy *proxy = dynamic_cast<BFlattenableProxy *>(self);
		if(proxy)
			return proxy->TypeCode_super();
		else
			return self->TypeCode();
	}

	ssize_t be_BFlattenable_FlattenedSize(BFlattenable *self)
	{
		BFlattenableProxy *proxy = dynamic_cast<BFlattenableProxy *>(self);
		if(proxy)
			return proxy->FlattenedSize_super();
		else
			return self->FlattenedSize();
	}

	status_t be_BFlattenable_Flatten(BFlattenable *self, void * buffer, ssize_t size)
	{
		BFlattenableProxy *proxy = dynamic_cast<BFlattenableProxy *>(self);
		if(proxy)
			return proxy->Flatten_super(buffer, size);
		else
			return self->Flatten(buffer, size);
	}

	bool be_BFlattenable_AllowsTypeCode(BFlattenable *self, type_code code)
	{
		BFlattenableProxy *proxy = dynamic_cast<BFlattenableProxy *>(self);
		if(proxy)
			return proxy->AllowsTypeCode_super(code);
		else
			return self->AllowsTypeCode(code);
	}

	status_t be_BFlattenable_Unflatten(BFlattenable *self, type_code code, const void * buffer, ssize_t size)
	{
		BFlattenableProxy *proxy = dynamic_cast<BFlattenableProxy *>(self);
		if(proxy)
			return proxy->Unflatten_super(code, buffer, size);
		else
			return self->Unflatten(code, buffer, size);
	}

}


