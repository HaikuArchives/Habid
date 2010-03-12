#ifndef __DATAIO_H__
#define __DATAIO_H__

#include <support/DataIO.h>

/* begin file DataIO.cpp */

class BDataIOBridge : public BDataIO
{
public:
	BDataIOBridge();	
	virtual ~BDataIOBridge();
	
	virtual ssize_t Read(void *buffer, size_t size);
	
	virtual ssize_t Write(const void *buffer, size_t size);
};


class BDataIOProxy : public BDataIOBridge
{
private:
	void *fBindInstPointer;
public:
	BDataIOProxy(void *bindInstPointer);
	virtual ~BDataIOProxy();
	
	virtual ssize_t Read(void *buffer, size_t size);
	virtual ssize_t super_Read(void *buffer, size_t size);
	virtual ssize_t Write(const void *buffer, size_t size);
	virtual ssize_t super_Write(const void *buffer, size_t size);
};

/* end file DataIO.cpp */

/* begin file DataIO_BPositionIO.cpp */

class BPositionIOBridge : public BPositionIO
{
public:
	BPositionIOBridge();
	~BPositionIOBridge();
	
	virtual ssize_t ReadAt(off_t position, void *buffer, size_t size);
	
	virtual ssize_t WriteAt(off_t position, const void *buffer, size_t size);

	virtual off_t Seek(off_t position, uint32 seekMode);
	
	virtual off_t Position() const;
};

class BPositionIOProxy : public BPositionIOBridge
{
private:
	void *fBindInstPointer;

public:
	BPositionIOProxy(void *bindInstPointer);
	virtual ~BPositionIOProxy();
	
	virtual ssize_t ReadAt(off_t position, void *buffer, size_t size);
	virtual ssize_t super_ReadAt(off_t position, void *buffer, size_t size);

	
	virtual ssize_t WriteAt(off_t position, const void *buffer, size_t size);
	virtual ssize_t super_WriteAt(off_t position, const void *buffer, size_t size);

	
	virtual off_t Seek(off_t position, uint32 seekMode);
	virtual off_t super_Seek(off_t position, uint32 seekMode);

	
	virtual off_t Position() const;
	virtual off_t super_Position() const;


	virtual ssize_t Read(void *buffer, size_t size);
	virtual ssize_t super_Read(void *buffer, size_t size);

	
	virtual ssize_t Write(const void *buffer, size_t size);
	virtual ssize_t super_Write(const void *buffer, size_t size);

	
	virtual status_t SetSize(off_t size);
	virtual status_t super_SetSize(off_t size);

	
	virtual status_t GetSize(off_t *size);
	virtual status_t super_GetSize(off_t *size);
};

/* end file DataIO_BPositionIO.cpp */

/* begin file DataIO_BMemoryIO.cpp */

class BMemoryIOBridge : public BMemoryIO
{
public:
	BMemoryIOBridge(void *buffer, size_t length);
	BMemoryIOBridge(const void *buffer, size_t length);
	virtual ~BMemoryIOBridge();
};

class BMemoryIOProxy : public BPositionIOProxy, public BMemoryIOBridge
{
private:
	void *fBindInstPointer;
public:
	BMemoryIOProxy(void *bindInstPointer, void *data, size_t length);
	BMemoryIOProxy(void *bindInstPointer, const void *data, size_t length);
	virtual ~BMemoryIOProxy();
	
	virtual ssize_t ReadAt(off_t position, void *buffer, size_t size);
	virtual ssize_t super_ReadAt(off_t position, void *buffer, size_t size);
	
	virtual ssize_t WriteAt(off_t position, const void *buffer, size_t size);
	virtual ssize_t super_WriteAt(off_t position, const void *buffer, size_t size);

	virtual off_t Seek(off_t position, uint32 seekMode);
	virtual off_t super_Seek(off_t position, uint32 seekMode);
		
	virtual off_t Position() const;
	virtual off_t super_Position() const;

	virtual status_t SetSize(off_t size);
	virtual status_t super_SetSize(off_t size);
};

/* end file DataIO_BMemoryIO.cpp */

/* begin file DataIO_BMallocIO.cpp */

class BMallocIOBridge : public BMallocIO
{
public:
	BMallocIOBridge();
	virtual ~BMallocIOBridge();
};

class BMallocIOProxy : public BPositionIOProxy, public BMallocIOBridge
{
private:
	void *fBindInstPointer;
public:
	BMallocIOProxy(void *bindInstPointer);
	virtual ~BMallocIOProxy();
	
	virtual ssize_t ReadAt(off_t position, void *buffer, size_t size);
	virtual ssize_t super_ReadAt(off_t position, void *buffer, size_t size);
		
	virtual ssize_t WriteAt(off_t position, const void *buffer, size_t size);
	virtual ssize_t super_WriteAt(off_t position, const void *buffer, size_t size);
	
	virtual off_t Seek(off_t position, uint32 seekMode);
	virtual off_t super_Seek(off_t position, uint32 seekMode);
		
	virtual off_t Position() const;
	virtual off_t super_Position() const;
	
	virtual status_t SetSize(off_t size);
	virtual status_t super_SetSize(off_t size);

	void SetBlockSize(size_t blockSize);
	void super_SetBlockSize(size_t blockSize);

	const void *Buffer() const;
	const void *super_Buffer() const;

	size_t BufferLength() const;
	size_t super_BufferLength() const;
};

/* end file DataIO_BMallocIO.cpp */


#endif
