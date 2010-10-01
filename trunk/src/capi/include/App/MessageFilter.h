/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BMessageFilter_
#define HABID_BMessageFilter_

#include <MessageFilter.h>

class BMessageFilterBridge
: public BMessageFilter
{
public:
	BMessageFilterBridge(uint32 what, filter_hook func);
	BMessageFilterBridge(message_delivery delivery, message_source source, filter_hook func);
	BMessageFilterBridge(message_delivery delivery, message_source source, uint32 what, filter_hook func);
	BMessageFilterBridge(const BMessageFilter* filter);
	~BMessageFilterBridge();

};


class BMessageFilterProxy
: public BMessageFilterBridge
{
	void *fBindInstPtr;
public:
	BMessageFilterProxy(void *bindInstPtr, uint32 what, filter_hook func);
	BMessageFilterProxy(void *bindInstPtr, message_delivery delivery, message_source source, filter_hook func);
	BMessageFilterProxy(void *bindInstPtr, message_delivery delivery, message_source source, uint32 what, filter_hook func);
	BMessageFilterProxy(void *bindInstPtr, const BMessageFilter* filter);
	~BMessageFilterProxy();

	virtual filter_result Filter(BMessage* message, BHandler** _target) ;
	virtual filter_result Filter_super(BMessage* message, BHandler** _target) ;
};


/* BMessageFilter */
extern "C" {
	filter_result bind_BMessageFilter_Filter(void *bindInstPtr, BMessage* message, BHandler** _target);
}

#endif // HABID_BMessageFilter_

