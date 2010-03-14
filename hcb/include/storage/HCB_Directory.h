#ifndef __DIRECTORY_H__
#define __DIRECTORY_H__

#include <storage/Directory.h>

#include <storage/HCB_Node.h>
#include <support/HCB_EntryList.h>


#include <hcb-types.h>

class BDirectoryBridge : public BDirectory
{
public:

};

/* begin class BDirectoryProxy */

class BDirectoryProxy : public BDirectoryBridge, public BNodeProxy, public BEntryListProxy
{
private:
	void *fBindInstPointer;
public:

};

/* end class BDirectoryProxy */

#endif
