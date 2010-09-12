/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


#include <SupportDefs.h>
#include <DataIO.h>
/* BDataIO */
extern "C" {
	ssize_t bind_BDataIO_Read(void *bindInstPtr, void * buffer, size_t size);
	ssize_t bind_BDataIO_Write(void *bindInstPtr, const void * buffer, size_t size);
}

/* BPositionIO */
extern "C" {
	ssize_t bind_BPositionIO_Read(void *bindInstPtr, void * buffer, size_t size);
	ssize_t bind_BPositionIO_Write(void *bindInstPtr, const void * buffer, size_t size);
	ssize_t bind_BPositionIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size);
	ssize_t bind_BPositionIO_WriteAt(void *bindInstPtr, off_t position, const void * buffer, size_t size);
	off_t bind_BPositionIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode);
	off_t bind_BPositionIO_Position(void *bindInstPtr);
	status_t bind_BPositionIO_SetSize(void *bindInstPtr, off_t size);
	status_t bind_BPositionIO_GetSize(void *bindInstPtr, off_t * size);
}

/* BMemoryIO */
extern "C" {
	ssize_t bind_BMemoryIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size);
	ssize_t bind_BMemoryIO_WriteAt(void *bindInstPtr, off_t position, const void * buffer, size_t size);
	off_t bind_BMemoryIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode);
	off_t bind_BMemoryIO_Position(void *bindInstPtr);
	status_t bind_BMemoryIO_SetSize(void *bindInstPtr, off_t size);
}

/* BMallocIO */
extern "C" {
	ssize_t bind_BMallocIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size);
	ssize_t bind_BMallocIO_WriteAt(void *bindInstPtr, off_t position, const void * buffer, size_t size);
	off_t bind_BMallocIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode);
	off_t bind_BMallocIO_Position(void *bindInstPtr);
	status_t bind_BMallocIO_SetSize(void *bindInstPtr, off_t size);
}

class BDataIOBridge : public BDataIO
{
public:
	BDataIOBridge() : BDataIO() { }

	virtual ~BDataIOBridge() { }
	virtual ssize_t Read(void * buffer, size_t size)  { }

	virtual ssize_t Write(const void * buffer, size_t size)  { }

};


class BDataIOProxy : 
 public BDataIOBridge
{
private: 
	void *fBindInstPtr;
public:
	BDataIOProxy(void *bindInstPtr) : fBindInstPtr(bindInstPtr), BDataIOBridge() {
	}

	virtual ~BDataIOProxy() { }
};


class BPositionIOBridge : public BPositionIO
{
public:
	BPositionIOBridge() : BPositionIO() { }

	virtual ~BPositionIOBridge() { }
	virtual ssize_t ReadAt(off_t position, void * buffer, size_t size)  { }

	virtual ssize_t WriteAt(off_t position, const void * buffer, size_t size)  { }

	virtual off_t Seek(off_t position, uint32 seekMode)  { }

	virtual off_t Position() const { }

};

#include <stdio.h>
class BPositionIOProxy : 
public BDataIOProxy, public BPositionIOBridge
{
private: 
	void *fBindInstPtr;
public:
	BPositionIOProxy(void *bindInstPtr) : fBindInstPtr(bindInstPtr), BDataIOProxy(bindInstPtr),BPositionIOBridge() {
	}

	virtual ~BPositionIOProxy() { }
	virtual ssize_t Read(void * buffer, size_t size)  {
		return bind_BPositionIO_Read(fBindInstPtr, buffer, size);
	}

	virtual ssize_t Read_super(void * buffer, size_t size)  {
		return BPositionIO::Read(buffer, size);
	}

	virtual ssize_t Write(const void * buffer, size_t size)  {
		return bind_BPositionIO_Write(fBindInstPtr, buffer, size);
	}

	virtual ssize_t Write_super(const void * buffer, size_t size)  {
		return BPositionIO::Write(buffer, size);
	}

	virtual status_t SetSize(off_t size)  {
		return bind_BPositionIO_SetSize(fBindInstPtr, size);
	}

	virtual status_t SetSize_super(off_t size)  {
		return BPositionIO::SetSize(size);
	}

	virtual status_t GetSize(off_t * size)  {
		return bind_BPositionIO_GetSize(fBindInstPtr, size);
	}

	virtual status_t GetSize_super(off_t * size)  {
		return BPositionIO::GetSize(size);
	}

};


