/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Support.DataIO;

import Support.BObject;

import Support.Locker;

import Support.SupportDefs;

import App.Looper;

import tango.stdc.posix.sys.types;
import tango.io.Stdout;

extern (C) extern
{
	void * be_BDataIO_ctor(void *bindInstPtr);

	void be_BDataIO_dtor(void *self);
}

extern (C)
{
	ssize_t bind_BDataIO_Read(void *bindInstPtr, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BDataIO)bindInstPtr).Read(x);
	}
	
	ssize_t bind_BDataIO_Write(void *bindInstPtr, void * buffer, size_t size) {
		return (cast(BDataIO)bindInstPtr).Write(buffer[0..size]);
	}
}

interface IBDataIO
{
	abstract ssize_t Read(inout void [] buffer);
	abstract ssize_t Write(void [] buffer);
		
	void * _GetInstPtr();
}

class BDataIO : IBDataIO
{
	mixin(BObject!());
public:
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDataIO_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	
	~this() {
		if(fInstancePointer !is null  && fOwnsPointer)
			be_BDataIO_dtor(_GetInstPtr());
		
		fInstancePointer = null;
		fOwnsPointer = false;

	}

	
	abstract ssize_t Read(inout void [] buffer); // { assert(false, "BDataIO::Read"); }
	abstract ssize_t Write(void [] buffer); // { assert(false, "BDataIO::Write"); }
	
	void * _GetInstPtr() {
		return fInstancePointer;
	}
}

extern (C) extern {
	void * be_BPositionIO_ctor(void *bindInstPtr);

	void be_BPositionIO_dtor(void *self);

	ssize_t be_BPositionIO_Read(void *self, void * buffer, size_t size);

	ssize_t be_BPositionIO_Write(void *self, void * buffer, size_t size);

	status_t be_BPositionIO_SetSize(void *self, off_t size);

	status_t be_BPositionIO_GetSize(void *self, off_t * size);
}

extern (C) {
	ssize_t bind_BPositionIO_Read(void *bindInstPtr, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BPositionIO)bindInstPtr).Read(x);
	}
	
	ssize_t bind_BPositionIO_Write(void *bindInstPtr, void * buffer, size_t size) {
		Stdout.formatln("PositionIO Write...");
		return (cast(BPositionIO)bindInstPtr).Write(buffer[0..size]);
	}
	
	ssize_t bind_BPositionIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BPositionIO)bindInstPtr).ReadAt(position, x);

	}
	
	ssize_t bind_BPositionIO_WriteAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		return (cast(BPositionIO)bindInstPtr).WriteAt(position, buffer[0..size]);
	}
	
	off_t bind_BPositionIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode) {
		return (cast(BPositionIO)bindInstPtr).Seek(position, seekMode);
	}
	
	off_t bind_BPositionIO_Position(void *bindInstPtr) {
		return (cast(BPositionIO)bindInstPtr).Position();
	}
	
	status_t bind_BPositionIO_SetSize(void *bindInstPtr, off_t size) {
		return (cast(BPositionIO)bindInstPtr).SetSize(size);
	}
	
	status_t bind_BPositionIO_GetSize(void *bindInstPtr, off_t * size) {
		return (cast(BPositionIO)bindInstPtr).GetSize(size);
	}
}

interface IBPositionIO
{
	ssize_t Read(inout void [] buffer);
	ssize_t Write(void [] buffer);
	
	abstract ssize_t ReadAt(off_t position, inout void [] buffer);
	abstract ssize_t WriteAt(off_t position, void [] buffer);
	
	abstract off_t Seek(off_t position, uint32 seekMode);
	abstract off_t Position();
	
	status_t SetSize(off_t size);
	status_t GetSize(off_t *size);

	void * _GetInstPtr();
}

