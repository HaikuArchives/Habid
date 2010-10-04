/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <App/PropertyInfo.h>

BPropertyInfoBridge::BPropertyInfoBridge(property_info* prop, value_info* value, bool freeOnDelete)
: BPropertyInfo(prop, value, freeOnDelete)
{
}
BPropertyInfoBridge::~BPropertyInfoBridge() { }

BPropertyInfoProxy::BPropertyInfoProxy(void *bindInstPtr, property_info* prop, value_info* value, bool freeOnDelete)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPropertyInfoBridge(prop, value, freeOnDelete) { }

BPropertyInfoProxy::~BPropertyInfoProxy() { }

int32 BPropertyInfoProxy::FindMatch(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data) 
{
	return bind_BPropertyInfo_FindMatch(fBindInstPtr, msg, index, specifier, form, prop, data);
}

int32 BPropertyInfoProxy::FindMatch_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data) 
{
	return BPropertyInfo::FindMatch(msg, index, specifier, form, prop, data);
}

bool BPropertyInfoProxy::IsFixedSize() const
{
	return bind_BPropertyInfo_IsFixedSize(fBindInstPtr);
}

bool BPropertyInfoProxy::IsFixedSize_super() const
{
	return BPropertyInfo::IsFixedSize();
}

type_code BPropertyInfoProxy::TypeCode() const
{
	return bind_BPropertyInfo_TypeCode(fBindInstPtr);
}

type_code BPropertyInfoProxy::TypeCode_super() const
{
	return BPropertyInfo::TypeCode();
}

ssize_t BPropertyInfoProxy::FlattenedSize() const
{
	return bind_BPropertyInfo_FlattenedSize(fBindInstPtr);
}

ssize_t BPropertyInfoProxy::FlattenedSize_super() const
{
	return BPropertyInfo::FlattenedSize();
}

status_t BPropertyInfoProxy::Flatten(void* buffer, ssize_t size) const
{
	return bind_BPropertyInfo_Flatten(fBindInstPtr, buffer, size);
}

status_t BPropertyInfoProxy::Flatten_super(void* buffer, ssize_t size) const
{
	return BPropertyInfo::Flatten(buffer, size);
}

bool BPropertyInfoProxy::AllowsTypeCode(type_code code) const
{
	return bind_BPropertyInfo_AllowsTypeCode(fBindInstPtr, code);
}

bool BPropertyInfoProxy::AllowsTypeCode_super(type_code code) const
{
	return BPropertyInfo::AllowsTypeCode(code);
}

status_t BPropertyInfoProxy::Unflatten(type_code code, const void* buffer, ssize_t size) 
{
	return bind_BPropertyInfo_Unflatten(fBindInstPtr, code, buffer, size);
}

status_t BPropertyInfoProxy::Unflatten_super(type_code code, const void* buffer, ssize_t size) 
{
	return BPropertyInfo::Unflatten(code, buffer, size);
}


extern "C" {
	BPropertyInfoProxy * be_BPropertyInfo_ctor(void *bindInstPtr, property_info* prop, value_info* value, bool freeOnDelete)
	{
		return new BPropertyInfoProxy(bindInstPtr, prop, value, freeOnDelete);
	}

	void be_BPropertyInfo_dtor(BPropertyInfo* self)
	{
		delete self;
	}

	int32 be_BPropertyInfo_FindMatch(BPropertyInfoProxy *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data)
	{
		return self->FindMatch_super(msg, index, specifier, form, prop, data);
	}

	bool be_BPropertyInfo_IsFixedSize(BPropertyInfoProxy *self)
	{
		return self->IsFixedSize_super();
	}

	type_code be_BPropertyInfo_TypeCode(BPropertyInfoProxy *self)
	{
		return self->TypeCode_super();
	}

	ssize_t be_BPropertyInfo_FlattenedSize(BPropertyInfoProxy *self)
	{
		return self->FlattenedSize_super();
	}

	status_t be_BPropertyInfo_Flatten(BPropertyInfoProxy *self, void* buffer, ssize_t size)
	{
		return self->Flatten_super(buffer, size);
	}

	bool be_BPropertyInfo_AllowsTypeCode(BPropertyInfoProxy *self, type_code code)
	{
		return self->AllowsTypeCode_super(code);
	}

	status_t be_BPropertyInfo_Unflatten(BPropertyInfoProxy *self, type_code code, const void* buffer, ssize_t size)
	{
		return self->Unflatten_super(code, buffer, size);
	}

	const property_info* be_BPropertyInfo_Properties(BPropertyInfoProxy *self)
	{
		return self->Properties();
	}

	const value_info* be_BPropertyInfo_Values(BPropertyInfoProxy *self)
	{
		return self->Values();
	}

	int32 be_BPropertyInfo_CountProperties(BPropertyInfoProxy *self)
	{
		return self->CountProperties();
	}

	int32 be_BPropertyInfo_CountValues(BPropertyInfoProxy *self)
	{
		return self->CountValues();
	}

	void be_BPropertyInfo_PrintToStream(BPropertyInfoProxy *self)
	{
		self->PrintToStream();
	}

}


