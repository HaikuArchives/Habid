#include <support/DataIO.h>
#include <bec-types.h>
#include <stdio.h>

extern "C" {
	ssize_t bind_BDataIO_Read(void *, void *, ssize_t);
	ssize_t bind_BDataIO_Write(void *, const void *, ssize_t);
}

class BDataIOBridge : public BDataIO
{
public:
	BDataIOBridge() : BDataIO() { }
	~BDataIOBridge() { }
	
	ssize_t Read(void *buffer, size_t size) {
		return 0;
	}
	
	ssize_t Write(const void *buffer, size_t size) {
		return 0;
	}
};

extern "C" {
	be_BDataIO * be_BDataIO_ctor() {
		return (be_BDataIO *)new BDataIOBridge();
	}
	
	void * be_BDataIO_dtor(be_BDataIO *instPointer) {
		delete instPointer;
	}
	
	ssize_t be_BDataIO_Read(be_BDataIO *instPointer, void *buffer, size_t size) {
		return ((BDataIOBridge *)instPointer)->Read(buffer, size);
	}
	
	ssize_t be_BDataIO_Write(be_BDataIO *instPointer, const void *buffer, size_t size) {
		return ((BDataIOBridge *)instPointer)->Write(buffer, size);
	}
}

/*
	Functions for bidirectional bridge for BPositionIO to be able to inherit from the C class
*/
extern "C" {
	ssize_t bind_BPositionIO_ReadAt(void *bindInstPointer, off_t position, void *buffer, size_t size);
	ssize_t bind_BPositionIO_WriteAt(void *bindInstPointer, off_t position, const void *buffer, size_t size);
	
	off_t bind_BPositionIO_Seek(void *bindInstPointer, off_t position, uint32 seekMode);
	off_t bind_BPositionIO_Position(void *bindInstPointer);
}


class BPositionIOBridge : public BPositionIO
{
private:
	void *fBindInstPointer;

public:
	BPositionIOBridge(void *bindInstPointer) : fBindInstPointer(bindInstPointer), BPositionIO() { }
	~BPositionIOBridge() { }	

	ssize_t ReadAt(off_t position, void *buffer, size_t size) {
		return bind_BPositionIO_ReadAt(fBindInstPointer, position, buffer, size);
	}
	
	ssize_t WriteAt(off_t position, const void *buffer, size_t size) {
		return bind_BPositionIO_WriteAt(fBindInstPointer, position, buffer, size);
	}
	
	off_t Seek(off_t position, uint32 seekMode) {
		return bind_BPositionIO_Seek(fBindInstPointer, position, seekMode);
	}
	
	off_t Position() const {
		return bind_BPositionIO_Position(fBindInstPointer);
	}
};


extern "C" {
	be_BPositionIO * be_BPositionIO_ctor(void *bindInstPointer) {
		return (be_BPositionIO *)new BPositionIOBridge(bindInstPointer);
	}
	
	void be_BPositionIO_dtor(be_BPositionIO *instPointer) {
		delete (BPositionIOBridge *)instPointer;
	}
	
	ssize_t be_BPositionIO_Read(be_BPositionIO *instPointer, void *buffer, size_t size) {
		return ((BPositionIOBridge *)instPointer)->Read(buffer, size);
	}
	
	ssize_t be_BPositionIO_Write(be_BPositionIO *instPointer, const void *buffer, size_t size) {
		return ((BPositionIOBridge *)instPointer)->Write(buffer, size);
	}
	
	ssize_t be_BPositionIO_ReadAt(be_BPositionIO *instPointer, off_t position, void *buffer, size_t size) {
		return ((BPositionIOBridge *)instPointer)->ReadAt(position, buffer, size);
	}
	
	ssize_t be_BPositionIO_WriteAt(be_BPositionIO *instPointer, off_t position, const void *buffer, size_t size) {
		return ((BPositionIOBridge *)instPointer)->WriteAt(position, buffer, size);
	}
	
	off_t be_BPositionIO_Seek(be_BPositionIO *instPointer, off_t position, uint32 seekMode) {
		return ((BPositionIOBridge *)instPointer)->Seek(position, seekMode);
	}
	
	off_t be_BPositionIO_Position(be_BPositionIO *instPointer) {
		return ((BPositionIOBridge *)instPointer)->Position();
	}
	
	status_t be_BPositionIO_SetSize(be_BPositionIO *instPointer, off_t size) {
		return ((BPositionIOBridge *)instPointer)->SetSize(size);
	}
	
	status_t be_BPositionIO_GetSize(be_BPositionIO *instPointer, off_t *size) {
		return ((BPositionIOBridge *)instPointer)->GetSize(size);
	}
}

