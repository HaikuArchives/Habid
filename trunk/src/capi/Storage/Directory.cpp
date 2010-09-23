/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/Directory.h"

BDirectoryBridge::BDirectoryBridge()
: BDirectory()
{
}
BDirectoryBridge::BDirectoryBridge(const BDirectory & dir)
: BDirectory(dir)
{
}
BDirectoryBridge::BDirectoryBridge(const entry_ref * _ref)
: BDirectory(_ref)
{
}
BDirectoryBridge::BDirectoryBridge(const node_ref * nref)
: BDirectory(nref)
{
}
BDirectoryBridge::BDirectoryBridge(const BEntry * entry)
: BDirectory(entry)
{
}
BDirectoryBridge::BDirectoryBridge(const char * path)
: BDirectory(path)
{
}
BDirectoryBridge::BDirectoryBridge(const BDirectory * dir, const char * path)
: BDirectory(dir, path)
{
}
BDirectoryBridge::~BDirectoryBridge() { }

BDirectoryProxy::BDirectoryProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr), BEntryListProxy(bindInstPtr), BDirectoryBridge() { }

BDirectoryProxy::BDirectoryProxy(void *bindInstPtr, const BDirectory & dir)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, dir), BEntryListProxy(bindInstPtr), BDirectoryBridge(dir) { }

BDirectoryProxy::BDirectoryProxy(void *bindInstPtr, const entry_ref * _ref)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, _ref), BEntryListProxy(bindInstPtr), BDirectoryBridge(_ref) { }

BDirectoryProxy::BDirectoryProxy(void *bindInstPtr, const node_ref * nref)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr), BEntryListProxy(bindInstPtr), BDirectoryBridge(nref) {
	((BDirectory *)this)->SetTo(nref);
}

BDirectoryProxy::BDirectoryProxy(void *bindInstPtr, const BEntry * entry)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, entry), BEntryListProxy(bindInstPtr), BDirectoryBridge(entry) { }

BDirectoryProxy::BDirectoryProxy(void *bindInstPtr, const char * path)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, path), BEntryListProxy(bindInstPtr), BDirectoryBridge(path) { }

BDirectoryProxy::BDirectoryProxy(void *bindInstPtr, const BDirectory * dir, const char * path)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, dir, path), BEntryListProxy(bindInstPtr), BDirectoryBridge(dir, path) { }

BDirectoryProxy::~BDirectoryProxy() { }

status_t BDirectoryProxy::GetNextEntry(BEntry * entry, bool traverse) 
{
	return bind_BDirectory_GetNextEntry(fBindInstPtr, entry, traverse);
}

status_t BDirectoryProxy::GetNextEntry_super(BEntry * entry, bool traverse) 
{
	return BDirectory::GetNextEntry(entry, traverse);
}

status_t BDirectoryProxy::GetNextRef(entry_ref * _ref) 
{
	return bind_BDirectory_GetNextRef(fBindInstPtr, _ref);
}

status_t BDirectoryProxy::GetNextRef_super(entry_ref * _ref) 
{
	return BDirectory::GetNextRef(_ref);
}

int32 BDirectoryProxy::GetNextDirents(dirent * buf, size_t bufSize, int32 count) 
{
	return bind_BDirectory_GetNextDirents(fBindInstPtr, buf, bufSize, count);
}

int32 BDirectoryProxy::GetNextDirents_super(dirent * buf, size_t bufSize, int32 count) 
{
	return BDirectory::GetNextDirents(buf, bufSize, count);
}

status_t BDirectoryProxy::Rewind() 
{
	return bind_BDirectory_Rewind(fBindInstPtr);
}

status_t BDirectoryProxy::Rewind_super() 
{
	return BDirectory::Rewind();
}

int32 BDirectoryProxy::CountEntries() 
{
	return bind_BDirectory_CountEntries(fBindInstPtr);
}

int32 BDirectoryProxy::CountEntries_super() 
{
	return BDirectory::CountEntries();
}


