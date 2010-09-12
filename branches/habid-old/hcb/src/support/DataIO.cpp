#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_DataIO.h>

/* begin import functions */

extern "C" {
	ssize_t bind_BDataIO_Read_pure(void *, void *, ssize_t);
	ssize_t bind_BDataIO_Write_pure(void *, const void *, ssize_t);
}

/* end import functions */

/* begin class BDataIOBridge */

BDataIOBridge::BDataIOBridge() : BDataIO()
{ }

BDataIOBridge::~BDataIOBridge()
{ }

ssize_t BDataIOBridge::Read(void *buffer, size_t size) {
	return 0;
}

ssize_t BDataIOBridge::Write(const void *buffer, size_t size) {
	return 0;
}

/* end class BDataIOBridge */

/* begin class BDataIOProxy */

BDataIOProxy::BDataIOProxy(void *bindInstPointer) :
	fBindInstPointer(bindInstPointer),
	BDataIOBridge()
{ }

BDataIOProxy::~BDataIOProxy()
{ }

ssize_t BDataIOProxy::Read(void *buffer, size_t size) {
	return bind_BDataIO_Read_pure(fBindInstPointer, buffer, size);
}

ssize_t BDataIOProxy::super_Read(void *buffer, size_t size) {
	return BDataIOBridge::Read(buffer, size);
}

ssize_t BDataIOProxy::Write(const void *buffer, size_t size) {
	return bind_BDataIO_Write_pure(fBindInstPointer, buffer, size);
}


ssize_t BDataIOProxy::super_Write(const void *buffer, size_t size) {
	return BDataIOBridge::Write(buffer, size);
}

/* end class BDataIOProxy */

/* begin export functions */

extern "C" {
	be_BDataIO * be_BDataIO_ctor(void *instPointer) {
		return (be_BDataIO *)new BDataIOProxy(instPointer);
	}
	
	void * be_BDataIO_dtor(be_BDataIO *instPointer) {
		delete instPointer;
	}
	
	ssize_t be_BDataIO_Read(be_BDataIO *instPointer, void *buffer, size_t size) {
		return ((BDataIOProxy *)instPointer)->Read(buffer, size);
	}
	
	ssize_t be_BDataIO_Read_super(be_BDataIO *instPointer, void *buffer, size_t size) {
		return ((BDataIOProxy *)instPointer)->super_Read(buffer, size);
	}
	
	ssize_t be_BDataIO_Write(be_BDataIO *instPointer, const void *buffer, size_t size) {
		return ((BDataIOProxy *)instPointer)->Write(buffer, size);
	}

	ssize_t be_BDataIO_Write_super(be_BDataIO *instPointer, void *buffer, size_t size) {
		return ((BDataIOProxy *)instPointer)->super_Write(buffer, size);
	}
}

/* end export functions */

