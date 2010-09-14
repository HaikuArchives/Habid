/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <SupportDefs.h>
#include <DataIO.h>
#include "Support/DataIO.h"

BDataIOBridge::BDataIOBridge()
: BDataIO()
{
}


BDataIOBridge::~BDataIOBridge() { }


ssize_t BDataIOBridge::Read(void * buffer, size_t size){ }


ssize_t BDataIOBridge::Write(const void * buffer, size_t size){ }


BPositionIOBridge::BPositionIOBridge()
: BPositionIO()
{
}


BPositionIOBridge::~BPositionIOBridge() { }






ssize_t BPositionIOBridge::ReadAt(off_t position, void * buffer, size_t size){ }


ssize_t BPositionIOBridge::WriteAt(off_t position, const void * buffer, size_t size){ }


off_t BPositionIOBridge::Seek(off_t position, uint32 seekMode){ }


off_t BPositionIOBridge::Position()const{ }






BMemoryIOBridge::BMemoryIOBridge(void * data, size_t length)
: BMemoryIO(data, length)
{
}


BMemoryIOBridge::BMemoryIOBridge(const void * data, size_t length)
: BMemoryIO(data, length)
{
}


BMemoryIOBridge::~BMemoryIOBridge() { }












BMallocIOBridge::BMallocIOBridge()
: BMallocIO()
{
}


BMallocIOBridge::~BMallocIOBridge() { }



















BDataIOProxy::BDataIOProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BDataIOBridge() { }

BDataIOProxy::~BDataIOProxy() { }

ssize_t BDataIOProxy::Read(void * buffer, size_t size) 
{
	return bind_BDataIO_Read(fBindInstPtr, buffer, size);
}

ssize_t BDataIOProxy::Read_super(void * buffer, size_t size) 
{
	return BDataIOBridge::Read(buffer, size);
}

ssize_t BDataIOProxy::Write(const void * buffer, size_t size) 
{
	return bind_BDataIO_Write(fBindInstPtr, buffer, size);
}

ssize_t BDataIOProxy::Write_super(const void * buffer, size_t size) 
{
	return BDataIOBridge::Write(buffer, size);
}

BPositionIOProxy::BPositionIOProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BDataIOProxy(bindInstPtr), BPositionIOBridge() { }

BPositionIOProxy::~BPositionIOProxy() { }

ssize_t BPositionIOProxy::Read(void * buffer, size_t size) 
{
	return bind_BPositionIO_Read(fBindInstPtr, buffer, size);
}

ssize_t BPositionIOProxy::Read_super(void * buffer, size_t size) 
{
	return BPositionIO::Read(buffer, size);
}

ssize_t BPositionIOProxy::Write(const void * buffer, size_t size) 
{
	return bind_BPositionIO_Write(fBindInstPtr, buffer, size);
}

ssize_t BPositionIOProxy::Write_super(const void * buffer, size_t size) 
{
	return BPositionIO::Write(buffer, size);
}

ssize_t BPositionIOProxy::ReadAt(off_t position, void * buffer, size_t size) 
{
	return bind_BPositionIO_ReadAt(fBindInstPtr, position, buffer, size);
}

ssize_t BPositionIOProxy::ReadAt_super(off_t position, void * buffer, size_t size) 
{
	return BPositionIOBridge::ReadAt(position, buffer, size);
}

ssize_t BPositionIOProxy::WriteAt(off_t position, const void * buffer, size_t size) 
{
	return bind_BPositionIO_WriteAt(fBindInstPtr, position, buffer, size);
}

ssize_t BPositionIOProxy::WriteAt_super(off_t position, const void * buffer, size_t size) 
{
	return BPositionIOBridge::WriteAt(position, buffer, size);
}

off_t BPositionIOProxy::Seek(off_t position, uint32 seekMode) 
{
	return bind_BPositionIO_Seek(fBindInstPtr, position, seekMode);
}

off_t BPositionIOProxy::Seek_super(off_t position, uint32 seekMode) 
{
	return BPositionIOBridge::Seek(position, seekMode);
}

off_t BPositionIOProxy::Position() const
{
	return bind_BPositionIO_Position(fBindInstPtr);
}

off_t BPositionIOProxy::Position_super() const
{
	return BPositionIOBridge::Position();
}

status_t BPositionIOProxy::SetSize(off_t size) 
{
	return bind_BPositionIO_SetSize(fBindInstPtr, size);
}

status_t BPositionIOProxy::SetSize_super(off_t size) 
{
	return BPositionIO::SetSize(size);
}

