#ifndef __PATH_H__
#define __PATH_H__

#include <storage/Path.h>
#include <storage/HCB_Path.h>
#include <support/HCB_Flattenable.h>

#include <hcb-types.h>

class BPathBridge : public BPath
{
public:
	BPathBridge();
	BPathBridge(const BPath& path);
	BPathBridge(const entry_ref* ref);
	BPathBridge(const BEntry* entry);
	BPathBridge(const char* dir, const char* leaf = NULL, bool normalize = false);
	BPathBridge(const BDirectory* dir, const char* leaf = NULL, bool normalize = false);

	virtual	~BPathBridge();
};

/* begin class BPathProxy */

class BPathProxy : public BPathBridge, public BFlattenableProxy
{
private:
	void *fBindInstPointer;
public:
	BPathProxy(void *bindInstPointer);
	BPathProxy(void *bindInstPointer, const BPath& path);
	BPathProxy(void *bindInstPointer, const entry_ref* ref);
	BPathProxy(void *bindInstPointer, const BEntry* entry);
	BPathProxy(void *bindInstPointer, const char* dir, const char* leaf = NULL, bool normalize = false);
	BPathProxy(void *bindInstPointer, const BDirectory* dir, const char* leaf = NULL, bool normalize = false);

	virtual	~BPathProxy();
/*
	bool			operator==(const BPath& item) const;
	bool			operator==(const char* path) const;
	bool			operator!=(const BPath& item) const;
	bool			operator!=(const char* path) const;
	BPath&			operator=(const BPath& item);
	BPath&			operator=(const char* path);
*/
	// BFlattenable protocol
	virtual	bool			IsFixedSize() const;
	virtual	bool			super_IsFixedSize() const;
	virtual	type_code		TypeCode() const;
	virtual	type_code		super_TypeCode() const;
	virtual	ssize_t			FlattenedSize() const;
	virtual	ssize_t			super_FlattenedSize() const;
	virtual	status_t		Flatten(void* buffer, ssize_t size) const;
	virtual	status_t		super_Flatten(void* buffer, ssize_t size) const;
	virtual	bool			AllowsTypeCode(type_code code) const;
	virtual	bool			super_AllowsTypeCode(type_code code) const;
	virtual	status_t		Unflatten(type_code code, const void* buffer, ssize_t size);
	virtual	status_t		super_Unflatten(type_code code, const void* buffer, ssize_t size);
};

/* end class BEntryProxy */

#endif
