/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.Flattenable;


import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

extern (C) extern {
	// BFlattenableProxy * be_BFlattenable_ctor(void *bindInstPtr);
	void * be_BFlattenable_ctor(void *bindInstPtr);

	// void be_BFlattenable_dtor(BFlattenable* self);
	void be_BFlattenable_dtor(void* self);

	// bool be_BFlattenable_IsFixedSize(BFlattenableProxy *self);
	bool be_BFlattenable_IsFixedSize(void *self);

	// type_code be_BFlattenable_TypeCode(BFlattenableProxy *self);
	type_code be_BFlattenable_TypeCode(void *self);

	// ssize_t be_BFlattenable_FlattenedSize(BFlattenableProxy *self);
	ssize_t be_BFlattenable_FlattenedSize(void *self);

	// status_t be_BFlattenable_Flatten(BFlattenableProxy *self, void * buffer, ssize_t size);
	status_t be_BFlattenable_Flatten(void *self, void * buffer, ssize_t size);

	// bool be_BFlattenable_AllowsTypeCode(BFlattenableProxy *self, type_code code);
	bool be_BFlattenable_AllowsTypeCode(void *self, type_code code);

	// status_t be_BFlattenable_Unflatten(BFlattenableProxy *self, type_code code, const void * buffer, ssize_t size);
	status_t be_BFlattenable_Unflatten(void *self, type_code code,  void * buffer, ssize_t size);

}


extern (C) {
	bool bind_BFlattenable_IsFixedSize(void *bindInstPtr) {
		return (cast(BFlattenable)bindInstPtr).IsFixedSize();
	}

	type_code bind_BFlattenable_TypeCode(void *bindInstPtr) {
		return (cast(BFlattenable)bindInstPtr).TypeCode();
	}

	ssize_t bind_BFlattenable_FlattenedSize(void *bindInstPtr) {
		return (cast(BFlattenable)bindInstPtr).FlattenedSize();
	}

	status_t bind_BFlattenable_Flatten(void *bindInstPtr, void * buffer, ssize_t size) {
		auto x = buffer[0..size];
		return (cast(BFlattenable)bindInstPtr).Flatten(x, size);
	}

	bool bind_BFlattenable_AllowsTypeCode(void *bindInstPtr, type_code code) {
		return (cast(BFlattenable)bindInstPtr).AllowsTypeCode(code);
	}

	status_t bind_BFlattenable_Unflatten(void *bindInstPtr, type_code code,  void * buffer, ssize_t size) {
		return (cast(BFlattenable)bindInstPtr).Unflatten(code, buffer[0..size], size);
	}

}


interface IBFlattenable
{
	// bool be_BFlattenable_IsFixedSize(BFlattenable *self);
	bool IsFixedSize();

	// type_code be_BFlattenable_TypeCode(BFlattenable *self);
	type_code TypeCode();

	// ssize_t be_BFlattenable_FlattenedSize(BFlattenable *self);
	ssize_t FlattenedSize();

	// status_t be_BFlattenable_Flatten(BFlattenable *self, void * buffer, ssize_t size);
	status_t Flatten(inout void [], ssize_t);

	// bool be_BFlattenable_AllowsTypeCode(BFlattenable *self, type_code code);
	bool AllowsTypeCode(type_code);

	// status_t be_BFlattenable_Unflatten(BFlattenable *self, type_code code, const void * buffer, ssize_t size);
	status_t Unflatten(type_code, void [], ssize_t);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

abstract class BFlattenable : IBFlattenable
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BFlattenableProxy * be_BFlattenable_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BFlattenable_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// void be_BFlattenable_dtor(BFlattenable* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BFlattenable_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// bool be_BFlattenable_IsFixedSize(BFlattenable *self);
	abstract bool IsFixedSize();

	// type_code be_BFlattenable_TypeCode(BFlattenable *self);
	abstract type_code TypeCode();

	// ssize_t be_BFlattenable_FlattenedSize(BFlattenable *self);
	abstract ssize_t FlattenedSize();

	// status_t be_BFlattenable_Flatten(BFlattenable *self, void * buffer, ssize_t size);
	abstract status_t Flatten(inout void [] buffer, ssize_t size);

	// bool be_BFlattenable_AllowsTypeCode(BFlattenable *self, type_code code);
	abstract bool AllowsTypeCode(type_code code);

	// status_t be_BFlattenable_Unflatten(BFlattenable *self, type_code code, const void * buffer, ssize_t size);
	abstract status_t Unflatten(type_code code, void [] buffer, ssize_t size);

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


