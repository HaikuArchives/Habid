/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <SupportDefs.h>
#include <DataIO.h>

class BDataIOBridge
: public BDataIO
{
public:
	BDataIOBridge();
	~BDataIOBridge();

	virtual ssize_t Read(void * buffer, size_t size) ;
	virtual ssize_t Write(const void * buffer, size_t size) ;
};

class BPositionIOBridge
: public BPositionIO
{
public:
	BPositionIOBridge();
	~BPositionIOBridge();

	virtual ssize_t ReadAt(off_t position, void * buffer, size_t size) ;
	virtual ssize_t WriteAt(off_t position, const void * buffer, size_t size) ;
	virtual off_t Seek(off_t position, uint32 seekMode) ;
	virtual off_t Position() const;
};

class BMemoryIOBridge
: public BMemoryIO
{
public:
	BMemoryIOBridge(void * data, size_t length);
	BMemoryIOBridge(const void * data, size_t length);
	~BMemoryIOBridge();

};

class BMallocIOBridge
: public BMallocIO
{
public:
	BMallocIOBridge();
	~BMallocIOBridge();

};


class BDataIOProxy
: public BDataIOBridge
{
	void *fBindInstPtr;
public:
	BDataIOProxy(void *bindInstPtr);
	~BDataIOProxy();

	virtual ssize_t Read(void * buffer, size_t size) ;
	virtual ssize_t Read_super(void * buffer, size_t size) ;
	virtual ssize_t Write(const void * buffer, size_t size) ;
	virtual ssize_t Write_super(const void * buffer, size_t size) ;
};

class BPositionIOProxy
: public  BDataIOProxy, public BPositionIOBridge
{
	void *fBindInstPtr;
public:
	BPositionIOProxy(void *bindInstPtr);
	~BPositionIOProxy();

	virtual ssize_t Read(void * buffer, size_t size) ;
	virtual ssize_t Read_super(void * buffer, size_t size) ;
	virtual ssize_t Write(const void * buffer, size_t size) ;
	virtual ssize_t Write_super(const void * buffer, size_t size) ;
	virtual ssize_t ReadAt(off_t position, void * buffer, size_t size) ;
	virtual ssize_t ReadAt_super(off_t position, void * buffer, size_t size) ;
	virtual ssize_t WriteAt(off_t position, const void * buffer, size_t size) ;
	virtual ssize_t WriteAt_super(off_t position, const void * buffer, size_t size) ;
	virtual off_t Seek(off_t position, uint32 seekMode) ;
	virtual off_t Seek_super(off_t position, uint32 seekMode) ;
	virtual off_t Position() const;
	virtual off_t Position_super() const;
	virtual status_t SetSize(off_t size) ;
	virtual status_t SetSize_super(off_t size) ;
	virtual status_t GetSize(off_t * size) ;
	virtual status_t GetSize_super(off_t * size) ;
};

class BMemoryIOProxy
: public  BPositionIOProxy, public BMemoryIOBridge
{
	void *fBindInstPtr;
public:
	BMemoryIOProxy(void *bindInstPtr, void * data, size_t length);
	BMemoryIOProxy(void *bindInstPtr, const void * data, size_t length);
	~BMemoryIOProxy();

	virtual ssize_t ReadAt(off_t position, void * buffer, size_t size) ;
	virtual ssize_t ReadAt_super(off_t position, void * buffer, size_t size) ;
	virtual ssize_t WriteAt(off_t position, const void * buffer, size_t size) ;
	virtual ssize_t WriteAt_super(off_t position, const void * buffer, size_t size) ;
	virtual off_t Seek(off_t position, uint32 seekMode) ;
	virtual off_t Seek_super(off_t position, uint32 seekMode) ;
	virtual off_t Position() const;
	virtual off_t Position_super() const;
	virtual status_t SetSize(off_t size) ;
	virtual status_t SetSize_super(off_t size) ;
};

class BMallocIOProxy
: public  BPositionIOProxy, public BMallocIOBridge
{
	void *fBindInstPtr;
public:
	BMallocIOProxy(void *bindInstPtr);
	~BMallocIOProxy();

	virtual ssize_t ReadAt(off_t position, void * buffer, size_t size) ;
	virtual ssize_t ReadAt_super(off_t position, void * buffer, size_t size) ;
	virtual ssize_t WriteAt(off_t position, const void * buffer, size_t size) ;
	virtual ssize_t WriteAt_super(off_t position, const void * buffer, size_t size) ;
	virtual off_t Seek(off_t position, uint32 seekMode) ;
	virtual off_t Seek_super(off_t position, uint32 seekMode) ;
	virtual off_t Position() const;
	virtual off_t Position_super() const;
	virtual status_t SetSize(off_t size) ;
	virtual status_t SetSize_super(off_t size) ;
};


/* BDataIO */
extern "C" {
	ssize_t bind_BDataIO_Read(void *bindInstPtr, void * buffer, size_t size);
	ssize_t bind_BDataIO_Write(void *bindInstPtr, const void * buffer, size_t size);
}
/* BPositionIO */
extern "C" {
	ssize_t bind_BPositionIO_Read(void *bindInstPtr, void * buffer, size_t size);
	ssize_t bind_BPositionIO_Write(void *bindInstPtr, const void * buffer, size_t size);
	ssize_t bind_BPositionIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size);
	ssize_t bind_BPositionIO_WriteAt(void *bindInstPtr, off_t position, const void * buffer, size_t size);
	off_t bind_BPositionIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode);
	off_t bind_BPositionIO_Position(void *bindInstPtr);
	status_t bind_BPositionIO_SetSize(void *bindInstPtr, off_t size);
	status_t bind_BPositionIO_GetSize(void *bindInstPtr, off_t * size);
}
/* BMemoryIO */
extern "C" {
	ssize_t bind_BMemoryIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size);
	ssize_t bind_BMemoryIO_WriteAt(void *bindInstPtr, off_t position, const void * buffer, size_t size);
	off_t bind_BMemoryIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode);
	off_t bind_BMemoryIO_Position(void *bindInstPtr);
	status_t bind_BMemoryIO_SetSize(void *bindInstPtr, off_t size);
}
/* BMallocIO */
extern "C" {
	ssize_t bind_BMallocIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size);
	ssize_t bind_BMallocIO_WriteAt(void *bindInstPtr, off_t position, const void * buffer, size_t size);
	off_t bind_BMallocIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode);
	off_t bind_BMallocIO_Position(void *bindInstPtr);
	status_t bind_BMallocIO_SetSize(void *bindInstPtr, off_t size);
	void bind_BMallocIO_SetBlockSize(void *bindInstPtr, size_t blockSize);
	const void * bind_BMallocIO_Buffer(void *bindInstPtr);
	size_t bind_BMallocIO_BufferLength(void *bindInstPtr);
}
