/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Storage.Path;

import Support.SupportDefs;
import Support.types;
import Support.BObject;

import Storage.Entry;
import Storage.Directory;
import Support.Flattenable;

import tango.stdc.stringz;

extern (C) extern {
	// BPathProxy * be_BPath_ctor(void *bindInstPtr);
	void * be_BPath_ctor(void *bindInstPtr);

	// BPathProxy * be_BPath_ctor_1(void *bindInstPtr, const BPath* path);
	void * be_BPath_ctor_1(void *bindInstPtr, void * path);

	// BPathProxy * be_BPath_ctor_2(void *bindInstPtr, const entry_ref* _ref);
	void * be_BPath_ctor_2(void *bindInstPtr, entry_ref* _ref);

	// BPathProxy * be_BPath_ctor_3(void *bindInstPtr, const BEntry* entry);
	void * be_BPath_ctor_3(void *bindInstPtr, void * entry);

	// BPathProxy * be_BPath_ctor_4(void *bindInstPtr, const char* dir, const char* leaf, bool normalize);
	void * be_BPath_ctor_4(void *bindInstPtr, char* dir,  char* leaf, bool normalize);

	// BPathProxy * be_BPath_ctor_5(void *bindInstPtr, const BDirectory* dir, const char* leaf, bool normalize);
	void * be_BPath_ctor_5(void *bindInstPtr, void * dir,  char* leaf, bool normalize);

	// void be_BPath_dtor(BPath* self);
	void be_BPath_dtor(void* self);

	// status_t be_BPath_InitCheck(BPathProxy *self);
	status_t be_BPath_InitCheck(void *self);

	// status_t be_BPath_SetTo(BPathProxy *self, const entry_ref* _ref);
	status_t be_BPath_SetTo(void *self, entry_ref* _ref);

	// status_t be_BPath_SetTo_1(BPathProxy *self, const BEntry* entry);
	status_t be_BPath_SetTo_1(void *self, void * entry);

	// status_t be_BPath_SetTo_2(BPathProxy *self, const char* path, const char* leaf, bool normalize);
	status_t be_BPath_SetTo_2(void *self, char* path,  char* leaf, bool normalize);

	// status_t be_BPath_SetTo_3(BPathProxy *self, const BDirectory* dir, const char* leaf, bool normalize);
	status_t be_BPath_SetTo_3(void *self, void * dir,  char* leaf, bool normalize);

	// void be_BPath_Unset(BPathProxy *self);
	void be_BPath_Unset(void *self);

	// status_t be_BPath_Append(BPathProxy *self, const char* path, bool normalize);
	status_t be_BPath_Append(void *self, char* path, bool normalize);

	// const char* be_BPath_Path(BPathProxy *self);
	char* be_BPath_Path(void *self);

	// const char* be_BPath_Leaf(BPathProxy *self);
	char* be_BPath_Leaf(void *self);

	// status_t be_BPath_GetParent(BPathProxy *self, BPath* path);
	status_t be_BPath_GetParent(void *self, void * path);

	// bool be_BPath_opEquals(BPath *self, const BPath* item);
	bool be_BPath_opEquals(void *self, void * item);

	// bool be_BPath_opEquals_1(BPath *self, const char* path);
	bool be_BPath_opEquals_1(void *self, char* path);

	// bool be_BPath_opNotEquals(BPath *self, const BPath* item);
	bool be_BPath_opNotEquals(void *self, void * item);

	// bool be_BPath_opNotEquals_1(BPath *self, const char* path);
	bool be_BPath_opNotEquals_1(void *self, char* path);

	// BPath * be_BPath_opAssign(BPath *self, const BPath* item);
	void * be_BPath_opAssign(void *self, void * item);

	// BPath * be_BPath_opAssign_1(BPath *self, const char* path);
	void * be_BPath_opAssign_1(void *self, char* path);

	// bool be_BPath_IsFixedSize(BPathProxy *self);
	bool be_BPath_IsFixedSize(void *self);

	// type_code be_BPath_TypeCode(BPathProxy *self);
	type_code be_BPath_TypeCode(void *self);

	// ssize_t be_BPath_FlattenedSize(BPathProxy *self);
	ssize_t be_BPath_FlattenedSize(void *self);

	// status_t be_BPath_Flatten(BPathProxy *self, void* buffer, ssize_t size);
	status_t be_BPath_Flatten(void *self, void* buffer, ssize_t size);

	// bool be_BPath_AllowsTypeCode(BPathProxy *self, type_code code);
	bool be_BPath_AllowsTypeCode(void *self, type_code code);

	// status_t be_BPath_Unflatten(BPathProxy *self, type_code code, const void* buffer, ssize_t size);
	status_t be_BPath_Unflatten(void *self, type_code code,  void* buffer, ssize_t size);

}


