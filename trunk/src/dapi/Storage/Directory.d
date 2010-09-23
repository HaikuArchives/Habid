/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Storage.Directory;

import Support.SupportDefs;
import Support.types;
import Support.BObject;

import Storage.Entry;
import Storage.Node;
import Storage.EntryList;
import Storage.File;

import tango.stdc.posix.dirent;
import tango.stdc.posix.sys.stat;

import tango.stdc.stringz;

extern (C) extern {
	// BDirectoryProxy * be_BDirectory_ctor(void *bindInstPtr);
	void * be_BDirectory_ctor(void *bindInstPtr);

	// BDirectoryProxy * be_BDirectory_ctor_1(void *bindInstPtr, const BDirectory * dir);
	void * be_BDirectory_ctor_1(void *bindInstPtr, void * dir);

	// BDirectoryProxy * be_BDirectory_ctor_2(void *bindInstPtr, const entry_ref * _ref);
	void * be_BDirectory_ctor_2(void *bindInstPtr, entry_ref * _ref);

	// BDirectoryProxy * be_BDirectory_ctor_3(void *bindInstPtr, const node_ref * nref);
	void * be_BDirectory_ctor_3(void *bindInstPtr, node_ref * nref);

	// BDirectoryProxy * be_BDirectory_ctor_4(void *bindInstPtr, const BEntry * entry);
	void * be_BDirectory_ctor_4(void *bindInstPtr, void * entry);

	// BDirectoryProxy * be_BDirectory_ctor_5(void *bindInstPtr, const char * path);
	void * be_BDirectory_ctor_5(void *bindInstPtr, char * path);

	// BDirectoryProxy * be_BDirectory_ctor_6(void *bindInstPtr, const BDirectory * dir, const char * path);
	void * be_BDirectory_ctor_6(void *bindInstPtr, void * dir,  char * path);

	// void be_BDirectory_dtor(BDirectory* self);
	void be_BDirectory_dtor(void* self);

	// status_t be_BDirectory_SetTo(BDirectoryProxy *self, const entry_ref * _ref);
	status_t be_BDirectory_SetTo(void *self, entry_ref * _ref);

	// status_t be_BDirectory_SetTo_1(BDirectoryProxy *self, const node_ref * nref);
	status_t be_BDirectory_SetTo_1(void *self, node_ref * nref);

	// status_t be_BDirectory_SetTo_2(BDirectoryProxy *self, const BEntry * entry);
	status_t be_BDirectory_SetTo_2(void *self, void * entry);

	// status_t be_BDirectory_SetTo_3(BDirectoryProxy *self, const char * path);
	status_t be_BDirectory_SetTo_3(void *self, char * path);

	// status_t be_BDirectory_SetTo_4(BDirectoryProxy *self, const BDirectory * dir, const char * path);
	status_t be_BDirectory_SetTo_4(void *self, void * dir,  char * path);

	// status_t be_BDirectory_GetEntry(BDirectoryProxy *self, BEntry * entry);
	status_t be_BDirectory_GetEntry(void *self, void * entry);

	// bool be_BDirectory_IsRootDirectory(BDirectoryProxy *self);
	bool be_BDirectory_IsRootDirectory(void *self);

	// status_t be_BDirectory_FindEntry(BDirectoryProxy *self, const char * path, BEntry * entry, bool traverse);
	status_t be_BDirectory_FindEntry(void *self, char * path, void * entry, bool traverse);

	// bool be_BDirectory_Contains(BDirectoryProxy *self, const char * path, int32 nodeFlags);
	bool be_BDirectory_Contains(void *self, char * path, int32 nodeFlags);

	// bool be_BDirectory_Contains_1(BDirectoryProxy *self, const BEntry * entry, int32 nodeFlags);
	bool be_BDirectory_Contains_1(void *self, void * entry, int32 nodeFlags);

	// status_t be_BDirectory_GetStatFor(BDirectoryProxy *self, const char * path, struct stat * st);
	status_t be_BDirectory_GetStatFor(void *self, char * path,  stat_t * st);

	// status_t be_BDirectory_GetNextEntry(BDirectoryProxy *self, BEntry * entry, bool traverse);
	status_t be_BDirectory_GetNextEntry(void *self, void * entry, bool traverse);

	// status_t be_BDirectory_GetNextRef(BDirectoryProxy *self, entry_ref * _ref);
	status_t be_BDirectory_GetNextRef(void *self, entry_ref * _ref);

	// int32 be_BDirectory_GetNextDirents(BDirectoryProxy *self, dirent * buf, size_t bufSize, int32 count);
	int32 be_BDirectory_GetNextDirents(void *self, dirent * buf, size_t bufSize, int32 count);

	// status_t be_BDirectory_Rewind(BDirectoryProxy *self);
	status_t be_BDirectory_Rewind(void *self);

	// int32 be_BDirectory_CountEntries(BDirectoryProxy *self);
	int32 be_BDirectory_CountEntries(void *self);

	// status_t be_BDirectory_CreateDirectory(BDirectoryProxy *self, const char * path, BDirectory * dir);
	status_t be_BDirectory_CreateDirectory(void *self, char * path, void * dir);

	// status_t be_BDirectory_CreateFile(BDirectoryProxy *self, const char * path, BFile * file, bool failIfExists);
	status_t be_BDirectory_CreateFile(void *self, char * path, void * file, bool failIfExists);

	// status_t be_BDirectory_CreateSymLink(BDirectoryProxy *self, const char * path, const char * linkToPath, BSymLink * link);
	status_t be_BDirectory_CreateSymLink(void *self, char * path,  char * linkToPath, void * link);

	// BDirectory * be_BDirectory_opAssign(BDirectory *self, const BDirectory * dir);
	BDirectory * be_BDirectory_opAssign(void *self, void * dir);

}


