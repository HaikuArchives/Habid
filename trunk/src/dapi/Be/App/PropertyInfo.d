/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.PropertyInfo;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;
import Be.Support.Flattenable;

import Be.App.Message;

import tango.stdc.stringz;

struct compound_type {
	struct field_pair {
		const char*	name;
		type_code	type;
	};
	field_pair	pairs[5];
}


struct property_info {
	const char*		name;
	uint32			commands[10];
	uint32			specifiers[10];
	const char*		usage;
	uint32			extra_data;
	uint32			types[10];
	compound_type	ctypes[3];
	uint32			_reserved[10];
}


enum value_kind {
	B_COMMAND_KIND = 0,
	B_TYPE_CODE_KIND = 1
}


struct value_info {
	const char*		name;
	uint32			value;
	value_kind		kind;
	const char*		usage;
	uint32			extra_data;
	uint32			_reserved[10];
}


extern (C) extern {
	// BPropertyInfoProxy * be_BPropertyInfo_ctor(void *bindInstPtr, property_info* prop, value_info* value, bool freeOnDelete);
	void * be_BPropertyInfo_ctor(void *bindInstPtr, property_info* prop, value_info* value, bool freeOnDelete);

	// void be_BPropertyInfo_dtor(BPropertyInfo* self);
	void be_BPropertyInfo_dtor(void* self);

	// int32 be_BPropertyInfo_FindMatch(BPropertyInfoProxy *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data);
	int32 be_BPropertyInfo_FindMatch(void *self, void* msg, int32 index, void* specifier, int32 form,  char* prop, void* data);

	// bool be_BPropertyInfo_IsFixedSize(BPropertyInfoProxy *self);
	bool be_BPropertyInfo_IsFixedSize(void *self);

	// type_code be_BPropertyInfo_TypeCode(BPropertyInfoProxy *self);
	type_code be_BPropertyInfo_TypeCode(void *self);

	// ssize_t be_BPropertyInfo_FlattenedSize(BPropertyInfoProxy *self);
	ssize_t be_BPropertyInfo_FlattenedSize(void *self);

	// status_t be_BPropertyInfo_Flatten(BPropertyInfoProxy *self, void* buffer, ssize_t size);
	status_t be_BPropertyInfo_Flatten(void *self, void* buffer, ssize_t size);

	// bool be_BPropertyInfo_AllowsTypeCode(BPropertyInfoProxy *self, type_code code);
	bool be_BPropertyInfo_AllowsTypeCode(void *self, type_code code);

	// status_t be_BPropertyInfo_Unflatten(BPropertyInfoProxy *self, type_code code, const void* buffer, ssize_t size);
	status_t be_BPropertyInfo_Unflatten(void *self, type_code code,  void* buffer, ssize_t size);

	// const property_info* be_BPropertyInfo_Properties(BPropertyInfoProxy *self);
	property_info* be_BPropertyInfo_Properties(void *self);

	// const value_info* be_BPropertyInfo_Values(BPropertyInfoProxy *self);
	value_info* be_BPropertyInfo_Values(void *self);

	// int32 be_BPropertyInfo_CountProperties(BPropertyInfoProxy *self);
	int32 be_BPropertyInfo_CountProperties(void *self);

	// int32 be_BPropertyInfo_CountValues(BPropertyInfoProxy *self);
	int32 be_BPropertyInfo_CountValues(void *self);

	// void be_BPropertyInfo_PrintToStream(BPropertyInfoProxy *self);
	void be_BPropertyInfo_PrintToStream(void *self);

}


extern (C) {
	int32 bind_BPropertyInfo_FindMatch(void *bindInstPtr, void* msg, int32 index, void* specifier, int32 form,  char* prop, void* data) {
		return (cast(BPropertyInfo)bindInstPtr).FindMatch(new BMessage(msg, false), index, new BMessage(specifier, false), form, fromStringz(prop), data);
	}

	bool bind_BPropertyInfo_IsFixedSize(void *bindInstPtr) {
		return (cast(BPropertyInfo)bindInstPtr).IsFixedSize();
	}

	type_code bind_BPropertyInfo_TypeCode(void *bindInstPtr) {
		return (cast(BPropertyInfo)bindInstPtr).TypeCode();
	}

	ssize_t bind_BPropertyInfo_FlattenedSize(void *bindInstPtr) {
		return (cast(BPropertyInfo)bindInstPtr).FlattenedSize();
	}

	status_t bind_BPropertyInfo_Flatten(void *bindInstPtr, void* buffer, ssize_t size) {
		auto x = buffer[0..size];
		return (cast(BPropertyInfo)bindInstPtr).Flatten(x, size);
	}

	bool bind_BPropertyInfo_AllowsTypeCode(void *bindInstPtr, type_code code) {
		return (cast(BPropertyInfo)bindInstPtr).AllowsTypeCode(code);
	}

	status_t bind_BPropertyInfo_Unflatten(void *bindInstPtr, type_code code,  void* buffer, ssize_t size) {
		return (cast(BPropertyInfo)bindInstPtr).Unflatten(code, buffer[0..size], size);
	}

}


