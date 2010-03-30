#include <storage/HCB_Path.h>

extern "C" {
	bool			bind_BPath_IsFixedSize_virtual(void *);
	type_code		bind_BPath_TypeCode_virtual(void *);
	ssize_t			bind_BPath_FlattenedSize_virtual(void *);
	status_t		bind_BPath_Flatten_virtual(void *, void* buffer, ssize_t size);
	bool			bind_BPath_AllowsTypeCode_virtual(void *, type_code code);
	status_t		bind_BPath_Unflatten_virtual(void *, type_code code, const void* buffer, ssize_t size);
}

/* begin class BPathBridge */

BPathBridge::BPathBridge()
: BPath()
{ }

BPathBridge::BPathBridge(const BPath& path)
: BPath(path)
{ }

BPathBridge::BPathBridge(const entry_ref* ref)
: BPath(ref)
{ }

BPathBridge::BPathBridge(const BEntry* entry)
: BPath(entry)
{ }

BPathBridge::BPathBridge(const char* dir, const char* leaf, bool normalize)
: BPath(dir, leaf, normalize)
{ }

BPathBridge::BPathBridge(const BDirectory* dir, const char* leaf, bool normalize)
: BPath(dir, leaf, normalize)
{ }

BPathBridge::~BPathBridge()
{ }
	
/* end class BPathBridge */

/* begin class BPathBridge */

BPathProxy::BPathProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BFlattenableProxy(bindInstPointer) ,BPathBridge()
{ }
BPathProxy::BPathProxy(void *bindInstPointer, const BPath& path)
: fBindInstPointer(bindInstPointer), BFlattenableProxy(bindInstPointer), BPathBridge(path)
{ }
BPathProxy::BPathProxy(void *bindInstPointer, const entry_ref* ref)
: fBindInstPointer(bindInstPointer), BFlattenableProxy(bindInstPointer), BPathBridge(ref)
{ }
BPathProxy::BPathProxy(void *bindInstPointer, const BEntry* entry)
: fBindInstPointer(bindInstPointer), BFlattenableProxy(bindInstPointer), BPathBridge(entry)
{ }
BPathProxy::BPathProxy(void *bindInstPointer, const char* dir, const char* leaf, bool normalize)
: fBindInstPointer(bindInstPointer), BFlattenableProxy(bindInstPointer), BPathBridge(dir, leaf, normalize)
{ }
BPathProxy::BPathProxy(void *bindInstPointer, const BDirectory* dir, const char* leaf, bool normalize)
: fBindInstPointer(bindInstPointer), BFlattenableProxy(bindInstPointer), BPathBridge(dir, leaf, normalize)
{ }

BPathProxy::~BPathProxy()
{ }

/*
bool			operator==(const BPath& item) const;
bool			operator==(const char* path) const;
bool			operator!=(const BPath& item) const;
bool			operator!=(const char* path) const;
BPath&			operator=(const BPath& item);
BPath&			operator=(const char* path);
*/

	// BFlattenable protocol
bool BPathProxy::IsFixedSize() const {
	return bind_BPath_IsFixedSize_virtual(fBindInstPointer);
}

bool BPathProxy::super_IsFixedSize() const {
	return BPathBridge::IsFixedSize();
}

type_code BPathProxy::TypeCode() const {
	return bind_BPath_TypeCode_virtual(fBindInstPointer);
}

type_code BPathProxy::super_TypeCode() const {
	return BPathBridge::TypeCode();
}

ssize_t BPathProxy::FlattenedSize() const {
	return bind_BPath_FlattenedSize_virtual(fBindInstPointer);
}

ssize_t BPathProxy::super_FlattenedSize() const {
	return BPathBridge::FlattenedSize();
}

status_t BPathProxy::Flatten(void* buffer, ssize_t size) const {
	return bind_BPath_Flatten_virtual(fBindInstPointer, buffer, size);
}

status_t BPathProxy::super_Flatten(void* buffer, ssize_t size) const {
	return BPathBridge::Flatten(buffer, size);
}

bool BPathProxy::AllowsTypeCode(type_code code) const {
	return bind_BPath_AllowsTypeCode_virtual(fBindInstPointer, code);
}

bool BPathProxy::super_AllowsTypeCode(type_code code) const {
	return BPathBridge::AllowsTypeCode(code);
}

status_t BPathProxy::Unflatten(type_code code, const void* buffer, ssize_t size) {
	return bind_BPath_Unflatten_virtual(fBindInstPointer, code, buffer, size);
}

status_t BPathProxy::super_Unflatten(type_code code, const void* buffer, ssize_t size) {
	return BPathBridge::Unflatten(code, buffer, size);
}


/* end class BPathBridge */

