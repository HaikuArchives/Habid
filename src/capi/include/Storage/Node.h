/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BNode_
#define HABID_BNode_

#include <Node.h>
#include "Storage/Statable.h"


class BNodeProxy
: public  BStatableProxy, public BNode
{
	void *fBindInstPtr;
public:
	BNodeProxy(void *bindInstPtr);
	BNodeProxy(void *bindInstPtr, const entry_ref * ref);
	BNodeProxy(void *bindInstPtr, const BEntry * entry);
	BNodeProxy(void *bindInstPtr, const char * path);
	BNodeProxy(void *bindInstPtr, const BDirectory * dir, const char * path);
	BNodeProxy(void *bindInstPtr, const BNode & node);
	~BNodeProxy();

	virtual status_t GetStat(struct stat * st) const;
	virtual status_t GetStat_super(struct stat * st) const;
};


/* BNode */
extern "C" {
	status_t bind_BNode_GetStat(void *bindInstPtr, struct stat * st);
}

#endif // HABID_BNode_

