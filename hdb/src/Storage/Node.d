module Storage.Node;

import tango.stdc.stdlib;
import tango.stdc.stringz;
import tango.stdc.posix.sys.types;
import tango.stdc.posix.sys.stat;

import Support.BObject;
import Support.SupportDefs;
import Support.String;

import Storage.StorageDefs;

import Storage.Statable;
import Storage.Entry;
import Storage.Directory;

import Kernel.fs_attr;

import Support.BObject; 

import Support.types;

struct node_ref
{
	dev_t device;
	ino_t node;	
}

extern (C) extern
{
	be_BNode * be_BNode_ctor_1(be_BNode *);
	be_BNode * be_BNode_ctor_2(be_BNode *, entry_ref *);
	be_BNode * be_BNode_ctor_3(be_BNode *, be_BEntry *);
	be_BNode * be_BNode_ctor_4(be_BNode *, char *);
	be_BNode * be_BNode_ctor_5(be_BNode *, be_BDirectory *, char *);
	be_BNode * be_BNode_ctor_6(be_BNode *, be_BNode *);
	void be_BNode_dtor(be_BNode *);
	
	status_t be_BNode_InitCheck(be_BNode *);
	status_t be_BNode_GetStat_super(be_BNode *, stat_t *);
	status_t be_BNode_SetTo_1(be_BNode *, entry_ref *);
	status_t be_BNode_SetTo_2(be_BNode *, be_BEntry *);
	status_t be_BNode_SetTo_3(be_BNode *, char *);
	status_t be_BNode_SetTo_4(be_BNode *, be_BDirectory *, char *);
	void be_BNode_Unset(be_BNode *);
	status_t be_BNode_Lock(be_BNode *);
	status_t be_BNode_Unlock(be_BNode *);
	status_t be_BNode_Sync(be_BNode *);
	ssize_t be_BNode_WriteAttr(be_BNode *, char *, type_code, off_t, void *, size_t);
	ssize_t be_BNode_ReadAttr(be_BNode *, char *, type_code, off_t, void *, size_t);
	status_t be_BNode_RemoveAttr(be_BNode *, char *);
	status_t be_BNode_RenameAttr(be_BNode *, char *, char *);
	status_t be_BNode_GetAttrInfo(be_BNode *, char *, attr_info *);
	status_t be_BNode_GetNextAttrName(be_BNode *, char *);
	status_t be_BNode_RewindAttrs(be_BNode *);
	status_t be_BNode_WriteAttrString(be_BNode *, char *, be_BString *);
	status_t be_BNode_ReadAttrString(be_BNode *, char *, be_BString *);
	bool be_BNode_operator_equals(be_BNode *, be_BNode *);
	bool be_BNode_operator_notequals(be_BNode *, be_BNode *);
/*
	BNode& operator=(const BNode &node);
*/
	int be_BNode_Dup(be_BNode *);
}

extern (C)
{
	status_t bind_BNode_GetStat_virtual(be_BNode *bindInstPointer, stat_t *st) {
		return (cast(BNode *)bindInstPointer).GetStat(*st);
	}
}

class BNode : public BStatable
{
	mixin(BObject!("be_BNode", false, "be_BStatable"));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BNode_ctor_1(cast(be_BNode *)this);
		super();
	}
	
	this(ref entry_ref reference) {
		if(fInstancePointer is null)
			fInstancePointer = be_BNode_ctor_2(cast(be_BNode *)this, &reference);
		super();
	}
	
	this(BEntry entry) {
		if(fInstancePointer is null)
			fInstancePointer = be_BNode_ctor_3(cast(be_BNode *)this, entry.fInstancePointer);
		super();
	}
	
	this(char [] path) {
		if(fInstancePointer is null)
			fInstancePointer = be_BNode_ctor_4(cast(be_BNode *)this, toStringz(path));
		super();
	}
	
	this(BDirectory dir, char [] path) {
		if(fInstancePointer is null)
			fInstancePointer = be_BNode_ctor_5(cast(be_BNode *)this, dir.fInstancePointer, toStringz(path));
		super();
	}
	
	this(BNode node) {
		if(fInstancePointer is null)
			fInstancePointer = be_BNode_ctor_6(cast(be_BNode *)this, node.fInstancePointer);
		super();
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BNode_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	final status_t InitCheck() {
		return be_BNode_InitCheck(fInstancePointer);
	}

	final status_t GetStat(ref stat_t st) {
		return be_BNode_GetStat_super(fInstancePointer, &st);
	}
	
	final status_t SetTo(ref entry_ref reference) {
		return be_BNode_SetTo_1(fInstancePointer, &reference);
	}
	
	final status_t SetTo(BEntry entry) {
		return be_BNode_SetTo_2(fInstancePointer, entry.fInstancePointer);
	}
	
	final status_t SetTo(char [] path) {
		return be_BNode_SetTo_3(fInstancePointer, toStringz(path));
	}
	
	final status_t SetTo(BDirectory dir, char [] path) {
		return be_BNode_SetTo_4(fInstancePointer, dir.fInstancePointer, toStringz(path));
	}

	final void Unset() {
		return be_BNode_Unset(fInstancePointer);
	}
	
	final status_t Lock() {
		return be_BNode_Lock(fInstancePointer);
	}
	
	final status_t Unlock() {
		return be_BNode_Unlock(fInstancePointer);
	}
	
	final status_t Sync() {
		return be_BNode_Sync(fInstancePointer);
	}
	
	final ssize_t WriteAttr(char [] name, type_code type, off_t offset, void [] buffer) {
		return be_BNode_WriteAttr(fInstancePointer, toStringz(name), type, offset, buffer.ptr, buffer.length);
	}
	
	final ssize_t ReadAttr(char [] name, type_code type, off_t offset, inout void [] buffer) {
		return be_BNode_ReadAttr(fInstancePointer, toStringz(name), type, offset, buffer.ptr, buffer.length);
	}
	
	final status_t RemoveAttr(char [] name) {
		return be_BNode_RemoveAttr(fInstancePointer, toStringz(name));
	}
	
	final status_t RenameAttr(char [] oldname, char [] newname) {
		return be_BNode_RenameAttr(fInstancePointer, toStringz(oldname), toStringz(newname));
	}
	
	final status_t GetAttrInfo(char [] name, ref attr_info info) {
		return be_BNode_GetAttrInfo(fInstancePointer, toStringz(name), &info);
	}
	
	final status_t GetNextAttrName(inout char [] buffer) {
		char *tmpBuffer = cast(char *)malloc(buffer.length);
		status_t ret = be_BNode_GetNextAttrName(fInstancePointer, tmpBuffer);
		
		buffer = fromStringz(tmpBuffer).dup;
		
		free(tmpBuffer);
		
		return ret;
	}
	
	final status_t RewindAttrs() {
		return be_BNode_RewindAttrs(fInstancePointer);
	}
	
	final status_t WriteAttrString(char [] name, BString data) {
		return be_BNode_WriteAttrString(fInstancePointer, toStringz(name), data.fInstancePointer);
	}
	
	final status_t ReadAttrString(char [] name, BString result) {
		return be_BNode_ReadAttrString(fInstancePointer, toStringz(name), result.fInstancePointer);
	}
	
/*
	BNode& operator=(const BNode &node);
	bool operator==(const BNode &node) const;
	bool operator!=(const BNode &node) const;
*/

	final int Dup() {
		return be_BNode_Dup(fInstancePointer);
	}
}
