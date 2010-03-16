#ifndef __STRING_H__
#define __STRING_H__

#include <support/String.h>

/* begin class BStringBridge */

class BStringBridge : public BString
{
public:
	BStringBridge();
	BStringBridge(const char* string);
	BStringBridge(const BString& string);
	BStringBridge(const char* string, int32 maxLength);
	~BStringBridge();
};

/* end class BStringBridge */

/* begin class BStringProxy */

class BStringProxy : public BStringBridge
{
private:
	void *fBindInstPointer;
public:
	BStringProxy(void *bindInstPointer);
	BStringProxy(void *bindInstPointer, const char* string);
	BStringProxy(void *bindInstPointer, const BString& string);
	BStringProxy(void *bindInstPointer, const char* string, int32 maxLength);
	~BStringProxy();
};

/* end class BStringProxy */

#endif
