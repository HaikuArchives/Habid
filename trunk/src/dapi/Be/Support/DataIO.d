/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.DataIO;


import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import tango.stdc.posix.sys.types;

extern (C) extern {
	// BDataIOProxy * be_BDataIO_ctor(void *bindInstPtr);
	void * be_BDataIO_ctor(void *bindInstPtr);

	// void be_BDataIO_dtor(BDataIO* self);
	void be_BDataIO_dtor(void* self);

	// ssize_t be_BDataIO_Read(BDataIOProxy *self, void * buffer, size_t size);
	ssize_t be_BDataIO_Read(void *self, void * buffer, size_t size);

	// ssize_t be_BDataIO_Write(BDataIOProxy *self, const void * buffer, size_t size);
	ssize_t be_BDataIO_Write(void *self, void * buffer, size_t size);

}

extern (C) extern {
	// BPositionIOProxy * be_BPositionIO_ctor(void *bindInstPtr);
	void * be_BPositionIO_ctor(void *bindInstPtr);

	// void be_BPositionIO_dtor(BPositionIO* self);
	void be_BPositionIO_dtor(void* self);

	// ssize_t be_BPositionIO_Read(BPositionIOProxy *self, void * buffer, size_t size);
	ssize_t be_BPositionIO_Read(void *self, void * buffer, size_t size);

	// ssize_t be_BPositionIO_Write(BPositionIOProxy *self, const void * buffer, size_t size);
	ssize_t be_BPositionIO_Write(void *self, void * buffer, size_t size);

	// ssize_t be_BPositionIO_ReadAt(BPositionIOProxy *self, off_t position, void * buffer, size_t size);
	ssize_t be_BPositionIO_ReadAt(void *self, off_t position, void * buffer, size_t size);

	// ssize_t be_BPositionIO_WriteAt(BPositionIOProxy *self, off_t position, const void * buffer, size_t size);
	ssize_t be_BPositionIO_WriteAt(void *self, off_t position,  void * buffer, size_t size);

	// off_t be_BPositionIO_Seek(BPositionIOProxy *self, off_t position, uint32 seekMode);
	off_t be_BPositionIO_Seek(void *self, off_t position, uint32 seekMode);

	// off_t be_BPositionIO_Position(BPositionIOProxy *self);
	off_t be_BPositionIO_Position(void *self);

	// status_t be_BPositionIO_SetSize(BPositionIOProxy *self, off_t size);
	status_t be_BPositionIO_SetSize(void *self, off_t size);

	// status_t be_BPositionIO_GetSize(BPositionIOProxy *self, off_t * size);
	status_t be_BPositionIO_GetSize(void *self, off_t * size);

}

extern (C) extern {
	// BMemoryIOProxy * be_BMemoryIO_ctor(void *bindInstPtr, void * data, size_t length);
	void * be_BMemoryIO_ctor(void *bindInstPtr, void * data, size_t length);

	// BMemoryIOProxy * be_BMemoryIO_ctor_1(void *bindInstPtr, const void * data, size_t length);
	void * be_BMemoryIO_ctor_1(void *bindInstPtr, void * data, size_t length);

	// void be_BMemoryIO_dtor(BMemoryIO* self);
	void be_BMemoryIO_dtor(void* self);

	// ssize_t be_BMemoryIO_ReadAt(BMemoryIOProxy *self, off_t position, void * buffer, size_t size);
	ssize_t be_BMemoryIO_ReadAt(void *self, off_t position, void * buffer, size_t size);

	// ssize_t be_BMemoryIO_WriteAt(BMemoryIOProxy *self, off_t position, const void * buffer, size_t size);
	ssize_t be_BMemoryIO_WriteAt(void *self, off_t position,  void * buffer, size_t size);

	// off_t be_BMemoryIO_Seek(BMemoryIOProxy *self, off_t position, uint32 seekMode);
	off_t be_BMemoryIO_Seek(void *self, off_t position, uint32 seekMode);

	// off_t be_BMemoryIO_Position(BMemoryIOProxy *self);
	off_t be_BMemoryIO_Position(void *self);

	// status_t be_BMemoryIO_SetSize(BMemoryIOProxy *self, off_t size);
	status_t be_BMemoryIO_SetSize(void *self, off_t size);

}

