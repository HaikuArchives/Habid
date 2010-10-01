/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Storage.File;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Storage.Directory;
import Be.Storage.Entry;
import Be.Storage.Node;
import Be.Support.DataIO;
import Be.Storage.Path;

import tango.stdc.stringz;

extern (C) extern {
	// BFileProxy * be_BFile_ctor(void *bindInstPtr);
	void * be_BFile_ctor(void *bindInstPtr);

	// BFileProxy * be_BFile_ctor_1(void *bindInstPtr, const BFile * file);
	void * be_BFile_ctor_1(void *bindInstPtr, void * file);

	// BFileProxy * be_BFile_ctor_2(void *bindInstPtr, const entry_ref * ref, uint32 openMode);
	void * be_BFile_ctor_2(void *bindInstPtr, entry_ref * _ref, uint32 openMode);

	// BFileProxy * be_BFile_ctor_3(void *bindInstPtr, const BEntry * entry, uint32 openMode);
	void * be_BFile_ctor_3(void *bindInstPtr, void * entry, uint32 openMode);

	// BFileProxy * be_BFile_ctor_4(void *bindInstPtr, const char * path, uint32 openMode);
	void * be_BFile_ctor_4(void *bindInstPtr, char * path, uint32 openMode);

	// BFileProxy * be_BFile_ctor_5(void *bindInstPtr, const BDirectory * dir, const char * path, uint32 openMode);
	void * be_BFile_ctor_5(void *bindInstPtr, void * dir,  char * path, uint32 openMode);

	// void be_BFile_dtor(BFile* self);
	void be_BFile_dtor(void* self);

	// status_t be_BFile_SetTo(BFileProxy *self, const entry_ref * ref, uint32 openMode);
	status_t be_BFile_SetTo(void *self, entry_ref * _ref, uint32 openMode);

	// status_t be_BFile_SetTo_1(BFileProxy *self, const BEntry * entry, uint32 openMode);
	status_t be_BFile_SetTo_1(void *self, void * entry, uint32 openMode);

	// status_t be_BFile_SetTo_2(BFileProxy *self, const char * path, uint32 openMode);
	status_t be_BFile_SetTo_2(void *self, char * path, uint32 openMode);

	// status_t be_BFile_SetTo_3(BFileProxy *self, const BDirectory * dir, const char * path, uint32 openMode);
	status_t be_BFile_SetTo_3(void *self, void * dir,  char * path, uint32 openMode);

	// bool be_BFile_IsReadable(BFileProxy *self);
	bool be_BFile_IsReadable(void *self);

	// bool be_BFile_IsWritable(BFileProxy *self);
	bool be_BFile_IsWritable(void *self);

	// ssize_t be_BFile_Read(BFileProxy *self, void * buffer, size_t size);
	ssize_t be_BFile_Read(void *self, void * buffer, size_t size);

	// ssize_t be_BFile_ReadAt(BFileProxy *self, off_t location, void * buffer, size_t size);
	ssize_t be_BFile_ReadAt(void *self, off_t location, void * buffer, size_t size);

	// ssize_t be_BFile_Write(BFileProxy *self, const void * buffer, size_t size);
	ssize_t be_BFile_Write(void *self, void * buffer, size_t size);

	// ssize_t be_BFile_WriteAt(BFileProxy *self, off_t location, const void * buffer, size_t size);
	ssize_t be_BFile_WriteAt(void *self, off_t location,  void * buffer, size_t size);

	// off_t be_BFile_Seek(BFileProxy *self, off_t offset, uint32 seekMode);
	off_t be_BFile_Seek(void *self, off_t offset, uint32 seekMode);

	// off_t be_BFile_Position(BFileProxy *self);
	off_t be_BFile_Position(void *self);

	// status_t be_BFile_SetSize(BFileProxy *self, off_t size);
	status_t be_BFile_SetSize(void *self, off_t size);

	// status_t be_BFile_GetSize(BFileProxy *self, off_t* size);
	status_t be_BFile_GetSize(void *self, off_t* size);

	// BFile * be_BFile_opAssign(BFile *self, const BFile * file);
	BFile * be_BFile_opAssign(void *self, BFile * file);

}


