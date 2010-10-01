/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Storage.Entry;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;
import Be.Support.Errors;

import Be.Storage.Directory;
import Be.Storage.Path;
import Be.Storage.Statable;

import tango.stdc.posix.sys.types;
import tango.stdc.posix.sys.stat;

import tango.stdc.stringz;
import tango.stdc.stdlib;


struct entry_ref {
	static entry_ref opCall() {
		entry_ref _ref;
		return _ref;	
	}
	
	static entry_ref opCall(dev_t dev, ino_t dir, char [] name) {
		entry_ref _ref;
		_ref.device = dev;
		_ref.directory = dir;
		_ref.name = toStringz(name.dup);
		
		return _ref;
	}

	status_t set_name(char [] _name) {
		name = toStringz(_name.dup);
		
		return B_OK;
	}
/*
								entry_ref();
								entry_ref(dev_t dev, ino_t dir,
									const char* name);
								entry_ref(const entry_ref& ref);
								~entry_ref();

			status_t			set_name(const char* name);

			bool				operator==(const entry_ref& ref) const;
			bool				operator!=(const entry_ref& ref) const;
			entry_ref&			operator=(const entry_ref& ref);
*/
	dev_t				device;
	ino_t				directory;
	char*				name;
};

extern (C) extern {
	// BEntryProxy * be_BEntry_ctor(void *bindInstPtr);
	void * be_BEntry_ctor(void *bindInstPtr);

	// BEntryProxy * be_BEntry_ctor_1(void *bindInstPtr, const BDirectory* dir, const char* path, bool traverse);
	void * be_BEntry_ctor_1(void *bindInstPtr, void * dir,  char* path, bool traverse);

	// BEntryProxy * be_BEntry_ctor_2(void *bindInstPtr, const entry_ref* _ref, bool traverse);
	void * be_BEntry_ctor_2(void *bindInstPtr, entry_ref* _ref, bool traverse);

	// BEntryProxy * be_BEntry_ctor_3(void *bindInstPtr, const char* path, bool traverse);
	void * be_BEntry_ctor_3(void *bindInstPtr, char* path, bool traverse);

	// BEntryProxy * be_BEntry_ctor_4(void *bindInstPtr, const BEntry* entry);
	void * be_BEntry_ctor_4(void *bindInstPtr, void * entry);

	// void be_BEntry_dtor(BEntry* self);
	void be_BEntry_dtor(void* self);

	// status_t be_BEntry_InitCheck(BEntryProxy *self);
	status_t be_BEntry_InitCheck(void *self);

	// bool be_BEntry_Exists(BEntryProxy *self);
	bool be_BEntry_Exists(void *self);

	// status_t be_BEntry_GetStat(BEntryProxy *self, struct stat* stat);
	status_t be_BEntry_GetStat(void *self, stat_t* stat);

	// status_t be_BEntry_SetTo(BEntryProxy *self, const BDirectory* dir, const char* path, bool traverse);
	status_t be_BEntry_SetTo(void *self, void * dir,  char* path, bool traverse);

	// status_t be_BEntry_SetTo_1(BEntryProxy *self, const entry_ref* _ref, bool traverse);
	status_t be_BEntry_SetTo_1(void *self, entry_ref* _ref, bool traverse);

	// status_t be_BEntry_SetTo_2(BEntryProxy *self, const char* path, bool traverse);
	status_t be_BEntry_SetTo_2(void *self, char* path, bool traverse);

	// void be_BEntry_Unset(BEntryProxy *self);
	void be_BEntry_Unset(void *self);

	// status_t be_BEntry_GetRef(BEntryProxy *self, entry_ref* _ref);
	status_t be_BEntry_GetRef(void *self, entry_ref* _ref);

	// status_t be_BEntry_GetPath(BEntryProxy *self, BPath* path);
	status_t be_BEntry_GetPath(void *self, void * path);

	// status_t be_BEntry_GetParent(BEntryProxy *self, BEntry* entry);
	status_t be_BEntry_GetParent(void *self, void * entry);

	// status_t be_BEntry_GetParent_1(BEntryProxy *self, BDirectory* dir);
	status_t be_BEntry_GetParent_1(void *self, void * dir);

	// status_t be_BEntry_GetName(BEntryProxy *self, char* buffer);
	status_t be_BEntry_GetName(void *self, char* buffer);

	// status_t be_BEntry_Rename(BEntryProxy *self, const char* path, bool clobber);
	status_t be_BEntry_Rename(void *self, char* path, bool clobber);

	// status_t be_BEntry_MoveTo(BEntryProxy *self, BDirectory* dir, const char* path, bool clobber);
	status_t be_BEntry_MoveTo(void *self, void * dir,  char* path, bool clobber);

	// status_t be_BEntry_Remove(BEntryProxy *self);
	status_t be_BEntry_Remove(void *self);

	// bool be_BEntry_opEquals(BEntry *self, const BEntry* item);
	bool be_BEntry_opEquals(void *self, void * item);

	// bool be_BEntry_opNotEquals(BEntry *self, const BEntry* item);
	bool be_BEntry_opNotEquals(void *self, void * item);

	// BEntry * be_BEntry_opAssign(BEntry *self, const BEntry* item);
	void * be_BEntry_opAssign(void *self, void * item);

}