extern (C) extern {
	// BMallocIOProxy * be_BMallocIO_ctor(void *bindInstPtr);
	void * be_BMallocIO_ctor(void *bindInstPtr);

	// void be_BMallocIO_dtor(BMallocIO* self);
	void be_BMallocIO_dtor(void* self);

	// ssize_t be_BMallocIO_ReadAt(BMallocIOProxy *self, off_t position, void * buffer, size_t size);
	ssize_t be_BMallocIO_ReadAt(void *self, off_t position, void * buffer, size_t size);

	// ssize_t be_BMallocIO_WriteAt(BMallocIOProxy *self, off_t position, const void * buffer, size_t size);
	ssize_t be_BMallocIO_WriteAt(void *self, off_t position,  void * buffer, size_t size);

	// off_t be_BMallocIO_Seek(BMallocIOProxy *self, off_t position, uint32 seekMode);
	off_t be_BMallocIO_Seek(void *self, off_t position, uint32 seekMode);

	// off_t be_BMallocIO_Position(BMallocIOProxy *self);
	off_t be_BMallocIO_Position(void *self);

	// status_t be_BMallocIO_SetSize(BMallocIOProxy *self, off_t size);
	status_t be_BMallocIO_SetSize(void *self, off_t size);

	// void be_BMallocIO_SetBlockSize(BMallocIOProxy *self, size_t blockSize);
	void be_BMallocIO_SetBlockSize(void *self, size_t blockSize);

	// const void * be_BMallocIO_Buffer(BMallocIOProxy *self);
	void * be_BMallocIO_Buffer(void *self);

	// size_t be_BMallocIO_BufferLength(BMallocIOProxy *self);
	size_t be_BMallocIO_BufferLength(void *self);

}


extern (C) {
	ssize_t bind_BDataIO_Read(void *bindInstPtr, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BDataIO)bindInstPtr).Read(x, size);
	}

	ssize_t bind_BDataIO_Write(void *bindInstPtr, void * buffer, size_t size) {
		return (cast(BDataIO)bindInstPtr).Write(buffer[0..size], size);
	}
}

extern (C) {
	ssize_t bind_BPositionIO_Read(void *bindInstPtr, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BPositionIO)bindInstPtr).Read(x, size);
	}

	ssize_t bind_BPositionIO_Write(void *bindInstPtr, void * buffer, size_t size) {
		return (cast(BPositionIO)bindInstPtr).Write(buffer[0..size], size);
	}

	ssize_t bind_BPositionIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BPositionIO)bindInstPtr).ReadAt(position, x, size);
	}

	ssize_t bind_BPositionIO_WriteAt(void *bindInstPtr, off_t position,  void * buffer, size_t size) {
		return (cast(BPositionIO)bindInstPtr).WriteAt(position, buffer[0..size], size);
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
		return (cast(BPositionIO)bindInstPtr).GetSize(*size);
	}
}

