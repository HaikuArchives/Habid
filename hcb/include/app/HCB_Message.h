#ifndef __MESSAGE_H__
#define __MESSAGE_H__

#include <app/Message.h>

/* begin class BMessageBridge */
/*
class BMessageBridge : public BMessage
{
public:
	BMessageBridge();
	BMessageBridge(uint32 what);
	BMessageBridge(const BMessage &other);
	virtual ~BMessageBridge();
};
*/
/* end class BMessageBridge */

/* begin class BMessageProxy */
/*
class BMessageProxy : public BMessageBridge
{
private:
	void *fBindInstPointer;
public:
	BMessageProxy(void *bindInstPointer);
	BMessageProxy(void *bindInstPointer, uint32 what);
	BMessageProxy(void *bindInstPointer, const BMessage &other);
	virtual ~BMessageProxy();
};
*/
/* end class BMessageProxy */

#endif
