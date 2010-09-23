/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BPath_
#define HABID_BPath_

#include <Path.h>
#include "Support/Flattenable.h"

class BPathBridge
: public BPath
{
public:
	BPathBridge();
	BPathBridge(const BPath& path);
	BPathBridge(const entry_ref* _ref);
	BPathBridge(const BEntry* entry);
	BPathBridge(const char* dir, const char* leaf, bool normalize);
	BPathBridge(const BDirectory* dir, const char* leaf, bool normalize);
	~BPathBridge();

};


class BPathProxy
: public  BFlattenableProxy, public BPathBridge
{
	void *fBindInstPtr;
public:
	BPathProxy(void *bindInstPtr);
	BPathProxy(void *bindInstPtr, const BPath& path);
	BPathProxy(void *bindInstPtr, const entry_ref* _ref);
	BPathProxy(void *bindInstPtr, const BEntry* entry);
	BPathProxy(void *bindInstPtr, const char* dir, const char* leaf, bool normalize);
	BPathProxy(void *bindInstPtr, const BDirectory* dir, const char* leaf, bool normalize);
	~BPathProxy();

	virtual bool IsFixedSize() const;
	virtual bool IsFixedSize_super() const;
	virtual type_code TypeCode() const;
	virtual type_code TypeCode_super() const;
	virtual ssize_t FlattenedSize() const;
	virtual ssize_t FlattenedSize_super() const;
	virtual status_t Flatten(void* buffer, ssize_t size) const;
	virtual status_t Flatten_super(void* buffer, ssize_t size) const;
	virtual bool AllowsTypeCode(type_code code) const;
	virtual bool AllowsTypeCode_super(type_code code) const;
	virtual status_t Unflatten(type_code code, const void* buffer, ssize_t size) ;
	virtual status_t Unflatten_super(type_code code, const void* buffer, ssize_t size) ;
};


/* BPath */
extern "C" {
	bool bind_BPath_IsFixedSize(void *bindInstPtr);
	type_code bind_BPath_TypeCode(void *bindInstPtr);
	ssize_t bind_BPath_FlattenedSize(void *bindInstPtr);
	status_t bind_BPath_Flatten(void *bindInstPtr, void* buffer, ssize_t size);
	bool bind_BPath_AllowsTypeCode(void *bindInstPtr, type_code code);
	status_t bind_BPath_Unflatten(void *bindInstPtr, type_code code, const void* buffer, ssize_t size);
}

#endif // HABID_BPath_

