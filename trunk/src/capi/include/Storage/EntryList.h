/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BEntryList_
#define HABID_BEntryList_

#include <EntryList.h>

class BEntryListBridge
: public BEntryList
{
public:
	BEntryListBridge();
	~BEntryListBridge();

	virtual status_t GetNextEntry(BEntry * entry, bool traverse) ;
	virtual status_t GetNextRef(entry_ref * ref) ;
	virtual int32 GetNextDirents(struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries) ;
	virtual status_t Rewind() ;
	virtual int32 CountEntries() ;
};


class BEntryListProxy
: public BEntryListBridge
{
	void *fBindInstPtr;
public:
	BEntryListProxy(void *bindInstPtr);
	~BEntryListProxy();

	virtual status_t GetNextEntry(BEntry * entry, bool traverse) ;
	virtual status_t GetNextEntry_super(BEntry * entry, bool traverse) ;
	virtual status_t GetNextRef(entry_ref * ref) ;
	virtual status_t GetNextRef_super(entry_ref * ref) ;
	virtual int32 GetNextDirents(struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries) ;
	virtual int32 GetNextDirents_super(struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries) ;
	virtual status_t Rewind() ;
	virtual status_t Rewind_super() ;
	virtual int32 CountEntries() ;
	virtual int32 CountEntries_super() ;
};


/* BEntryList */
extern "C" {
	status_t bind_BEntryList_GetNextEntry(void *bindInstPtr, BEntry * entry, bool traverse);
	status_t bind_BEntryList_GetNextRef(void *bindInstPtr, entry_ref * ref);
	int32 bind_BEntryList_GetNextDirents(void *bindInstPtr, struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries);
	status_t bind_BEntryList_Rewind(void *bindInstPtr);
	int32 bind_BEntryList_CountEntries(void *bindInstPtr);
}
#endif // HABID_BEntryList_