extern (C) {
	status_t bind_BEntry_GetStat(void *bindInstPtr, stat_t* stat) {
		assert(false, "bind_BEntry_GetStat(void *bindInstPtr, struct stat* stat) Unimplemented");
	}

}


interface IBEntry
{
	// status_t be_BEntry_InitCheck(BEntry *self);
	status_t InitCheck();

	// bool be_BEntry_Exists(BEntry *self);
	bool Exists();

	// status_t be_BEntry_GetStat(BEntry *self, struct stat* stat);
	status_t GetStat(inout stat_t st);

	// status_t be_BEntry_SetTo(BEntry *self, const BDirectory* dir, const char* path, bool traverse);
	status_t SetTo(IBDirectory, char [], bool);

	// status_t be_BEntry_SetTo_1(BEntry *self, const entry_ref* _ref, bool traverse);
	status_t SetTo(entry_ref, bool);

	// status_t be_BEntry_SetTo_2(BEntry *self, const char* path, bool traverse);
	status_t SetTo(char [], bool);

	// void be_BEntry_Unset(BEntry *self);
	void Unset();

	// status_t be_BEntry_GetRef(BEntry *self, entry_ref* _ref);
	status_t GetRef(inout entry_ref);

	// status_t be_BEntry_GetPath(BEntry *self, BPath* path);
	status_t GetPath(IBPath);

	// status_t be_BEntry_GetParent(BEntry *self, BEntry* entry);
	status_t GetParent(IBEntry);

	// status_t be_BEntry_GetParent_1(BEntry *self, BDirectory* dir);
	status_t GetParent(IBDirectory);

	// status_t be_BEntry_GetName(BEntry *self, char* buffer);
	status_t GetName(inout char []);

	// status_t be_BEntry_Rename(BEntry *self, const char* path, bool clobber);
	status_t Rename(char [], bool);

	// status_t be_BEntry_MoveTo(BEntry *self, BDirectory* dir, const char* path, bool clobber);
	status_t MoveTo(IBDirectory, char [], bool);

	// status_t be_BEntry_Remove(BEntry *self);
	status_t Remove();

	// bool be_BEntry_opEquals(BEntry *self, const BEntry& item);
	//bool opEquals();

	// bool be_BEntry_opNotEquals(BEntry *self, const BEntry& item);
	//bool opNotEquals();

