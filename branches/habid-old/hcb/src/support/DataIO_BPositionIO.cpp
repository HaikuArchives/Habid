#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>

#include "support/HCB_DataIO.h"

/* begin import functions */

extern "C" {
	ssize_t bind_BPositionIO_Read_virtual(void *bindInstPointer, void *buffer, size_t size);
	ssize_t bind_BPositionIO_Write_virtual (void *bindInstPointer, const void *buffer, size_t size);
	
	ssize_t bind_BPositionIO_ReadAt_pure(void *bindInstPointer, off_t position, void *buffer, size_t size);
	ssize_t bind_BPositionIO_WriteAt_pure(void *bindInstPointer, off_t position, const void *buffer, size_t size);
	
	off_t bind_BPositionIO_Seek_pure(void *bindInstPointer, off_t position, uint32 seekMode);
	off_t bind_BPositionIO_Position_pure(void *bindInstPointer);
	
	status_t bind_BPositionIO_SetSize_virtual(void *bindInstPointer, off_t size);
	status_t bind_BPositionIO_GetSize_virtual(void *bindInstPointer, off_t *size);
}

/* end import functions */

/* begin class BPositionIOBridge */

BPositionIOBridge::BPositionIOBridge() : BPositionIO()
{ }

BPositionIOBridge::~BPositionIOBridge()
{ }

ssize_t BPositionIOBridge::ReadAt(off_t position, void *buffer, size_t size) {
	return 0;
}
	
ssize_t BPositionIOBridge::WriteAt(off_t position, const void *buffer, size_t size) {
	return 0;
}

off_t BPositionIOBridge::Seek(off_t position, uint32 seekMode) {
	return 0;
}
	
off_t BPositionIOBridge::Position() const {
	return 0;
}

/* end class BPositionIOBridge */


/* begin class BPositionIOProxy */

BPositionIOProxy::BPositionIOProxy(void *bindInstPointer)
	: fBindInstPointer(bindInstPointer), BPositionIOBridge()
{ }

BPositionIOProxy::~BPositionIOProxy()
{ }
	
ssize_t BPositionIOProxy::ReadAt(off_t position, void *buffer, size_t size) {
	bind_BPositionIO_ReadAt_pure(fBindInstPointer, position, buffer, size);		
}

ssize_t BPositionIOProxy::super_ReadAt(off_t position, void *buffer, size_t size) {
	return BPositionIOBridge::ReadAt(position, buffer, size);
}

	
ssize_t BPositionIOProxy::WriteAt(off_t position, const void *buffer, size_t size) {
	return bind_BPositionIO_WriteAt_pure(fBindInstPointer, position, buffer, size);
}

ssize_t BPositionIOProxy::super_WriteAt(off_t position, const void *buffer, size_t size) {
	return BPositionIOBridge::WriteAt(position, buffer, size);
}

	
off_t BPositionIOProxy::Seek(off_t position, uint32 seekMode) {
	return bind_BPositionIO_Seek_pure(fBindInstPointer, position, seekMode);
}

off_t BPositionIOProxy::super_Seek(off_t position, uint32 seekMode) {
	return BPositionIOBridge::Seek(position, seekMode);
}

	
off_t BPositionIOProxy::Position() const {
	return bind_BPositionIO_Position_pure(fBindInstPointer);
}

off_t BPositionIOProxy::super_Position() const {
	return BPositionIOBridge::Position();
}


ssize_t BPositionIOProxy::Read(void *buffer, size_t size) {
	return bind_BPositionIO_Read_virtual(fBindInstPointer, buffer, size);
}

ssize_t BPositionIOProxy::super_Read(void *buffer, size_t size) {
	return BPositionIOBridge::Read(buffer, size);
}

	
ssize_t BPositionIOProxy::Write(const void *buffer, size_t size) {
	return bind_BPositionIO_Write_virtual(fBindInstPointer, buffer, size);
}

ssize_t BPositionIOProxy::super_Write(const void *buffer, size_t size) {
	return BPositionIOBridge::Write(buffer, size);
}

	
status_t BPositionIOProxy::SetSize(off_t size) {
	return bind_BPositionIO_SetSize_virtual(fBindInstPointer, size);
}

status_t BPositionIOProxy::super_SetSize(off_t size) {
	return BPositionIOBridge::SetSize(size);
}

	
status_t BPositionIOProxy::GetSize(off_t *size) {
	return bind_BPositionIO_GetSize_virtual(fBindInstPointer, size);
}

status_t BPositionIOProxy::super_GetSize(off_t *size) {
	return BPositionIOBridge::GetSize(size);
}

/* end class BPositionIOProxy */

/* begin export functions */

extern "C" {
	be_BPositionIO * be_BPositionIO_ctor(void *bindInstPointer) {
		return (be_BPositionIO *)new BPositionIOProxy(bindInstPointer);
	}
	
	void be_BPositionIO_dtor(be_BPositionIO *instPointer) {
		delete (BPositionIOProxy *)instPointer;
	}
	
	ssize_t be_BPositionIO_Read_super(be_BPositionIO *instPointer, void *buffer, size_t size) {
		return ((BPositionIOProxy *)instPointer)->super_Read(buffer, size);
	}
	
	ssize_t be_BPositionIO_Write_super(be_BPositionIO *instPointer, const void *buffer, size_t size) {
		return ((BPositionIOProxy *)instPointer)->super_Write(buffer, size);
	}
	
	ssize_t be_BPositionIO_ReadAt_super(be_BPositionIO *instPointer, off_t position, void *buffer, size_t size) {
		return ((BPositionIOProxy *)instPointer)->super_ReadAt(position, buffer, size);
	}
	
	ssize_t be_BPositionIO_WriteAt_super(be_BPositionIO *instPointer, off_t position, const void *buffer, size_t size) {
		return ((BPositionIOProxy *)instPointer)->super_WriteAt(position, buffer, size);
	}
	
	off_t be_BPositionIO_Seek_super(be_BPositionIO *instPointer, off_t position, uint32 seekMode) {
		return ((BPositionIOProxy *)instPointer)->super_Seek(position, seekMode);
	}
	
	off_t be_BPositionIO_Position_super(be_BPositionIO *instPointer) {
		return ((BPositionIOProxy *)instPointer)->super_Position();
	}
	
	status_t be_BPositionIO_SetSize_super(be_BPositionIO *instPointer, off_t size) {
		return ((BPositionIOProxy *)instPointer)->super_SetSize(size);
	}
	
	status_t be_BPositionIO_GetSize_super(be_BPositionIO *instPointer, off_t *size) {
		return ((BPositionIOProxy *)instPointer)->super_GetSize(size);
	}
}

/* end export functions */

