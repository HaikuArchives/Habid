module Support.Flattenable;

import Support.BObject;
import Support.SupportDefs;

import tango.stdc.posix.sys.types;

extern (C) extern {
	void * be_BFlattenable_ctor(void *);
	
	void * be_BFlattenable_dtor(void *);
	
	bool be_BFlattenable_AllowsTypeCode(void *, type_code);

	bool be_BFlattenable_AllowsTypeCode_super(void *, type_code);
}

extern (C) {
	bool bind_BFlattenable_IsFixedSize_pure(void *instPointer) {
		return (cast(BFlattenable)instPointer).IsFixedSize();
	}
	
	type_code bind_BFlattenable_TypeCode_pure(void *instPointer) {
		return (cast(BFlattenable)instPointer).TypeCode();
	}
	
	ssize_t bind_BFlattenable_FlattenedSize_pure(void *instPointer) {
		return (cast(BFlattenable)instPointer).FlattenedSize();
	}
	
	status_t bind_BFlattenable_Flatten_pure(void *instPointer, void *buffer, ssize_t size) {
		return (cast(BFlattenable)instPointer).Flatten(buffer[0..size]);
	}
	
	bool bind_BFlattenable_AllowsTypeCode_virtual(void *instPointer, type_code code) {
		return (cast(BFlattenable)instPointer).AllowsTypeCode(code);
	}
	
	status_t bind_BFlattenable_Unflatten_pure(void *instPointer, type_code code, void *buffer, ssize_t size) {
		return (cast(BFlattenable)instPointer).Unflatten(code, buffer[0..size]);
	}
}

class BFlattenable
{
public:
	mixin BObject;
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BFlattenable_ctor(cast(void *)this);
	}
	
	~this() {
		if(fInstancePointer)
			be_BFlattenable_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	abstract bool IsFixedSize();

	abstract type_code TypeCode();

	abstract ssize_t FlattenedSize();
	abstract status_t Flatten(void [] buffer);
	abstract status_t Unflatten(type_code type, void [] buffer); 
	
	bool AllowsTypeCode(type_code type) {
		return be_BFlattenable_AllowsTypeCode_super(fInstancePointer, type);
	}
}
