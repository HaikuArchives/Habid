/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Size;


import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

enum {
	B_SIZE_UNSET		= -2,
	B_SIZE_UNLIMITED	= 1024 * 1024 * 1024,
}

extern (C) extern {
	// BSize* be_BSize_ctor(void *bindInstPtr);
	void * be_BSize_ctor(void *bindInstPtr);

	// BSize* be_BSize_ctor_1(void *bindInstPtr, const BSize* other);
	void * be_BSize_ctor_1(void *bindInstPtr, void * other);

	// BSize* be_BSize_ctor_2(void *bindInstPtr, float width, float height);
	void * be_BSize_ctor_2(void *bindInstPtr, float width, float height);

	// void be_BSize_dtor(BSize* self);
	void be_BSize_dtor(void* self);

	// float be_BSize_Width(BSize *self);
	float be_BSize_Width(void *self);

	// float be_BSize_Height(BSize *self);
	float be_BSize_Height(void *self);

	// void be_BSize_Set(BSize *self, float width, float height);
	void be_BSize_Set(void *self, float width, float height);

	// void be_BSize_SetWidth(BSize *self, float width);
	void be_BSize_SetWidth(void *self, float width);

	// void be_BSize_SetHeight(BSize *self, float height);
	void be_BSize_SetHeight(void *self, float height);

	// int32 be_BSize_IntegerWidth(BSize *self);
	int32 be_BSize_IntegerWidth(void *self);

	// int32 be_BSize_IntegerHeight(BSize *self);
	int32 be_BSize_IntegerHeight(void *self);

	// bool be_BSize_IsWidthSet(BSize *self);
	bool be_BSize_IsWidthSet(void *self);

	// bool be_BSize_IsHeightSet(BSize *self);
	bool be_BSize_IsHeightSet(void *self);

	// bool be_BSize_opEquals(BSize *self, const BSize* other);
	bool be_BSize_opEquals(void *self, void * other);

	// bool be_BSize_opNotEquals(BSize *self, const BSize* other);
	bool be_BSize_opNotEquals(void *self, void * other);

	// BSize * be_BSize_opAssign(BSize *self, const BSize* other);
	void * be_BSize_opAssign(void *self, void * other);

	// void be_BSize_width_varSet(BSize *self, float width);
	void be_BSize_width_varSet(void *self, float width);

	// float be_BSize_width_varGet(BSize *self);
	float be_BSize_width_varGet(void *self);

	// void be_BSize_height_varSet(BSize *self, float height);
	void be_BSize_height_varSet(void *self, float height);

	// float be_BSize_height_varGet(BSize *self);
	float be_BSize_height_varGet(void *self);

}


extern (C) {
}


interface IBSize
{
	// float be_BSize_Width(BSize *self);
	float Width();

	// float be_BSize_Height(BSize *self);
	float Height();

	// void be_BSize_Set(BSize *self, float width, float height);
	void Set(float, float);

	// void be_BSize_SetWidth(BSize *self, float width);
	void SetWidth(float);

	// void be_BSize_SetHeight(BSize *self, float height);
	void SetHeight(float);

	// int32 be_BSize_IntegerWidth(BSize *self);
	int32 IntegerWidth();

	// int32 be_BSize_IntegerHeight(BSize *self);
	int32 IntegerHeight();

	// bool be_BSize_IsWidthSet(BSize *self);
	bool IsWidthSet();

	// bool be_BSize_IsHeightSet(BSize *self);
	bool IsHeightSet();

	// bool be_BSize_opEquals(BSize *self, const BSize& other);
	//bool opEquals();

	// bool be_BSize_opNotEquals(BSize *self, const BSize& other);
	//bool opNotEquals();

	// BSize & be_BSize_opAssign(BSize *self, const BSize& other);
	//BSize & opAssign();

	void * _InstPtr();
	bool _OwnsPtr();
}

final class BSize : IBSize
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BSize* be_BSize_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BSize_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BSize* be_BSize_ctor_1(void *bindInstPtr, const BSize* other);
	this(IBSize other) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BSize_ctor_1(cast(void *)this, other._InstPtr());
			fOwnsPointer = true;
		}
	}

	// BSize* be_BSize_ctor_2(void *bindInstPtr, float width, float height);
	this(float width, float height) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BSize_ctor_2(cast(void *)this, width, height);
			fOwnsPointer = true;
		}
	}

	// void be_BSize_dtor(BSize* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BSize_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// float be_BSize_Width(BSize *self);
	float Width() {
		return be_BSize_Width(_InstPtr());
	}

	// float be_BSize_Height(BSize *self);
	float Height() {
		return be_BSize_Height(_InstPtr());
	}

	// void be_BSize_Set(BSize *self, float width, float height);
	void Set(float width, float height) {
		be_BSize_Set(_InstPtr(), width, height);
	}

	// void be_BSize_SetWidth(BSize *self, float width);
	void SetWidth(float width) {
		be_BSize_SetWidth(_InstPtr(), width);
	}

	// void be_BSize_SetHeight(BSize *self, float height);
	void SetHeight(float height) {
		be_BSize_SetHeight(_InstPtr(), height);
	}

	// int32 be_BSize_IntegerWidth(BSize *self);
	int32 IntegerWidth() {
		return be_BSize_IntegerWidth(_InstPtr());
	}

	// int32 be_BSize_IntegerHeight(BSize *self);
	int32 IntegerHeight() {
		return be_BSize_IntegerHeight(_InstPtr());
	}

	// bool be_BSize_IsWidthSet(BSize *self);
	bool IsWidthSet() {
		return be_BSize_IsWidthSet(_InstPtr());
	}

	// bool be_BSize_IsHeightSet(BSize *self);
	bool IsHeightSet() {
		return be_BSize_IsHeightSet(_InstPtr());
	}

	// bool be_BSize_opEquals(BSize *self, const BSize& other);
	//bool opEquals();

	// bool be_BSize_opNotEquals(BSize *self, const BSize& other);
	//bool opNotEquals();

	// BSize & be_BSize_opAssign(BSize *self, const BSize& other);
	//BSize & opAssign();

	//void be_BSize_width_varSet(BSize *self, float width)
	void width(float _width) {
		be_BSize_width_varSet(_InstPtr(), _width);
	}

	//float be_BSize_width_varGet(BSize *self)
	float width() {
		return be_BSize_width_varGet(_InstPtr());
	}

	//void be_BSize_height_varSet(BSize *self, float height)
	void height(float _height) {
		be_BSize_height_varSet(_InstPtr(), _height);
	}

	//float be_BSize_height_varGet(BSize *self)
	float height() {
		return be_BSize_height_varGet(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


