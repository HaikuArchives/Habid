/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/Entry.h"

BEntryBridge::BEntryBridge()
: BEntry()
{
}
BEntryBridge::BEntryBridge(const BDirectory* dir, const char* path, bool traverse)
: BEntry(dir, path, traverse)
{
}
BEntryBridge::BEntryBridge(const entry_ref* ref, bool traverse)
: BEntry(ref, traverse)
{
}
BEntryBridge::BEntryBridge(const char* path, bool traverse)
: BEntry(path, traverse)
{
}
BEntryBridge::BEntryBridge(const BEntry& entry)
: BEntry(entry)
{
}
BEntryBridge::~BEntryBridge() { }

BEntryProxy::BEntryProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BEntryBridge() { }

BEntryProxy::BEntryProxy(void *bindInstPtr, const BDirectory* dir, const char* path, bool traverse)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BEntryBridge(dir, path, traverse) { }

BEntryProxy::BEntryProxy(void *bindInstPtr, const entry_ref* ref, bool traverse)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BEntryBridge(ref, traverse) { }

BEntryProxy::BEntryProxy(void *bindInstPtr, const char* path, bool traverse)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BEntryBridge(path, traverse) { }

BEntryProxy::BEntryProxy(void *bindInstPtr, const BEntry& entry)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BEntryBridge(entry) { }

BEntryProxy::~BEntryProxy() { }

status_t BEntryProxy::GetStat(struct stat* stat) const
{
	return bind_BEntry_GetStat(fBindInstPtr, stat);
}

status_t BEntryProxy::GetStat_super(struct stat* stat) const
{
	return BEntry::GetStat(stat);
}


extern "C" {
	BEntryProxy * be_BEntry_ctor(void *bindInstPtr)
	{
		return new BEntryProxy(bindInstPtr);
	}

	BEntryProxy * be_BEntry_ctor_1(void *bindInstPtr, const BDirectory* dir, const char* path, bool traverse)
	{
		return new BEntryProxy(bindInstPtr, dir, path, traverse);
	}

	BEntryProxy * be_BEntry_ctor_2(void *bindInstPtr, const entry_ref* ref, bool traverse)
	{
		return new BEntryProxy(bindInstPtr, ref, traverse);
	}

	BEntryProxy * be_BEntry_ctor_3(void *bindInstPtr, const char* path, bool traverse)
	{
		return new BEntryProxy(bindInstPtr, path, traverse);
	}

	BEntryProxy * be_BEntry_ctor_4(void *bindInstPtr, const BEntry* entry)
	{
		return new BEntryProxy(bindInstPtr, *entry);
	}

	void be_BEntry_dtor(BEntry* self)
	{
		delete self;
	}

	status_t be_BEntry_InitCheck(BEntryProxy *self)
	{
		return self->InitCheck();
	}

	bool be_BEntry_Exists(BEntryProxy *self)
	{
		return self->Exists();
	}

	status_t be_BEntry_GetStat(BEntryProxy *self, struct stat* stat)
	{
		return self->GetStat_super(stat);
	}

	status_t be_BEntry_SetTo(BEntryProxy *self, const BDirectory* dir, const char* path, bool traverse)
	{
		return self->SetTo(dir, path, traverse);
	}

	status_t be_BEntry_SetTo_1(BEntryProxy *self, const entry_ref* ref, bool traverse)
	{
		return self->SetTo(ref, traverse);
	}

	status_t be_BEntry_SetTo_2(BEntryProxy *self, const char* path, bool traverse)
	{
		return self->SetTo(path, traverse);
	}

	void be_BEntry_Unset(BEntryProxy *self)
	{
		self->Unset();
	}

	status_t be_BEntry_GetRef(BEntryProxy *self, entry_ref* ref)
	{
		return self->GetRef(ref);
	}

	status_t be_BEntry_GetPath(BEntryProxy *self, BPath* path)
	{
		return self->GetPath(path);
	}

	status_t be_BEntry_GetParent(BEntryProxy *self, BEntry* entry)
	{
		return self->GetParent(entry);
	}

	status_t be_BEntry_GetParent_1(BEntryProxy *self, BDirectory* dir)
	{
		return self->GetParent(dir);
	}

	status_t be_BEntry_GetName(BEntryProxy *self, char* buffer)
	{
		return self->GetName(buffer);
	}

	status_t be_BEntry_Rename(BEntryProxy *self, const char* path, bool clobber)
	{
		return self->Rename(path, clobber);
	}

	status_t be_BEntry_MoveTo(BEntryProxy *self, BDirectory* dir, const char* path, bool clobber)
	{
		return self->MoveTo(dir, path, clobber);
	}

	status_t be_BEntry_Remove(BEntryProxy *self)
	{
		return self->Remove();
	}

	bool be_BEntry_opEquals(BEntry *self, const BEntry* item)
	{
		return self->operator==(*item);
	}

	bool be_BEntry_opNotEquals(BEntry *self, const BEntry* item)
	{
		return self->operator!=(*item);
	}

	BEntry * be_BEntry_opAssign(BEntry *self, const BEntry* item)
	{
		return &self->operator=(*item);
	}

}


