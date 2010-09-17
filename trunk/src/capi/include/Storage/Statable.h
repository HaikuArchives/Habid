/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BStatable_
#define HABID_BStatable_

#include <Statable.h>

class BStatableBridge
: public BStatable
{
public:
	BStatableBridge();
	~BStatableBridge();

	virtual status_t GetStat(struct stat * st) const;
	virtual status_t _GetStat(struct stat_beos * st) const;
	virtual status_t set_stat(struct stat & st, uint32 what) ;
};


class BStatableProxy
: public BStatableBridge
{
	void *fBindInstPtr;
public:
	BStatableProxy(void *bindInstPtr);
	~BStatableProxy();

	virtual status_t GetStat(struct stat * st) const;
	virtual status_t GetStat_super(struct stat * st) const;
	virtual status_t _GetStat(struct stat_beos * st) const;
	virtual status_t _GetStat_super(struct stat_beos * st) const;
	virtual status_t set_stat(struct stat & st, uint32 what) ;
	virtual status_t set_stat_super(struct stat & st, uint32 what) ;
};


/* BStatable */
extern "C" {
	status_t bind_BStatable_GetStat(void *bindInstPtr, struct stat * st);
	status_t bind_BStatable__GetStat(void *bindInstPtr, struct stat_beos * st);
	status_t bind_BStatable_set_stat(void *bindInstPtr, struct stat * st, uint32 what);
}
#endif // HABID_BStatable_

