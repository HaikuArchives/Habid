/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BPropertyInfo_
#define HABID_BPropertyInfo_

#include <PropertyInfo.h>
#include <Support/Flattenable.h>

class BPropertyInfoBridge
: public BPropertyInfo
{
public:
	BPropertyInfoBridge(property_info* prop, value_info* value, bool freeOnDelete);
	~BPropertyInfoBridge();

};


class BPropertyInfoProxy
: public  BFlattenableProxy, public BPropertyInfoBridge
{
	void *fBindInstPtr;
public:
	BPropertyInfoProxy(void *bindInstPtr, property_info* prop, value_info* value, bool freeOnDelete);
	~BPropertyInfoProxy();

	virtual int32 FindMatch(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data) ;
	virtual int32 FindMatch_super(BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data) ;
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


/* BPropertyInfo */
extern "C" {
	int32 bind_BPropertyInfo_FindMatch(void *bindInstPtr, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data);
	bool bind_BPropertyInfo_IsFixedSize(void *bindInstPtr);
	type_code bind_BPropertyInfo_TypeCode(void *bindInstPtr);
	ssize_t bind_BPropertyInfo_FlattenedSize(void *bindInstPtr);
	status_t bind_BPropertyInfo_Flatten(void *bindInstPtr, void* buffer, ssize_t size);
	bool bind_BPropertyInfo_AllowsTypeCode(void *bindInstPtr, type_code code);
	status_t bind_BPropertyInfo_Unflatten(void *bindInstPtr, type_code code, const void* buffer, ssize_t size);
}

#endif // HABID_BPropertyInfo_

