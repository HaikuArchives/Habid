/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "App/Cursor.h"


BCursorProxy::BCursorProxy(void *bindInstPtr, const void* cursorData)
: fBindInstPtr(bindInstPtr), BCursor(cursorData) { }

BCursorProxy::BCursorProxy(void *bindInstPtr, const BCursor& other)
: fBindInstPtr(bindInstPtr), BCursor(other) { }

BCursorProxy::BCursorProxy(void *bindInstPtr, BCursorID id)
: fBindInstPtr(bindInstPtr), BCursor(id) { }

BCursorProxy::BCursorProxy(void *bindInstPtr, BMessage* data)
: fBindInstPtr(bindInstPtr), BCursor(data) { }

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
	BCursor * be_BCursor_ctor(void *bindInstPtr, const void* cursorData)
	{
		return (BCursor *)new BCursorProxy(bindInstPtr, cursorData);
	}

	BCursor * be_BCursor_ctor_1(void *bindInstPtr, const BCursor* other)
	{
		return (BCursor *)new BCursorProxy(bindInstPtr, *other);
	}

	BCursor * be_BCursor_ctor_2(void *bindInstPtr, BCursorID id)
	{
		return (BCursor *)new BCursorProxy(bindInstPtr, id);
	}

	BCursor * be_BCursor_ctor_3(void *bindInstPtr, BMessage* data)
	{
		return (BCursor *)new BCursorProxy(bindInstPtr, data);
	}

	void be_BCursor_dtor(BCursor* self)
	{
		delete self;
	}

	status_t be_BCursor_Archive(BCursor *self, BMessage* archive, bool deep)
	{
		BCursorProxy *proxy = dynamic_cast<BCursorProxy *>(self);
		if(proxy)
			return proxy->Archive_super(archive, deep);
		else
			return self->Archive(archive, deep);
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