status_t BPositionIOProxy::GetSize(off_t * size) 
{
	return bind_BPositionIO_GetSize(fBindInstPtr, size);
}

status_t BPositionIOProxy::GetSize_super(off_t * size) 
{
	return BPositionIO::GetSize(size);
}

BMemoryIOProxy::BMemoryIOProxy(void *bindInstPtr, void * data, size_t length)
: fBindInstPtr(bindInstPtr), BPositionIOProxy(bindInstPtr), BMemoryIOBridge(data, length) { }

BMemoryIOProxy::BMemoryIOProxy(void *bindInstPtr, const void * data, size_t length)
: fBindInstPtr(bindInstPtr), BPositionIOProxy(bindInstPtr), BMemoryIOBridge(data, length) { }

BMemoryIOProxy::~BMemoryIOProxy() { }

ssize_t BMemoryIOProxy::ReadAt(off_t position, void * buffer, size_t size) 
{
	return bind_BMemoryIO_ReadAt(fBindInstPtr, position, buffer, size);
}

ssize_t BMemoryIOProxy::ReadAt_super(off_t position, void * buffer, size_t size) 
{
	return BMemoryIO::ReadAt(position, buffer, size);
}

ssize_t BMemoryIOProxy::WriteAt(off_t position, const void * buffer, size_t size) 
{
	return bind_BMemoryIO_WriteAt(fBindInstPtr, position, buffer, size);
}

ssize_t BMemoryIOProxy::WriteAt_super(off_t position, const void * buffer, size_t size) 
{
	return BMemoryIO::WriteAt(position, buffer, size);
}

off_t BMemoryIOProxy::Seek(off_t position, uint32 seekMode) 
{
	return bind_BMemoryIO_Seek(fBindInstPtr, position, seekMode);
}

off_t BMemoryIOProxy::Seek_super(off_t position, uint32 seekMode) 
{
	return BMemoryIO::Seek(position, seekMode);
}

off_t BMemoryIOProxy::Position() const
{
	return bind_BMemoryIO_Position(fBindInstPtr);
}

off_t BMemoryIOProxy::Position_super() const
{
	return BMemoryIO::Position();
}

status_t BMemoryIOProxy::SetSize(off_t size) 
{
	return bind_BMemoryIO_SetSize(fBindInstPtr, size);
}

status_t BMemoryIOProxy::SetSize_super(off_t size) 
{
	return BMemoryIO::SetSize(size);
}

BMallocIOProxy::BMallocIOProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BPositionIOProxy(bindInstPtr), BMallocIOBridge() { }

BMallocIOProxy::~BMallocIOProxy() { }

ssize_t BMallocIOProxy::ReadAt(off_t position, void * buffer, size_t size) 
{
	return bind_BMallocIO_ReadAt(fBindInstPtr, position, buffer, size);
}

ssize_t BMallocIOProxy::ReadAt_super(off_t position, void * buffer, size_t size) 
{
	return BMallocIO::ReadAt(position, buffer, size);
}

ssize_t BMallocIOProxy::WriteAt(off_t position, const void * buffer, size_t size) 
{
	return bind_BMallocIO_WriteAt(fBindInstPtr, position, buffer, size);
}

ssize_t BMallocIOProxy::WriteAt_super(off_t position, const void * buffer, size_t size) 
{
	return BMallocIO::WriteAt(position, buffer, size);
}

off_t BMallocIOProxy::Seek(off_t position, uint32 seekMode) 
{
	return bind_BMallocIO_Seek(fBindInstPtr, position, seekMode);
}

off_t BMallocIOProxy::Seek_super(off_t position, uint32 seekMode) 
{
	return BMallocIO::Seek(position, seekMode);
}

off_t BMallocIOProxy::Position() const
{
	return bind_BMallocIO_Position(fBindInstPtr);
}

off_t BMallocIOProxy::Position_super() const
{
	return BMallocIO::Position();
}

status_t BMallocIOProxy::SetSize(off_t size) 
{
	return bind_BMallocIO_SetSize(fBindInstPtr, size);
}

status_t BMallocIOProxy::SetSize_super(off_t size) 
{
	return BMallocIO::SetSize(size);
}


extern "C" {
	BDataIOProxy * be_BDataIO_ctor(void *bindInstPtr)
	{
		return new BDataIOProxy(bindInstPtr);
	}

	void be_BDataIO_dtor(BDataIO* self)
	{
		delete self;
	}

	ssize_t be_BDataIO_Read(BDataIOProxy *self, void * buffer, size_t size)
	{
		return self->Read_super(buffer, size);
	}

	ssize_t be_BDataIO_Write(BDataIOProxy *self, const void * buffer, size_t size)
	{
		return self->Write_super(buffer, size);
	}

}

