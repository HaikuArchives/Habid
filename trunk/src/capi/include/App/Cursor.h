/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BCursor_
#define HABID_BCursor_

#include <Cursor.h>

class BCursorBridge
: public BCursor
{
public:
	BCursorBridge(const void* cursorData);
	BCursorBridge(const BCursor& other);
	BCursorBridge(BCursorID id);
	BCursorBridge(BMessage* data);
	~BCursorBridge();

};


class BCursorProxy
: public BCursorBridge
{
	void *fBindInstPtr;
public:
	BCursorProxy(void *bindInstPtr, const void* cursorData);
	BCursorProxy(void *bindInstPtr, const BCursor& other);
	BCursorProxy(void *bindInstPtr, BCursorID id);
	BCursorProxy(void *bindInstPtr, BMessage* data);
	~BCursorProxy();

	virtual status_t Archive(BMessage* archive, bool deep) const;
	virtual status_t Archive_super(BMessage* archive, bool deep) const;
};


/* BCursor */
extern "C" {
	status_t bind_BCursor_Archive(void *bindInstPtr, BMessage* archive, bool deep);
}

#endif // HABID_BCursor_

