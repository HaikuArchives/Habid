/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/Cursor.h"

BCursorBridge::BCursorBridge(const void* cursorData)
: BCursor(cursorData)
{
}
BCursorBridge::BCursorBridge(const BCursor& other)
: BCursor(other)
{
}
BCursorBridge::BCursorBridge(BCursorID id)
: BCursor(id)
{
}
BCursorBridge::BCursorBridge(BMessage* data)
: BCursor(data)
{
}
BCursorBridge::~BCursorBridge() { }

BCursorProxy::BCursorProxy(void *bindInstPtr, const void* cursorData)
: fBindInstPtr(bindInstPtr), BCursorBridge(cursorData) { }

BCursorProxy::BCursorProxy(void *bindInstPtr, const BCursor& other)
: fBindInstPtr(bindInstPtr), BCursorBridge(other) { }

BCursorProxy::BCursorProxy(void *bindInstPtr, BCursorID id)
: fBindInstPtr(bindInstPtr), BCursorBridge(id) { }

BCursorProxy::BCursorProxy(void *bindInstPtr, BMessage* data)
: fBindInstPtr(bindInstPtr), BCursorBridge(data) { }

BCursorProxy::~BCursorProxy() { }

status_t BCursorProxy::Archive(BMessage* archive, bool deep) const
{
	return bind_BCursor_Archive(fBindInstPtr, archive, deep);
}

status_t BCursorProxy::Archive_super(BMessage* archive, bool deep) const
{
	return BCursor::Archive(archive, deep);
}


extern "C" {
	BCursorProxy * be_BCursor_ctor(void *bindInstPtr, const void* cursorData)
	{
		return new BCursorProxy(bindInstPtr, cursorData);
	}

	BCursorProxy * be_BCursor_ctor_1(void *bindInstPtr, const BCursor* other)
	{
		return new BCursorProxy(bindInstPtr, *other);
	}

	BCursorProxy * be_BCursor_ctor_2(void *bindInstPtr, BCursorID id)
	{
		return new BCursorProxy(bindInstPtr, id);
	}

	BCursorProxy * be_BCursor_ctor_3(void *bindInstPtr, BMessage* data)
	{
		return new BCursorProxy(bindInstPtr, data);
	}

	void be_BCursor_dtor(BCursor* self)
	{
		delete self;
	}

	status_t be_BCursor_Archive(BCursorProxy *self, BMessage* archive, bool deep)
	{
		return self->Archive_super(archive, deep);
	}

	BArchivable* be_BCursor_Instantiate_static(BMessage* archive)
	{
		return BCursor::Instantiate(archive);
	}

	BCursor* be_BCursor_opAssign(BCursor *self, const BCursor* other)
	{
		return &self->operator=(*other);
	}

	bool be_BCursor_opEquals(BCursor *self, const BCursor* other)
	{
		return self->operator==(*other);
	}

	bool be_BCursor_opNotEquals(BCursor *self, const BCursor* other)
	{
		return self->operator!=(*other);
	}

}


