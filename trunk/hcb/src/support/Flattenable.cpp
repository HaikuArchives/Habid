#include <support/Flattenable.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_Flattenable.h>

extern "C" {
	bool bind_BFlattenable_IsFixedSize(void *);
	type_code bind_BFlattenable_TypeCode(void *);
	ssize_t bind_BFlattenable_FlattenedSize(void *);
	status_t bind_BFlattenable_Flatten(void *, void *, ssize_t);
	bool bind_BFlattenable_AllowsTypeCode(void *, type_code);
	status_t bind_BFlattenable_Unflatten(void *, type_code, const void *, ssize_t);
}

/* end class BFlattenableBridge */

BFlattenableBridge::BFlattenableBridge()
: BFlattenable()
{ }
	
BFlattenableBridge::~BFlattenableBridge()
{ }
	
bool BFlattenableBridge::IsFixedSize() const {
	return false;
}
	
type_code BFlattenableBridge::TypeCode() const {
	return 0;
}
	
ssize_t BFlattenableBridge::FlattenedSize() const {
	return 0;
}
	
status_t BFlattenableBridge::Flatten(void *buffer, ssize_t size) const {
	return 0;
}
	
bool BFlattenableBridge::AllowsTypeCode(type_code type) const {
	return 0;
}
	
status_t BFlattenableBridge::Unflatten(type_code type, const void *buffer, ssize_t size) {
	return 0;
}

/* end class BFlattenableBridge */

/* begin class BFlattenableProxy */

BFlattenableProxy::BFlattenableProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BFlattenableBridge()
{ }

BFlattenableProxy::~BFlattenableProxy()
{ }

bool BFlattenableProxy::IsFixedSize() const {
	return bind_BFlattenable_IsFixedSize(fBindInstPointer);
}
	
type_code BFlattenableProxy::TypeCode() const {
	return bind_BFlattenable_TypeCode(fBindInstPointer);
}
	
ssize_t BFlattenableProxy::FlattenedSize() const {
	return bind_BFlattenable_FlattenedSize(fBindInstPointer);
}
	
status_t BFlattenableProxy::Flatten(void *buffer, ssize_t size) const {
	return bind_BFlattenable_Flatten(fBindInstPointer, buffer, size);
}
	
bool BFlattenableProxy::AllowsTypeCode(type_code type) const {
	return bind_BFlattenable_AllowsTypeCode(fBindInstPointer, type);
}
	
status_t BFlattenableProxy::Unflatten(type_code type, const void *buffer, ssize_t size) {
	return bind_BFlattenable_Unflatten(fBindInstPointer, type, buffer, size);
}

/* end class BFlattenableProxy */

extern "C" {
	be_BFlattenable * be_BFlattenable_ctor(void *bindInstPointer) {
		return (be_BFlattenable *)new BFlattenableProxy(bindInstPointer);
	}
	
	be_BFlattenable * be_BFlattenable_dtor(void *instPointer) {
		delete (BFlattenableProxy *)instPointer;
	}
	
	bool be_BFlattenable_IsFixedSize(void *instPointer) {
		return ((BFlattenableProxy *)instPointer)->IsFixedSize();
	}
	
	type_code be_BFlattenable_TypeCode(void *instPointer) {
		return ((BFlattenableProxy *)instPointer)->TypeCode();
	}
	
	ssize_t be_BFlattenable_FlattenedSize(void *instPointer) {
		return ((BFlattenableProxy *)instPointer)->FlattenedSize();
	}
	
	status_t be_BFlattenable_Flatten(void *instPointer, void *buffer, ssize_t size) {
		return ((BFlattenableProxy *)instPointer)->Flatten(buffer, size);
	}
	
	bool be_BFlattenable_AllowsTypeCode(void *instPointer, type_code type) {
		return ((BFlattenableProxy *)instPointer)->AllowsTypeCode(type);
	}
	
	status_t be_BFlattenable_Unflatten(void *instPointer, type_code type, const void *buffer, ssize_t size) {
		return ((BFlattenableProxy *)instPointer)->Unflatten(type, buffer, size);
	}
}
