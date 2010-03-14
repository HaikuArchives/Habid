module Support.Flattenable;

import Support.BObject;
import Support.SupportDefs;

import tango.stdc.posix.sys.types;

extern (C) {
	bool bind_BFlattenable_IsFixedSize(void *instPointer) {
		return (cast(BFlattenable)instPointer).IsFixedSize();
	}
	
	type_code bind_BFlattenable_TypeCode(void *instPointer) {
		return (cast(BFlattenable)instPointer).TypeCode();
	}
	
	ssize_t bind_BFlattenable_FlattenedSize(void *instPointer) {
		return (cast(BFlattenable)instPointer).FlattenedSize();
	}
	
	status_t bind_BFlattenable_Flatten(void *instPointer, void *buffer, ssize_t size) {
		return (cast(BFlattenable)instPointer).Flatten(buffer[0..size]);
	}
	
	bool bind_BFlattenable_AllowsTypeCode(void *instPointer, type_code code) {
		return (cast(BFlattenable)instPointer).AllowsTypeCode(code);
	}
	
	status_t bind_BFlattenable_Unflatten(void *instPointer, type_code code, void *buffer, ssize_t size) {
		return (cast(BFlattenable)instPointer).Unflatten(code, buffer[0..size]);
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
	abstract status_t Flatten(void [] buffer);
	abstract status_t Unflatten(type_code type, void [] buffer); 
	
	bool AllowsTypeCode(type_code type) {
		return (TypeCode() == type);
	}
}
