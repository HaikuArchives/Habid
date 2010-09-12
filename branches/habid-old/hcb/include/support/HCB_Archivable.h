#ifndef __ARCHIVABLE_H__
#define __ARCHIVABLE_H__

#include <support/Archivable.h>

/* begin class BArchivableBridge */

class BArchivableBridge : public BArchivable
{
public:
	BArchivableBridge();
	BArchivableBridge(BMessage *from);
	virtual ~BArchivableBridge();
};

/* end class BArchivableBridge */

/* begin class BArchivableProxy */

class BArchivableProxy : public BArchivableBridge
{
private:
	void *fBindInstPointer;
public:
	BArchivableProxy(void *bindInstPointer);
	BArchivableProxy(void *bindInstPointer, BMessage *from);
	virtual ~BArchivableProxy();
	
	virtual	status_t Archive(BMessage* into, bool deep = true) const;
	virtual	status_t Archive_super(BMessage* into, bool deep = true) const;

	// Private or reserved
	virtual status_t Perform(perform_code d, void* arg);
	virtual status_t Perform_super(perform_code d, void* arg);
};

/* end class BArchivableProxy */

#endif
