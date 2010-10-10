/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Interface/Picture.h"

BPictureBridge::BPictureBridge()
: BPicture()
{
}
BPictureBridge::BPictureBridge(const BPicture& other)
: BPicture(other)
{
}
BPictureBridge::BPictureBridge(BMessage* archive)
: BPicture(archive)
{
}
BPictureBridge::~BPictureBridge() { }

BPictureProxy::BPictureProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BPictureBridge() { }

BPictureProxy::BPictureProxy(void *bindInstPtr, const BPicture& other)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BPictureBridge(other) { }

BPictureProxy::BPictureProxy(void *bindInstPtr, BMessage* archive)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr, archive), BPictureBridge(archive) { }

BPictureProxy::~BPictureProxy() { }

status_t BPictureProxy::Archive(BMessage* archive, bool deep) const
{
	return bind_BPicture_Archive(fBindInstPtr, archive, deep);
}

status_t BPictureProxy::Archive_super(BMessage* archive, bool deep) const
{
	return BPicture::Archive(archive, deep);
}

status_t BPictureProxy::Perform(perform_code d, void* arg) 
{
	return bind_BPicture_Perform(fBindInstPtr, d, arg);
}

status_t BPictureProxy::Perform_super(perform_code d, void* arg) 
{
	return BPicture::Perform(d, arg);
}


extern "C" {
	BPicture *be_BPicture_ctor(void *bindInstPtr)
	{
		return (BPicture* )new BPictureProxy(bindInstPtr);
	}

	BPicture *be_BPicture_ctor_1(void *bindInstPtr, const BPicture* other)
	{
		return (BPicture* )new BPictureProxy(bindInstPtr, *other);
	}

	BPicture *be_BPicture_ctor_2(void *bindInstPtr, BMessage* archive)
	{
		return (BPicture* )new BPictureProxy(bindInstPtr, archive);
	}

	void be_BPicture_dtor(BPicture *self)
	{
		delete self;
	}

	BArchivable* be_BPicture_Instantiate_static(BMessage* archive)
	{
		return BPicture::Instantiate(archive);
	}

	status_t be_BPicture_Archive(BPicture *self, BMessage* archive, bool deep)
	{
		BPictureProxy *proxy = dynamic_cast<BPictureProxy *>(self);
		if(proxy)
			return proxy->Archive_super(archive, deep);
		else
			return self->Archive(archive, deep);
	}

	status_t be_BPicture_Perform(BPicture *self, perform_code d, void* arg)
	{
		BPictureProxy *proxy = dynamic_cast<BPictureProxy *>(self);
		if(proxy)
			return proxy->Perform_super(d, arg);
		else
			return self->Perform(d, arg);
	}

	status_t be_BPicture_Play(BPicture *self, void** callBackTable, int32 tableEntries, void* userData)
	{
		return self->Play(callBackTable, tableEntries, userData);
	}

	status_t be_BPicture_Flatten(BPicture *self, BDataIO* stream)
	{
		return self->Flatten(stream);
	}

	status_t be_BPicture_Unflatten(BPicture *self, BDataIO* stream)
	{
		return self->Unflatten(stream);
	}

}


