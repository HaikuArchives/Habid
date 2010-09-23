/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BFile_
#define HABID_BFile_

#include <File.h>
#include "Storage/Node.h"
#include "Support/DataIO.h"

class BFileBridge
: public BFile
{
public:
	BFileBridge();
	BFileBridge(const BFile & file);
	BFileBridge(const entry_ref * ref, uint32 openMode);
	BFileBridge(const BEntry * entry, uint32 openMode);
	BFileBridge(const char * path, uint32 openMode);
	BFileBridge(const BDirectory * dir, const char * path, uint32 openMode);
	~BFileBridge();

};


class BFileProxy
: public  BNodeProxy,  BPositionIOProxy, public BFileBridge
{
	void *fBindInstPtr;
public:
	BFileProxy(void *bindInstPtr);
	BFileProxy(void *bindInstPtr, const BFile & file);
	BFileProxy(void *bindInstPtr, const entry_ref * ref, uint32 openMode);
	BFileProxy(void *bindInstPtr, const BEntry * entry, uint32 openMode);
	BFileProxy(void *bindInstPtr, const char * path, uint32 openMode);
	BFileProxy(void *bindInstPtr, const BDirectory * dir, const char * path, uint32 openMode);
	~BFileProxy();

	virtual ssize_t Read(void * buffer, size_t size) ;
	virtual ssize_t Read_super(void * buffer, size_t size) ;
	virtual ssize_t ReadAt(off_t location, void * buffer, size_t size) ;
	virtual ssize_t ReadAt_super(off_t location, void * buffer, size_t size) ;
	virtual ssize_t Write(const void * buffer, size_t size) ;
	virtual ssize_t Write_super(const void * buffer, size_t size) ;
	virtual ssize_t WriteAt(off_t location, const void * buffer, size_t size) ;
	virtual ssize_t WriteAt_super(off_t location, const void * buffer, size_t size) ;
	virtual off_t Seek(off_t offset, uint32 seekMode) ;
	virtual off_t Seek_super(off_t offset, uint32 seekMode) ;
	virtual off_t Position() const;
	virtual off_t Position_super() const;
	virtual status_t SetSize(off_t size) ;
	virtual status_t SetSize_super(off_t size) ;
	virtual status_t GetSize(off_t* size) ;
	virtual status_t GetSize_super(off_t* size) ;
};


/* BFile */
extern "C" {
	ssize_t bind_BFile_Read(void *bindInstPtr, void * buffer, size_t size);
	ssize_t bind_BFile_ReadAt(void *bindInstPtr, off_t location, void * buffer, size_t size);
	ssize_t bind_BFile_Write(void *bindInstPtr, const void * buffer, size_t size);
	ssize_t bind_BFile_WriteAt(void *bindInstPtr, off_t location, const void * buffer, size_t size);
	off_t bind_BFile_Seek(void *bindInstPtr, off_t offset, uint32 seekMode);
	off_t bind_BFile_Position(void *bindInstPtr);
	status_t bind_BFile_SetSize(void *bindInstPtr, off_t size);
	status_t bind_BFile_GetSize(void *bindInstPtr, off_t* size);
}

#endif // HABID_BFile_

