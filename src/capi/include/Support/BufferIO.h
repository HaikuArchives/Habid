/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BBufferIO_
#define HABID_BBufferIO_

#include <SupportDefs.h>
#include <BufferIO.h>
#include "Support/DataIO.h"

class BBufferIOBridge
: public BBufferIO
{
public:
	BBufferIOBridge(BPositionIO * stream, size_t bufferSize, bool ownsStream);
	~BBufferIOBridge();

};


class BBufferIOProxy
: public  BPositionIOProxy, public BBufferIOBridge
{
	void *fBindInstPtr;
public:
	BBufferIOProxy(void *bindInstPtr, BPositionIO * stream, size_t bufferSize, bool ownsStream);
	~BBufferIOProxy();

	virtual ssize_t ReadAt(off_t pos, void * buffer, size_t size) ;
	virtual ssize_t ReadAt_super(off_t pos, void * buffer, size_t size) ;
	virtual ssize_t WriteAt(off_t pos, const void * buffer, size_t size) ;
	virtual ssize_t WriteAt_super(off_t pos, const void * buffer, size_t size) ;
	virtual off_t Seek(off_t position, uint32 seekMode) ;
	virtual off_t Seek_super(off_t position, uint32 seekMode) ;
	virtual off_t Position() const;
	virtual off_t Position_super() const;
	virtual status_t SetSize(off_t size) ;
	virtual status_t SetSize_super(off_t size) ;
	virtual status_t Flush() ;
	virtual status_t Flush_super() ;
};


/* BBufferIO */
extern "C" {
	ssize_t bind_BBufferIO_ReadAt(void *bindInstPtr, off_t pos, void * buffer, size_t size);
	ssize_t bind_BBufferIO_WriteAt(void *bindInstPtr, off_t pos, const void * buffer, size_t size);
	off_t bind_BBufferIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode);
	off_t bind_BBufferIO_Position(void *bindInstPtr);
	status_t bind_BBufferIO_SetSize(void *bindInstPtr, off_t size);
	status_t bind_BBufferIO_Flush(void *bindInstPtr);
}
#endif // HABID_BBufferIO_

