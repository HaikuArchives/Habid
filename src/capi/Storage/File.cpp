/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/Node.h"
#include "Support/DataIO.h"
#include "Storage/File.h"


BFileProxy::BFileProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr), BPositionIOProxy(bindInstPtr), BFile() { }

BFileProxy::BFileProxy(void *bindInstPtr, const BFile & file)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, file), BPositionIOProxy(bindInstPtr), BFile(file) { }

BFileProxy::BFileProxy(void *bindInstPtr, const entry_ref * ref, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, ref), BPositionIOProxy(bindInstPtr), BFile(ref, openMode) { }

BFileProxy::BFileProxy(void *bindInstPtr, const BEntry * entry, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, entry), BPositionIOProxy(bindInstPtr), BFile(entry, openMode) { }

BFileProxy::BFileProxy(void *bindInstPtr, const char * path, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, path), BPositionIOProxy(bindInstPtr), BFile(path, openMode) { }

BFileProxy::BFileProxy(void *bindInstPtr, const BDirectory * dir, const char * path, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, dir, path), BPositionIOProxy(bindInstPtr), BFile(dir, path, openMode) { }

BFileProxy::~BFileProxy() { }

ssize_t BFileProxy::Read(void * buffer, size_t size) 
{
	return bind_BFile_Read(fBindInstPtr, buffer, size);
}

ssize_t BFileProxy::Read_super(void * buffer, size_t size) 
{
	return BFile::Read(buffer, size);
}

ssize_t BFileProxy::ReadAt(off_t location, void * buffer, size_t size) 
{
	return bind_BFile_ReadAt(fBindInstPtr, location, buffer, size);
}

ssize_t BFileProxy::ReadAt_super(off_t location, void * buffer, size_t size) 
{
	return BFile::ReadAt(location, buffer, size);
}

ssize_t BFileProxy::Write(const void * buffer, size_t size) 
{
	return bind_BFile_Write(fBindInstPtr, buffer, size);
}

ssize_t BFileProxy::Write_super(const void * buffer, size_t size) 
{
	return BFile::Write(buffer, size);
}

ssize_t BFileProxy::WriteAt(off_t location, const void * buffer, size_t size) 
{
	return bind_BFile_WriteAt(fBindInstPtr, location, buffer, size);
}

ssize_t BFileProxy::WriteAt_super(off_t location, const void * buffer, size_t size) 
{
	return BFile::WriteAt(location, buffer, size);
}

off_t BFileProxy::Seek(off_t offset, uint32 seekMode) 
{
	return bind_BFile_Seek(fBindInstPtr, offset, seekMode);
}

off_t BFileProxy::Seek_super(off_t offset, uint32 seekMode) 
{
	return BFile::Seek(offset, seekMode);
}

off_t BFileProxy::Position() const
{
	return bind_BFile_Position(fBindInstPtr);
}

off_t BFileProxy::Position_super() const
{
	return BFile::Position();
}

status_t BFileProxy::SetSize(off_t size) 
{
	return bind_BFile_SetSize(fBindInstPtr, size);
}

status_t BFileProxy::SetSize_super(off_t size) 
{
	return BFile::SetSize(size);
}

status_t BFileProxy::GetSize(off_t* size) 
{
	return bind_BFile_GetSize(fBindInstPtr, size);
}

status_t BFileProxy::GetSize_super(off_t* size) 
{
	return BFile::GetSize(size);
}


extern "C" {
	BFile * be_BFile_ctor(void *bindInstPtr)
	{
		return (BFile *)new BFileProxy(bindInstPtr);
	}

	BFile * be_BFile_ctor_1(void *bindInstPtr, const BFile * file)
	{
		return (BFile *)new BFileProxy(bindInstPtr, *file);
	}

	BFile * be_BFile_ctor_2(void *bindInstPtr, const entry_ref * ref, uint32 openMode)
	{
		return (BFile *)new BFileProxy(bindInstPtr, ref, openMode);
	}

	BFile * be_BFile_ctor_3(void *bindInstPtr, const BEntry * entry, uint32 openMode)
	{
		return (BFile *)new BFileProxy(bindInstPtr, entry, openMode);
	}

	BFile * be_BFile_ctor_4(void *bindInstPtr, const char * path, uint32 openMode)
	{
		return (BFile *)new BFileProxy(bindInstPtr, path, openMode);
	}

	BFile * be_BFile_ctor_5(void *bindInstPtr, const BDirectory * dir, const char * path, uint32 openMode)
	{
		return (BFile *)new BFileProxy(bindInstPtr, dir, path, openMode);
	}

	void be_BFile_dtor(BFile* self)
	{
		delete self;
	}

	status_t be_BFile_SetTo(BFile *self, const entry_ref * ref, uint32 openMode)
	{
		return self->SetTo(ref, openMode);
	}

	status_t be_BFile_SetTo_1(BFile *self, const BEntry * entry, uint32 openMode)
	{
		return self->SetTo(entry, openMode);
	}

	status_t be_BFile_SetTo_2(BFile *self, const char * path, uint32 openMode)
	{
		return self->SetTo(path, openMode);
	}

	status_t be_BFile_SetTo_3(BFile *self, const BDirectory * dir, const char * path, uint32 openMode)
	{
		return self->SetTo(dir, path, openMode);
	}

	bool be_BFile_IsReadable(BFile *self)
	{
		return self->IsReadable();
	}

	bool be_BFile_IsWritable(BFile *self)
	{
		return self->IsWritable();
	}

	ssize_t be_BFile_Read(BFile *self, void * buffer, size_t size)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->Read_super(buffer, size);
		else
			return self->Read(buffer, size);
	}

	ssize_t be_BFile_ReadAt(BFile *self, off_t location, void * buffer, size_t size)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->ReadAt_super(location, buffer, size);
		else
			return self->ReadAt(location, buffer, size);
	}

	ssize_t be_BFile_Write(BFile *self, const void * buffer, size_t size)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->Write_super(buffer, size);
		else
			return self->Write(buffer, size);
	}

	ssize_t be_BFile_WriteAt(BFile *self, off_t location, const void * buffer, size_t size)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->WriteAt_super(location, buffer, size);
		else
			return self->WriteAt(location, buffer, size);
	}

	off_t be_BFile_Seek(BFile *self, off_t offset, uint32 seekMode)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->Seek_super(offset, seekMode);
		else
			return self->Seek(offset, seekMode);
	}

	off_t be_BFile_Position(BFile *self)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->Position_super();
		else
			return self->Position();
	}

	status_t be_BFile_SetSize(BFile *self, off_t size)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->SetSize_super(size);
		else
			return self->SetSize(size);
	}

	status_t be_BFile_GetSize(BFile *self, off_t* size)
	{
		BFileProxy *proxy = dynamic_cast<BFileProxy *>(self);
		if(proxy)
			return proxy->GetSize_super(size);
		else
			return self->GetSize(size);
	}

	BFile * be_BFile_opAssign(BFile *self, const BFile * file)
	{
		return &self->operator=(*file);
	}

}


