/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/Node.h"
#include "Support/DataIO.h"
#include "Storage/File.h"

BFileBridge::BFileBridge()
: BFile()
{
}
BFileBridge::BFileBridge(const BFile & file)
: BFile(file)
{
}
BFileBridge::BFileBridge(const entry_ref * ref, uint32 openMode)
: BFile(ref, openMode)
{
}
BFileBridge::BFileBridge(const BEntry * entry, uint32 openMode)
: BFile(entry, openMode)
{
}
BFileBridge::BFileBridge(const char * path, uint32 openMode)
: BFile(path, openMode)
{
}
BFileBridge::BFileBridge(const BDirectory * dir, const char * path, uint32 openMode)
: BFile(dir, path, openMode)
{
}
BFileBridge::~BFileBridge() { }

BFileProxy::BFileProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr), BPositionIOProxy(bindInstPtr), BFileBridge() { }

BFileProxy::BFileProxy(void *bindInstPtr, const BFile & file)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, file), BPositionIOProxy(bindInstPtr), BFileBridge(file) { }

BFileProxy::BFileProxy(void *bindInstPtr, const entry_ref * ref, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, ref), BPositionIOProxy(bindInstPtr), BFileBridge(ref, openMode) { }

BFileProxy::BFileProxy(void *bindInstPtr, const BEntry * entry, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, entry), BPositionIOProxy(bindInstPtr), BFileBridge(entry, openMode) { }

BFileProxy::BFileProxy(void *bindInstPtr, const char * path, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, path), BPositionIOProxy(bindInstPtr), BFileBridge(path, openMode) { }

BFileProxy::BFileProxy(void *bindInstPtr, const BDirectory * dir, const char * path, uint32 openMode)
: fBindInstPtr(bindInstPtr), BNodeProxy(bindInstPtr, dir, path), BPositionIOProxy(bindInstPtr), BFileBridge(dir, path, openMode) { }

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
	BFileProxy * be_BFile_ctor(void *bindInstPtr)
	{
		return new BFileProxy(bindInstPtr);
	}

	BFileProxy * be_BFile_ctor_1(void *bindInstPtr, const BFile * file)
	{
		return new BFileProxy(bindInstPtr, *file);
	}

	BFileProxy * be_BFile_ctor_2(void *bindInstPtr, const entry_ref * ref, uint32 openMode)
	{
		return new BFileProxy(bindInstPtr, ref, openMode);
	}

	BFileProxy * be_BFile_ctor_3(void *bindInstPtr, const BEntry * entry, uint32 openMode)
	{
		return new BFileProxy(bindInstPtr, entry, openMode);
	}

	BFileProxy * be_BFile_ctor_4(void *bindInstPtr, const char * path, uint32 openMode)
	{
		return new BFileProxy(bindInstPtr, path, openMode);
	}

	BFileProxy * be_BFile_ctor_5(void *bindInstPtr, const BDirectory * dir, const char * path, uint32 openMode)
	{
		return new BFileProxy(bindInstPtr, dir, path, openMode);
	}

	void be_BFile_dtor(BFile* self)
	{
		delete self;
	}

	status_t be_BFile_SetTo(BFileProxy *self, const entry_ref * ref, uint32 openMode)
	{
		return ((BFile *)self)->SetTo(ref, openMode);
	}

	status_t be_BFile_SetTo_1(BFileProxy *self, const BEntry * entry, uint32 openMode)
	{
		return ((BFile *)self)->SetTo(entry, openMode);
	}

	status_t be_BFile_SetTo_2(BFileProxy *self, const char * path, uint32 openMode)
	{
		return ((BFile *)self)->SetTo(path, openMode);
	}

	status_t be_BFile_SetTo_3(BFileProxy *self, const BDirectory * dir, const char * path, uint32 openMode)
	{
		return ((BFile *)self)->SetTo(dir, path, openMode);
	}

	bool be_BFile_IsReadable(BFileProxy *self)
	{
		return ((BFile *)self)->IsReadable();
	}

	bool be_BFile_IsWritable(BFileProxy *self)
	{
		return ((BFile *)self)->IsWritable();
	}

	ssize_t be_BFile_Read(BFileProxy *self, void * buffer, size_t size)
	{
		return self->Read_super(buffer, size);
	}

	ssize_t be_BFile_ReadAt(BFileProxy *self, off_t location, void * buffer, size_t size)
	{
		return self->ReadAt_super(location, buffer, size);
	}

	ssize_t be_BFile_Write(BFileProxy *self, const void * buffer, size_t size)
	{
		return self->Write_super(buffer, size);
	}

	ssize_t be_BFile_WriteAt(BFileProxy *self, off_t location, const void * buffer, size_t size)
	{
		return self->WriteAt_super(location, buffer, size);
	}

	off_t be_BFile_Seek(BFileProxy *self, off_t offset, uint32 seekMode)
	{
		return self->Seek_super(offset, seekMode);
	}

	off_t be_BFile_Position(BFileProxy *self)
	{
		return self->Position_super();
	}

	status_t be_BFile_SetSize(BFileProxy *self, off_t size)
	{
		return self->SetSize_super(size);
	}

	status_t be_BFile_GetSize(BFileProxy *self, off_t* size)
	{
		return self->GetSize_super(size);
	}

	BFile * be_BFile_opAssign(BFile *self, const BFile * file)
	{
		return &self->operator=(*file);
	}

}


