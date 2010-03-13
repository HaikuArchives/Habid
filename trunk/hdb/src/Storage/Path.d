module Storage.Path;

import Support.BObject;

import Support.Flattenable;
import Storage.Entry;
import Storage.Directory;

import Support.SupportDefs;
import Storage.StorageDefs;

import tango.stdc.posix.sys.types;
import tango.stdc.stringz;

extern (C) extern {
	void *be_BPath_ctor_1(void *);
	
	void *be_BPath_ctor_2(void *, void *path);
	
	void *be_BPath_ctor_3(void *, entry_ref*);
	
	void *be_BPath_ctor_4(void *, void* entry);
	
	void *be_BPath_ctor_5(void *, char*, char*, bool);
	
	void *be_BPath_ctor_6(void *, void*, char*, bool);

	void be_BPath_dtor(void *);

	status_t		be_BPath_InitCheck(void *);

	status_t		be_BPath_SetTo_1(void *, entry_ref*);
	status_t		be_BPath_SetTo_2(void *, void*);
	status_t		be_BPath_SetTo_3(void *, char*, char*, bool);
	status_t		be_BPath_SetTo_4(void *, void*, char*, bool);
	void			be_BPath_Unset(void *);

	status_t		be_BPath_Append(void *, char*, bool);

	char*		be_BPath_Path(void *);
	char*		be_BPath_Leaf(void *);
	status_t		be_BPath_GetParent(void *, void*);
	
	bool be_BPath_operator_equals_1(void *, void *);
	
	bool be_BPath_operator_equals_2(void *, char *);
	
	bool be_BPath_operator_notequals_1(void *, void *);
	
	bool be_BPath_operator_notequals_2(void *, char *);

/*
BPath&			operator=(const BPath& item);
BPath&			operator=(const char* path);
*/

	// BFlattenable protocol
	bool			be_BPath_IsFixedSize(void *);
	bool			be_BPath_IsFixedSize_super(void *);
	type_code		be_BPath_TypeCode(void *);
	type_code		be_BPath_TypeCode_super(void *);
	ssize_t			be_BPath_FlattenedSize(void *);
	ssize_t			be_BPath_FlattenedSize_super(void *);
	status_t		be_BPath_Flatten(void *, void*, ssize_t);
	status_t		be_BPath_Flatten_super(void *, void*, ssize_t);
	bool			be_BPath_AllowsTypeCode(void *, type_code);
	bool			be_BPath_AllowsTypeCode_super(void *, type_code);
	status_t		be_BPath_Unflatten(void *, type_code, void*, ssize_t);
	status_t		be_BPath_Unflatten_super(void *, type_code, void*, ssize_t);
}

extern (C) {
	bool			bind_BPath_IsFixedSize_virtual(void *bindInstPointer) {
		return (cast(BPath)bindInstPointer).IsFixedSize();
	}
	
	type_code		bind_BPath_TypeCode_virtual(void *bindInstPointer) {
		return (cast(BPath)bindInstPointer).TypeCode();
	}
	ssize_t			bind_BPath_FlattenedSize_virtual(void *bindInstPointer) {
		return (cast(BPath)bindInstPointer).FlattenedSize();
	}
	status_t		bind_BPath_Flatten_virtual(void *bindInstPointer, void* buffer, ssize_t size) {
		return (cast(BPath)bindInstPointer).Flatten(buffer[0..size]);
	}
	bool			bind_BPath_AllowsTypeCode_virtual(void *bindInstPointer, type_code code) {
		return (cast(BPath)bindInstPointer).AllowsTypeCode(code);
	}
	status_t		bind_BPath_Unflatten_virtual(void *bindInstPointer, type_code code, void* buffer, ssize_t size) {
		return (cast(BPath)bindInstPointer).Unflatten(code, buffer[0..size]);
	}
}

class BPath : public BFlattenable
{
	mixin BObject;
	
	this() {
		if(fInstancePointer)
			fInstancePointer = be_BPath_ctor_1(fInstancePointer);
		super();
	}
	