extern (C) {
	status_t bind_BDirectory_GetNextEntry(void *bindInstPtr, BEntry * entry, bool traverse) {
		assert(false, "bind_BDirectory_GetNextEntry(void *bindInstPtr, BEntry * entry, bool traverse) Unimplemented");
	}

	status_t bind_BDirectory_GetNextRef(void *bindInstPtr, entry_ref * _ref) {
		assert(false, "bind_BDirectory_GetNextRef(void *bindInstPtr, entry_ref * _ref) Unimplemented");
	}

	int32 bind_BDirectory_GetNextDirents(void *bindInstPtr, dirent * buf, size_t bufSize, int32 count) {
		assert(false, "bind_BDirectory_GetNextDirents(void *bindInstPtr, dirent * buf, size_t bufSize, int32 count) Unimplemented");
	}

	status_t bind_BDirectory_Rewind(void *bindInstPtr) {
		assert(false, "bind_BDirectory_Rewind(void *bindInstPtr) Unimplemented");
	}

	int32 bind_BDirectory_CountEntries(void *bindInstPtr) {
		assert(false, "bind_BDirectory_CountEntries(void *bindInstPtr) Unimplemented");
	}

}


interface IBDirectory
{
	// status_t be_BDirectory_SetTo(BDirectory *self, const entry_ref * _ref);
	status_t SetTo(entry_ref);

	// status_t be_BDirectory_SetTo_1(BDirectory *self, const node_ref * nref);
	status_t SetTo(node_ref);

	// status_t be_BDirectory_SetTo_2(BDirectory *self, const BEntry * entry);
	status_t SetTo(IBEntry);

	// status_t be_BDirectory_SetTo_3(BDirectory *self, const char * path);
	status_t SetTo(char []);

	// status_t be_BDirectory_SetTo_4(BDirectory *self, const BDirectory * dir, const char * path);
	status_t SetTo(IBDirectory, char []);

	// status_t be_BDirectory_GetEntry(BDirectory *self, BEntry * entry);
	status_t GetEntry(IBEntry);

	// bool be_BDirectory_IsRootDirectory(BDirectory *self);
	bool IsRootDirectory();

	// status_t be_BDirectory_FindEntry(BDirectory *self, const char * path, BEntry * entry, bool traverse);
	status_t FindEntry(char [], IBEntry, bool);

	// bool be_BDirectory_Contains(BDirectory *self, const char * path, int32 nodeFlags);
	bool Contains(char [], int32);

	// bool be_BDirectory_Contains_1(BDirectory *self, const BEntry * entry, int32 nodeFlags);
	bool Contains(IBEntry, int32);

