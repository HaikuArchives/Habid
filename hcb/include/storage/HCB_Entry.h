#ifndef __ENTRY_H__
#define __ENTRY_H__

#include <storage/Entry.h>
#include <storage/HCB_Statable.h>

#include <hcb-types.h>

/* begin class BEntryProxy */

class BEntryProxy : public BStatableProxy, public BEntry
{
private:
	void *fBindInstPointer;
public:
	BEntryProxy(void *bindInstPointer);
	BEntryProxy(void *bindInstPointer, const BDirectory* dir, const char* path, bool traverse = false);
	BEntryProxy(void *bindInstPointer, const entry_ref* ref, bool traverse = false);
	BEntryProxy(void *bindInstPointer, const char* path, bool traverse = false);
	BEntryProxy(void *bindInstPointer, const BEntry& entry);
	virtual	~BEntryProxy();

	virtual status_t	GetStat(struct stat* stat) const;
	virtual status_t	super_GetStat(struct stat *stat) const;
};

/* end class BEntryProxy */

#endif
