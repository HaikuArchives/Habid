module Support.Flattenable;

import Support.BObject;
import Support.SupportDefs;

import tango.stdc.posix.sys.types;

import Support.types;

extern (C) extern {
	be_BFlattenable * be_BFlattenable_ctor(be_BFlattenable *);
	
	be_BFlattenable * be_BFlattenable_dtor(be_BFlattenable *);
	
	bool be_BFlattenable_AllowsTypeCode_super(be_BFlattenable *, type_code);
}

extern (C) {
	bool bind_BFlattenable_IsFixedSize_pure(be_BFlattenable * instPointer) {
		return (cast(BFlattenable)instPointer).IsFixedSize();
	}
	
	type_code bind_BFlattenable_TypeCode_pure(be_BFlattenable * instPointer) {
		return (cast(BFlattenable)instPointer).TypeCode();
	}
	
	ssize_t bind_BFlattenable_FlattenedSize_pure(be_BFlattenable * instPointer) {
		return (cast(BFlattenable)instPointer).FlattenedSize();
	}
	
	status_t bind_BFlattenable_Flatten_pure(be_BFlattenable * instPointer, void *buffer, ssize_t size) {
		return (cast(BFlattenable)instPointer).Flatten(buffer[0..size]);
	}
	
	bool bind_BFlattenable_AllowsTypeCode_virtual(be_BFlattenable * instPointer, type_code code) {
		return (cast(BFlattenable)instPointer).AllowsTypeCode(code);
	}
	
	status_t bind_BFlattenable_Unflatten_pure(be_BFlattenable * instPointer, type_code code, void *buffer, ssize_t size) {
		return (cast(BFlattenable)instPointer).Unflatten(code, buffer[0..size]);
	}
}

class BFlattenable
{
public:
	mixin(BObject!("be_BFlattenable", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BFlattenable_ctor(cast(be_BFlattenable *)this);
	}
	
	~this() {
		if(fInstancePointer && GetOwnsPointer())
			be_BFlattenable_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	bool IsFixedSize() {
		assert(false, "BFlattenable::IsFixedSize needs to be implemented");
	}

	type_code TypeCode() {
		assert(false, "BFlattenable::TypeCode needs to be implemented");
	}

	ssize_t FlattenedSize() {
		assert(false, "BFlattenable::FlattenedSize needs to be implemented");
		
	}
	
	status_t Flatten(void [] buffer) {
		assert(false, "BFlattenable::Flatten needs to be implemented");
	}
	
	status_t Unflatten(type_code type, void [] buffer) {
		assert(false, "BFlattenable::Unflatten needs to be implemented");
	}
	
	bool AllowsTypeCode(type_code type) {
		return be_BFlattenable_AllowsTypeCode_super(fInstancePointer, type);
	}
}