extern (C) {
	ssize_t bind_BFile_Read(void *bindInstPtr, void * buffer, size_t size) {
		assert(false, "bind_BFile_Read(void *bindInstPtr, void * buffer, size_t size) Unimplemented");
	}

	ssize_t bind_BFile_ReadAt(void *bindInstPtr, off_t location, void * buffer, size_t size) {
		assert(false, "bind_BFile_ReadAt(void *bindInstPtr, off_t location, void * buffer, size_t size) Unimplemented");
	}

	ssize_t bind_BFile_Write(void *bindInstPtr, void * buffer, size_t size) {
		assert(false, "bind_BFile_Write(void *bindInstPtr, const void * buffer, size_t size) Unimplemented");
	}

	ssize_t bind_BFile_WriteAt(void *bindInstPtr, off_t location,  void * buffer, size_t size) {
		assert(false, "bind_BFile_WriteAt(void *bindInstPtr, off_t location, const void * buffer, size_t size) Unimplemented");
	}

	off_t bind_BFile_Seek(void *bindInstPtr, off_t offset, uint32 seekMode) {
		assert(false, "bind_BFile_Seek(void *bindInstPtr, off_t offset, uint32 seekMode) Unimplemented");
	}

	off_t bind_BFile_Position(void *bindInstPtr) {
		assert(false, "bind_BFile_Position(void *bindInstPtr) Unimplemented");
	}

	status_t bind_BFile_SetSize(void *bindInstPtr, off_t size) {
		assert(false, "bind_BFile_SetSize(void *bindInstPtr, off_t size) Unimplemented");
	}

	status_t bind_BFile_GetSize(void *bindInstPtr, off_t* size) {
		assert(false, "bind_BFile_GetSize(void *bindInstPtr, off_t* size) Unimplemented");
	}

}


interface IBFile
{
	// status_t be_BFile_SetTo(BFile *self, const entry_ref * ref, uint32 openMode);
	status_t SetTo(entry_ref, uint32);

	// status_t be_BFile_SetTo_1(BFile *self, const BEntry * entry, uint32 openMode);
	status_t SetTo(IBEntry, uint32);

	// status_t be_BFile_SetTo_2(BFile *self, const char * path, uint32 openMode);
	status_t SetTo(char [], uint32);

	// status_t be_BFile_SetTo_3(BFile *self, const BDirectory * dir, const char * path, uint32 openMode);
	status_t SetTo(IBDirectory, char [], uint32);

	// bool be_BFile_IsReadable(BFile *self);
	bool IsReadable();

	// bool be_BFile_IsWritable(BFile *self);
	bool IsWritable();

	// ssize_t be_BFile_Read(BFile *self, void * buffer, size_t size);
	ssize_t Read(inout void [], size_t);

	// ssize_t be_BFile_ReadAt(BFile *self, off_t location, void * buffer, size_t size);
	ssize_t ReadAt(off_t, inout void [], size_t);

	// ssize_t be_BFile_Write(BFile *self, const void * buffer, size_t size);
	ssize_t Write(void [], size_t);

	// ssize_t be_BFile_WriteAt(BFile *self, off_t location, const void * buffer, size_t size);
	ssize_t WriteAt(off_t, void [], size_t);

	// off_t be_BFile_Seek(BFile *self, off_t offset, uint32 seekMode);
	off_t Seek(off_t, uint32);

	// off_t be_BFile_Position(BFile *self);
	off_t Position();

	// status_t be_BFile_SetSize(BFile *self, off_t size);
	status_t SetSize(off_t);

	// status_t be_BFile_GetSize(BFile *self, off_t* size);
	status_t GetSize(inout off_t size);