extern (C) {
	bool bind_BPath_IsFixedSize(void *bindInstPtr) {
		assert(false, "bind_BPath_IsFixedSize(void *bindInstPtr) Unimplemented");
	}

	type_code bind_BPath_TypeCode(void *bindInstPtr) {
		assert(false, "bind_BPath_TypeCode(void *bindInstPtr) Unimplemented");
	}

	ssize_t bind_BPath_FlattenedSize(void *bindInstPtr) {
		assert(false, "bind_BPath_FlattenedSize(void *bindInstPtr) Unimplemented");
	}

	status_t bind_BPath_Flatten(void *bindInstPtr, void* buffer, ssize_t size) {
		assert(false, "bind_BPath_Flatten(void *bindInstPtr, void* buffer, ssize_t size) Unimplemented");
	}

	bool bind_BPath_AllowsTypeCode(void *bindInstPtr, type_code code) {
		assert(false, "bind_BPath_AllowsTypeCode(void *bindInstPtr, type_code code) Unimplemented");
	}

	status_t bind_BPath_Unflatten(void *bindInstPtr, type_code code,  void* buffer, ssize_t size) {
		assert(false, "bind_BPath_Unflatten(void *bindInstPtr, type_code code, const void* buffer, ssize_t size) Unimplemented");
	}

}


interface IBPath
{
	// status_t be_BPath_InitCheck(BPath *self);
	status_t InitCheck();

	// status_t be_BPath_SetTo(BPath *self, const entry_ref* _ref);
	status_t SetTo(entry_ref);

	// status_t be_BPath_SetTo_1(BPath *self, const BEntry* entry);
	status_t SetTo(IBEntry);

	// status_t be_BPath_SetTo_2(BPath *self, const char* path, const char* leaf, bool normalize);
	status_t SetTo(char [], char [] = null, bool = false);

	// status_t be_BPath_SetTo_3(BPath *self, const BDirectory* dir, const char* leaf, bool normalize);
	status_t SetTo(IBDirectory, char [] = null, bool = false);
 
	// void be_BPath_Unset(BPath *self);
	void Unset();

	// status_t be_BPath_Append(BPath *self, const char* path, bool normalize);
	status_t Append(char [], bool);

	// const char* be_BPath_Path(BPath *self);
	char [] Path();

	// const char* be_BPath_Leaf(BPath *self);
	char [] Leaf();

	// status_t be_BPath_GetParent(BPath *self, BPath* path);
	status_t GetParent(IBPath);

	// bool be_BPath_opEquals(BPath *self, const BPath& item);
	//bool opEquals();

	// bool be_BPath_opEquals_1(BPath *self, const char* path);
	//bool opEquals();

	// bool be_BPath_opNotEquals(BPath *self, const BPath& item);
	//bool opNotEquals();

	// bool be_BPath_opNotEquals_1(BPath *self, const char* path);
	//bool opNotEquals();

	// BPath & be_BPath_opAssign(BPath *self, const BPath& item);
	//BPath & opAssign();

	// BPath & be_BPath_opAssign_1(BPath *self, const char* path);
	//BPath & opAssign();

	// bool be_BPath_IsFixedSize(BPath *self);
	bool IsFixedSize();

	// type_code be_BPath_TypeCode(BPath *self);
	type_code TypeCode();

	// ssize_t be_BPath_FlattenedSize(BPath *self);
	ssize_t FlattenedSize();

	// status_t be_BPath_Flatten(BPath *self, void* buffer, ssize_t size);
	status_t Flatten(inout void [], ssize_t);

	// bool be_BPath_AllowsTypeCode(BPath *self, type_code code);
	bool AllowsTypeCode(type_code);

	// status_t be_BPath_Unflatten(BPath *self, type_code code, const void* buffer, ssize_t size);
	status_t Unflatten(type_code, void [], ssize_t);

	void * _InstPtr();
	bool _OwnsPtr();
}