class BPositionIO : public BDataIO, IBPositionIO
{
	mixin(BObject!());
public:
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPositionIO_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
		super();
	}
	
	~this() {
		if(fInstancePointer !is null  && fOwnsPointer)
			be_BPositionIO_dtor(_GetInstPtr());
		
		fInstancePointer = null;
		fOwnsPointer = false;
	}
	
	ssize_t Read(inout void [] buffer) {
		return be_BPositionIO_Read(_GetInstPtr(), buffer.ptr, buffer.length);	
	}
	
	ssize_t Write(void [] buffer) {
		return be_BPositionIO_Write(_GetInstPtr(), buffer.ptr, buffer.length);
	}
	
	abstract ssize_t ReadAt(off_t position, inout void [] buffer); // { assert(false, "BPositionIO::ReadAt"); }
	
	abstract ssize_t WriteAt(off_t position, void [] buffer); // { assert(false, "BPositionIO::WriteAt"); }
	
	abstract off_t Seek(off_t position, uint32 seekMode); // { assert(false, "BPositionIO::Seek"); }
	abstract off_t Position(); // { assert(false, "BPositionIO::Position"); }
	
	status_t SetSize(off_t size) {
		return be_BPositionIO_SetSize(_GetInstPtr(), size);
	}
	
	status_t GetSize(off_t *size) {
		return be_BPositionIO_GetSize(_GetInstPtr(), size);	
	}
	
	void * _GetInstPtr() {
		return fInstancePointer;
	}
}

extern (C) extern {
	void * be_BMemoryIO_ctor(void *bindInstPtr, void * data, size_t length);

	void * be_BMemoryIO_ctor_1(void *bindInstPtr, void * data, size_t length);

	void be_BMemoryIO_dtor(void *self);

	ssize_t be_BMemoryIO_ReadAt(void *self, off_t position, void * buffer, size_t size);

	ssize_t be_BMemoryIO_WriteAt(void *self, off_t position, void * buffer, size_t size);

	off_t be_BMemoryIO_Seek(void *self, off_t position, uint32 seekMode);

	off_t be_BMemoryIO_Position(void *self);

	status_t be_BMemoryIO_SetSize(void *self, off_t size);
}

extern (C) {
	ssize_t bind_BMemoryIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BMemoryIO)bindInstPtr).ReadAt(position, x);
	}
	
	ssize_t bind_BMemoryIO_WriteAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		return (cast(BMemoryIO)bindInstPtr).WriteAt(position, buffer[0..size]);
	}

	off_t bind_BMemoryIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode) {
		return (cast(BMemoryIO)bindInstPtr).Seek(position, seekMode);
	}

	off_t bind_BMemoryIO_Position(void *bindInstPtr) {
		return (cast(BMemoryIO)bindInstPtr).Position();
	}

	status_t bind_BMemoryIO_SetSize(void *bindInstPtr, off_t size) {
		return (cast(BMemoryIO)bindInstPtr).SetSize(size);
	}
}

interface IBMemoryIO
{
	ssize_t ReadAt(off_t position, inout void [] buffer);
	ssize_t WriteAt(off_t position, void [] buffer);
	
	off_t Seek(off_t position, uint32 seekMode);
	off_t Position();
	
	status_t SetSize(off_t size);

	void * _GetInstPtr();		
}

class BMemoryIO : BPositionIO, IBMemoryIO
{
	mixin(BObject!());
public:
	this(void [] data) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BMemoryIO_ctor(cast(void *)this, data.ptr, data.length);
			fOwnsPointer = true;
		}
		super();
	}
	
	~this() {
		if(fInstancePointer !is null && fOwnsPointer)
			be_BMemoryIO_dtor(_GetInstPtr());
		
		fInstancePointer = null;
		fOwnsPointer = false;	
	}
	
	ssize_t ReadAt(off_t position, inout void [] buffer) {
		return be_BMemoryIO_ReadAt(_GetInstPtr(), position, buffer.ptr, buffer.length);
	}
	
	ssize_t WriteAt(off_t position, void [] buffer) {
		return be_BMemoryIO_WriteAt(_GetInstPtr(), position, buffer.ptr, buffer.length);
	}
	
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMemoryIO_Seek(_GetInstPtr(), position, seekMode);
	}
	
	off_t Position() {
		return be_BMemoryIO_Position(_GetInstPtr());
	}
	
	status_t SetSize(off_t size) {
		return be_BMemoryIO_SetSize(_GetInstPtr(), size);
	}
	
	void * _GetInstPtr() {
		return fInstancePointer;
	}
}

