#include <support/Flattenable.h>
#include <hcb-types.h>
#include <stdio.h>

extern "C" {
	bool bind_BFlattenable_IsFixedSize(void *);
	type_code bind_BFlattenable_TypeCode(void *);
	ssize_t bind_BFlattenable_FlattenedSize(void *);
	status_t bind_BFlattenable_Flatten(void *, void *, ssize_t);
	bool bind_BFlattenable_AllowsTypeCode(void *, type_code);
	status_t bind_BFlattenable_Unflatten(void *, type_code, const void *, ssize_t);
}


class BFlattenableBridge : BFlattenable
{
private:
	void *fBindInstPointer;
public:
	BFlattenableBridge(void *bindInstPointer) : fBindInstPointer(bindInstPointer),
												BFlattenable()
	{ }
	
	~BFlattenableBridge()
	{ }
	
	bool IsFixedSize() const {
		return bind_BFlattenable_IsFixedSize(fBindInstPointer);
	}
	
	type_code TypeCode() const {
		return bind_BFlattenable_TypeCode(fBindInstPointer);
	}
	
	ssize_t FlattenedSize() const {
		return bind_BFlattenable_FlattenedSize(fBindInstPointer);
	}
	
	status_t Flatten(void *buffer, ssize_t size) const {
		return bind_BFlattenable_Flatten(fBindInstPointer, buffer, size);
	}
	
	bool AllowsTypeCode(type_code type) const {
		return bind_BFlattenable_AllowsTypeCode(fBindInstPointer, type);
	}
	
	status_t Unflatten(type_code type, const void *buffer, ssize_t size) {
		return bind_BFlattenable_Unflatten(fBindInstPointer, type, buffer, size);
	}
};

extern "C" {
	be_BFlattenable * be_BFlattenable_ctor(void *bindInstPointer) {
		return (be_BFlattenable *)new BFlattenableBridge(bindInstPointer);
	}
	
	be_BFlattenable * be_BFlattenable_dtor(void *instPointer) {
		delete (BFlattenableBridge *)instPointer;
	}
	
	bool be_BFlattenable_IsFixedSize(void *instPointer) {
		return ((BFlattenableBridge *)instPointer)->IsFixedSize();
	}
	
	type_code be_BFlattenable_TypeCode(void *instPointer) {
		return ((BFlattenableBridge *)instPointer)->TypeCode();
	}
	
	ssize_t be_BFlattenable_FlattenedSize(void *instPointer) {
		return ((BFlattenableBridge *)instPointer)->FlattenedSize();
	}
	
	status_t be_BFlattenable_Flatten(void *instPointer, void *buffer, ssize_t size) {
		return ((BFlattenableBridge *)instPointer)->Flatten(buffer, size);
	}
	
	bool be_BFlattenable_AllowsTypeCode(void *instPointer, type_code type) {
		return ((BFlattenableBridge *)instPointer)->AllowsTypeCode(type);
	}
	
	status_t be_BFlattenable_Unflatten(void *instPointer, type_code type, const void *buffer, ssize_t size) {
		return ((BFlattenableBridge *)instPointer)->Unflatten(type, buffer, size);
	}
}
