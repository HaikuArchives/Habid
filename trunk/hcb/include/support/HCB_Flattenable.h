#ifndef __FLATTENABLE_H__
#define __FLATTENABLE_H__

#include <support/Flattenable.h>

/* begin class BFlattenableBridge */

class BFlattenableBridge : public BFlattenable
{
public:
	BFlattenableBridge();
	virtual ~BFlattenableBridge();
	
	/* Pure virtual functions has to call back into D */
	virtual bool IsFixedSize() const;
	
	virtual type_code TypeCode() const;
	
	virtual ssize_t FlattenedSize() const;
	
	virtual status_t Flatten(void *buffer, ssize_t size) const;
	
	virtual bool AllowsTypeCode(type_code type) const;
	
	virtual status_t Unflatten(type_code type, const void *buffer, ssize_t size);
};

/* end class BFlattenableBridge */

/* begin class BFlattenableProxy */

class BFlattenableProxy : public BFlattenableBridge
{
private:
	void *fBindInstPointer;
public:
	BFlattenableProxy(void *bindInstPointer);
	virtual ~BFlattenableProxy();

	virtual bool IsFixedSize() const;
	
	virtual type_code TypeCode() const;
	
	virtual ssize_t FlattenedSize() const;
	
	virtual status_t Flatten(void *buffer, ssize_t size) const;
	
	virtual bool AllowsTypeCode(type_code type) const;
	
	virtual status_t Unflatten(type_code type, const void *buffer, ssize_t size);
};

/* end class BFlattenableProxy */

#endif
