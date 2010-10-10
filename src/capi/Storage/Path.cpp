/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Storage/Path.h>


BPathProxy::BPathProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPath() { }

BPathProxy::BPathProxy(void *bindInstPtr, const BPath& path)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPath(path) { }

BPathProxy::BPathProxy(void *bindInstPtr, const entry_ref* _ref)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPath(_ref) { }

BPathProxy::BPathProxy(void *bindInstPtr, const BEntry* entry)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPath(entry) { }

BPathProxy::BPathProxy(void *bindInstPtr, const char* dir, const char* leaf, bool normalize)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPath(dir, leaf, normalize) { }

BPathProxy::BPathProxy(void *bindInstPtr, const BDirectory* dir, const char* leaf, bool normalize)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPath(dir, leaf, normalize) { }

BPathProxy::~BPathProxy() { }

bool BPathProxy::IsFixedSize() const
{
	return bind_BPath_IsFixedSize(fBindInstPtr);
}

bool BPathProxy::IsFixedSize_super() const
{
	return BPath::IsFixedSize();
}

type_code BPathProxy::TypeCode() const
{
	return bind_BPath_TypeCode(fBindInstPtr);
}

type_code BPathProxy::TypeCode_super() const
{
	return BPath::TypeCode();
}

ssize_t BPathProxy::FlattenedSize() const
{
	return bind_BPath_FlattenedSize(fBindInstPtr);
}

ssize_t BPathProxy::FlattenedSize_super() const
{
	return BPath::FlattenedSize();
}

status_t BPathProxy::Flatten(void* buffer, ssize_t size) const
{
	return bind_BPath_Flatten(fBindInstPtr, buffer, size);
}

status_t BPathProxy::Flatten_super(void* buffer, ssize_t size) const
{
	return BPath::Flatten(buffer, size);
}

bool BPathProxy::AllowsTypeCode(type_code code) const
{
	return bind_BPath_AllowsTypeCode(fBindInstPtr, code);
}

bool BPathProxy::AllowsTypeCode_super(type_code code) const
{
	return BPath::AllowsTypeCode(code);
}

status_t BPathProxy::Unflatten(type_code code, const void* buffer, ssize_t size) 
{
	return bind_BPath_Unflatten(fBindInstPtr, code, buffer, size);
}

status_t BPathProxy::Unflatten_super(type_code code, const void* buffer, ssize_t size) 
{
	return BPath::Unflatten(code, buffer, size);
}


extern "C" {
	BPath * be_BPath_ctor(void *bindInstPtr)
	{
		return (BPath *)new BPathProxy(bindInstPtr);
	}

	BPath * be_BPath_ctor_1(void *bindInstPtr, const BPath* path)
	{
		return (BPath *)new BPathProxy(bindInstPtr, *path);
	}

	BPath * be_BPath_ctor_2(void *bindInstPtr, const entry_ref* _ref)
	{
		return (BPath *)new BPathProxy(bindInstPtr, _ref);
	}

	BPath * be_BPath_ctor_3(void *bindInstPtr, const BEntry* entry)
	{
		return (BPath *)new BPathProxy(bindInstPtr, entry);
	}

	BPath * be_BPath_ctor_4(void *bindInstPtr, const char* dir, const char* leaf, bool normalize)
	{
		return (BPath *)new BPathProxy(bindInstPtr, dir, leaf, normalize);
	}

	BPath * be_BPath_ctor_5(void *bindInstPtr, const BDirectory* dir, const char* leaf, bool normalize)
	{
		return (BPath *)new BPathProxy(bindInstPtr, dir, leaf, normalize);
	}

	void be_BPath_dtor(BPath* self)
	{
		delete self;
	}

	status_t be_BPath_InitCheck(BPath *self)
	{
		return self->InitCheck();
	}

	status_t be_BPath_SetTo(BPath *self, const entry_ref* _ref)
	{
		return self->SetTo(_ref);
	}

	status_t be_BPath_SetTo_1(BPath *self, const BEntry* entry)
	{
		return self->SetTo(entry);
	}

	status_t be_BPath_SetTo_2(BPath *self, const char* path, const char* leaf, bool normalize)
	{
		return self->SetTo(path, leaf, normalize);
	}

	status_t be_BPath_SetTo_3(BPath *self, const BDirectory* dir, const char* leaf, bool normalize)
	{
		return self->SetTo(dir, leaf, normalize);
	}

	void be_BPath_Unset(BPath *self)
	{
		self->Unset();
	}

	status_t be_BPath_Append(BPath *self, const char* path, bool normalize)
	{
		return self->Append(path, normalize);
	}

	const char* be_BPath_Path(BPath *self)
	{
		return self->Path();
	}

	const char* be_BPath_Leaf(BPath *self)
	{
		return self->Leaf();
	}

	status_t be_BPath_GetParent(BPath *self, BPath* path)
	{
		return self->GetParent(path);
	}

	bool be_BPath_opEquals(BPath *self, const BPath* item)
	{
		return self->operator==(*item);
	}

	bool be_BPath_opEquals_1(BPath *self, const char* path)
	{
		return self->operator==(path);
	}

	bool be_BPath_opNotEquals(BPath *self, const BPath* item)
	{
		return self->operator!=(*item);
	}

	bool be_BPath_opNotEquals_1(BPath *self, const char* path)
	{
		return self->operator!=(path);
	}

	BPath * be_BPath_opAssign(BPath *self, const BPath* item)
	{
		return &self->operator=(*item);
	}

	BPath * be_BPath_opAssign_1(BPath *self, const char* path)
	{
		return &self->operator=(path);
	}

	bool be_BPath_IsFixedSize(BPath *self)
	{
		BPathProxy *proxy = dynamic_cast<BPathProxy *>(self);
		if(proxy)
			return proxy->IsFixedSize_super();
		else
			return self->IsFixedSize();
	}

	type_code be_BPath_TypeCode(BPath *self)
	{
		BPathProxy *proxy = dynamic_cast<BPathProxy *>(self);
		if(proxy)
			return proxy->TypeCode_super();
		else
			return self->TypeCode();
	}

	ssize_t be_BPath_FlattenedSize(BPath *self)
	{
		BPathProxy *proxy = dynamic_cast<BPathProxy *>(self);
		if(proxy)
			return proxy->FlattenedSize_super();
		else
			return self->FlattenedSize();
	}

	status_t be_BPath_Flatten(BPathProxy *self, void* buffer, ssize_t size)
	{
		BPathProxy *proxy = dynamic_cast<BPathProxy *>(self);
		if(proxy)
			return proxy->Flatten_super(buffer, size);
		else
			return self->Flatten(buffer, size);
	}

	bool be_BPath_AllowsTypeCode(BPath *self, type_code code)
	{
		BPathProxy *proxy = dynamic_cast<BPathProxy *>(self);
		if(proxy)
			return proxy->AllowsTypeCode_super(code);
		else
			return self->AllowsTypeCode(code);
	}

	status_t be_BPath_Unflatten(BPath *self, type_code code, const void* buffer, ssize_t size)
	{
		BPathProxy *proxy = dynamic_cast<BPathProxy *>(self);
		if(proxy)
			return proxy->Unflatten_super(code, buffer, size);
		else
			return self->Unflatten(code, buffer, size);
	}

}


