/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Storage.Volume;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Storage.Directory;

import tango.stdc.stringz;
import tango.stdc.stdlib;

/* Should be in Mime.d */
enum icon_size {
	B_LARGE_ICON	= 32,
	B_MINI_ICON		= 16
}

extern (C) extern {
	// BVolume* be_BVolume_ctor(void *bindInstPtr);
	void * be_BVolume_ctor(void *bindInstPtr);

	// BVolume* be_BVolume_ctor_1(void *bindInstPtr, dev_t device);
	void * be_BVolume_ctor_1(void *bindInstPtr, dev_t device);

	// BVolume* be_BVolume_ctor_2(void *bindInstPtr, const BVolume* volume);
	void * be_BVolume_ctor_2(void *bindInstPtr, void * volume);

	// void be_BVolume_dtor(BVolume* self);
	void be_BVolume_dtor(void* self);

	// status_t be_BVolume_InitCheck(BVolume *self);
	status_t be_BVolume_InitCheck(void *self);

	// status_t be_BVolume_SetTo(BVolume *self, dev_t device);
	status_t be_BVolume_SetTo(void *self, dev_t device);

	// void be_BVolume_Unset(BVolume *self);
	void be_BVolume_Unset(void *self);

	// dev_t be_BVolume_Device(BVolume *self);
	dev_t be_BVolume_Device(void *self);

	// status_t be_BVolume_GetRootDirectory(BVolume *self, BDirectory* directory);
	status_t be_BVolume_GetRootDirectory(void *self, void* directory);

	// off_t be_BVolume_Capacity(BVolume *self);
	off_t be_BVolume_Capacity(void *self);

	// off_t be_BVolume_FreeBytes(BVolume *self);
	off_t be_BVolume_FreeBytes(void *self);

	// off_t be_BVolume_BlockSize(BVolume *self);
	off_t be_BVolume_BlockSize(void *self);

	// status_t be_BVolume_GetName(BVolume *self, char* name);
	status_t be_BVolume_GetName(void *self, char* name);

	// status_t be_BVolume_SetName(BVolume *self, const char* name);
	status_t be_BVolume_SetName(void *self, char* name);

	// status_t be_BVolume_GetIcon(BVolume *self, BBitmap* icon, icon_size which);
	status_t be_BVolume_GetIcon(void *self, void * icon, icon_size which);

	// status_t be_BVolume_GetIcon_1(BVolume *self, uint8** _data, size_t* _size, type_code* _type);
	status_t be_BVolume_GetIcon_1(void *self, uint8** _data, size_t* _size, type_code* _type);

	// bool be_BVolume_IsRemovable(BVolume *self);
	bool be_BVolume_IsRemovable(void *self);

	// bool be_BVolume_IsReadOnly(BVolume *self);
	bool be_BVolume_IsReadOnly(void *self);

	// bool be_BVolume_IsPersistent(BVolume *self);
	bool be_BVolume_IsPersistent(void *self);

	// bool be_BVolume_IsShared(BVolume *self);
	bool be_BVolume_IsShared(void *self);

	// bool be_BVolume_KnowsMime(BVolume *self);
	bool be_BVolume_KnowsMime(void *self);

	// bool be_BVolume_KnowsAttr(BVolume *self);
	bool be_BVolume_KnowsAttr(void *self);

	// bool be_BVolume_KnowsQuery(BVolume *self);
	bool be_BVolume_KnowsQuery(void *self);

	// bool be_BVolume_opEquals(BVolume *self, const BVolume* volume);
	bool be_BVolume_opEquals(void *self, void * volume);

	// bool be_BVolume_opNotEquals(BVolume *self, const BVolume* volume);
	bool be_BVolume_opNotEquals(void *self, void * volume);

	// BVolume * be_BVolume_opAssign(BVolume *self, const BVolume* volume);
	void * be_BVolume_opAssign(void *self, void * volume);

}


extern (C) {
}


interface IBVolume
{
	// status_t be_BVolume_InitCheck(BVolume *self);
	status_t InitCheck();

	// status_t be_BVolume_SetTo(BVolume *self, dev_t device);
	status_t SetTo(dev_t);

	// void be_BVolume_Unset(BVolume *self);
	void Unset();

	// dev_t be_BVolume_Device(BVolume *self);
	dev_t Device();

	// status_t be_BVolume_GetRootDirectory(BVolume *self, BDirectory* directory);
	status_t GetRootDirectory(IBDirectory);

	// off_t be_BVolume_Capacity(BVolume *self);
	off_t Capacity();

	// off_t be_BVolume_FreeBytes(BVolume *self);
	off_t FreeBytes();

	// off_t be_BVolume_BlockSize(BVolume *self);
	off_t BlockSize();

	// status_t be_BVolume_GetName(BVolume *self, char* name);
	status_t GetName(inout char []);

	// status_t be_BVolume_SetName(BVolume *self, const char* name);
	status_t SetName(char []);

	// status_t be_BVolume_GetIcon(BVolume *self, BBitmap* icon, icon_size which);
//	status_t GetIcon(IBBitmap, icon_size);

	// status_t be_BVolume_GetIcon_1(BVolume *self, uint8** _data, size_t* _size, type_code* _type);
//	status_t GetIcon(inout uint8 [], inout size_t, inout type_code);

	// bool be_BVolume_IsRemovable(BVolume *self);
	bool IsRemovable();

	// bool be_BVolume_IsReadOnly(BVolume *self);
	bool IsReadOnly();

