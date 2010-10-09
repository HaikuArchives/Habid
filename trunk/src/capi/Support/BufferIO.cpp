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
	BBufferIO * be_BBufferIO_ctor(void *bindInstPtr, BPositionIO * stream, size_t bufferSize, bool ownsStream)
	{
		return (BBufferIO *)new BBufferIOProxy(bindInstPtr, stream, bufferSize, ownsStream);
	}

	void be_BBufferIO_dtor(BBufferIO* self)
	{
		delete self;
	}

	ssize_t be_BBufferIO_ReadAt(BBufferIOProxy *self, off_t pos, void * buffer, size_t size)
	{
		BBufferIOProxy *proxy = dynamic_cast<BBufferIOProxy *>(self);
		if(proxy)
			return proxy->ReadAt_super(pos, buffer, size);
		else
			return self->ReadAt(pos, buffer, size);
	}

	ssize_t be_BBufferIO_WriteAt(BBufferIO *self, off_t pos, const void * buffer, size_t size)
	{
		BBufferIOProxy *proxy = dynamic_cast<BBufferIOProxy *>(self);
		if(proxy)
			return proxy->WriteAt_super(pos, buffer, size);
		else
			return self->WriteAt(pos, buffer, size);
	}

	off_t be_BBufferIO_Seek(BBufferIO *self, off_t position, uint32 seekMode)
	{
		BBufferIOProxy *proxy = dynamic_cast<BBufferIOProxy *>(self);
		if(proxy)
			return proxy->Seek_super(position, seekMode);
		else
			return self->Seek(position, seekMode);
	}

	off_t be_BBufferIO_Position(BBufferIO *self)
	{
		BBufferIOProxy *proxy = dynamic_cast<BBufferIOProxy *>(self);
		if(proxy)
			return proxy->Position_super();
		else
			return self->Position();
	}

	status_t be_BBufferIO_SetSize(BBufferIO *self, off_t size)
	{
		BBufferIOProxy *proxy = dynamic_cast<BBufferIOProxy *>(self);
		if(proxy)
			return proxy->SetSize_super(size);
		else
			return self->SetSize(size);
	}

	status_t be_BBufferIO_Flush(BBufferIO *self)
	{
		BBufferIOProxy *proxy = dynamic_cast<BBufferIOProxy *>(self);
		if(proxy)
			return proxy->Flush_super();
		else
			return self->Flush();
	}

	BPositionIO * be_BBufferIO_Stream(BBufferIO *self)
	{
		return self->Stream();
	}

	size_t be_BBufferIO_BufferSize(BBufferIO *self)
	{
		return self->BufferSize();
	}

	bool be_BBufferIO_OwnsStream(BBufferIO *self)
	{
		return self->OwnsStream();
	}

	void be_BBufferIO_SetOwnsStream(BBufferIO *self, bool ownsStream)
	{
		self->SetOwnsStream(ownsStream);
	}

	void be_BBufferIO_PrintToStream(BBufferIO *self)
	{
		self->PrintToStream();
	}

}