class BMemoryIOProxy : 
public BPositionIOProxy, public BMemoryIO
{
private: 
	void *fBindInstPtr;
public:
	BMemoryIOProxy(void *bindInstPtr, void * data, size_t length) : fBindInstPtr(bindInstPtr), BPositionIOProxy(bindInstPtr),BMemoryIO(data, length) {
	}

	BMemoryIOProxy(void *bindInstPtr, const void * data, size_t length) : fBindInstPtr(bindInstPtr), BPositionIOProxy(bindInstPtr),BMemoryIO(data, length) {
	}

	virtual ~BMemoryIOProxy() { }
	virtual ssize_t ReadAt(off_t position, void * buffer, size_t size)  {
		return bind_BMemoryIO_ReadAt(fBindInstPtr, position, buffer, size);
	}

	virtual ssize_t ReadAt_super(off_t position, void * buffer, size_t size)  {
		return BMemoryIO::ReadAt(position, buffer, size);
	}

	virtual ssize_t WriteAt(off_t position, const void * buffer, size_t size)  {
		return bind_BMemoryIO_WriteAt(fBindInstPtr, position, buffer, size);
	}

	virtual ssize_t WriteAt_super(off_t position, const void * buffer, size_t size)  {
		return BMemoryIO::WriteAt(position, buffer, size);
	}

	virtual off_t Seek(off_t position, uint32 seekMode)  {
		return bind_BMemoryIO_Seek(fBindInstPtr, position, seekMode);
	}

	virtual off_t Seek_super(off_t position, uint32 seekMode)  {
		return BMemoryIO::Seek(position, seekMode);
	}

	virtual off_t Position() const {
		return bind_BMemoryIO_Position(fBindInstPtr);
	}

	virtual off_t Position_super() const {
		return BMemoryIO::Position();
	}

	virtual status_t SetSize(off_t size)  {
		return bind_BMemoryIO_SetSize(fBindInstPtr, size);
	}

	virtual status_t SetSize_super(off_t size)  {
		return BMemoryIO::SetSize(size);
	}

};


class BMallocIOProxy : 
public BPositionIOProxy, public BMallocIO
{
private: 
	void *fBindInstPtr;
public:
	BMallocIOProxy(void *bindInstPtr) : fBindInstPtr(bindInstPtr), BPositionIOProxy(bindInstPtr),BMallocIO() {
	}

	virtual ~BMallocIOProxy() { }
	virtual ssize_t ReadAt(off_t position, void * buffer, size_t size)  {
		return bind_BMallocIO_ReadAt(fBindInstPtr, position, buffer, size);
	}

	virtual ssize_t ReadAt_super(off_t position, void * buffer, size_t size)  {
		return BMallocIO::ReadAt(position, buffer, size);
	}

	virtual ssize_t WriteAt(off_t position, const void * buffer, size_t size)  {
		return bind_BMallocIO_WriteAt(fBindInstPtr, position, buffer, size);
	}

	virtual ssize_t WriteAt_super(off_t position, const void * buffer, size_t size)  {
		return BMallocIO::WriteAt(position, buffer, size);
	}

	virtual off_t Seek(off_t position, uint32 seekMode)  {
		return bind_BMallocIO_Seek(fBindInstPtr, position, seekMode);
	}

	virtual off_t Seek_super(off_t position, uint32 seekMode)  {
		return BMallocIO::Seek(position, seekMode);
	}

	virtual off_t Position() const {
		return bind_BMallocIO_Position(fBindInstPtr);
	}

	virtual off_t Position_super() const {
		return BMallocIO::Position();
	}

	virtual status_t SetSize(off_t size)  {
		return bind_BMallocIO_SetSize(fBindInstPtr, size);
	}

	virtual status_t SetSize_super(off_t size)  {
		return BMallocIO::SetSize(size);
	}

};