	// bool be_BVolume_IsPersistent(BVolume *self);
	bool IsPersistent();

	// bool be_BVolume_IsShared(BVolume *self);
	bool IsShared();

	// bool be_BVolume_KnowsMime(BVolume *self);
	bool KnowsMime();

	// bool be_BVolume_KnowsAttr(BVolume *self);
	bool KnowsAttr();

	// bool be_BVolume_KnowsQuery(BVolume *self);
	bool KnowsQuery();

	// bool be_BVolume_opEquals(BVolume *self, const BVolume& volume);
	//bool opEquals();

	// bool be_BVolume_opNotEquals(BVolume *self, const BVolume& volume);
	//bool opNotEquals();

	// BVolume & be_BVolume_opAssign(BVolume *self, const BVolume& volume);
	//BVolume & opAssign();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

final class BVolume : IBVolume
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BVolume* be_BVolume_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BVolume_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BVolume* be_BVolume_ctor_1(void *bindInstPtr, dev_t device);
	this(dev_t device) {
		if(_InstPtr is null) {
			_InstPtr = be_BVolume_ctor_1(cast(void *)this, device);
			_OwnsPtr = true;
		}
	}

	// BVolume* be_BVolume_ctor_2(void *bindInstPtr, const BVolume* volume);
	this(IBVolume volume) {
		if(_InstPtr is null) {
			_InstPtr = be_BVolume_ctor_2(cast(void *)this, volume._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BVolume_dtor(BVolume* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BVolume_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BVolume_InitCheck(BVolume *self);
	status_t InitCheck() {
		return be_BVolume_InitCheck(_InstPtr());
	}

	// status_t be_BVolume_SetTo(BVolume *self, dev_t device);
	status_t SetTo(dev_t device) {
		return be_BVolume_SetTo(_InstPtr(), device);
	}

	// void be_BVolume_Unset(BVolume *self);
	void Unset() {
		be_BVolume_Unset(_InstPtr());
	}

	// dev_t be_BVolume_Device(BVolume *self);
	dev_t Device() {
		return be_BVolume_Device(_InstPtr());
	}

	// status_t be_BVolume_GetRootDirectory(BVolume *self, BDirectory* directory);
	status_t GetRootDirectory(IBDirectory dir) {
		return be_BVolume_GetRootDirectory(_InstPtr(), dir._InstPtr());
	}

	// off_t be_BVolume_Capacity(BVolume *self);
	off_t Capacity() {
		return be_BVolume_Capacity(_InstPtr());
	}

	// off_t be_BVolume_FreeBytes(BVolume *self);
	off_t FreeBytes() {
		return be_BVolume_FreeBytes(_InstPtr());
	}

	// off_t be_BVolume_BlockSize(BVolume *self);
	off_t BlockSize() {
		return be_BVolume_BlockSize(_InstPtr());
	}

	// status_t be_BVolume_GetName(BVolume *self, char* name);
	status_t GetName(inout char [] name) {
		char *buffer = cast(char *)malloc(1024);
		
		status_t ret = be_BVolume_GetName(_InstPtr(), buffer);
		
		name = fromStringz(buffer).dup;
		
		free(buffer);
		
		return ret;
	}

	// status_t be_BVolume_SetName(BVolume *self, const char* name);
	status_t SetName(char [] name) {
		return be_BVolume_SetName(_InstPtr(), toStringz(name));
	}

	// status_t be_BVolume_GetIcon(BVolume *self, BBitmap* icon, icon_size which);
/*
	status_t GetIcon(IBBitmap bitmap, icon_size whitch) {
		return be_BVolume_GetIcon(_InstPtr(), bitmap._InstPtr(), whitch);
	}
*/
	// status_t be_BVolume_GetIcon_1(BVolume *self, uint8** _data, size_t* _size, type_code* _type);
/*
	status_t GetIcon(inout uint8 [][] data, inout size_t size, inout type_code type) {
		return be_BVolume_GetIcon_1(_InstPtr(), &data.ptr, &size, &type);
	}
*/
	// bool be_BVolume_IsRemovable(BVolume *self);
	bool IsRemovable() {
		return be_BVolume_IsRemovable(_InstPtr());
	}

	// bool be_BVolume_IsReadOnly(BVolume *self);
	bool IsReadOnly() {
		return be_BVolume_IsReadOnly(_InstPtr());
	}

	// bool be_BVolume_IsPersistent(BVolume *self);
	bool IsPersistent() {
		return be_BVolume_IsPersistent(_InstPtr());
	}

	// bool be_BVolume_IsShared(BVolume *self);
	bool IsShared() {
		return be_BVolume_IsShared(_InstPtr());
	}

	// bool be_BVolume_KnowsMime(BVolume *self);
	bool KnowsMime() {
		return be_BVolume_KnowsMime(_InstPtr());
	}

	// bool be_BVolume_KnowsAttr(BVolume *self);
	bool KnowsAttr() {
		return be_BVolume_KnowsAttr(_InstPtr());
	}

	// bool be_BVolume_KnowsQuery(BVolume *self);
	bool KnowsQuery() {
		return be_BVolume_KnowsQuery(_InstPtr());
	}

	// bool be_BVolume_opEquals(BVolume *self, const BVolume& volume);
	//bool opEquals();

	// bool be_BVolume_opNotEquals(BVolume *self, const BVolume& volume);
	//bool opNotEquals();

	// BVolume & be_BVolume_opAssign(BVolume *self, const BVolume& volume);
	//BVolume & opAssign();

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


