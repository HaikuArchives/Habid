#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_DataIO.h>

extern "C" {
	ssize_t bind_BMallocIO_ReadAt_virtual(void *bindInstPointer, off_t position, void *buffer, size_t size);
	ssize_t bind_BMallocIO_WriteAt_virtual(void *bindInstPointer, off_t position, const void *buffer, size_t size);

	off_t bind_BMallocIO_Seek_virtual(void *bindInstPointer, off_t position, uint32 seekMode);
	off_t bind_BMallocIO_Position_virtual(void *bindInstPointer);

	status_t bind_BMallocIO_SetSize_virtual(void *bindInstPointer, off_t size);
}

BMallocIOBridge::BMallocIOBridge()
: BMallocIO()
{ }

BMallocIOBridge::~BMallocIOBridge()
{ }


BMallocIOProxy::BMallocIOProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BMallocIOBridge(),
  BPositionIOProxy(bindInstPointer)
{ }

BMallocIOProxy::~BMallocIOProxy()
{ }
	
ssize_t BMallocIOProxy::ReadAt(off_t position, void *buffer, size_t size) {
	return bind_BMallocIO_ReadAt_virtual(fBindInstPointer, position, buffer, size);
}
ssize_t BMallocIOProxy::super_ReadAt(off_t position, void *buffer, size_t size) {
	return BMallocIOBridge::ReadAt(position, buffer, size);
}
		
ssize_t BMallocIOProxy::WriteAt(off_t position, const void *buffer, size_t size) {
	return bind_BMallocIO_WriteAt_virtual(fBindInstPointer, position, buffer, size);
}
ssize_t BMallocIOProxy::super_WriteAt(off_t position, const void *buffer, size_t size) {
	return BMallocIOBridge::WriteAt(position, buffer, size);
}
	
off_t BMallocIOProxy::Seek(off_t position, uint32 seekMode) {
	return bind_BMallocIO_Seek_virtual(fBindInstPointer, position, seekMode);
}
off_t BMallocIOProxy::super_Seek(off_t position, uint32 seekMode) {
	return BMallocIOBridge::Seek(position, seekMode);
}
		
off_t BMallocIOProxy::Position() const {
	return bind_BMallocIO_Position_virtual(fBindInstPointer);
}
off_t BMallocIOProxy::super_Position() const {
	return BMallocIOBridge::Position();
}
	
status_t BMallocIOProxy::SetSize(off_t size) {
	return bind_BMallocIO_SetSize_virtual(fBindInstPointer, size);
}
status_t BMallocIOProxy::super_SetSize(off_t size) {
	return BMallocIOBridge::SetSize(size);
}

void BMallocIOProxy::SetBlockSize(size_t blockSize) {
	return BMallocIOBridge::SetBlockSize(blockSize);
}

const void *BMallocIOProxy::Buffer() const {
	return BMallocIOBridge::Buffer();
}

size_t BMallocIOProxy::BufferLength() const {
	return BMallocIOBridge::BufferLength();
}


extern "C" {
	be_BMallocIO * be_BMallocIO_ctor(void *bindInstPointer) {
		return (be_BMallocIO *)new BMallocIOProxy(bindInstPointer);
	}
	
	void be_BMallocIO_dtor(be_BMallocIO *instPointer) {
		delete (BMallocIOProxy *)instPointer;
	}
	
	ssize_t be_BMallocIO_ReadAt(be_BMallocIO *instPointer, off_t position, void *buffer, size_t size) {
		return ((BMallocIOProxy *)instPointer)->ReadAt(position, buffer, size);
	}
	ssize_t be_BMallocIO_ReadAt_super(be_BMallocIO *instPointer, off_t position, void *buffer, size_t size) {
		return ((BMallocIOProxy *)instPointer)->super_ReadAt(position, buffer, size);
	}
	
	ssize_t be_BMallocIO_WriteAt(be_BMallocIO *instPointer, off_t position, const void *buffer, size_t size) {
		return ((BMallocIOProxy *)instPointer)->WriteAt(position, buffer, size);
	}
	ssize_t be_BMallocIO_WriteAt_super(be_BMallocIO *instPointer, off_t position, const void *buffer, size_t size) {
		return ((BMallocIOProxy *)instPointer)->super_WriteAt(position, buffer, size);
	}
	
	off_t be_BMallocIO_Seek(be_BMallocIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMallocIOProxy *)instPointer)->Seek(position, seekMode);
	}
	off_t be_BMallocIO_Seek_super(be_BMallocIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMallocIOProxy *)instPointer)->super_Seek(position, seekMode);
	}

	off_t be_BMallocIO_SetSize(be_BMallocIO *instPointer, size_t size) {
		return ((BMallocIOProxy *)instPointer)->SetSize(size);
	}
	off_t be_BMallocIO_SetSize_super(be_BMallocIO *instPointer, size_t size) {
		return ((BMallocIOProxy *)instPointer)->super_SetSize(size);
	}
	
	off_t be_BMallocIO_Position(be_BMallocIO *instPointer) {
		return ((BMallocIOProxy *)instPointer)->Position();
	}
	off_t be_BMallocIO_Position_super(be_BMallocIO *instPointer) {
		return ((BMallocIOProxy *)instPointer)->super_Position();
	}
	
	void be_BMallocIO_SetBlockSize(be_BMallocIO *instPointer, size_t blockSize) {
		((BMallocIOProxy *)instPointer)->SetBlockSize(blockSize);
	}
	
	const void * be_BMallocIO_Buffer(be_BMallocIO *instPointer) {
		return ((BMallocIOProxy *)instPointer)->Buffer();
	}
	
	size_t be_BMallocIO_BufferLength(be_BMallocIO *instPointer) {
		return ((BMallocIOProxy *)instPointer)->BufferLength();
	}
}