extern (C) {
	ssize_t bind_BMemoryIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BMemoryIO)bindInstPtr).ReadAt(position, x, size);
	}

	ssize_t bind_BMemoryIO_WriteAt(void *bindInstPtr, off_t position,  void * buffer, size_t size) {
		return (cast(BMemoryIO)bindInstPtr).WriteAt(position, buffer[0..size], size);
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
extern (C) {
	ssize_t bind_BMallocIO_ReadAt(void *bindInstPtr, off_t position, void * buffer, size_t size) {
		auto x = buffer[0..size];
		return (cast(BMallocIO)bindInstPtr).ReadAt(position, x, size);
	}

	ssize_t bind_BMallocIO_WriteAt(void *bindInstPtr, off_t position,  void * buffer, size_t size) {
		return (cast(BMallocIO)bindInstPtr).WriteAt(position, buffer[0..size], size);
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

interface IBDataIO
{
	// ssize_t be_BDataIO_Read(BDataIO *self, void * buffer, size_t size);
	ssize_t Read(inout void [], size_t);

	// ssize_t be_BDataIO_Write(BDataIO *self, const void * buffer, size_t size);
	ssize_t Write(void [], size_t);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BDataIO : IBDataIO
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BDataIOProxy * be_BDataIO_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BDataIO_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// void be_BDataIO_dtor(BDataIO* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BDataIO_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// ssize_t be_BDataIO_Read(BDataIO *self, void * buffer, size_t size);
	ssize_t Read(inout void [] buffer, size_t size) {
		return be_BDataIO_Read(_InstPtr(), buffer.ptr, size);
	}

	// ssize_t be_BDataIO_Write(BDataIO *self, const void * buffer, size_t size);
	ssize_t Write(void [] buffer, size_t size) {
		return be_BDataIO_Write(_InstPtr(), buffer.ptr, size);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}

interface IBPositionIO
{
	// ssize_t be_BPositionIO_Read(BPositionIO *self, void * buffer, size_t size);
	ssize_t Read(inout void [], size_t);

	// ssize_t be_BPositionIO_Write(BPositionIO *self, const void * buffer, size_t size);
	ssize_t Write(void [], size_t);

	// ssize_t be_BPositionIO_ReadAt(BPositionIO *self, off_t position, void * buffer, size_t size);
	ssize_t ReadAt(off_t, inout void [], size_t);

	// ssize_t be_BPositionIO_WriteAt(BPositionIO *self, off_t position, const void * buffer, size_t size);
	ssize_t WriteAt(off_t, void [], size_t);

	// off_t be_BPositionIO_Seek(BPositionIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t, uint32);

	// off_t be_BPositionIO_Position(BPositionIO *self);
	off_t Position();

	// status_t be_BPositionIO_SetSize(BPositionIO *self, off_t size);
	status_t SetSize(off_t);

	// status_t be_BPositionIO_GetSize(BPositionIO *self, off_t * size);
	status_t GetSize(inout off_t);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BPositionIO : BDataIO, IBPositionIO
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BPositionIOProxy * be_BPositionIO_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BPositionIO_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
		super();
	}

	// void be_BPositionIO_dtor(BPositionIO* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BPositionIO_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// ssize_t be_BPositionIO_Read(BPositionIO *self, void * buffer, size_t size);
	ssize_t Read(inout void [] buffer, size_t size) {
		return be_BPositionIO_Read(_InstPtr(), buffer.ptr, size);
	}

	// ssize_t be_BPositionIO_Write(BPositionIO *self, const void * buffer, size_t size);
	ssize_t Write(void [] buffer, size_t size) {
		return be_BPositionIO_Write(_InstPtr(), buffer.ptr, size);
	}

	// ssize_t be_BPositionIO_ReadAt(BPositionIO *self, off_t position, void * buffer, size_t size);
	ssize_t ReadAt(off_t position, inout void [] buffer, size_t size) {
		return be_BPositionIO_ReadAt(_InstPtr(), position, buffer.ptr, size);
	}

	// ssize_t be_BPositionIO_WriteAt(BPositionIO *self, off_t position, const void * buffer, size_t size);
	ssize_t WriteAt(off_t position, void [] buffer, size_t size) {
		return be_BPositionIO_WriteAt(_InstPtr(), position, buffer.ptr, size);
	}

	// off_t be_BPositionIO_Seek(BPositionIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BPositionIO_Seek(_InstPtr(), position, seekMode);
	}

	// off_t be_BPositionIO_Position(BPositionIO *self);
	off_t Position() {
		return be_BPositionIO_Position(_InstPtr());
	}

	// status_t be_BPositionIO_SetSize(BPositionIO *self, off_t size);
	status_t SetSize(off_t size) {
		return be_BPositionIO_SetSize(_InstPtr(), size);
	}

	// status_t be_BPositionIO_GetSize(BPositionIO *self, off_t * size);
	status_t GetSize(inout off_t size) {
		return be_BPositionIO_GetSize(_InstPtr(), &size);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}

interface IBMemoryIO
{
	// ssize_t be_BMemoryIO_ReadAt(BMemoryIO *self, off_t position, void * buffer, size_t size);
	ssize_t ReadAt(off_t, inout void [], size_t);

	// ssize_t be_BMemoryIO_WriteAt(BMemoryIO *self, off_t position, const void * buffer, size_t size);
	ssize_t WriteAt(off_t, void [], size_t);

	// off_t be_BMemoryIO_Seek(BMemoryIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t, uint32);

	// off_t be_BMemoryIO_Position(BMemoryIO *self);
	off_t Position();

	// status_t be_BMemoryIO_SetSize(BMemoryIO *self, off_t size);
	status_t SetSize(off_t);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BMemoryIO : BPositionIO, IBMemoryIO
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BMemoryIOProxy * be_BMemoryIO_ctor(void *bindInstPtr, void * data, size_t length);
	this(void [] data) {
		if(_InstPtr is null) {
			_InstPtr = be_BMemoryIO_ctor(cast(void *)this, data.ptr, data.length);
			_OwnsPtr = true;
		}
		super();
	}
/*
	// BMemoryIOProxy * be_BMemoryIO_ctor_1(void *bindInstPtr, const void * data, size_t length);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BMemoryIO_ctor_1(cast(void *)this);
			fOwnsPointer = true;
		}
	}
*/
	// void be_BMemoryIO_dtor(BMemoryIO* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BMemoryIO_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// ssize_t be_BMemoryIO_ReadAt(BMemoryIO *self, off_t position, void * buffer, size_t size);
	ssize_t ReadAt(off_t position, inout void [] buffer, size_t size) {
		return be_BMemoryIO_ReadAt(_InstPtr(), position, buffer.ptr, size);
	}

	// ssize_t be_BMemoryIO_WriteAt(BMemoryIO *self, off_t position, const void * buffer, size_t size);
	ssize_t WriteAt(off_t position, void [] buffer, size_t size) {
		return be_BMemoryIO_WriteAt(_InstPtr(), position, buffer.ptr, size);
	}

	// off_t be_BMemoryIO_Seek(BMemoryIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMemoryIO_Seek(_InstPtr(), position, seekMode);
	}

	// off_t be_BMemoryIO_Position(BMemoryIO *self);
	off_t Position() {
		return be_BMemoryIO_Position(_InstPtr());
	}

	// status_t be_BMemoryIO_SetSize(BMemoryIO *self, off_t size);
	status_t SetSize(off_t size) {
		return be_BMemoryIO_SetSize(_InstPtr(), size);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}

interface IBMallocIO
{
	// ssize_t be_BMallocIO_ReadAt(BMallocIO *self, off_t position, void * buffer, size_t size);
	ssize_t ReadAt(off_t, inout void [], size_t);

	// ssize_t be_BMallocIO_WriteAt(BMallocIO *self, off_t position, const void * buffer, size_t size);
	ssize_t WriteAt(off_t, void [], size_t);

	// off_t be_BMallocIO_Seek(BMallocIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t, uint32);

	// off_t be_BMallocIO_Position(BMallocIO *self);
	off_t Position();

	// status_t be_BMallocIO_SetSize(BMallocIO *self, off_t size);
	status_t SetSize(off_t);

	// void be_BMallocIO_SetBlockSize(BMallocIO *self, size_t blockSize);
	void SetBlockSize(size_t);

	// const void * be_BMallocIO_Buffer(BMallocIO *self);
	void * Buffer();

	// size_t be_BMallocIO_BufferLength(BMallocIO *self);
	size_t BufferLength();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BMallocIO : BPositionIO, IBMallocIO
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BMallocIOProxy * be_BMallocIO_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BMallocIO_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
		super();
	}

	// void be_BMallocIO_dtor(BMallocIO* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BMallocIO_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// ssize_t be_BMallocIO_ReadAt(BMallocIO *self, off_t position, void * buffer, size_t size);
	ssize_t ReadAt(off_t position, inout void [] buffer, size_t size) {
		return be_BMallocIO_ReadAt(_InstPtr(), position, buffer.ptr, size);
	}

	// ssize_t be_BMallocIO_WriteAt(BMallocIO *self, off_t position, const void * buffer, size_t size);
	ssize_t WriteAt(off_t position, void [] buffer, size_t size) {
		return be_BMallocIO_WriteAt(_InstPtr(), position, buffer.ptr, size);
	}

	// off_t be_BMallocIO_Seek(BMallocIO *self, off_t position, uint32 seekMode);
	off_t Seek(off_t position, uint32 seekMode) {
		return be_BMallocIO_Seek(_InstPtr(), position, seekMode);
	}

	// off_t be_BMallocIO_Position(BMallocIO *self);
	off_t Position() {
		return be_BMallocIO_Position(_InstPtr());
	}

	// status_t be_BMallocIO_SetSize(BMallocIO *self, off_t size);
	status_t SetSize(off_t size) {
		return be_BMallocIO_SetSize(_InstPtr(), size);
	}

	// void be_BMallocIO_SetBlockSize(BMallocIO *self, size_t blockSize);
	void SetBlockSize(size_t blockSize) {
		be_BMallocIO_SetBlockSize(_InstPtr(), blockSize);
	}

	// const void * be_BMallocIO_Buffer(BMallocIO *self);
	void * Buffer() {
		return be_BMallocIO_Buffer(_InstPtr());
	}

	// size_t be_BMallocIO_BufferLength(BMallocIO *self);
	size_t BufferLength() {
		return be_BMallocIO_BufferLength(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


