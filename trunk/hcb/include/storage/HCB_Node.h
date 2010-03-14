#ifndef __PATH_H__
#define __PATH_H__

#include <storage/Node.h>

#include <storage/HCB_Statable.h>

#include <hcb-types.h>

class BNodeBridge : public BNode
{
public:
	BNodeBridge();
	BNodeBridge(const entry_ref *ref);
	BNodeBridge(const BEntry *entry);
	BNodeBridge(const char *path);
	BNodeBridge(const BDirectory *dir, const char *path);
	BNodeBridge(const BNode &node);
	virtual ~BNodeBridge();
};

/* begin class BPathProxy */

class BNodeProxy : public BNodeBridge, public BStatableProxy
{
private:
	void *fBindInstPointer;
public:
	BNodeProxy(void *bindInstPointer);
	BNodeProxy(void *bindInstPointer, const entry_ref *ref);
	BNodeProxy(void *bindInstPointer, const BEntry *entry);
	BNodeProxy(void *bindInstPointer, const char *path);
	BNodeProxy(void *bindInstPointer, const BDirectory *dir, const char *path);
	BNodeProxy(void *bindInstPointer, const BNode &node);
	virtual ~BNodeProxy();
	
	virtual status_t GetStat(struct stat *st) const;
	virtual status_t super_GetStat(struct stat *st) const;
};

/* end class BEntryProxy */

#endif
