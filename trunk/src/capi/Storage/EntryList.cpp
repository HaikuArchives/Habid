/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/EntryList.h"

BEntryListBridge::BEntryListBridge()
: BEntryList()
{
}
BEntryListBridge::~BEntryListBridge() { }
status_t BEntryListBridge::GetNextEntry(BEntry * entry, bool traverse){ }
status_t BEntryListBridge::GetNextRef(entry_ref * _ref){ }
int32 BEntryListBridge::GetNextDirents(struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries){ }
status_t BEntryListBridge::Rewind(){ }
int32 BEntryListBridge::CountEntries(){ }

BEntryListProxy::BEntryListProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BEntryListBridge() { }

BEntryListProxy::~BEntryListProxy() { }

status_t BEntryListProxy::GetNextEntry(BEntry * entry, bool traverse) 
{
	return bind_BEntryList_GetNextEntry(fBindInstPtr, entry, traverse);
}

status_t BEntryListProxy::GetNextEntry_super(BEntry * entry, bool traverse) 
{
	return BEntryListBridge::GetNextEntry(entry, traverse);
}

status_t BEntryListProxy::GetNextRef(entry_ref * _ref) 
{
	return bind_BEntryList_GetNextRef(fBindInstPtr, _ref);
}

status_t BEntryListProxy::GetNextRef_super(entry_ref * _ref) 
{
	return BEntryListBridge::GetNextRef(_ref);
}

int32 BEntryListProxy::GetNextDirents(struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries) 
{
	return bind_BEntryList_GetNextDirents(fBindInstPtr, direntBuffer, bufferSize, maxEntries);
}

int32 BEntryListProxy::GetNextDirents_super(struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries) 
{
	return BEntryListBridge::GetNextDirents(direntBuffer, bufferSize, maxEntries);
}

status_t BEntryListProxy::Rewind() 
{
	return bind_BEntryList_Rewind(fBindInstPtr);
}

status_t BEntryListProxy::Rewind_super() 
{
	return BEntryListBridge::Rewind();
}

int32 BEntryListProxy::CountEntries() 
{
	return bind_BEntryList_CountEntries(fBindInstPtr);
}

int32 BEntryListProxy::CountEntries_super() 
{
	return BEntryListBridge::CountEntries();
}


extern "C" {
	BEntryListProxy * be_BEntryList_ctor(void *bindInstPtr)
	{
		return new BEntryListProxy(bindInstPtr);
	}

	void be_BEntryList_dtor(BEntryList* self)
	{
		delete self;
	}

	status_t be_BEntryList_GetNextEntry(BEntryListProxy *self, BEntry * entry, bool traverse)
	{
		return self->GetNextEntry_super(entry, traverse);
	}

	status_t be_BEntryList_GetNextRef(BEntryListProxy *self, entry_ref * _ref)
	{
		return self->GetNextRef_super(_ref);
	}

	int32 be_BEntryList_GetNextDirents(BEntryListProxy *self, struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries)
	{
		return self->GetNextDirents_super(direntBuffer, bufferSize, maxEntries);
	}

	status_t be_BEntryList_Rewind(BEntryListProxy *self)
	{
		return self->Rewind_super();
	}

	int32 be_BEntryList_CountEntries(BEntryListProxy *self)
	{
		return self->CountEntries_super();
	}

}