	// status_t be_BDirectory_GetStatFor(BDirectory *self, const char * path, struct stat * st);
	status_t GetStatFor(char [], inout stat_t);

	// status_t be_BDirectory_GetNextEntry(BDirectory *self, BEntry * entry, bool traverse);
	status_t GetNextEntry(IBEntry, bool);

	// status_t be_BDirectory_GetNextRef(BDirectory *self, entry_ref * _ref);
	status_t GetNextRef(inout entry_ref);

	// int32 be_BDirectory_GetNextDirents(BDirectory *self, dirent * buf, size_t bufSize, int32 count);
	int32 GetNextDirents(inout dirent [], size_t, int32);

	// status_t be_BDirectory_Rewind(BDirectory *self);
	status_t Rewind();

	// int32 be_BDirectory_CountEntries(BDirectory *self);
	int32 CountEntries();

	// status_t be_BDirectory_CreateDirectory(BDirectory *self, const char * path, BDirectory * dir);
	status_t CreateDirectory(char [], IBDirectory);

	// status_t be_BDirectory_CreateFile(BDirectory *self, const char * path, BFile * file, bool failIfExists);
	status_t CreateFile(char [], IBFile, bool);

	// status_t be_BDirectory_CreateSymLink(BDirectory *self, const char * path, const char * linkToPath, BSymLink * link);
//	status_t CreateSymLink(char [], char [], IBSymLink);

	// BDirectory & be_BDirectory_opAssign(BDirectory *self, const BDirectory & dir);
	//BDirectory & opAssign();

	void * _InstPtr();
	bool _OwnsPtr();
}

