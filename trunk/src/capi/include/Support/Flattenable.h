/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BFlattenable_
#define HABID_BFlattenable_

#include <Flattenable.h>

class BFlattenableBridge
: public BFlattenable
{
public:
	BFlattenableBridge();
	~BFlattenableBridge();

	virtual bool IsFixedSize() const;
	virtual type_code TypeCode() const;
	virtual ssize_t FlattenedSize() const;
	virtual status_t Flatten(void * buffer, ssize_t size) const;
	virtual bool AllowsTypeCode(type_code code) const;
	virtual status_t Unflatten(type_code code, const void * buffer, ssize_t size) ;
};


class BFlattenableProxy
: public BFlattenableBridge
{
	void *fBindInstPtr;
public:
	BFlattenableProxy(void *bindInstPtr);
	~BFlattenableProxy();

	virtual bool IsFixedSize() const;
	virtual bool IsFixedSize_super() const;
	virtual type_code TypeCode() const;
	virtual type_code TypeCode_super() const;
	virtual ssize_t FlattenedSize() const;
	virtual ssize_t FlattenedSize_super() const;
	virtual status_t Flatten(void * buffer, ssize_t size) const;
	virtual status_t Flatten_super(void * buffer, ssize_t size) const;
	virtual bool AllowsTypeCode(type_code code) const;
	virtual bool AllowsTypeCode_super(type_code code) const;
	virtual status_t Unflatten(type_code code, const void * buffer, ssize_t size) ;
	virtual status_t Unflatten_super(type_code code, const void * buffer, ssize_t size) ;
};


/* BFlattenable */
extern "C" {
	bool bind_BFlattenable_IsFixedSize(void *bindInstPtr);
	type_code bind_BFlattenable_TypeCode(void *bindInstPtr);
	ssize_t bind_BFlattenable_FlattenedSize(void *bindInstPtr);
	status_t bind_BFlattenable_Flatten(void *bindInstPtr, void * buffer, ssize_t size);
	bool bind_BFlattenable_AllowsTypeCode(void *bindInstPtr, type_code code);
	status_t bind_BFlattenable_Unflatten(void *bindInstPtr, type_code code, const void * buffer, ssize_t size);
}

#endif // HABID_BFlattenable_