extern "C" {
	be_BPath *be_BPath_ctor_1(void *bindInstPointer) {
		return (be_BPath *)new BPathProxy(bindInstPointer);
	}
	
	be_BPath *be_BPath_ctor_2(void *bindInstPointer, const be_BPath *path) {
		return (be_BPath *)new BPathProxy(bindInstPointer, *(BPath *)path);
	}
	
	be_BPath *be_BPath_ctor_3(void *bindInstPointer, const entry_ref* ref) {
		return (be_BPath *)new BPathProxy(bindInstPointer, ref);
	}
	
	be_BPath *be_BPath_ctor_4(void *bindInstPointer, const be_BEntry* entry) {
		return (be_BPath *)new BPathProxy(bindInstPointer, (BEntry *)entry);
	}
	
	be_BPath *be_BPath_ctor_5(void *bindInstPointer, const char* dir, const char* leaf, bool normalize) {
		return (be_BPath *)new BPathProxy(bindInstPointer, dir, leaf, normalize);
	}
	
	be_BPath *be_BPath_ctor_6(void *bindInstPointer, const be_BDirectory* dir, const char* leaf, bool normalize) {
		return (be_BPath *)new BPathProxy(bindInstPointer, (BDirectory *)dir, leaf, normalize);
	}

	void be_BPath_dtor(void *instPointer) {
		delete (BPathProxy *)instPointer;
	}

	status_t		be_BPath_InitCheck(be_BPath *instPointer) {
		return ((BPathProxy *)instPointer)->InitCheck();
	}

	status_t		be_BPath_SetTo_1(be_BPath *instPointer, const entry_ref* ref) {
		return ((BPathProxy *)instPointer)->SetTo(ref);
	}
	status_t		be_BPath_SetTo_2(be_BPath *instPointer, const be_BEntry* entry) {
		return ((BPathProxy *)instPointer)->SetTo((BEntry *)entry);
	}
	status_t		be_BPath_SetTo_3(be_BPath *instPointer, const char* path, const char* leaf, bool normalize) {
		return ((BPathProxy *)instPointer)->SetTo(path, leaf, normalize);
	}
	status_t		be_BPath_SetTo_4(be_BPath *instPointer, const be_BDirectory* dir, const char* leaf, bool normalize) {
		return ((BPathProxy *)instPointer)->SetTo((BDirectory *)dir, leaf, normalize);
	}
	void			be_BPath_Unset(be_BPath *instPointer) {
		return ((BPathProxy *)instPointer)->Unset();
	}

	status_t		be_BPath_Append(be_BPath *instPointer, const char* path, bool normalize) {
		return ((BPathProxy *)instPointer)->Append(path, normalize);
	}

	const char*		be_BPath_Path(be_BPath *instPointer) {
		return ((BPathProxy *)instPointer)->Path();
	}
	const char*		be_BPath_Leaf(be_BPath *instPointer) {
		return ((BPathProxy *)instPointer)->Leaf();
	}
	status_t		be_BPath_GetParent(be_BPath *instPointer, be_BPath* path) {
		return ((BPathProxy *)instPointer)->GetParent((BPath *)path);
	}
	
	bool be_BPath_operator_equals_1(be_BPath *instPointer, be_BPath *path) {
		return ((BPathProxy *)instPointer)->operator==(*(BPath *)path);
	}
	
	bool be_BPath_operator_equals_2(be_BPath *instPointer, const char *path) {
		return ((BPathProxy *)instPointer)->operator==(path);
	}
	
	bool be_BPath_operator_notequals_1(be_BPath *instPointer, be_BPath *path) {
		return ((BPathProxy *)instPointer)->operator!=(*(BPath *)path);
	}
	
	bool be_BPath_operator_notequals_2(be_BPath *instPointer, const char *path) {
		return ((BPathProxy *)instPointer)->operator!=(path);
	}

/*
BPath&			operator=(const BPath& item);
BPath&			operator=(const char* path);
*/

	// BFlattenable protocol
	bool			be_BPath_IsFixedSize_super(be_BPath *instPointer) {
		return ((BPathProxy *)instPointer)->super_IsFixedSize();
	}
	type_code		be_BPath_TypeCode_super(be_BPath *instPointer) {
		return ((BPathProxy *)instPointer)->super_TypeCode();
	}
	ssize_t			be_BPath_FlattenedSize_super(be_BPath *instPointer) {
		return ((BPathProxy *)instPointer)->super_FlattenedSize();
	}
	status_t		be_BPath_Flatten_super(be_BPath *instPointer, void* buffer, ssize_t size) {
		return ((BPathProxy *)instPointer)->super_Flatten(buffer, size);
	}
	bool			be_BPath_AllowsTypeCode_super(be_BPath *instPointer, type_code code) {
		return ((BPathProxy *)instPointer)->super_AllowsTypeCode(code);
	}
	status_t		be_BPath_Unflatten_super(be_BPath *instPointer, type_code code, const void* buffer, ssize_t size) {
		return ((BPathProxy *)instPointer)->super_Unflatten(code, buffer, size);
	}
}