class BPath : BFlattenable, IBPath
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BPathProxy * be_BPath_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPath_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
		super();
	}

	// BPathProxy * be_BPath_ctor_1(void *bindInstPtr, const BPath* path);
	this(IBPath path) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPath_ctor_1(cast(void *)this, path._InstPtr());
			fOwnsPointer = true;
		}
		super();
	}

	// BPathProxy * be_BPath_ctor_2(void *bindInstPtr, const entry_ref* _ref);
	this(entry_ref _ref) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPath_ctor_2(cast(void *)this, &_ref);
			fOwnsPointer = true;
		}
		super();
	}

	// BPathProxy * be_BPath_ctor_3(void *bindInstPtr, const BEntry* entry);
	this(IBEntry entry) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPath_ctor_3(cast(void *)this, entry._InstPtr());
			fOwnsPointer = true;
		}
		super();
	}

	// BPathProxy * be_BPath_ctor_4(void *bindInstPtr, const char* dir, const char* leaf, bool normalize);
	this(char [] dir, char [] leaf = null, bool normalize = false) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPath_ctor_4(cast(void *)this, toStringz(dir), leaf is null ? null : toStringz(leaf), normalize);
			fOwnsPointer = true;
		}
		super();
	}

	// BPathProxy * be_BPath_ctor_5(void *bindInstPtr, const BDirectory* dir, const char* leaf, bool normalize);
	this(IBDirectory dir, char [] leaf = null, bool normalize = false) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPath_ctor_5(cast(void *)this, dir._InstPtr(), leaf is null ? null : toStringz(leaf), normalize);
			fOwnsPointer = true;
		}
		super();
	}

	// void be_BPath_dtor(BPath* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BPath_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// status_t be_BPath_InitCheck(BPath *self);
	status_t InitCheck() {
		return be_BPath_InitCheck(_InstPtr());
	}

	// status_t be_BPath_SetTo(BPath *self, const entry_ref* _ref);
	status_t SetTo(entry_ref _ref) {
		return be_BPath_SetTo(_InstPtr(), &_ref);
	}

	// status_t be_BPath_SetTo_1(BPath *self, const BEntry* entry);
	status_t SetTo(IBEntry entry) {
		return be_BPath_SetTo_1(_InstPtr(), entry._InstPtr());
	}

	// status_t be_BPath_SetTo_2(BPath *self, const char* path, const char* leaf, bool normalize);
	status_t SetTo(char [] path, char [] leaf = null, bool normalize = false) {
		return be_BPath_SetTo_2(_InstPtr(), toStringz(path), leaf is null ? null : toStringz(leaf), normalize);
	}

	// status_t be_BPath_SetTo_3(BPath *self, const BDirectory* dir, const char* leaf, bool normalize);
	status_t SetTo(IBDirectory dir, char [] leaf = null, bool normalize = false) {
		return be_BPath_SetTo_3(_InstPtr(), dir._InstPtr(), leaf is null ? null : toStringz(leaf), normalize);
	}

	// void be_BPath_Unset(BPath *self);
	void Unset() {
		be_BPath_Unset(_InstPtr());
	}

	// status_t be_BPath_Append(BPath *self, const char* path, bool normalize);
	status_t Append(char [] path, bool normalize = false) {
		return be_BPath_Append(_InstPtr(), toStringz(path), normalize);
	}

	// const char* be_BPath_Path(BPath *self);
	char [] Path() {
		return fromStringz(be_BPath_Path(_InstPtr()));
	}

	// const char* be_BPath_Leaf(BPath *self);
	char [] Leaf() {
		return fromStringz(be_BPath_Leaf(_InstPtr()));
	}

	// status_t be_BPath_GetParent(BPath *self, BPath* path);
	status_t GetParent(IBPath path) {
		return be_BPath_GetParent(_InstPtr(), path._InstPtr());
	}

	// bool be_BPath_opEquals(BPath *self, const BPath& item);
	//bool opEquals();

	// bool be_BPath_opEquals_1(BPath *self, const char* path);
	//bool opEquals();

	// bool be_BPath_opNotEquals(BPath *self, const BPath& item);
	//bool opNotEquals();

	// bool be_BPath_opNotEquals_1(BPath *self, const char* path);
	//bool opNotEquals();

	// BPath & be_BPath_opAssign(BPath *self, const BPath& item);
	//BPath & opAssign();

	// BPath & be_BPath_opAssign_1(BPath *self, const char* path);
	//BPath & opAssign();

	// bool be_BPath_IsFixedSize(BPath *self);
	bool IsFixedSize() {
		return be_BPath_IsFixedSize(_InstPtr());
	}

	// type_code be_BPath_TypeCode(BPath *self);
	type_code TypeCode() {
		return be_BPath_TypeCode(_InstPtr());
	}

	// ssize_t be_BPath_FlattenedSize(BPath *self);
	ssize_t FlattenedSize() {
		return be_BPath_FlattenedSize(_InstPtr());
	}

	// status_t be_BPath_Flatten(BPath *self, void* buffer, ssize_t size);
	status_t Flatten(inout void [] buffer, ssize_t size) {
		return be_BPath_Flatten(_InstPtr(), buffer.ptr, size);
	}

	// bool be_BPath_AllowsTypeCode(BPath *self, type_code code);
	bool AllowsTypeCode(type_code code) {
		return be_BPath_AllowsTypeCode(_InstPtr(), code);
	}

	// status_t be_BPath_Unflatten(BPath *self, type_code code, const void* buffer, ssize_t size);
	status_t Unflatten(type_code code, void [] buffer, ssize_t size) {
		return be_BPath_Unflatten(_InstPtr(), code, buffer.ptr, size);
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


