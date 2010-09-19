/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BArchivable_
#define HABID_BArchivable_

#include <Archivable.h>

class BArchivableBridge
: public BArchivable
{
public:
	BArchivableBridge();
	BArchivableBridge(BMessage* from);
	~BArchivableBridge();

};


class BArchivableProxy
: public BArchivableBridge
{
	void *fBindInstPtr;
public:
	BArchivableProxy(void *bindInstPtr);
	BArchivableProxy(void *bindInstPtr, BMessage* from);
	~BArchivableProxy();

	virtual status_t Archive(BMessage* into, bool deep) const;
	virtual status_t Archive_super(BMessage* into, bool deep) const;
	virtual status_t Perform(perform_code d, void* arg) ;
	virtual status_t Perform_super(perform_code d, void* arg) ;
	virtual status_t AllUnarchived(const BMessage* archive) ;
	virtual status_t AllUnarchived_super(const BMessage* archive) ;
	virtual status_t AllArchived(BMessage* archive) const;
	virtual status_t AllArchived_super(BMessage* archive) const;
};


/* BArchivable */
extern "C" {
	status_t bind_BArchivable_Archive(void *bindInstPtr, BMessage* into, bool deep);
	status_t bind_BArchivable_Perform(void *bindInstPtr, perform_code d, void* arg);
	status_t bind_BArchivable_AllUnarchived(void *bindInstPtr, const BMessage* archive);
	status_t bind_BArchivable_AllArchived(void *bindInstPtr, BMessage* archive);
}

#endif // HABID_BArchivable_

