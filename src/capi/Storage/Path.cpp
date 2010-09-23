/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Storage/Path.h>

BPathBridge::BPathBridge()
: BPath()
{
}
BPathBridge::BPathBridge(const BPath& path)
: BPath(path)
{
}
BPathBridge::BPathBridge(const entry_ref* _ref)
: BPath(_ref)
{
}
BPathBridge::BPathBridge(const BEntry* entry)
: BPath(entry)
{
}
BPathBridge::BPathBridge(const char* dir, const char* leaf, bool normalize)
: BPath(dir, leaf, normalize)
{
}
BPathBridge::BPathBridge(const BDirectory* dir, const char* leaf, bool normalize)
: BPath(dir, leaf, normalize)
{
}
BPathBridge::~BPathBridge() { }

BPathProxy::BPathProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPathBridge() { }

BPathProxy::BPathProxy(void *bindInstPtr, const BPath& path)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPathBridge(path) { }

BPathProxy::BPathProxy(void *bindInstPtr, const entry_ref* _ref)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPathBridge(_ref) { }

BPathProxy::BPathProxy(void *bindInstPtr, const BEntry* entry)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPathBridge(entry) { }

BPathProxy::BPathProxy(void *bindInstPtr, const char* dir, const char* leaf, bool normalize)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPathBridge(dir, leaf, normalize) { }

BPathProxy::BPathProxy(void *bindInstPtr, const BDirectory* dir, const char* leaf, bool normalize)
: fBindInstPtr(bindInstPtr), BFlattenableProxy(bindInstPtr), BPathBridge(dir, leaf, normalize) { }

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
	BPathProxy * be_BPath_ctor(void *bindInstPtr)
	{
		return new BPathProxy(bindInstPtr);
	}

	BPathProxy * be_BPath_ctor_1(void *bindInstPtr, const BPath* path)
	{
		return new BPathProxy(bindInstPtr, *path);
	}

	BPathProxy * be_BPath_ctor_2(void *bindInstPtr, const entry_ref* _ref)
	{
		return new BPathProxy(bindInstPtr, _ref);
	}

	BPathProxy * be_BPath_ctor_3(void *bindInstPtr, const BEntry* entry)
	{
		return new BPathProxy(bindInstPtr, entry);
	}

	BPathProxy * be_BPath_ctor_4(void *bindInstPtr, const char* dir, const char* leaf, bool normalize)
	{
		return new BPathProxy(bindInstPtr, dir, leaf, normalize);
	}

	BPathProxy * be_BPath_ctor_5(void *bindInstPtr, const BDirectory* dir, const char* leaf, bool normalize)
	{
		return new BPathProxy(bindInstPtr, dir, leaf, normalize);
	}

	void be_BPath_dtor(BPath* self)
	{
		delete self;
	}

	status_t be_BPath_InitCheck(BPathProxy *self)
	{
		return self->InitCheck();
	}

	status_t be_BPath_SetTo(BPathProxy *self, const entry_ref* _ref)
	{
		return self->SetTo(_ref);
	}

	status_t be_BPath_SetTo_1(BPathProxy *self, const BEntry* entry)
	{
		return self->SetTo(entry);
	}

	status_t be_BPath_SetTo_2(BPathProxy *self, const char* path, const char* leaf, bool normalize)
	{
		return self->SetTo(path, leaf, normalize);
	}

	status_t be_BPath_SetTo_3(BPathProxy *self, const BDirectory* dir, const char* leaf, bool normalize)
	{
		return self->SetTo(dir, leaf, normalize);
	}

	void be_BPath_Unset(BPathProxy *self)
	{
		self->Unset();
	}

	status_t be_BPath_Append(BPathProxy *self, const char* path, bool normalize)
	{
		return self->Append(path, normalize);
	}

	const char* be_BPath_Path(BPathProxy *self)
	{
		return self->Path();
	}

	const char* be_BPath_Leaf(BPathProxy *self)
	{
		return self->Leaf();
	}

	status_t be_BPath_GetParent(BPathProxy *self, BPath* path)
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

	bool be_BPath_IsFixedSize(BPathProxy *self)
	{
		return self->IsFixedSize_super();
	}

	type_code be_BPath_TypeCode(BPathProxy *self)
	{
		return self->TypeCode_super();
	}

	ssize_t be_BPath_FlattenedSize(BPathProxy *self)
	{
		return self->FlattenedSize_super();
	}

	status_t be_BPath_Flatten(BPathProxy *self, void* buffer, ssize_t size)
	{
		return self->Flatten_super(buffer, size);
	}

	bool be_BPath_AllowsTypeCode(BPathProxy *self, type_code code)
	{
		return self->AllowsTypeCode_super(code);
	}

	status_t be_BPath_Unflatten(BPathProxy *self, type_code code, const void* buffer, ssize_t size)
	{
		return self->Unflatten_super(code, buffer, size);
	}

}


