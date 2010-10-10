/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BBitmap_
#define HABID_BBitmap_

#include <Bitmap.h>
#include "Support/Archivable.h"

class BBitmapProxy
: public  BArchivableProxy, public BBitmap
{
	void *fBindInstPtr;
public:
	BBitmapProxy(void *bindInstPtr, BRect bounds, uint32 flags, color_space colorSpace, int32 bytesPerRow, screen_id screenID);
	BBitmapProxy(void *bindInstPtr, BRect bounds, color_space colorSpace, bool acceptsViews, bool needsContiguous);
	BBitmapProxy(void *bindInstPtr, const BBitmap& source, uint32 flags);
	BBitmapProxy(void *bindInstPtr, const BBitmap& source);
	BBitmapProxy(void *bindInstPtr, const BBitmap* source, bool acceptsViews, bool needsContiguous);
	BBitmapProxy(void *bindInstPtr, BMessage* data);
	~BBitmapProxy();

	virtual status_t Archive(BMessage* data, bool deep) const;
	virtual status_t Archive_super(BMessage* data, bool deep) const;
	virtual void AddChild(BView* view) ;
	virtual void AddChild_super(BView* view) ;
	virtual bool RemoveChild(BView* view) ;
	virtual bool RemoveChild_super(BView* view) ;
};


/* BBitmap */
extern "C" {
	status_t bind_BBitmap_Archive(void *bindInstPtr, BMessage* data, bool deep);
	void bind_BBitmap_AddChild(void *bindInstPtr, BView* view);
	bool bind_BBitmap_RemoveChild(void *bindInstPtr, BView* view);
}

#endif // HABID_BBitmap_

