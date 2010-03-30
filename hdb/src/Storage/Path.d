module Storage.Path;

import Support.BObject;

import Support.Flattenable;
import Storage.Entry;
import Storage.Directory;

import Support.SupportDefs;
import Storage.StorageDefs;

import tango.stdc.posix.sys.types;
import tango.stdc.stringz;

import Support.types;

extern (C) extern {
	be_BPath * be_BPath_ctor_1(be_BPath *);
	
	be_BPath * be_BPath_ctor_2(be_BPath *, be_BPath * path);
	
	be_BPath * be_BPath_ctor_3(be_BPath *, entry_ref*);
	
	be_BPath * be_BPath_ctor_4(be_BPath *, be_BEntry * entry);
	
	be_BPath * be_BPath_ctor_5(be_BPath *, char*, char*, bool);
	
	be_BPath * be_BPath_ctor_6(be_BPath *, be_BDirectory *, char*, bool);

	void be_BPath_dtor(be_BPath *);

	status_t		be_BPath_InitCheck(be_BPath *);

	status_t		be_BPath_SetTo_1(be_BPath *, entry_ref*);
	status_t		be_BPath_SetTo_2(be_BPath *, be_BEntry *);
	status_t		be_BPath_SetTo_3(be_BPath *, char*, char*, bool);
	status_t		be_BPath_SetTo_4(be_BPath *, be_BDirectory *, char*, bool);
	void			be_BPath_Unset(be_BPath *);

	status_t		be_BPath_Append(be_BPath *, char*, bool);

	char*		be_BPath_Path(be_BPath *);
	char*		be_BPath_Leaf(be_BPath *);
	status_t		be_BPath_GetParent(be_BPath *, be_BPath *);
	
	bool be_BPath_operator_equals_1(be_BPath *, be_BPath *);
	
	bool be_BPath_operator_equals_2(be_BPath *, char *);
	
	bool be_BPath_operator_notequals_1(be_BPath *, be_BPath *);
	
	bool be_BPath_operator_notequals_2(be_BPath *, char *);

/*
BPath&			operator=(const BPath& item);
BPath&			operator=(const char* path);
*/

	// BFlattenable protocol
	bool			be_BPath_IsFixedSize_super(be_BPath *);
	type_code		be_BPath_TypeCode_super(be_BPath *);
	ssize_t			be_BPath_FlattenedSize_super(be_BPath *);
	status_t		be_BPath_Flatten_super(be_BPath *, void *, ssize_t);
	bool			be_BPath_AllowsTypeCode_super(be_BPath *, type_code);
	status_t		be_BPath_Unflatten_super(be_BPath *, type_code, void *, ssize_t);
}

extern (C) {
	bool			bind_BPath_IsFixedSize_virtual(be_BPath * bindInstPointer) {
		return (cast(BPath)bindInstPointer).IsFixedSize();
	}
	
	type_code		bind_BPath_TypeCode_virtual(be_BPath * bindInstPointer) {
		return (cast(BPath)bindInstPointer).TypeCode();
	}
	ssize_t			bind_BPath_FlattenedSize_virtual(be_BPath * bindInstPointer) {
		return (cast(BPath)bindInstPointer).FlattenedSize();
	}
	status_t		bind_BPath_Flatten_virtual(be_BPath * bindInstPointer, void* buffer, ssize_t size) {
		return (cast(BPath)bindInstPointer).Flatten(buffer[0..size]);
	}
	bool			bind_BPath_AllowsTypeCode_virtual(be_BPath * bindInstPointer, type_code code) {
		return (cast(BPath)bindInstPointer).AllowsTypeCode(code);
	}
	status_t		bind_BPath_Unflatten_virtual(be_BPath * bindInstPointer, type_code code, void* buffer, ssize_t size) {
		return (cast(BPath)bindInstPointer).Unflatten(code, buffer[0..size]);
	}
}

class BPath : public BFlattenable
{
	mixin(BObject!("be_BPath", false, "be_BFlattenable"));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BPath_ctor_1(cast(be_BPath *)this);
		super();
	}
	
	this(BPath path) {
		if(fInstancePointer is null)
			fInstancePointer = be_BPath_ctor_2(cast(be_BPath *)this, path.fInstancePointer);
		super();
	}
	
	this(ref entry_ref reference) {
		if(fInstancePointer is null)
			fInstancePointer = be_BPath_ctor_3(cast(be_BPath *)this, &reference);
		super();
	}
	
	this(BEntry entry) {
		if(fInstancePointer is null)
			fInstancePointer = be_BPath_ctor_4(cast(be_BPath *)this, entry.fInstancePointer);
		super();
	}
	
	this(char [] dir, char [] leaf = null, bool normalize = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BPath_ctor_5(cast(be_BPath *)this, 
												dir == null ? null : toStringz(dir),
												leaf == null ? null : toStringz(leaf), 
												normalize);
		super();
	}
	
	this(BDirectory dir, char [] leaf = null, bool normalize = false) {
		if(fInstancePointer is null)
			fInstancePointer = be_BPath_ctor_6(cast(be_BPath *)this, 
												dir.fInstancePointer, leaf == null ? null : toStringz(leaf),
												normalize);
		super();
	}
	
	~this() {
		if(fInstancePointer && GetOwnsPointer())
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
		return be_BPath_Unflatten_super(fInstancePointer, code, buffer.ptr, buffer.length);
	}
}