	// BEntry & be_BEntry_opAssign(BEntry *self, const BEntry& item);
	//BEntry & opAssign();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BEntry : BStatable, IBEntry
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BEntryProxy * be_BEntry_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BEntry_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
		super();
	}

	// BEntryProxy * be_BEntry_ctor_1(void *bindInstPtr, const BDirectory* dir, const char* path, bool traverse);
	this(IBDirectory dir, char [] path, bool traverse = false) {
		if(_InstPtr is null) {
			_InstPtr = be_BEntry_ctor_1(cast(void *)this, dir._InstPtr(), toStringz(path), traverse);
			_OwnsPtr = true;
		}
		super();
	}

	// BEntryProxy * be_BEntry_ctor_2(void *bindInstPtr, const entry_ref* _ref, bool traverse);
	this(entry_ref _ref, bool traverse = false) {
		if(_InstPtr is null) {
			_InstPtr = be_BEntry_ctor_2(cast(void *)this, &_ref, traverse);
			_OwnsPtr = true;
		}
		super();
	}

	// BEntryProxy * be_BEntry_ctor_3(void *bindInstPtr, const char* path, bool traverse);
	this(char [] path, bool traverse = false) {
		if(_InstPtr is null) {
			_InstPtr = be_BEntry_ctor_3(cast(void *)this, toStringz(path), traverse);
			_OwnsPtr = true;
		}
		super();
	}

	// BEntryProxy * be_BEntry_ctor_4(void *bindInstPtr, const BEntry* entry);
	this(IBEntry entry) {
		if(_InstPtr is null) {
			_InstPtr = be_BEntry_ctor_4(cast(void *)this, entry._InstPtr());
			_OwnsPtr = true;
		}
		super();
	}

	// void be_BEntry_dtor(BEntry* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BEntry_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BEntry_InitCheck(BEntry *self);
	status_t InitCheck() {
		return be_BEntry_InitCheck(_InstPtr());
	}

	// bool be_BEntry_Exists(BEntry *self);
	bool Exists() {
		return be_BEntry_Exists(_InstPtr());
	}

	// status_t be_BEntry_GetStat(BEntry *self, struct stat* stat);
	status_t GetStat(inout stat_t st) {
		return be_BEntry_GetStat(_InstPtr(), &st);
	}

	// status_t be_BEntry_SetTo(BEntry *self, const BDirectory* dir, const char* path, bool traverse);
	status_t SetTo(IBDirectory dir, char [] path, bool traverse = false) {
		return be_BEntry_SetTo(_InstPtr(), dir._InstPtr(), toStringz(path), traverse);
	}

	// status_t be_BEntry_SetTo_1(BEntry *self, const entry_ref* _ref, bool traverse);
	status_t SetTo(entry_ref _ref, bool traverse = false) {
		return be_BEntry_SetTo_1(_InstPtr(), &_ref, traverse);
	}

	// status_t be_BEntry_SetTo_2(BEntry *self, const char* path, bool traverse);
	status_t SetTo(char [] path, bool traverse = false) {
		return be_BEntry_SetTo_2(_InstPtr(), toStringz(path), traverse);
	}

	// void be_BEntry_Unset(BEntry *self);
	void Unset() {
		be_BEntry_Unset(_InstPtr());
	}

	// status_t be_BEntry_GetRef(BEntry *self, entry_ref* _ref);
	status_t GetRef(inout entry_ref _ref) {
		return be_BEntry_GetRef(_InstPtr(), &_ref);
	}

	// status_t be_BEntry_GetPath(BEntry *self, BPath* path);
	status_t GetPath(IBPath path) {
		return be_BEntry_GetPath(_InstPtr(), path._InstPtr());
	}

	// status_t be_BEntry_GetParent(BEntry *self, BEntry* entry);
	status_t GetParent(IBEntry entry) {
		return be_BEntry_GetParent(_InstPtr(), entry._InstPtr());
	}

	// status_t be_BEntry_GetParent_1(BEntry *self, BDirectory* dir);
	status_t GetParent(IBDirectory dir) {
		return be_BEntry_GetParent_1(_InstPtr(), dir._InstPtr());
	}

	// status_t be_BEntry_GetName(BEntry *self, char* buffer);
	status_t GetName(inout char [] buffer) {
		char *tmpBuffer = cast(char *)malloc(256);
		
		status_t ret = be_BEntry_GetName(_InstPtr(), tmpBuffer);
		
		buffer = fromStringz(tmpBuffer).dup;
		
		free(tmpBuffer);
		
		return ret;
	}

	// status_t be_BEntry_Rename(BEntry *self, const char* path, bool clobber);
	status_t Rename(char [] path, bool clobber = false) {
		return be_BEntry_Rename(_InstPtr(), toStringz(path), clobber);
	}

	// status_t be_BEntry_MoveTo(BEntry *self, BDirectory* dir, const char* path, bool clobber);
	status_t MoveTo(IBDirectory dir, char [] path, bool clobber = false) {
		return be_BEntry_MoveTo(_InstPtr(), dir._InstPtr(), toStringz(path), clobber);
	}

	// status_t be_BEntry_Remove(BEntry *self);
	status_t Remove() {
		return be_BEntry_Remove(_InstPtr());
	}

	// bool be_BEntry_opEquals(BEntry *self, const BEntry& item);
	//bool opEquals();

	// bool be_BEntry_opNotEquals(BEntry *self, const BEntry& item);
	//bool opNotEquals();

	// BEntry & be_BEntry_opAssign(BEntry *self, const BEntry& item);
	//BEntry & opAssign();

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


