module Support.Flattenable;

import Support.BObject;
import Support.SupportDefs;

import tango.stdc.posix.sys.types;

extern (C) {
	bool bind_BFlattenable_IsFixedSize(void *) {
		return true;
	}
	
	type_code bind_BFlattenable_TypeCode(void *) {
		return type_code.DUMMY;
	}
	
	ssize_t bind_BFlattenable_FlattenedSize(void *) {
		return 0;
	}
	
	status_t bind_BFlattenable_Flatten(void *, void *, ssize_t) {
		return 0;
	}
	
	bool bind_BFlattenable_AllowsTypeCode(void *, type_code) {
		return 0;
	}
	
	status_t bind_BFlattenable_Unflatten(void *, type_code, void *, ssize_t) {
		return 0;
	}
}

class BFlattenable
{
public:
	this() {
	}
	
	~this() {
	}
	
	abstract bool IsFixedSize();

	abstract type_code TypeCode();

	abstract ssize_t FlattenedSize();
	abstract status_t Flatten(void *buffer, ssize_t size);
	abstract status_t Unflatten(type_code type, void *buffer, ssize_t size); 
	
	bool AllowsTypeCode(type_code type) {
		return (TypeCode() == type);
	}
}
