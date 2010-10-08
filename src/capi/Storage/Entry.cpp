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
BEntryBridge::BEntryBridge(const entry_ref* _ref, bool traverse)
: BEntry(_ref, traverse)
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

BEntryProxy::BEntryProxy(void *bindInstPtr, const entry_ref* _ref, bool traverse)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BEntryBridge(_ref, traverse) { }

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
	BEntry * be_BEntry_ctor(void *bindInstPtr)
	{
		return (BEntry *)new BEntryProxy(bindInstPtr);
	}

	BEntry * be_BEntry_ctor_1(void *bindInstPtr, const BDirectory* dir, const char* path, bool traverse)
	{
		return (BEntry *)new BEntryProxy(bindInstPtr, dir, path, traverse);
	}

	BEntry * be_BEntry_ctor_2(void *bindInstPtr, const entry_ref* _ref, bool traverse)
	{
		return (BEntry *)new BEntryProxy(bindInstPtr, _ref, traverse);
	}

	BEntry * be_BEntry_ctor_3(void *bindInstPtr, const char* path, bool traverse)
	{
		return (BEntry *)new BEntryProxy(bindInstPtr, path, traverse);
	}

	BEntry * be_BEntry_ctor_4(void *bindInstPtr, const BEntry* entry)
	{
		return (BEntry *)new BEntryProxy(bindInstPtr, *entry);
	}

	void be_BEntry_dtor(BEntry* self)
	{
		delete self;
	}

	status_t be_BEntry_InitCheck(BEntry *self)
	{
		return self->InitCheck();
	}

	bool be_BEntry_Exists(BEntry *self)
	{
		return self->Exists();
	}

	status_t be_BEntry_GetStat(BEntry *self, struct stat* stat)
	{
		BEntryProxy *proxy = dynamic_cast<BEntryProxy *>(self);
		if(proxy)
			return proxy->GetStat_super(stat);
		else
			return self->GetStat(stat);
	}

	status_t be_BEntry_SetTo(BEntry *self, const BDirectory* dir, const char* path, bool traverse)
	{
		return self->SetTo(dir, path, traverse);
	}

	status_t be_BEntry_SetTo_1(BEntry *self, const entry_ref* _ref, bool traverse)
	{
		return self->SetTo(_ref, traverse);
	}

	status_t be_BEntry_SetTo_2(BEntry *self, const char* path, bool traverse)
	{
		return self->SetTo(path, traverse);
	}

	void be_BEntry_Unset(BEntry *self)
	{
		self->Unset();
	}

	status_t be_BEntry_GetRef(BEntry *self, entry_ref* _ref)
	{
		return self->GetRef(_ref);
	}

	status_t be_BEntry_GetPath(BEntry *self, BPath* path)
	{
		return self->GetPath(path);
	}

	status_t be_BEntry_GetParent(BEntry *self, BEntry* entry)
	{
		return self->GetParent(entry);
	}

	status_t be_BEntry_GetParent_1(BEntry *self, BDirectory* dir)
	{
		return self->GetParent(dir);
	}

	status_t be_BEntry_GetName(BEntry *self, char* buffer)
	{
		return self->GetName(buffer);
	}

	status_t be_BEntry_Rename(BEntry *self, const char* path, bool clobber)
	{
		return self->Rename(path, clobber);
	}

	status_t be_BEntry_MoveTo(BEntry *self, BDirectory* dir, const char* path, bool clobber)
	{
		return self->MoveTo(dir, path, clobber);
	}

	status_t be_BEntry_Remove(BEntry *self)
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