class BDirectory : BNode, IBEntryList, IBDirectory
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BDirectoryProxy * be_BDirectory_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDirectory_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
		super();
	}

	// BDirectoryProxy * be_BDirectory_ctor_1(void *bindInstPtr, const BDirectory * dir);
	this(IBDirectory dir) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDirectory_ctor_1(cast(void *)this, dir._InstPtr());
			fOwnsPointer = true;
		}
		super();
	}

	// BDirectoryProxy * be_BDirectory_ctor_2(void *bindInstPtr, const entry_ref * _ref);
	this(entry_ref _ref) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDirectory_ctor_2(cast(void *)this, &_ref);
			fOwnsPointer = true;
		}
		super();
	}

	// BDirectoryProxy * be_BDirectory_ctor_3(void *bindInstPtr, const node_ref * nref);
	this(node_ref nref) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDirectory_ctor_3(cast(void *)this, &nref);
			fOwnsPointer = true;
		}
		super();
	}

	// BDirectoryProxy * be_BDirectory_ctor_4(void *bindInstPtr, const BEntry * entry);
	this(IBEntry entry) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDirectory_ctor_4(cast(void *)this, entry._InstPtr());
			fOwnsPointer = true;
		}
		super();
	}

	// BDirectoryProxy * be_BDirectory_ctor_5(void *bindInstPtr, const char * path);
	this(char [] path) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDirectory_ctor_5(cast(void *)this, toStringz(path));
			fOwnsPointer = true;
		}
		super();
	}

	// BDirectoryProxy * be_BDirectory_ctor_6(void *bindInstPtr, const BDirectory * dir, const char * path);
	this(IBDirectory dir, char [] path) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BDirectory_ctor_6(cast(void *)this, dir._InstPtr(), toStringz(path));
			fOwnsPointer = true;
		}
		super();
	}

	// void be_BDirectory_dtor(BDirectory* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BDirectory_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// status_t be_BDirectory_SetTo(BDirectory *self, const entry_ref * _ref);
	status_t SetTo(entry_ref _ref) {
		return be_BDirectory_SetTo(_InstPtr(), &_ref);
	}

	// status_t be_BDirectory_SetTo_1(BDirectory *self, const node_ref * nref);
	status_t SetTo(node_ref nref) {
		return be_BDirectory_SetTo_1(_InstPtr(), &nref);
	}

	// status_t be_BDirectory_SetTo_2(BDirectory *self, const BEntry * entry);
	status_t SetTo(IBEntry entry) {
		return be_BDirectory_SetTo_2(_InstPtr(), entry._InstPtr());
	}

	// status_t be_BDirectory_SetTo_3(BDirectory *self, const char * path);
	status_t SetTo(char [] path) {
		return be_BDirectory_SetTo_3(_InstPtr(), toStringz(path));
	}

	// status_t be_BDirectory_SetTo_4(BDirectory *self, const BDirectory * dir, const char * path);
	status_t SetTo(IBDirectory dir, char [] path) {
		return be_BDirectory_SetTo_4(_InstPtr(), dir._InstPtr(), toStringz(path));
	}

	// status_t be_BDirectory_GetEntry(BDirectory *self, BEntry * entry);
	status_t GetEntry(IBEntry entry) {
		return be_BDirectory_GetEntry(_InstPtr(), entry._InstPtr());
	}

	// bool be_BDirectory_IsRootDirectory(BDirectory *self);
	bool IsRootDirectory() {
		return be_BDirectory_IsRootDirectory(_InstPtr());
	}

	// status_t be_BDirectory_FindEntry(BDirectory *self, const char * path, BEntry * entry, bool traverse);
	status_t FindEntry(char [] path, IBEntry entry, bool traverse = false) {
		return be_BDirectory_FindEntry(_InstPtr(), toStringz(path), entry._InstPtr(), traverse);
	}

	// bool be_BDirectory_Contains(BDirectory *self, const char * path, int32 nodeFlags);
	bool Contains(char [] path, int32 nodeFlags) {
		return be_BDirectory_Contains(_InstPtr(), toStringz(path), nodeFlags);
	}

	// bool be_BDirectory_Contains_1(BDirectory *self, const BEntry * entry, int32 nodeFlags);
	bool Contains(IBEntry entry, int32 nodeFlags) {
		return be_BDirectory_Contains_1(_InstPtr(), entry._InstPtr(), nodeFlags);
	}

	// status_t be_BDirectory_GetStatFor(BDirectory *self, const char * path, struct stat * st);
	status_t GetStatFor(char [] path, inout stat_t st) {
		return be_BDirectory_GetStatFor(_InstPtr(), toStringz(path), &st);
	}

	// status_t be_BDirectory_GetNextEntry(BDirectory *self, BEntry * entry, bool traverse);
	status_t GetNextEntry(IBEntry entry, bool traverse = false) {
		return be_BDirectory_GetNextEntry(_InstPtr(), entry._InstPtr(), traverse);
	}

	// status_t be_BDirectory_GetNextRef(BDirectory *self, entry_ref * _ref);
	status_t GetNextRef(inout entry_ref _ref) {
		return be_BDirectory_GetNextRef(_InstPtr(), &_ref);
	}

	// int32 be_BDirectory_GetNextDirents(BDirectory *self, dirent * buf, size_t bufSize, int32 count);
	int32 GetNextDirents(inout dirent [] buf, size_t bufSize, int32 count) {
		return be_BDirectory_GetNextDirents(_InstPtr(), buf.ptr, bufSize, count);
	}

	// status_t be_BDirectory_Rewind(BDirectory *self);
	status_t Rewind() {
		return be_BDirectory_Rewind(_InstPtr());
	}

	// int32 be_BDirectory_CountEntries(BDirectory *self);
	int32 CountEntries() {
		return be_BDirectory_CountEntries(_InstPtr());
	}

	// status_t be_BDirectory_CreateDirectory(BDirectory *self, const char * path, BDirectory * dir);
	status_t CreateDirectory(char [] path, IBDirectory dir) {
		return be_BDirectory_CreateDirectory(_InstPtr(), toStringz(path), dir._InstPtr());
	}

	// status_t be_BDirectory_CreateFile(BDirectory *self, const char * path, BFile * file, bool failIfExists);
	status_t CreateFile(char [] path, IBFile file, bool failIfExsists = false) {
		return be_BDirectory_CreateFile(_InstPtr(), toStringz(path), file._InstPtr(), failIfExsists);
	}

	// status_t be_BDirectory_CreateSymLink(BDirectory *self, const char * path, const char * linkToPath, BSymLink * link);
/*
	status_t CreateSymLink() {
		return be_BDirectory_CreateSymLink(_InstPtr());
	}
*/
	// BDirectory & be_BDirectory_opAssign(BDirectory *self, const BDirectory & dir);
	//BDirectory & opAssign();

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