extern "C" {
	BDirectoryProxy * be_BDirectory_ctor(void *bindInstPtr)
	{
		return new BDirectoryProxy(bindInstPtr);
	}

	BDirectoryProxy * be_BDirectory_ctor_1(void *bindInstPtr, const BDirectory * dir)
	{
		return new BDirectoryProxy(bindInstPtr, *dir);
	}

	BDirectoryProxy * be_BDirectory_ctor_2(void *bindInstPtr, const entry_ref * _ref)
	{
		return new BDirectoryProxy(bindInstPtr, _ref);
	}

	BDirectoryProxy * be_BDirectory_ctor_3(void *bindInstPtr, const node_ref * nref)
	{
		return new BDirectoryProxy(bindInstPtr, nref);
	}

	BDirectoryProxy * be_BDirectory_ctor_4(void *bindInstPtr, const BEntry * entry)
	{
		return new BDirectoryProxy(bindInstPtr, entry);
	}

	BDirectoryProxy * be_BDirectory_ctor_5(void *bindInstPtr, const char * path)
	{
		return new BDirectoryProxy(bindInstPtr, path);
	}

	BDirectoryProxy * be_BDirectory_ctor_6(void *bindInstPtr, const BDirectory * dir, const char * path)
	{
		return new BDirectoryProxy(bindInstPtr, dir, path);
	}

	void be_BDirectory_dtor(BDirectory* self)
	{
		delete self;
	}

	status_t be_BDirectory_SetTo(BDirectoryProxy *self, const entry_ref * _ref)
	{
		return ((BDirectory *)self)->SetTo(_ref);
	}

	status_t be_BDirectory_SetTo_1(BDirectoryProxy *self, const node_ref * nref)
	{
		return ((BDirectory *)self)->SetTo(nref);
	}

	status_t be_BDirectory_SetTo_2(BDirectoryProxy *self, const BEntry * entry)
	{
		return ((BDirectory *)self)->SetTo(entry);
	}

	status_t be_BDirectory_SetTo_3(BDirectoryProxy *self, const char * path)
	{
		return ((BDirectory *)self)->SetTo(path);
	}

	status_t be_BDirectory_SetTo_4(BDirectoryProxy *self, const BDirectory * dir, const char * path)
	{
		return ((BDirectory *)self)->SetTo(dir, path);
	}

	status_t be_BDirectory_GetEntry(BDirectoryProxy *self, BEntry * entry)
	{
		return self->GetEntry(entry);
	}

	bool be_BDirectory_IsRootDirectory(BDirectoryProxy *self)
	{
		return self->IsRootDirectory();
	}

	status_t be_BDirectory_FindEntry(BDirectoryProxy *self, const char * path, BEntry * entry, bool traverse)
	{
		return self->FindEntry(path, entry, traverse);
	}

	bool be_BDirectory_Contains(BDirectoryProxy *self, const char * path, int32 nodeFlags)
	{
		return self->Contains(path, nodeFlags);
	}

	bool be_BDirectory_Contains_1(BDirectoryProxy *self, const BEntry * entry, int32 nodeFlags)
	{
		return self->Contains(entry, nodeFlags);
	}

	status_t be_BDirectory_GetStatFor(BDirectoryProxy *self, const char * path, struct stat * st)
	{
		return self->GetStatFor(path, st);
	}

	status_t be_BDirectory_GetNextEntry(BDirectoryProxy *self, BEntry * entry, bool traverse)
	{
		return self->GetNextEntry_super(entry, traverse);
	}

	status_t be_BDirectory_GetNextRef(BDirectoryProxy *self, entry_ref * _ref)
	{
		return self->GetNextRef_super(_ref);
	}

	int32 be_BDirectory_GetNextDirents(BDirectoryProxy *self, dirent * buf, size_t bufSize, int32 count)
	{
		return self->GetNextDirents_super(buf, bufSize, count);
	}

	status_t be_BDirectory_Rewind(BDirectoryProxy *self)
	{
		return self->Rewind_super();
	}

	int32 be_BDirectory_CountEntries(BDirectoryProxy *self)
	{
		return self->CountEntries_super();
	}

	status_t be_BDirectory_CreateDirectory(BDirectoryProxy *self, const char * path, BDirectory * dir)
	{
		return self->CreateDirectory(path, dir);
	}

	status_t be_BDirectory_CreateFile(BDirectoryProxy *self, const char * path, BFile * file, bool failIfExists)
	{
		return self->CreateFile(path, file, failIfExists);
	}

	status_t be_BDirectory_CreateSymLink(BDirectoryProxy *self, const char * path, const char * linkToPath, BSymLink * link)
	{
		return self->CreateSymLink(path, linkToPath, link);
	}

	BDirectory * be_BDirectory_opAssign(BDirectory *self, const BDirectory * dir)
	{
		return &self->operator=(*dir);
	}

}


