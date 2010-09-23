/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Storage.Node;

import Support.SupportDefs;
import Support.types;
import Support.BObject;

import Storage.Entry;
import Storage.Statable;
import Storage.Directory;

import Support.String;
import tango.io.Stdout;

import Kernel.fs_attr;

import tango.stdc.posix.sys.types;

import tango.stdc.posix.sys.stat;

import tango.stdc.stringz;
import tango.stdc.stdlib;

struct node_ref {
/*
	node_ref();
	node_ref(const node_ref &ref);

	bool operator==(const node_ref &ref) const;
	bool operator!=(const node_ref &ref) const;
	node_ref& operator=(const node_ref &ref);
*/
	dev_t device;
	ino_t node;
};

extern (C) extern {
	// BNodeProxy * be_BNode_ctor(void *bindInstPtr);
	void * be_BNode_ctor(void *bindInstPtr);

	// BNodeProxy * be_BNode_ctor_1(void *bindInstPtr, const entry_ref * _ref);
	void * be_BNode_ctor_1(void *bindInstPtr, entry_ref * _ref);

	// BNodeProxy * be_BNode_ctor_2(void *bindInstPtr, const BEntry * entry);
	void * be_BNode_ctor_2(void *bindInstPtr, void * entry);

	// BNodeProxy * be_BNode_ctor_3(void *bindInstPtr, const char * path);
	void * be_BNode_ctor_3(void *bindInstPtr, char * path);

	// BNodeProxy * be_BNode_ctor_4(void *bindInstPtr, const BDirectory * dir, const char * path);
	void * be_BNode_ctor_4(void *bindInstPtr, void * dir,  char * path);

	// BNodeProxy * be_BNode_ctor_5(void *bindInstPtr, const BNode * node);
	void * be_BNode_ctor_5(void *bindInstPtr, void * node);

	// void be_BNode_dtor(BNode* self);
	void be_BNode_dtor(void* self);

	// status_t be_BNode_InitCheck(BNodeProxy *self);
	status_t be_BNode_InitCheck(void *self);

	// status_t be_BNode_GetStat(BNodeProxy *self, struct stat * st);
	status_t be_BNode_GetStat(void *self, stat_t * st);

	// status_t be_BNode_SetTo(BNodeProxy *self, const entry_ref * _ref);
	status_t be_BNode_SetTo(void *self, entry_ref * _ref);

	// status_t be_BNode_SetTo_1(BNodeProxy *self, const BEntry * entry);
	status_t be_BNode_SetTo_1(void *self, void * entry);

	// status_t be_BNode_SetTo_2(BNodeProxy *self, const char * path);
	status_t be_BNode_SetTo_2(void *self, char * path);

	// status_t be_BNode_SetTo_3(BNodeProxy *self, const BDirectory * dir, const char * path);
	status_t be_BNode_SetTo_3(void *self, void * dir,  char * path);

	// void be_BNode_Unset(BNodeProxy *self);
	void be_BNode_Unset(void *self);

	// status_t be_BNode_Lock(BNodeProxy *self);
	status_t be_BNode_Lock(void *self);

	// status_t be_BNode_Unlock(BNodeProxy *self);
	status_t be_BNode_Unlock(void *self);

	// status_t be_BNode_Sync(BNodeProxy *self);
	status_t be_BNode_Sync(void *self);

	// ssize_t be_BNode_WriteAttr(BNodeProxy *self, const char * name, type_code type, off_t offset, const void * buffer, size_t len);
	ssize_t be_BNode_WriteAttr(void *self, char * name, type_code type, off_t offset,  void * buffer, size_t len);

	// ssize_t be_BNode_ReadAttr(BNodeProxy *self, const char * name, type_code type, off_t offset, void * buffer, size_t len);
	ssize_t be_BNode_ReadAttr(void *self, char * name, type_code type, off_t offset, void * buffer, size_t len);

	// status_t be_BNode_RemoveAttr(BNodeProxy *self, const char * name);
	status_t be_BNode_RemoveAttr(void *self, char * name);

	// status_t be_BNode_RenameAttr(BNodeProxy *self, const char * oldname, const char * newname);
	status_t be_BNode_RenameAttr(void *self, char * oldname,  char * newname);

	// status_t be_BNode_GetAttrInfo(BNodeProxy *self, const char * name, struct attr_info * info);
	status_t be_BNode_GetAttrInfo(void *self, char * name,  attr_info * info);

	// status_t be_BNode_GetNextAttrName(BNodeProxy *self, char * buffer);
	status_t be_BNode_GetNextAttrName(void *self, char * buffer);

	// status_t be_BNode_RewindAttrs(BNodeProxy *self);
	status_t be_BNode_RewindAttrs(void *self);

	// status_t be_BNode_WriteAttrString(BNodeProxy *self, const char * name, const BString * data);
	status_t be_BNode_WriteAttrString(void *self, char * name, void * data);

	// status_t be_BNode_ReadAttrString(BNodeProxy *self, const char * name, BString * result);
	status_t be_BNode_ReadAttrString(void *self, char * name, void * result);

	// BNode * be_BNode_opAssign(BNode *self, const BNode * node);
	void * be_BNode_opAssign(void *self, void * node);

	// bool be_BNode_opEquals(BNode *self, const BNode * node);
	bool be_BNode_opEquals(void *self, void * node);

	// bool be_BNode_opNotEquals(BNode *self, const BNode * node);
	bool be_BNode_opNotEquals(void *self, void * node);

	// int be_BNode_Dup(BNodeProxy *self);
	int be_BNode_Dup(void *self);

}