/* BDataIO */
extern "C" {
	BDataIOProxy * be_BDataIO_ctor(void *bindInstPtr) {
		return new BDataIOProxy(bindInstPtr);
	}

	void be_BDataIO_dtor(BDataIO *self) {
		delete self;
	}

}

/* BPositionIO */
extern "C" {
	BPositionIOProxy * be_BPositionIO_ctor(void *bindInstPtr) {
		return new BPositionIOProxy(bindInstPtr);
	}

	void be_BPositionIO_dtor(BPositionIO *self) {
		delete self;
	}

	ssize_t be_BPositionIO_Read(BPositionIOProxy *self, void * buffer, size_t size) {
		return self->Read_super(buffer, size);
	}

	ssize_t be_BPositionIO_Write(BPositionIOProxy *self, const void * buffer, size_t size) {
		return self->Write_super(buffer, size);
	}

	status_t be_BPositionIO_SetSize(BPositionIOProxy *self, off_t size) {
		return self->SetSize_super(size);
	}

	status_t be_BPositionIO_GetSize(BPositionIOProxy *self, off_t * size) {
		return self->GetSize_super(size);
	}

}

/* BMemoryIO */
extern "C" {
	BMemoryIOProxy * be_BMemoryIO_ctor(void *bindInstPtr, void * data, size_t length) {
		return new BMemoryIOProxy(bindInstPtr, data, length);
	}

	BMemoryIOProxy * be_BMemoryIO_ctor_1(void *bindInstPtr, const void * data, size_t length) {
		return new BMemoryIOProxy(bindInstPtr, data, length);
	}

	void be_BMemoryIO_dtor(BMemoryIO *self) {
		delete self;
	}

	ssize_t be_BMemoryIO_ReadAt(BMemoryIOProxy *self, off_t position, void * buffer, size_t size) {
		return self->ReadAt_super(position, buffer, size);
	}

	ssize_t be_BMemoryIO_WriteAt(BMemoryIOProxy *self, off_t position, const void * buffer, size_t size) {
		return self->WriteAt_super(position, buffer, size);
	}

	off_t be_BMemoryIO_Seek(BMemoryIOProxy *self, off_t position, uint32 seekMode) {
		return self->Seek_super(position, seekMode);
	}

	off_t be_BMemoryIO_Position(BMemoryIOProxy *self) {
		return self->Position_super();
	}

	status_t be_BMemoryIO_SetSize(BMemoryIOProxy *self, off_t size) {
		return self->SetSize_super(size);
	}

}

/* BMallocIO */
extern "C" {
	BMallocIOProxy * be_BMallocIO_ctor(void *bindInstPtr) {
		return new BMallocIOProxy(bindInstPtr);
	}

	void be_BMallocIO_dtor(BMallocIO *self) {
		delete self;
	}

	ssize_t be_BMallocIO_ReadAt(BMallocIOProxy *self, off_t position, void * buffer, size_t size) {
		return self->ReadAt_super(position, buffer, size);
	}

	ssize_t be_BMallocIO_WriteAt(BMallocIOProxy *self, off_t position, const void * buffer, size_t size) {
		return self->WriteAt_super(position, buffer, size);
	}

	off_t be_BMallocIO_Seek(BMallocIOProxy *self, off_t position, uint32 seekMode) {
		return self->Seek_super(position, seekMode);
	}

	off_t be_BMallocIO_Position(BMallocIOProxy *self) {
		return self->Position_super();
	}

	status_t be_BMallocIO_SetSize(BMallocIOProxy *self, off_t size) {
		return self->SetSize_super(size);
	}

	void be_BMallocIO_SetBlockSize(BMallocIO *self, size_t blockSize) {
		self->SetBlockSize(blockSize);
	}

	const void * be_BMallocIO_Buffer(BMallocIO *self) {
		return self->Buffer();
	}

	size_t be_BMallocIO_BufferLength(BMallocIO *self) {
		return self->BufferLength();
	}

}