extern "C" {
	BPositionIOProxy * be_BPositionIO_ctor(void *bindInstPtr)
	{
		return new BPositionIOProxy(bindInstPtr);
	}

	void be_BPositionIO_dtor(BPositionIO* self)
	{
		delete self;
	}

	ssize_t be_BPositionIO_Read(BPositionIOProxy *self, void * buffer, size_t size)
	{
		return self->Read_super(buffer, size);
	}

	ssize_t be_BPositionIO_Write(BPositionIOProxy *self, const void * buffer, size_t size)
	{
		return self->Write_super(buffer, size);
	}

	ssize_t be_BPositionIO_ReadAt(BPositionIOProxy *self, off_t position, void * buffer, size_t size)
	{
		return self->ReadAt_super(position, buffer, size);
	}

	ssize_t be_BPositionIO_WriteAt(BPositionIOProxy *self, off_t position, const void * buffer, size_t size)
	{
		return self->WriteAt_super(position, buffer, size);
	}

	off_t be_BPositionIO_Seek(BPositionIOProxy *self, off_t position, uint32 seekMode)
	{
		return self->Seek_super(position, seekMode);
	}

	off_t be_BPositionIO_Position(BPositionIOProxy *self)
	{
		return self->Position_super();
	}

	status_t be_BPositionIO_SetSize(BPositionIOProxy *self, off_t size)
	{
		return self->SetSize_super(size);
	}

	status_t be_BPositionIO_GetSize(BPositionIOProxy *self, off_t * size)
	{
		return self->GetSize_super(size);
	}

}

extern "C" {
	BMemoryIOProxy * be_BMemoryIO_ctor(void *bindInstPtr, void * data, size_t length)
	{
		return new BMemoryIOProxy(bindInstPtr, data, length);
	}

	BMemoryIOProxy * be_BMemoryIO_ctor_1(void *bindInstPtr, const void * data, size_t length)
	{
		return new BMemoryIOProxy(bindInstPtr, data, length);
	}

	void be_BMemoryIO_dtor(BMemoryIO* self)
	{
		delete self;
	}

	ssize_t be_BMemoryIO_ReadAt(BMemoryIOProxy *self, off_t position, void * buffer, size_t size)
	{
		return self->ReadAt_super(position, buffer, size);
	}

	ssize_t be_BMemoryIO_WriteAt(BMemoryIOProxy *self, off_t position, const void * buffer, size_t size)
	{
		return self->WriteAt_super(position, buffer, size);
	}

	off_t be_BMemoryIO_Seek(BMemoryIOProxy *self, off_t position, uint32 seekMode)
	{
		return self->Seek_super(position, seekMode);
	}

	off_t be_BMemoryIO_Position(BMemoryIOProxy *self)
	{
		return self->Position_super();
	}

	status_t be_BMemoryIO_SetSize(BMemoryIOProxy *self, off_t size)
	{
		return self->SetSize_super(size);
	}

}

extern "C" {
	BMallocIOProxy * be_BMallocIO_ctor(void *bindInstPtr)
	{
		return new BMallocIOProxy(bindInstPtr);
	}

	void be_BMallocIO_dtor(BMallocIO* self)
	{
		delete self;
	}

	ssize_t be_BMallocIO_ReadAt(BMallocIOProxy *self, off_t position, void * buffer, size_t size)
	{
		return self->ReadAt_super(position, buffer, size);
	}

	ssize_t be_BMallocIO_WriteAt(BMallocIOProxy *self, off_t position, const void * buffer, size_t size)
	{
		return self->WriteAt_super(position, buffer, size);
	}

	off_t be_BMallocIO_Seek(BMallocIOProxy *self, off_t position, uint32 seekMode)
	{
		return self->Seek_super(position, seekMode);
	}

	off_t be_BMallocIO_Position(BMallocIOProxy *self)
	{
		return self->Position_super();
	}

	status_t be_BMallocIO_SetSize(BMallocIOProxy *self, off_t size)
	{
		return self->SetSize_super(size);
	}

	void be_BMallocIO_SetBlockSize(BMallocIOProxy *self, size_t blockSize)
	{
		self->SetBlockSize(blockSize);
	}

	const void * be_BMallocIO_Buffer(BMallocIOProxy *self)
	{
		return self->Buffer();
	}

	size_t be_BMallocIO_BufferLength(BMallocIOProxy *self)
	{
		return self->BufferLength();
	}

}