	this(BPath path) {
		if(fInstancePointer)
			fInstancePointer = be_BPath_ctor_2(fInstancePointer, path.fInstancePointer);
		super();
	}
	
	this(ref entry_ref reference) {
		if(fInstancePointer)
			fInstancePointer = be_BPath_ctor_3(fInstancePointer, &reference);
		super();
	}
	
	this(BEntry entry) {
		if(fInstancePointer)
			fInstancePointer = be_BPath_ctor_4(fInstancePointer, entry.fInstancePointer);
		super();
	}
	
	this(char [] dir, char [] leaf = null, bool normalize = false) {
		if(fInstancePointer)
			fInstancePointer = be_BPath_ctor_5(fInstancePointer, 
												dir == null ? null : toStringz(dir),
												leaf == null ? null : toStringz(leaf), 
												normalize);
		super();
	}
	
	this(BDirectory dir, char [] leaf = null, bool normalize = false) {
		if(fInstancePointer)
			fInstancePointer = be_BPath_ctor_6(fInstancePointer, 
												dir.fInstancePointer, leaf == null ? null : toStringz(leaf),
												normalize);
		super();
	}
	
	~this() {
		if(fInstancePointer)
			be_BPath_dtor(fInstancePointer);
		fInstancePointer = null;
	}

	status_t		InitCheck() {
		return be_BPath_InitCheck(fInstancePointer);
	}

	status_t		SetTo(ref entry_ref reference) {
		return be_BPath_SetTo_1(fInstancePointer, &reference);
	}
	status_t		SetTo(BEntry entry) {
		return be_BPath_SetTo_2(fInstancePointer, entry.fInstancePointer);
	}
	status_t		SetTo(char [] path, char [] leaf = null, bool normalize = false) {
		return be_BPath_SetTo_3(fInstancePointer,
								toStringz(path),
								leaf == null ? null : toStringz(leaf),
								normalize);
	}
	status_t		SetTo(BDirectory dir, char [] leaf = null, bool normalize = false) {
		return be_BPath_SetTo_4(fInstancePointer,
								dir.fInstancePointer,
								leaf == null ? null : toStringz(leaf),
								normalize);
	}
	void			Unset() {
		return be_BPath_Unset(fInstancePointer);
	}

	status_t		Append(char [] path, bool normalize = false) {
		return be_BPath_Append(fInstancePointer, toStringz(path), normalize);
	}

	char []			Path() {
		return fromStringz(be_BPath_Path(fInstancePointer));
	}
	char []			Leaf() {
		return fromStringz(be_BPath_Leaf(fInstancePointer));
	}
	status_t		GetParent(BPath path) {
		return be_BPath_GetParent(fInstancePointer, path.fInstancePointer);
	}
/*
	bool			operator!=(const BPath& item) const;
	bool			operator!=(const char* path) const;
	BPath&			operator=(const BPath& item);
	BPath&			operator=(const char* path);
*/
	bool opEquals(BPath path) {
		return be_BPath_operator_equals_1(fInstancePointer, path.fInstancePointer);
	}
	
	bool opEquals(char [] path) {
		return be_BPath_operator_equals_2(fInstancePointer, toStringz(path));
	}
	
	// BFlattenable protocol
	bool			IsFixedSize() {
		return be_BPath_IsFixedSize_super(fInstancePointer);
	}
	type_code		TypeCode() {
		return be_BPath_TypeCode_super(fInstancePointer);
	}
	ssize_t			FlattenedSize() {
		return be_BPath_FlattenedSize_super(fInstancePointer);
	}
	status_t		Flatten(void [] buffer) {
		return be_BPath_Flatten_super(fInstancePointer, buffer.ptr, buffer.length);
	}
	bool			AllowsTypeCode(type_code code) {
		return be_BPath_AllowsTypeCode_super(fInstancePointer, code);
	}
	status_t		Unflatten(type_code code, void [] buffer) {
		return be_BPath_Unflatten(fInstancePointer, code, buffer.ptr, buffer.length);
	}
}