extern (C) {
	status_t bind_BNode_GetStat(void *bindInstPtr, stat_t * st) {
		assert(false, "bind_BNode_GetStat(void *bindInstPtr, struct stat * st) Unimplemented");
	}

}


interface IBNode
{
	// status_t be_BNode_InitCheck(BNode *self);
	status_t InitCheck();

	// status_t be_BNode_GetStat(BNode *self, struct stat * st);
	status_t GetStat(inout stat_t);

	// status_t be_BNode_SetTo(BNode *self, const entry_ref * ref);
	status_t SetTo(entry_ref);

	// status_t be_BNode_SetTo_1(BNode *self, const BEntry * entry);
	status_t SetTo(IBEntry);

	// status_t be_BNode_SetTo_2(BNode *self, const char * path);
	status_t SetTo(char []);

	// status_t be_BNode_SetTo_3(BNode *self, const BDirectory * dir, const char * path);
	status_t SetTo(IBDirectory, char []);

	// void be_BNode_Unset(BNode *self);
	void Unset();

	// status_t be_BNode_Lock(BNode *self);
	status_t Lock();

	// status_t be_BNode_Unlock(BNode *self);
	status_t Unlock();

	// status_t be_BNode_Sync(BNode *self);
	status_t Sync();

	// ssize_t be_BNode_WriteAttr(BNode *self, const char * name, type_code type, off_t offset, const void * buffer, size_t len);
	ssize_t WriteAttr(char [], type_code, off_t, void [], size_t);

	// ssize_t be_BNode_ReadAttr(BNode *self, const char * name, type_code type, off_t offset, void * buffer, size_t len);
	ssize_t ReadAttr(char [], type_code, off_t, inout void [], size_t);

	// status_t be_BNode_RemoveAttr(BNode *self, const char * name);
	status_t RemoveAttr(char []);

	// status_t be_BNode_RenameAttr(BNode *self, const char * oldname, const char * newname);
	status_t RenameAttr(char [], char []);

	// status_t be_BNode_GetAttrInfo(BNode *self, const char * name, struct attr_info * info);
	status_t GetAttrInfo(char [], inout attr_info);

	// status_t be_BNode_GetNextAttrName(BNode *self, char * buffer);
	status_t GetNextAttrName(inout char []);

	// status_t be_BNode_RewindAttrs(BNode *self);
	status_t RewindAttrs();

	// status_t be_BNode_WriteAttrString(BNode *self, const char * name, const BString * data);
	status_t WriteAttrString(char [], IBString);

	// status_t be_BNode_ReadAttrString(BNode *self, const char * name, BString * result);
	status_t ReadAttrString(char [], IBString);

	// BNode & be_BNode_opAssign(BNode *self, const BNode & node);
	//BNode & opAssign();

	// bool be_BNode_opEquals(BNode *self, const BNode & node);
	//bool opEquals();

	// bool be_BNode_opNotEquals(BNode *self, const BNode & node);
	//bool opNotEquals();

	// int be_BNode_Dup(BNode *self);
	int Dup();

	void * _InstPtr();
	bool _OwnsPtr();
}

