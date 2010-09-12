#ifndef __ENTRYLIST_H__
#define __ENTRYLIST_H__

#include <storage/EntryList.h>

/* begin class BEntryListBridge */

class BEntryListBridge : public BEntryList
{
public:
	BEntryListBridge();

	virtual ~BEntryListBridge();

	virtual status_t GetNextEntry(BEntry *entry, bool traverse = false);
	virtual status_t GetNextRef(entry_ref *ref);
	virtual int32 GetNextDirents(struct dirent *buf, size_t length,
								 int32 count = INT_MAX);
	virtual status_t Rewind();
	virtual int32 CountEntries();
};

/* end class BStatableBridge */

/* begin class BEntryListProxy */

class BEntryListProxy : public BEntryListBridge
{
private:
	void *fBindInstPointer;
public:
	BEntryListProxy(void *bindInstPointer);
	~BEntryListProxy();
	
	virtual status_t GetNextEntry(BEntry *entry, bool traverse = false);
	virtual status_t GetNextRef(entry_ref *ref);
	virtual int32 GetNextDirents(struct dirent *buf, size_t length,
								 int32 count = INT_MAX);
	virtual status_t Rewind();
	virtual int32 CountEntries();
};

/* end class BStatableProxy */

#endif
