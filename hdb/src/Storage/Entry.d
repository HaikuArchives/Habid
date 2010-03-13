module Storage.Entry;

import Support.Errors;

import Storage.Statable;
import Storage.Directory;
import Storage.Path;

import Storage.StorageDefs;
import Support.SupportDefs;

import tango.stdc.posix.sys.types;
import tango.stdc.posix.sys.stat;

import tango.stdc.stringz;
import tango.stdc.string;
import tango.stdc.stdlib;

import tango.io.Stdout;

struct entry_ref
{
	static entry_ref opCall() {
		entry_ref tmpRef;
		tmpRef.device = cast(dev_t)-1;
		tmpRef.directory = cast(ino_t)-1;
		tmpRef.name = null;
		return tmpRef;
	}

	static entry_ref opCall(dev_t dev, ino_t dir, char [] name) {
		entry_ref tmpRef;
		tmpRef.device = dev;
		tmpRef.directory = dir;
		tmpRef.set_name(name);
		return tmpRef;
	}

	static entry_ref opCall(ref entry_ref _ref) {
		entry_ref tmpRef;
		tmpRef.device = _ref.device;
		tmpRef.directory = _ref.directory;
		tmpRef.set_name(fromStringz(_ref.name));
		return tmpRef;
	}

	int set_name(char [] newName) {
		if(newName.length == 0)
			name = null;
		else 
			name = strdup(toStringz(newName));
		
		return B_OK;	
	}

	bool opEquals(ref entry_ref _ref) {
		return 	device == _ref.device &&
				directory == _ref.directory &&
				(name == _ref.name ||
						 (name !is null && _ref.name !is null &&
						  !strcmp(name, _ref.name)));
	}

	dev_t	device;
	ino_t	directory;
	char *	name;
}

extern (C)
{
	status_t bind_BEntry_GetStat_virtual(void *instPointer, stat_t *st) {
		return (cast(BEntry)instPointer).GetStat(*st);
	}
}

extern (C) extern
{
	void * be_BEntry_ctor_1(void *);
	
	void * be_BEntry_ctor_2(void *, void *, char *, bool);
	void * be_BEntry_ctor_3(void *, entry_ref *, bool);
	void * be_BEntry_ctor_4(void *, char *, bool);
	void * be_BEntry_ctor_5(void *, void *);

	void be_BEntry_dtor(void *);
	
	status_t be_BEntry_InitCheck(void *);

	bool be_BEntry_Exists(void *);

	status_t be_BEntry_GetStat(void *, stat_t *);
	status_t be_BEntry_GetStat_super(void *, stat_t *);

	status_t be_BEntry_SetTo_1(void *, void *, char *, bool);
	
	status_t be_BEntry_SetTo_2(void *, entry_ref *, bool);
	
	status_t be_BEntry_SetTo_3(void *, char *, bool);
	
	void be_BEntry_Unset(void *);

	status_t be_BEntry_GetRef(void *, entry_ref *);
	
	status_t be_BEntry_GetPath(void *, void *);
	
	status_t be_BEntry_GetParent_1(void *, void *);
	
	status_t be_BEntry_GetParent_2(void *, void*);
	
	status_t be_BEntry_GetName(void *, char *);

	status_t be_BEntry_Rename(void *, char *, bool);
	
	status_t be_BEntry_MoveTo(void *, void *, char *, bool);
	
	status_t be_BEntry_Remove(void *);
	
	status_t be_BEntry_operator_equals(void *, void *);
	
	status_t be_BEntry_operator_notequals(void *, void *);
	
	void * be_BEntry_operator_assign(void *, void *);
}

class BEntry : BStatable
{
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BEntry_ctor_1(cast(void *)this);
		
		super();
	}
	
	this(BDirectory dir, char [] path, bool traverse = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BEntry_ctor_2(cast(void *)this, dir.fInstancePointer, toStringz(path), traverse);
		super();
	}
	
	this(ref entry_ref reference, bool traverse = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BEntry_ctor_3(cast(void *)this, &reference, traverse);
		super();
	}
	
	this(char [] path, bool traverse = false) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BEntry_ctor_4(cast(void *)this, toStringz(path), traverse);
		}
		super();
	}
	
	this(BEntry entry) {
		if(fInstancePointer is null)
			fInstancePointer = be_BEntry_ctor_5(cast(void *)this, entry.fInstancePointer);
		super();
	}
	
	~this() {
		if(fInstancePointer !is null)
			be_BEntry_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	final status_t InitCheck() {
		return be_BEntry_InitCheck(fInstancePointer);
	}
	
	final bool Exists() {
		return be_BEntry_Exists(fInstancePointer);
	}
	
	status_t GetStat(ref stat_t st) {
		return be_BEntry_GetStat_super(fInstancePointer, &st);
	}
	
	final status_t SetTo(BDirectory dir, char [] path, bool traverse = false) {
		return be_BEntry_SetTo_1(fInstancePointer, dir.fInstancePointer, toStringz(path), traverse);
	}
	
	final status_t SetTo(ref entry_ref reference, bool traverse = false) {
		return be_BEntry_SetTo_2(fInstancePointer, &reference, traverse);
	}
	
	final status_t SetTo(char [] path, bool traverse = false) {
		return be_BEntry_SetTo_3(fInstancePointer, toStringz(path), traverse);
	}
	
	final void Unset() {
		return be_BEntry_Unset(fInstancePointer);
	}
	
	final status_t GetRef(ref entry_ref reference) {
		return be_BEntry_GetRef(fInstancePointer, &reference);
	}
	
	final status_t GetPath(BPath path) {
		return be_BEntry_GetPath(fInstancePointer, path.fInstancePointer);
	}
	
	final status_t GetParent(BEntry entry) {
		return be_BEntry_GetParent_1(fInstancePointer, entry.fInstancePointer);
	}
	
	final status_t GetParent(BDirectory dir) {
		return be_BEntry_GetParent_2(fInstancePointer, dir.fInstancePointer);
	}
	
	final status_t GetName(inout char [] buffer) {
		char *name = cast(char *)malloc(256);
		status_t ret = be_BEntry_GetName(fInstancePointer, name);
		buffer = fromStringz(name).dup;
		free(name);
		
		return ret;
	}
	
	final status_t Rename(char [] path, bool clobber = false) {
		return be_BEntry_Rename(fInstancePointer, toStringz(path), clobber);
	}
	
	final status_t MoveTo(BDirectory dir, char [] path = null, bool clobber = false) {
		return be_BEntry_MoveTo(fInstancePointer, dir.fInstancePointer, path == null ? null : toStringz(path), clobber);
	}
	
	final status_t Remove() {
		return be_BEntry_Remove(fInstancePointer);
	}
	
	final status_t opEquals(BEntry entry) {
		return be_BEntry_operator_equals(fInstancePointer, entry.fInstancePointer);
	}
}