extern "C" {
	be_BMemoryIO * be_BMemoryIO_ctor_1(void *data, size_t length) {
		return (be_BMemoryIO *)new BMemoryIO(data, length);
	}
	
	be_BMemoryIO * be_BMemoryIO_ctor_2(const void *data, size_t length) {
		return (be_BMemoryIO *)new BMemoryIO(data, length);
	}
	
	void be_BMemoryIO_dtor(be_BMemoryIO *instPointer) {
		delete (BMemoryIO *)instPointer;
	}
	
	ssize_t be_BMemoryIO_ReadAt(be_BMemoryIO *instPointer, off_t position, void *buffer, size_t length) {
		return ((BMemoryIO *)instPointer)->ReadAt(position, buffer, length);
	}
	
	ssize_t be_BMemoryIO_WriteAt(be_BMemoryIO *instPointer, off_t position, const void *buffer, size_t length) {
		return ((BMemoryIO *)instPointer)->WriteAt(position, buffer, length);
	}
	
	off_t be_BMemoryIO_Seek(be_BMemoryIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMemoryIO *)instPointer)->Seek(position, seekMode);
	}
	
	off_t be_BMemoryIO_Position(be_BMemoryIO *instPointer) {
		return ((BMemoryIO *)instPointer)->Position();
	}
	
	status_t be_BMemoryIO_SetSize(be_BMemoryIO *instPointer, off_t size) {
		return ((BMemoryIO *)instPointer)->SetSize(size);
	}
}

extern "C" {
	be_BMallocIO * be_BMallocIO_ctor() {
		return (be_BMallocIO *)new BMallocIO();
	}
	
	void be_BMallocIO_dtor(be_BMallocIO *instPointer) {
		delete (BMallocIO *)instPointer;
	}
	
	ssize_t be_BMallocIO_ReadAt(be_BMallocIO *instPointer, off_t position, void *buffer, size_t size) {
		return ((BMallocIO *)instPointer)->ReadAt(position, buffer, size);
	}
	
	ssize_t be_BMallocIO_WriteAt(be_BMallocIO *instPointer, off_t position, const void *buffer, size_t size) {
		return ((BMallocIO *)instPointer)->WriteAt(position, buffer, size);
	}
	
	off_t be_BMallocIO_Seek(be_BMallocIO *instPointer, off_t position, uint32 seekMode) {
		return ((BMallocIO *)instPointer)->Seek(position, seekMode);
	}
	
	off_t be_BMallocIO_Position(be_BMallocIO *instPointer) {
		return ((BMallocIO *)instPointer)->Position();
	}
	
	void be_BMallocIO_SetBlockSize(be_BMallocIO *instPointer, size_t blockSize) {
		((BMallocIO *)instPointer)->SetBlockSize(blockSize);
	}
	
	const void * be_BMallocIO_Buffer(be_BMallocIO *instPointer) {
		return ((BMallocIO *)instPointer)->Buffer();
	}
	
	size_t be_BMallocIO_BufferLength(be_BMallocIO *instPointer) {
		return ((BMallocIO *)instPointer)->BufferLength();
	}
}