extern (C) extern
{
	void * be_BMallocIO_ctor(void *bindInstPtr);

	void be_BMallocIO_dtor(void *self);

	ssize_t be_BMallocIO_ReadAt(void *self, off_t position, void * buffer, size_t size);

	ssize_t be_BMallocIO_WriteAt(void *self, off_t position, void * buffer, size_t size);

	off_t be_BMallocIO_Seek(void *self, off_t position, uint32 seekMode);

	off_t be_BMallocIO_Position(void *self);

	status_t be_BMallocIO_SetSize(void *self, off_t size);

	void be_BMallocIO_SetBlockSize(void *self, size_t blockSize);

	void * be_BMallocIO_Buffer(void *self);

	size_t be_BMallocIO_BufferLength(void *self);

}

extern (C) {
	ssize_t bind_BMallocIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BMallocIO)bindInstPtr).ReadAt(position, x);
	}
	
	ssize_t bind_BMallocIO_WriteAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		return (cast(BMallocIO)bindInstPtr).WriteAt(position, buffer[0..size]);
	}
	
	off_t bind_BMallocIO_Seek(void *bindInstPtr, off_t position, uint32 seekMode) {
		return (cast(BMallocIO)bindInstPtr).Seek(position, seekMode);
	}
	
	off_t bind_BMallocIO_Position(void *bindInstPtr) {
		return (cast(BMallocIO)bindInstPtr).Position();
	}
	
	status_t bind_BMallocIO_SetSize(void *bindInstPtr, off_t size) {
		return (cast(BMallocIO)bindInstPtr).SetSize(size);
	}
	
}

interface IBMallocIO
{
	ssize_t ReadAt(off_t position, inout void [] buffer);
	ssize_t	WriteAt(off_t position, void [] buffer);

	off_t Seek(off_t position, uint32 seekMode);
	off_t Position();

	status_t SetSize(off_t size);

	// BMallocIO interface
	void SetBlockSize(size_t blockSize);

	void []	Buffer();
	size_t BufferLength();
	
	void * _GetInstPtr();
}

class BMallocIO : BPositionIO, IBMallocIO
{
	mixin(BObject!());
public:
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BMallocIO_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
		super();
	}
	
	~this() {
		if(fInstancePointer !is null && fOwnsPointer)
			be_BMallocIO_dtor(_GetInstPtr());
		
		fInstancePointer = null;
		fOwnsPointer = false;	
	}
	
	ssize_t ReadAt(off_t position, inout void [] buffer) {
		return be_BMallocIO_ReadAt(_GetInstPtr(), position, buffer.ptr, buffer.length);	
	}
	
	ssize_t	WriteAt(off_t position, void [] buffer) {
		return be_BMallocIO_WriteAt(_GetInstPtr(), position, buffer.ptr, buffer.length);	
	}

	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMallocIO_Seek(_GetInstPtr(), position, seekMode);
	}
	
	off_t Position() {
		return be_BMallocIO_Position(_GetInstPtr());
	}

	status_t SetSize(off_t size) {
		return be_BMallocIO_SetSize(_GetInstPtr(), size);
	}

	// BMallocIO interface
	void SetBlockSize(size_t blockSize) {
		return be_BMallocIO_SetBlockSize(_GetInstPtr(), blockSize);
	}

	void []	Buffer() {
		void *buffer = be_BMallocIO_Buffer(_GetInstPtr());
		return buffer[0..BufferLength()];
	}
	
	size_t BufferLength() {
		return be_BMallocIO_BufferLength(_GetInstPtr());
	}

	void * _GetInstPtr() {
		return fInstancePointer;
	}
}
