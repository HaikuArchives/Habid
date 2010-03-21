#ifndef __LIST_H__
#define __LIST_H__

#include <support/List.h>

/* begin class BListBridge */

class BListBridge : public BList
{
public:
	BListBridge(int32 count = 20);
	BListBridge(const BList & anotherList);
	~BListBridge();
};

/* end class BListBridge */

/* begin class BListProxy */

class BListProxy : public BListBridge
{
private:
	void *fBindInstPointer;
public:
	BListProxy(void *bindInstPointer, int32 count = 20);
	BListProxy(void *bindInstPointer, const BList & anotherList);
	~BListProxy();
};

/* end class BListProxy */

#endif
