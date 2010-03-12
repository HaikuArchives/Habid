#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_DataIO.h>

extern "C" {
	ssize_t bind_BMemoryIO_ReadAt_virtual(void *bindInstPointer, off_t position, void *buffer, size_t size);
	ssize_t bind_BMemoryIO_WriteAt_virtual(void *bindInstPointer, off_t position, const void *buffer, size_t size);

	off_t bind_BMemoryIO_Seek_virtual(void *bindInstPointer, off_t position, uint32 seekMode);
	off_t bind_BMemoryIO_Position_virtual(void *bindInstPointer);

	status_t bind_BMemoryIO_SetSize_virtual(void *bindInstPointer, off_t size);
}

BMemoryIOBridge::BMemoryIOBridge(void *buffer, size_t length)
: BMemoryIO(buffer, length)
{ }

BMemoryIOBridge::BMemoryIOBridge(const void *buffer, size_t length)
: BMemoryIO(buffer, length)
{ }

BMemoryIOBridge::~BMemoryIOBridge()
{ }


BMemoryIOProxy::BMemoryIOProxy(void *bindInstPointer, void *data, size_t length)
: fBindInstPointer(bindInstPointer), BMemoryIOBridge(data, length),
  BPositionIOProxy(bindInstPointer)
{ }

BMemoryIOProxy::BMemoryIOProxy(void *bindInstPointer, const void *data, size_t length)
: fBindInstPointer(bindInstPointer), BMemoryIOBridge(data, length),
  BPositionIOProxy(bindInstPointer)
{ }

BMemoryIOProxy::~BMemoryIOProxy()
{ }
	
ssize_t BMemoryIOProxy::ReadAt(off_t position, void *buffer, size_t size)
{
	return bind_BMemoryIO_ReadAt_virtual(fBindInstPointer, position, buffer, size);
}

ssize_t BMemoryIOProxy::super_ReadAt(off_t position, void *buffer, size_t size)
{
	printf("BMemoryIOBridge::ReadAt\n");
	return BMemoryIOBridge::ReadAt(position, buffer, size);
}
	

ssize_t BMemoryIOProxy::WriteAt(off_t position, const void *buffer, size_t size)
{
	return bind_BMemoryIO_WriteAt_virtual(fBindInstPointer, position, buffer, size);
}

ssize_t BMemoryIOProxy::super_WriteAt(off_t position, const void *buffer, size_t size)
{
	return BMemoryIOBridge::WriteAt(position, buffer, size);
}


off_t BMemoryIOProxy::Seek(off_t position, uint32 seekMode)
{
	return bind_BMemoryIO_Seek_virtual(fBindInstPointer, position, seekMode);
}

off_t BMemoryIOProxy::super_Seek(off_t position, uint32 seekMode)
{
	return BMemoryIOBridge::Seek(position, seekMode);
}

		
off_t BMemoryIOProxy::Position() const
{
	return bind_BMemoryIO_Position_virtual(fBindInstPointer);
}

off_t BMemoryIOProxy::super_Position() const
{
	return BMemoryIOBridge::Position();
}


status_t BMemoryIOProxy::SetSize(off_t size)
{
	return bind_BMemoryIO_SetSize_virtual(fBindInstPointer, size);
}

status_t BMemoryIOProxy::super_SetSize(off_t size)
{
	return BMemoryIOBridge::SetSize(size);
}


extern "C" {
	be_BMemoryIO * be_BMemoryIO_ctor_1(void *bindInstPointer, void *data, size_t length) {
		return (be_BMemoryIO *)new BMemoryIOProxy(bindInstPointer, data, length);
	}
	
	be_BMemoryIO * be_BMemoryIO_ctor_2(void *bindInstPointer, const void *data, size_t length) {
		return (be_BMemoryIO *)new BMemoryIOProxy(bindInstPointer, data, length);
	}
	
	void be_BMemoryIO_dtor(be_BMemoryIO *instPointer) {
		delete (BMemoryIOProxy *)instPointer;
	}
	
	ssize_t be_BMemoryIO_ReadAt(be_BMemoryIO *instPointer, off_t position, void *buffer, size_t length) {
		return ((BMemoryIOProxy *)instPointer)->ReadAt(position, buffer, length);
	}
	ssize_t be_BMemoryIO_ReadAt_super(be_BMemoryIO *instPointer, off_t position, void *buffer, size_t length) {
		return ((BMemoryIOProxy *)instPointer)->super_ReadAt(position, buffer, length);
	}
	
	ssize_t be_BMemoryIO_WriteAt(be_BMemoryIO *instPointer, off_t position, const void *buffer, size_t length) {
		return ((BMemoryIOProxy *)instPointer)->WriteAt(position, buffer, length);
	}
	ssize_t be_BMemoryIO_WriteAt_super(be_BMemoryIO *instPointer, off_t position, const void *buffer, size_t length) {
		return ((BMemoryIOProxy *)instPointer)->super_WriteAt(position, buffer, length);
	}
	
	off_t be_BMemoryIO_Seek(be_BMemoryIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMemoryIOProxy *)instPointer)->Seek(position, seekMode);
	}
	off_t be_BMemoryIO_Seek_super(be_BMemoryIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMemoryIOProxy *)instPointer)->super_Seek(position, seekMode);
	}
	
	off_t be_BMemoryIO_Position(be_BMemoryIO *instPointer) {
		return ((BMemoryIOProxy *)instPointer)->Position();
	}
	off_t be_BMemoryIO_Position_super(be_BMemoryIO *instPointer) {
		return ((BMemoryIOProxy *)instPointer)->super_Position();
	}
	
	status_t be_BMemoryIO_SetSize(be_BMemoryIO *instPointer, off_t size) {
		return ((BMemoryIOProxy *)instPointer)->SetSize(size);
	}
	status_t be_BMemoryIO_SetSize_super(be_BMemoryIO *instPointer, off_t size) {
		return ((BMemoryIOProxy *)instPointer)->super_SetSize(size);
	}
}