interface IBPropertyInfo
{
	// int32 be_BPropertyInfo_FindMatch(BPropertyInfo *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data);
	int32 FindMatch(BMessage, int32, BMessage, int32, char [], void *);

	// bool be_BPropertyInfo_IsFixedSize(BPropertyInfo *self);
	bool IsFixedSize();

	// type_code be_BPropertyInfo_TypeCode(BPropertyInfo *self);
	type_code TypeCode();

	// ssize_t be_BPropertyInfo_FlattenedSize(BPropertyInfo *self);
	ssize_t FlattenedSize();

	// status_t be_BPropertyInfo_Flatten(BPropertyInfo *self, void* buffer, ssize_t size);
	status_t Flatten(inout void [], ssize_t);

	// bool be_BPropertyInfo_AllowsTypeCode(BPropertyInfo *self, type_code code);
	bool AllowsTypeCode(type_code);

	// status_t be_BPropertyInfo_Unflatten(BPropertyInfo *self, type_code code, const void* buffer, ssize_t size);
	status_t Unflatten(type_code, void [], ssize_t);

	// const property_info* be_BPropertyInfo_Properties(BPropertyInfo *self);
	property_info Properties();

	// const value_info* be_BPropertyInfo_Values(BPropertyInfo *self);
	value_info Values();

	// int32 be_BPropertyInfo_CountProperties(BPropertyInfo *self);
	int32 CountProperties();

	// int32 be_BPropertyInfo_CountValues(BPropertyInfo *self);
	int32 CountValues();

	// void be_BPropertyInfo_PrintToStream(BPropertyInfo *self);
	void PrintToStream();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BPropertyInfo : BFlattenable, IBPropertyInfo
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BPropertyInfoProxy * be_BPropertyInfo_ctor(void *bindInstPtr, property_info* prop, value_info* value, bool freeOnDelete);
	this(property_info prop, value_info value, bool freeOnDelete) {
		if(_InstPtr is null) {
			_InstPtr = be_BPropertyInfo_ctor(cast(void *)this, &prop, &value, false);
			_OwnsPtr = true;
		}
	}

	// void be_BPropertyInfo_dtor(BPropertyInfo* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BPropertyInfo_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// int32 be_BPropertyInfo_FindMatch(BPropertyInfo *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* prop, void* data);
	int32 FindMatch(BMessage msg, int32 index, BMessage specifier, int32 form, char [] prop, void *data) {
		return be_BPropertyInfo_FindMatch(_InstPtr(), msg._InstPtr, index, specifier._InstPtr, form, toStringz(prop), data);
	}

	// bool be_BPropertyInfo_IsFixedSize(BPropertyInfo *self);
	bool IsFixedSize() {
		return be_BPropertyInfo_IsFixedSize(_InstPtr());
	}

	// type_code be_BPropertyInfo_TypeCode(BPropertyInfo *self);
	type_code TypeCode() {
		return be_BPropertyInfo_TypeCode(_InstPtr());
	}

	// ssize_t be_BPropertyInfo_FlattenedSize(BPropertyInfo *self);
	ssize_t FlattenedSize() {
		return be_BPropertyInfo_FlattenedSize(_InstPtr());
	}

	// status_t be_BPropertyInfo_Flatten(BPropertyInfo *self, void* buffer, ssize_t size);
	status_t Flatten(inout void [] buffer, ssize_t size) {
		return be_BPropertyInfo_Flatten(_InstPtr(), buffer.ptr, size);
	}

	// bool be_BPropertyInfo_AllowsTypeCode(BPropertyInfo *self, type_code code);
	bool AllowsTypeCode(type_code code) {
		return be_BPropertyInfo_AllowsTypeCode(_InstPtr(), code);
	}

	// status_t be_BPropertyInfo_Unflatten(BPropertyInfo *self, type_code code, const void* buffer, ssize_t size);
	status_t Unflatten(type_code code, void [] buffer, ssize_t size) {
		return be_BPropertyInfo_Unflatten(_InstPtr(), code, buffer.ptr, size);
	}

	// const property_info* be_BPropertyInfo_Properties(BPropertyInfo *self);
	property_info Properties() {
		return *be_BPropertyInfo_Properties(_InstPtr());
	}

	// const value_info* be_BPropertyInfo_Values(BPropertyInfo *self);
	value_info Values() {
		return *be_BPropertyInfo_Values(_InstPtr());
	}

	// int32 be_BPropertyInfo_CountProperties(BPropertyInfo *self);
	int32 CountProperties() {
		return be_BPropertyInfo_CountProperties(_InstPtr());
	}

	// int32 be_BPropertyInfo_CountValues(BPropertyInfo *self);
	int32 CountValues() {
		return be_BPropertyInfo_CountValues(_InstPtr());
	}

	// void be_BPropertyInfo_PrintToStream(BPropertyInfo *self);
	void PrintToStream() {
		be_BPropertyInfo_PrintToStream(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


