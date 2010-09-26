/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Storage.EntryList;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Storage.Entry;

import tango.stdc.posix.dirent;

extern (C) extern {
	// BEntryListProxy * be_BEntryList_ctor(void *bindInstPtr);
	void * be_BEntryList_ctor(void *bindInstPtr);

	// void be_BEntryList_dtor(BEntryList* self);
	void be_BEntryList_dtor(void* self);

	// status_t be_BEntryList_GetNextEntry(BEntryListProxy *self, BEntry * entry, bool traverse);
	status_t be_BEntryList_GetNextEntry(void *self, void * entry, bool traverse);

	// status_t be_BEntryList_GetNextRef(BEntryListProxy *self, entry_ref * _ref);
	status_t be_BEntryList_GetNextRef(void *self, entry_ref * _ref);

	// int32 be_BEntryList_GetNextDirents(BEntryListProxy *self, struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries);
	int32 be_BEntryList_GetNextDirents(void *self, dirent * direntBuffer, size_t bufferSize, int32 maxEntries);

	// status_t be_BEntryList_Rewind(BEntryListProxy *self);
	status_t be_BEntryList_Rewind(void *self);

	// int32 be_BEntryList_CountEntries(BEntryListProxy *self);
	int32 be_BEntryList_CountEntries(void *self);

}


extern (C) {
	status_t bind_BEntryList_GetNextEntry(void *bindInstPtr, BEntry * entry, bool traverse) {
		assert(false, "bind_BEntryList_GetNextEntry(void *bindInstPtr, BEntry * entry, bool traverse) Unimplemented");
	}

	status_t bind_BEntryList_GetNextRef(void *bindInstPtr, entry_ref * _ref) {
		assert(false, "bind_BEntryList_GetNextRef(void *bindInstPtr, entry_ref * _ref) Unimplemented");
	}

	int32 bind_BEntryList_GetNextDirents(void *bindInstPtr, dirent * direntBuffer, size_t bufferSize, int32 maxEntries) {
		assert(false, "bind_BEntryList_GetNextDirents(void *bindInstPtr, struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries) Unimplemented");
	}

	status_t bind_BEntryList_Rewind(void *bindInstPtr) {
		assert(false, "bind_BEntryList_Rewind(void *bindInstPtr) Unimplemented");
	}

	int32 bind_BEntryList_CountEntries(void *bindInstPtr) {
		assert(false, "bind_BEntryList_CountEntries(void *bindInstPtr) Unimplemented");
	}

}


interface IBEntryList
{
	// status_t be_BEntryList_GetNextEntry(BEntryList *self, BEntry * entry, bool traverse);
	status_t GetNextEntry(IBEntry, bool);

	// status_t be_BEntryList_GetNextRef(BEntryList *self, entry_ref * _ref);
	status_t GetNextRef(inout entry_ref);

	// int32 be_BEntryList_GetNextDirents(BEntryList *self, struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries);
	int32 GetNextDirents(inout dirent [], size_t, int32);

	// status_t be_BEntryList_Rewind(BEntryList *self);
	status_t Rewind();

	// int32 be_BEntryList_CountEntries(BEntryList *self);
	int32 CountEntries();

	void * _InstPtr();
	bool _OwnsPtr();
}

class BEntryList : IBEntryList
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BEntryListProxy * be_BEntryList_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BEntryList_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// void be_BEntryList_dtor(BEntryList* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BEntryList_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// status_t be_BEntryList_GetNextEntry(BEntryList *self, BEntry * entry, bool traverse);
	status_t GetNextEntry(IBEntry entry, bool traverse = false) {
		return be_BEntryList_GetNextEntry(_InstPtr(), entry._InstPtr(), traverse);
	}

	// status_t be_BEntryList_GetNextRef(BEntryList *self, entry_ref * _ref);
	status_t GetNextRef(inout entry_ref _ref) {
		return be_BEntryList_GetNextRef(_InstPtr(), &_ref);
	}

	// int32 be_BEntryList_GetNextDirents(BEntryList *self, struct dirent * direntBuffer, size_t bufferSize, int32 maxEntries);
	int32 GetNextDirents(inout dirent [] direntBuffer, size_t bufferSize, int32 maxEntries) {
		return be_BEntryList_GetNextDirents(_InstPtr(), direntBuffer.ptr, bufferSize, maxEntries);
	}

	// status_t be_BEntryList_Rewind(BEntryList *self);
	status_t Rewind() {
		return be_BEntryList_Rewind(_InstPtr());
	}

	// int32 be_BEntryList_CountEntries(BEntryList *self);
	int32 CountEntries() {
		return be_BEntryList_CountEntries(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


