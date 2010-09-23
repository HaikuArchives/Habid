/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BDirectory_
#define HABID_BDirectory_

#include <Directory.h>
#include "Storage/Node.h"
#include "Storage/EntryList.h"

class BDirectoryBridge
: public BDirectory
{
public:
	BDirectoryBridge();
	BDirectoryBridge(const BDirectory & dir);
	BDirectoryBridge(const entry_ref * _ref);
	BDirectoryBridge(const node_ref * nref);
	BDirectoryBridge(const BEntry * entry);
	BDirectoryBridge(const char * path);
	BDirectoryBridge(const BDirectory * dir, const char * path);
	~BDirectoryBridge();

};


class BDirectoryProxy
: public  BNodeProxy,  BEntryListProxy, public BDirectoryBridge
{
	void *fBindInstPtr;
public:
	BDirectoryProxy(void *bindInstPtr);
	BDirectoryProxy(void *bindInstPtr, const BDirectory & dir);
	BDirectoryProxy(void *bindInstPtr, const entry_ref * _ref);
	BDirectoryProxy(void *bindInstPtr, const node_ref * nref);
	BDirectoryProxy(void *bindInstPtr, const BEntry * entry);
	BDirectoryProxy(void *bindInstPtr, const char * path);
	BDirectoryProxy(void *bindInstPtr, const BDirectory * dir, const char * path);
	~BDirectoryProxy();

	virtual status_t GetNextEntry(BEntry * entry, bool traverse) ;
	virtual status_t GetNextEntry_super(BEntry * entry, bool traverse) ;
	virtual status_t GetNextRef(entry_ref * _ref) ;
	virtual status_t GetNextRef_super(entry_ref * _ref) ;
	virtual int32 GetNextDirents(dirent * buf, size_t bufSize, int32 count) ;
	virtual int32 GetNextDirents_super(dirent * buf, size_t bufSize, int32 count) ;
	virtual status_t Rewind() ;
	virtual status_t Rewind_super() ;
	virtual int32 CountEntries() ;
	virtual int32 CountEntries_super() ;
};


/* BDirectory */
extern "C" {
	status_t bind_BDirectory_GetNextEntry(void *bindInstPtr, BEntry * entry, bool traverse);
	status_t bind_BDirectory_GetNextRef(void *bindInstPtr, entry_ref * _ref);
	int32 bind_BDirectory_GetNextDirents(void *bindInstPtr, dirent * buf, size_t bufSize, int32 count);
	status_t bind_BDirectory_Rewind(void *bindInstPtr);
	int32 bind_BDirectory_CountEntries(void *bindInstPtr);
}

#endif // HABID_BDirectory_