	// BFile & be_BFile_opAssign(BFile *self, const BFile & file);
	//BFile & opAssign();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BFile : public BNode, IBPositionIO, IBFile
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BFileProxy * be_BFile_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BFile_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
		super();
	}

	// BFileProxy * be_BFile_ctor_1(void *bindInstPtr, const BFile * file);
	this(IBFile file) {
		if(_InstPtr is null) {
			_InstPtr = be_BFile_ctor_1(cast(void *)this, file._InstPtr());
			_OwnsPtr = true;
		}
		super();
	}

	// BFileProxy * be_BFile_ctor_2(void *bindInstPtr, const entry_ref * ref, uint32 openMode);
	this(entry_ref _ref, uint32 openMode) {
		if(_InstPtr is null) {
			_InstPtr = be_BFile_ctor_2(cast(void *)this, &_ref, openMode);
			_OwnsPtr = true;
		}
		super();
	}

	// BFileProxy * be_BFile_ctor_3(void *bindInstPtr, const BEntry * entry, uint32 openMode);
	this(IBEntry entry, uint32 openMode) {
		if(_InstPtr is null) {
			_InstPtr = be_BFile_ctor_3(cast(void *)this, entry._InstPtr(), openMode);
			_OwnsPtr = true;
		}
		super();
	}

	// BFileProxy * be_BFile_ctor_4(void *bindInstPtr, const char * path, uint32 openMode);
	this(char [] path, uint32 openMode) {
		if(_InstPtr is null) {
			_InstPtr = be_BFile_ctor_4(cast(void *)this, toStringz(path), openMode);
			_OwnsPtr = true;
		}
		super();
	}

	// BFileProxy * be_BFile_ctor_5(void *bindInstPtr, const BDirectory * dir, const char * path, uint32 openMode);
	this(IBDirectory dir, char [] path, uint32 openMode) {
		if(_InstPtr is null) {
			_InstPtr = be_BFile_ctor_5(cast(void *)this, dir._InstPtr(), toStringz(path), openMode);
			_OwnsPtr = true;
		}
		super();
	}

	// void be_BFile_dtor(BFile* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BFile_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BFile_SetTo(BFile *self, const entry_ref * ref, uint32 openMode);
	status_t SetTo(entry_ref _ref, uint32 openMode) {
		return be_BFile_SetTo(_InstPtr(), &_ref, openMode);
	}

	// status_t be_BFile_SetTo_1(BFile *self, const BEntry * entry, uint32 openMode);
	status_t SetTo(IBEntry entry, uint32 openMode) {
		return be_BFile_SetTo_1(_InstPtr(), entry._InstPtr(), openMode);
	}

	// status_t be_BFile_SetTo_2(BFile *self, const char * path, uint32 openMode);
	status_t SetTo(char [] path, uint32 openMode) {
		return be_BFile_SetTo_2(_InstPtr(), toStringz(path), openMode);
	}

	// status_t be_BFile_SetTo_3(BFile *self, const BDirectory * dir, const char * path, uint32 openMode);
	status_t SetTo(IBDirectory dir, char [] path, uint32 openMode) {
		return be_BFile_SetTo_3(_InstPtr(), dir._InstPtr(), toStringz(path), openMode);
	}

	// bool be_BFile_IsReadable(BFile *self);
	bool IsReadable() {
		return be_BFile_IsReadable(_InstPtr());
	}

	// bool be_BFile_IsWritable(BFile *self);
	bool IsWritable() {
		return be_BFile_IsWritable(_InstPtr());
	}

	// ssize_t be_BFile_Read(BFile *self, void * buffer, size_t size);
	ssize_t Read(inout void [] buffer, size_t size) {
		return be_BFile_Read(_InstPtr(), buffer.ptr, size);
	}

	// ssize_t be_BFile_ReadAt(BFile *self, off_t location, void * buffer, size_t size);
	ssize_t ReadAt(off_t location, inout void [] buffer, size_t size) {
		return be_BFile_ReadAt(_InstPtr(), location, buffer.ptr, size);
	}

	// ssize_t be_BFile_Write(BFile *self, const void * buffer, size_t size);
	ssize_t Write(void [] buffer, size_t size) {
		return be_BFile_Write(_InstPtr(), buffer.ptr, size);
	}

	// ssize_t be_BFile_WriteAt(BFile *self, off_t location, const void * buffer, size_t size);
	ssize_t WriteAt(off_t location, void [] buffer, size_t size) {
		return be_BFile_WriteAt(_InstPtr(), location, buffer.ptr, size);
	}

	// off_t be_BFile_Seek(BFile *self, off_t offset, uint32 seekMode);
	off_t Seek(off_t offset, uint32 seekMode) {
		return be_BFile_Seek(_InstPtr(), offset, seekMode);
	}

	// off_t be_BFile_Position(BFile *self);
	off_t Position() {
		return be_BFile_Position(_InstPtr());
	}

	// status_t be_BFile_SetSize(BFile *self, off_t size);
	status_t SetSize(off_t size) {
		return be_BFile_SetSize(_InstPtr(), size);
	}

	// status_t be_BFile_GetSize(BFile *self, off_t* size);
	status_t GetSize(inout off_t size) {
		return be_BFile_GetSize(_InstPtr(), &size);
	}

	// BFile & be_BFile_opAssign(BFile *self, const BFile & file);
	//BFile & opAssign();

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


