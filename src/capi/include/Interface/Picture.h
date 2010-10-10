/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BPicture_
#define HABID_BPicture_

#include <Picture.h>
#include "Support/Archivable.h"

class BPictureBridge
: public BPicture
{
public:
	BPictureBridge();
	BPictureBridge(const BPicture& other);
	BPictureBridge(BMessage* archive);
	~BPictureBridge();

};


class BPictureProxy
: public  BArchivableProxy, public BPictureBridge
{
	void *fBindInstPtr;
public:
	BPictureProxy(void *bindInstPtr);
	BPictureProxy(void *bindInstPtr, const BPicture& other);
	BPictureProxy(void *bindInstPtr, BMessage* archive);
	~BPictureProxy();

	virtual status_t Archive(BMessage* archive, bool deep) const;
	virtual status_t Archive_super(BMessage* archive, bool deep) const;
	virtual status_t Perform(perform_code d, void* arg) ;
	virtual status_t Perform_super(perform_code d, void* arg) ;
};


/* BPicture */
extern "C" {
	status_t bind_BPicture_Archive(void *bindInstPtr, BMessage* archive, bool deep);
	status_t bind_BPicture_Perform(void *bindInstPtr, perform_code d, void* arg);
}

#endif // HABID_BPicture_

