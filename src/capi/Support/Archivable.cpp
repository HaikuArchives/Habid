/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Support/Archivable.h"

BArchivableBridge::BArchivableBridge()
: BArchivable()
{
}
BArchivableBridge::BArchivableBridge(BMessage* from)
: BArchivable(from)
{
}
BArchivableBridge::~BArchivableBridge() { }

BArchivableProxy::BArchivableProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BArchivableBridge() { }

BArchivableProxy::BArchivableProxy(void *bindInstPtr, BMessage* from)
: fBindInstPtr(bindInstPtr), BArchivableBridge(from) { }

BArchivableProxy::~BArchivableProxy() { }

status_t BArchivableProxy::Archive(BMessage* into, bool deep) const
{
	return bind_BArchivable_Archive(fBindInstPtr, into, deep);
}

status_t BArchivableProxy::Archive_super(BMessage* into, bool deep) const
{
	return BArchivable::Archive(into, deep);
}

status_t BArchivableProxy::Perform(perform_code d, void* arg) 
{
	return bind_BArchivable_Perform(fBindInstPtr, d, arg);
}

status_t BArchivableProxy::Perform_super(perform_code d, void* arg) 
{
	return BArchivable::Perform(d, arg);
}

status_t BArchivableProxy::AllUnarchived(const BMessage* archive) 
{
	return bind_BArchivable_AllUnarchived(fBindInstPtr, archive);
}

status_t BArchivableProxy::AllUnarchived_super(const BMessage* archive) 
{
	return BArchivable::AllUnarchived(archive);
}

status_t BArchivableProxy::AllArchived(BMessage* archive) const
{
	return bind_BArchivable_AllArchived(fBindInstPtr, archive);
}

status_t BArchivableProxy::AllArchived_super(BMessage* archive) const
{
	return BArchivable::AllArchived(archive);
}


extern "C" {
	BArchivable * be_BArchivable_ctor(void *bindInstPtr)
	{
		return (BArchivable *)new BArchivableProxy(bindInstPtr);
	}

	BArchivable * be_BArchivable_ctor_1(void *bindInstPtr, BMessage* from)
	{
		return (BArchivable *)new BArchivableProxy(bindInstPtr, from);
	}

	void be_BArchivable_dtor(BArchivable* self)
	{
		delete self;
	}

	status_t be_BArchivable_Archive(BArchivable *self, BMessage* into, bool deep)
	{
		BArchivableProxy *proxy = dynamic_cast<BArchivableProxy *>(self);
		if(proxy)
			return proxy->Archive_super(into, deep);
		else
			return self->Archive(into, deep);
	}

	BArchivable * be_BArchivable_Instantiate_static(BMessage * archive)
	{
		return BArchivable::Instantiate(archive);
	}

	status_t be_BArchivable_Perform(BArchivable *self, perform_code d, void* arg)
	{
		BArchivableProxy *proxy = dynamic_cast<BArchivableProxy *>(self);
		if(proxy)
			return proxy->Perform_super(d, arg);
		else
			return self->Perform(d, arg);
	}

	status_t be_BArchivable_AllUnarchived(BArchivable *self, const BMessage* archive)
	{
		BArchivableProxy *proxy = dynamic_cast<BArchivableProxy *>(self);
		if(proxy)
			return proxy->AllUnarchived_super(archive);
		else
			return self->AllUnarchived(archive);
	}

	status_t be_BArchivable_AllArchived(BArchivable *self, BMessage* archive)
	{
		BArchivableProxy *proxy = dynamic_cast<BArchivableProxy *>(self);
		if(proxy)
			return proxy->AllArchived_super(archive);
		else
			return self->AllArchived(archive);
	}

}