class BNode : BStatable, IBNode
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BNodeProxy * be_BNode_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BNode_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
		super();
	}

	// BNodeProxy * be_BNode_ctor_1(void *bindInstPtr, const entry_ref * ref);
	this(entry_ref _ref) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BNode_ctor_1(cast(void *)this, &_ref);
			fOwnsPointer = true;
		}
		super();
	}

	// BNodeProxy * be_BNode_ctor_2(void *bindInstPtr, const BEntry * entry);
	this(IBEntry entry) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BNode_ctor_2(cast(void *)this, entry._InstPtr());
			fOwnsPointer = true;
		}
		super();
	}

	// BNodeProxy * be_BNode_ctor_3(void *bindInstPtr, const char * path);
	this(char [] path) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BNode_ctor_3(cast(void *)this, toStringz(path));
			fOwnsPointer = true;
		}
		super();
	}

	// BNodeProxy * be_BNode_ctor_4(void *bindInstPtr, const BDirectory * dir, const char * path);
	this(IBDirectory dir, char [] path) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BNode_ctor_4(cast(void *)this, dir._InstPtr(), toStringz(path));
			fOwnsPointer = true;
		}
		super();
	}

	// BNodeProxy * be_BNode_ctor_5(void *bindInstPtr, const BNode * node);
	this(IBNode node) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BNode_ctor_5(cast(void *)this, node._InstPtr());
			fOwnsPointer = true;
		}
		super();
	}

	// void be_BNode_dtor(BNode* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BNode_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// status_t be_BNode_InitCheck(BNode *self);
	status_t InitCheck() {
		return be_BNode_InitCheck(_InstPtr());
	}

	// status_t be_BNode_GetStat(BNode *self, struct stat * st);
	status_t GetStat(inout stat_t st) {
		return be_BNode_GetStat(_InstPtr(), &st);
	}

	// status_t be_BNode_SetTo(BNode *self, const entry_ref * ref);
	status_t SetTo(entry_ref _ref) {
		return be_BNode_SetTo(_InstPtr(), &_ref);
	}

	// status_t be_BNode_SetTo_1(BNode *self, const BEntry * entry);
	status_t SetTo(IBEntry entry) {
		return be_BNode_SetTo_1(_InstPtr(), entry._InstPtr());
	}

	// status_t be_BNode_SetTo_2(BNode *self, const char * path);
	status_t SetTo(char [] path) {
		return be_BNode_SetTo_2(_InstPtr(), toStringz(path));
	}

	// status_t be_BNode_SetTo_3(BNode *self, const BDirectory * dir, const char * path);
	status_t SetTo(IBDirectory dir, char [] path) {
		return be_BNode_SetTo_3(_InstPtr(), dir._InstPtr(), toStringz(path));
	}

	// void be_BNode_Unset(BNode *self);
	void Unset() {
		be_BNode_Unset(_InstPtr());
	}

	// status_t be_BNode_Lock(BNode *self);
	status_t Lock() {
		return be_BNode_Lock(_InstPtr());
	}

	// status_t be_BNode_Unlock(BNode *self);
	status_t Unlock() {
		return be_BNode_Unlock(_InstPtr());
	}

	// status_t be_BNode_Sync(BNode *self);
	status_t Sync() {
		return be_BNode_Sync(_InstPtr());
	}

	// ssize_t be_BNode_WriteAttr(BNode *self, const char * name, type_code type, off_t offset, const void * buffer, size_t len);
	ssize_t WriteAttr(char [] name, type_code type, off_t offset, void [] buffer, size_t len) {
		Stdout.formatln("Writing attr: {} with: {}, len: {}", name, cast(char [])buffer, len);
		return be_BNode_WriteAttr(_InstPtr(), toStringz(name), type, offset, buffer.ptr, len);
	}

	// ssize_t be_BNode_ReadAttr(BNode *self, const char * name, type_code type, off_t offset, void * buffer, size_t len);
	ssize_t ReadAttr(char [] name, type_code type, off_t offset, inout void [] buffer, size_t len) {
		return be_BNode_ReadAttr(_InstPtr(), toStringz(name), type, offset, buffer.ptr, len);
	}

	// status_t be_BNode_RemoveAttr(BNode *self, const char * name);
	status_t RemoveAttr(char [] name) {
		return be_BNode_RemoveAttr(_InstPtr(), toStringz(name));
	}

	// status_t be_BNode_RenameAttr(BNode *self, const char * oldname, const char * newname);
	status_t RenameAttr(char [] oldname, char [] newname) {
		return be_BNode_RenameAttr(_InstPtr(), toStringz(oldname), toStringz(newname));
	}

	// status_t be_BNode_GetAttrInfo(BNode *self, const char * name, struct attr_info * info);
	status_t GetAttrInfo(char [] name, inout attr_info info) {
		return be_BNode_GetAttrInfo(_InstPtr(), toStringz(name), &info);
	}

	// status_t be_BNode_GetNextAttrName(BNode *self, char * buffer);
	status_t GetNextAttrName(inout char [] buffer) {
		char *tmpBuffer = cast(char *)malloc(256);
		
		status_t ret = be_BNode_GetNextAttrName(_InstPtr(), tmpBuffer);
		
		buffer = fromStringz(tmpBuffer).dup;
		
		free(tmpBuffer);
		
		return ret;
	}

	// status_t be_BNode_RewindAttrs(BNode *self);
	status_t RewindAttrs() {
		return be_BNode_RewindAttrs(_InstPtr());
	}

	// status_t be_BNode_WriteAttrString(BNode *self, const char * name, const BString * data);
	status_t WriteAttrString(char [] name, IBString data) {
		return be_BNode_WriteAttrString(_InstPtr(), toStringz(name), data._InstPtr());
	}

	// status_t be_BNode_ReadAttrString(BNode *self, const char * name, BString * result);
	status_t ReadAttrString(char [] name, IBString result) {
		return be_BNode_ReadAttrString(_InstPtr(), toStringz(name), result._InstPtr());
	}

	// BNode & be_BNode_opAssign(BNode *self, const BNode & node);
	//BNode & opAssign();

	// bool be_BNode_opEquals(BNode *self, const BNode & node);
	//bool opEquals();

	// bool be_BNode_opNotEquals(BNode *self, const BNode & node);
	//bool opNotEquals();

	// int be_BNode_Dup(BNode *self);
	int Dup() {
		return be_BNode_Dup(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


