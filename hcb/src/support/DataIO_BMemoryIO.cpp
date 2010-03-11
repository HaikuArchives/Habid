#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>

/*
extern "C" {
	ssize_t bind_BMemoryIO_ReadAt_virtual(void *bindInstPointer, bool *called, off_t position, void *buffer, size_t size);
	ssize_t bind_BMemoryIO_WriteAt_virtual(void *bindInstPointer, bool *called, off_t position, const void *buffer, size_t size);

	off_t bind_BMemoryIO_Seek_virtual(void *bindInstPointer, bool *called, off_t position, uint32 seekMode);
	off_t bind_BMemoryIO_Position_virtual(void *bindInstPointer, bool *called);

	status_t bind_BMemoryIO_SetSize_virtual(void *bindInstPointer, bool *called, off_t size);
}

class BMemoryIOBridge : public BPositionIOBridge, public BMemoryIO
{
private:
	void *fBindInstPointer;
public:
	BMemoryIOBridge(void *bindInstPointer, void *data, size_t length) 
	: fBindInstPointer(bindInstPointer), BMemoryIO(data, length), BPositionIOBridge(bindInstPointer)
	{ }
	
	BMemoryIOBridge(void *bindInstPointer, const void *data, size_t length)
	: fBindInstPointer(bindInstPointer), BMemoryIO(data, length), BPositionIOBridge(bindInstPointer)
	{ }
	
	ssize_t ReadAt(off_t position, void *buffer, size_t size) {
		bool called = false;
		ssize_t ret = bind_BMemoryIO_ReadAt_virtual(fBindInstPointer,
													 &called,
													 position,
													 buffer,
													 size);
		if(called == true)
			return ret;
		return BMemoryIO::ReadAt(position, buffer, size);									 
	}
	
	ssize_t WriteAt(off_t position, const void *buffer, size_t size) {
		bool called = false;
		ssize_t ret = bind_BMemoryIO_WriteAt_virtual(fBindInstPointer,
													 &called,
													 position,
													 buffer,
													 size);
		if(called == true)
			return ret;
		return BMemoryIO::WriteAt(position, buffer, size);		
	}

	off_t Seek(off_t position, uint32 seekMode) {
		bool called = false;
		off_t ret = bind_BMemoryIO_Seek_virtual(fBindInstPointer,
													 &called,
													 position,
													 seekMode);
		if(called == true)
			return ret;
		return BMemoryIO::Seek(position, seekMode);
	}
		
	off_t Position() const {
		bool called = false;
		off_t ret = bind_BMemoryIO_Position_virtual(fBindInstPointer,
													&called);
		if(called == true) {
			printf("Class was derived so calling D Function Position\n");
			return ret;
		}
		
		printf("Class was not derived so calling C++ Position\n");
		return BMemoryIO::Position();
	}

	status_t SetSize(off_t size) {
		bool called = false;
		status_t ret = bind_BMemoryIO_SetSize_virtual(fBindInstPointer,
													&called,
													size);
		if(called == true)
			return ret;
		return BMemoryIO::SetSize(size);
	}
};


extern "C" {
	be_BMemoryIO * be_BMemoryIO_ctor_1(void *bindInstPointer, void *data, size_t length) {
		return (be_BMemoryIO *)new BMemoryIOBridge(bindInstPointer, data, length);
	}
	
	be_BMemoryIO * be_BMemoryIO_ctor_2(void *bindInstPointer, const void *data, size_t length) {
		return (be_BMemoryIO *)new BMemoryIOBridge(bindInstPointer, data, length);
	}
	
	void be_BMemoryIO_dtor(be_BMemoryIO *instPointer) {
		delete (BMemoryIOBridge *)instPointer;
	}
	
	ssize_t be_BMemoryIO_ReadAt(be_BMemoryIO *instPointer, off_t position, void *buffer, size_t length) {
		return ((BMemoryIOBridge *)instPointer)->ReadAt(position, buffer, length);
	}
	
	ssize_t be_BMemoryIO_WriteAt(be_BMemoryIO *instPointer, off_t position, const void *buffer, size_t length) {
		return ((BMemoryIOBridge *)instPointer)->WriteAt(position, buffer, length);
	}
	
	off_t be_BMemoryIO_Seek(be_BMemoryIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMemoryIOBridge *)instPointer)->Seek(position, seekMode);
	}
	
	off_t be_BMemoryIO_Position(be_BMemoryIO *instPointer) {
		return ((BMemoryIOBridge *)instPointer)->Position();
	}
	
	status_t be_BMemoryIO_SetSize(be_BMemoryIO *instPointer, off_t size) {
		return ((BMemoryIOBridge *)instPointer)->SetSize(size);
	}
}
*/
