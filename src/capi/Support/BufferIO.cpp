/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <SupportDefs.h>
#include "Support/BufferIO.h"

BBufferIOBridge::BBufferIOBridge(BPositionIO * stream, size_t bufferSize, bool ownsStream)
: BBufferIO(stream, bufferSize, ownsStream)
{
}
BBufferIOBridge::~BBufferIOBridge() { }

BBufferIOProxy::BBufferIOProxy(void *bindInstPtr, BPositionIO * stream, size_t bufferSize, bool ownsStream)
: fBindInstPtr(bindInstPtr), BPositionIOProxy(bindInstPtr), BBufferIOBridge(stream, bufferSize, ownsStream) { }

BBufferIOProxy::~BBufferIOProxy() { }

ssize_t BBufferIOProxy::ReadAt(off_t pos, void * buffer, size_t size) 
{
	return bind_BBufferIO_ReadAt(fBindInstPtr, pos, buffer, size);
}

ssize_t BBufferIOProxy::ReadAt_super(off_t pos, void * buffer, size_t size) 
{
	return BBufferIO::ReadAt(pos, buffer, size);
}

ssize_t BBufferIOProxy::WriteAt(off_t pos, const void * buffer, size_t size) 
{
	return bind_BBufferIO_WriteAt(fBindInstPtr, pos, buffer, size);
}

ssize_t BBufferIOProxy::WriteAt_super(off_t pos, const void * buffer, size_t size) 
{
	return BBufferIO::WriteAt(pos, buffer, size);
}

off_t BBufferIOProxy::Seek(off_t position, uint32 seekMode) 
{
	return bind_BBufferIO_Seek(fBindInstPtr, position, seekMode);
}

off_t BBufferIOProxy::Seek_super(off_t position, uint32 seekMode) 
{
	return BBufferIO::Seek(position, seekMode);
}

off_t BBufferIOProxy::Position() const
{
	return bind_BBufferIO_Position(fBindInstPtr);
}

off_t BBufferIOProxy::Position_super() const
{
	return BBufferIO::Position();
}

status_t BBufferIOProxy::SetSize(off_t size) 
{
	return bind_BBufferIO_SetSize(fBindInstPtr, size);
}

status_t BBufferIOProxy::SetSize_super(off_t size) 
{
	return BBufferIO::SetSize(size);
}

status_t BBufferIOProxy::Flush() 
{
	return bind_BBufferIO_Flush(fBindInstPtr);
}

status_t BBufferIOProxy::Flush_super() 
{
	return BBufferIO::Flush();
}


extern "C" {
	BBufferIOProxy * be_BBufferIO_ctor(void *bindInstPtr, BPositionIO * stream, size_t bufferSize, bool ownsStream)
	{
		return new BBufferIOProxy(bindInstPtr, stream, bufferSize, ownsStream);
	}

	void be_BBufferIO_dtor(BBufferIO* self)
	{
		delete self;
	}

	ssize_t be_BBufferIO_ReadAt(BBufferIOProxy *self, off_t pos, void * buffer, size_t size)
	{
		return self->ReadAt_super(pos, buffer, size);
	}

	ssize_t be_BBufferIO_WriteAt(BBufferIOProxy *self, off_t pos, const void * buffer, size_t size)
	{
		return self->WriteAt_super(pos, buffer, size);
	}

	off_t be_BBufferIO_Seek(BBufferIOProxy *self, off_t position, uint32 seekMode)
	{
		return self->Seek_super(position, seekMode);
	}

	off_t be_BBufferIO_Position(BBufferIOProxy *self)
	{
		return self->Position_super();
	}

	status_t be_BBufferIO_SetSize(BBufferIOProxy *self, off_t size)
	{
		return self->SetSize_super(size);
	}

	status_t be_BBufferIO_Flush(BBufferIOProxy *self)
	{
		return self->Flush_super();
	}

	BPositionIO * be_BBufferIO_Stream(BBufferIOProxy *self)
	{
		return self->Stream();
	}

	size_t be_BBufferIO_BufferSize(BBufferIOProxy *self)
	{
		return self->BufferSize();
	}

	bool be_BBufferIO_OwnsStream(BBufferIOProxy *self)
	{
		return self->OwnsStream();
	}

	void be_BBufferIO_SetOwnsStream(BBufferIOProxy *self, bool ownsStream)
	{
		self->SetOwnsStream(ownsStream);
	}

	void be_BBufferIO_PrintToStream(BBufferIOProxy *self)
	{
		self->PrintToStream();
	}

}


