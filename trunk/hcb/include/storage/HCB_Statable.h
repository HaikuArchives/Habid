#ifndef __STATABLE_H__
#define __STATABLE_H__

#include <storage/Statable.h>

/* begin class BStatableBridge */

class BStatableBridge : public BStatable
{
public:
	BStatableBridge();

	virtual ~BStatableBridge();

	virtual status_t GetStat(struct stat *st) const;

	virtual status_t _GetStat(struct stat_beos *st) const;
private:
	virtual status_t set_stat(struct stat &st, uint32 what);	
};

/* end class BStatableBridge */

/* begin class BStatableProxy */

class BStatableProxy : public BStatableBridge
{
private:
	void *fBindInstPointer;
public:
	BStatableProxy(void *bindInstPointer);
	virtual ~BStatableProxy();
	
	virtual status_t GetStat(struct stat *st) const;
	
//	virtual status_t set_stat(struct stat &st, uint32 what);
};

/* end class BStatableBridge */

#endif
