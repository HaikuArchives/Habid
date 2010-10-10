/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BEntry_
#define HABID_BEntry_

#include <Entry.h>
#include "Storage/Statable.h"


class BEntryProxy
: public  BStatableProxy, public BEntry
{
	void *fBindInstPtr;
public:
	BEntryProxy(void *bindInstPtr);
	BEntryProxy(void *bindInstPtr, const BDirectory* dir, const char* path, bool traverse);
	BEntryProxy(void *bindInstPtr, const entry_ref* _ref, bool traverse);
	BEntryProxy(void *bindInstPtr, const char* path, bool traverse);
	BEntryProxy(void *bindInstPtr, const BEntry& entry);
	~BEntryProxy();

	virtual status_t GetStat(struct stat* stat) const;
	virtual status_t GetStat_super(struct stat* stat) const;
};


/* BEntry */
extern "C" {
	status_t bind_BEntry_GetStat(void *bindInstPtr, struct stat* stat);
}

#endif // HABID_BEntry_

