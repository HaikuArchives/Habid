#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>
/*
extern "C" {
	ssize_t bind_BMallocIO_ReadAt_virtual(void *bindInstPointer, bool *called, off_t position, void *buffer, size_t size);
	ssize_t bind_BMallocIO_WriteAt_virtual(void *bindInstPointer, bool *called, off_t position, const void *buffer, size_t size);

	off_t bind_BMallocIO_Seek_virtual(void *bindInstPointer, bool *called, off_t position, uint32 seekMode);
	off_t bind_BMallocIO_Position_virtual(void *bindInstPointer, bool *called);

	status_t bind_BMallocIO_SetSize_virtual(void *bindInstPointer, bool *called, off_t size);
}

class BMallocIOBridge : public BPositionIOBridge, public BMallocIO
{
private:
	void *fBindInstPointer;
public:
	BMallocIOBridge(void *bindInstPointer)
	: fBindInstPointer(bindInstPointer),
	  BPositionIOBridge(bindInstPointer), BMallocIO()
	{ }
	
	ssize_t ReadAt(off_t position, void *buffer, size_t size) {
		bool called = false;
		ssize_t ret = bind_BMallocIO_ReadAt_virtual(fBindInstPointer,
													&called,
													position,
													buffer,
													size);
		if(called == true)
			return ret;
		printf("Calling BMallocIO::ReadAt\n");
		return BMallocIO::ReadAt(position, buffer, size);
	}
	
	ssize_t WriteAt(off_t position, const void *buffer, size_t size) {
		bool called = false;
		ssize_t ret = bind_BMallocIO_WriteAt_virtual(fBindInstPointer,
													&called,
													position,
													buffer,
													size);
													
		if(called == true)
			return ret;
		return BMallocIO::WriteAt(position, buffer, size);
	}

	off_t Seek(off_t position, uint32 seekMode) {
		bool called = false;
		
		printf("Calling bind_BMalloc_Seek_Virtual\n");
		off_t ret = bind_BMallocIO_Seek_virtual(fBindInstPointer,
												&called,
												position,
												seekMode);
		if(called == true)
			return ret;
		printf("Calling BMallocIO::Seek()\n");
		return BMallocIO::Seek(position, seekMode);
	}
	
	off_t Position() const {
		bool called = false;
		off_t ret = bind_BMallocIO_Position_virtual(fBindInstPointer,
													&called);
		if(called == true)
			return ret;
		return BMallocIO::Position();
	}

	status_t SetSize(off_t size) {
		bool called = false;
		status_t ret = bind_BMallocIO_SetSize_virtual(fBindInstPointer,
													  &called,
													  size);
		if(called == true)
			return ret;
		return BMallocIO::SetSize(size);
	}
};


extern "C" {
	be_BMallocIO * be_BMallocIO_ctor(void *bindInstPointer) {
		return (be_BMallocIO *)new BMallocIOBridge(bindInstPointer);
	}
	
	void be_BMallocIO_dtor(be_BMallocIO *instPointer) {
		delete (BMallocIOBridge *)instPointer;
	}
	
	ssize_t be_BMallocIO_ReadAt(be_BMallocIO *instPointer, off_t position, void *buffer, size_t size) {
		return ((BMallocIOBridge *)instPointer)->ReadAt(position, buffer, size);
	}
	
	ssize_t be_BMallocIO_WriteAt(be_BMallocIO *instPointer, off_t position, const void *buffer, size_t size) {
		return ((BMallocIOBridge *)instPointer)->WriteAt(position, buffer, size);
	}
	
	off_t be_BMallocIO_Seek(be_BMallocIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMallocIOBridge *)instPointer)->Seek(position, seekMode);
	}
	
	off_t be_BMallocIO_Position(be_BMallocIO *instPointer) {
		return ((BMallocIOBridge *)instPointer)->Position();
	}
	
	void be_BMallocIO_SetBlockSize(be_BMallocIO *instPointer, size_t blockSize) {
		((BMallocIOBridge *)instPointer)->SetBlockSize(blockSize);
	}
	
	const void * be_BMallocIO_Buffer(be_BMallocIO *instPointer) {
		return ((BMallocIOBridge *)instPointer)->Buffer();
	}
	
	size_t be_BMallocIO_BufferLength(be_BMallocIO *instPointer) {
		return ((BMallocIOBridge *)instPointer)->BufferLength();
	}
}
*/
