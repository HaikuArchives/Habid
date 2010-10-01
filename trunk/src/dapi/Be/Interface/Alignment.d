/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Alignment;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Interface.InterfaceDefs;

extern (C) extern {
	// BAlignment* be_BAlignment_ctor(void *bindInstPtr);
	void * be_BAlignment_ctor(void *bindInstPtr);

	// BAlignment* be_BAlignment_ctor_1(void *bindInstPtr, const BAlignment* other);
	void * be_BAlignment_ctor_1(void *bindInstPtr, void * other);

	// BAlignment* be_BAlignment_ctor_2(void *bindInstPtr, alignment horizontal, vertical_alignment vertical);
	void * be_BAlignment_ctor_2(void *bindInstPtr, alignment horizontal, vertical_alignment vertical);

	// void be_BAlignment_dtor(BAlignment* self);
	void be_BAlignment_dtor(void* self);

	// alignment be_BAlignment_Horizontal(BAlignment *self);
	alignment be_BAlignment_Horizontal(void *self);

	// vertical_alignment be_BAlignment_Vertical(BAlignment *self);
	vertical_alignment be_BAlignment_Vertical(void *self);

	// float be_BAlignment_RelativeHorizontal(BAlignment *self);
	float be_BAlignment_RelativeHorizontal(void *self);

	// float be_BAlignment_RelativeVertical(BAlignment *self);
	float be_BAlignment_RelativeVertical(void *self);

	// void be_BAlignment_SetHorizontal(BAlignment *self, alignment horizontal);
	void be_BAlignment_SetHorizontal(void *self, alignment horizontal);

	// void be_BAlignment_SetVertical(BAlignment *self, vertical_alignment vertical);
	void be_BAlignment_SetVertical(void *self, vertical_alignment vertical);

	// bool be_BAlignment_IsHorizontalSet(BAlignment *self);
	bool be_BAlignment_IsHorizontalSet(void *self);

	// bool be_BAlignment_IsVerticalSet(BAlignment *self);
	bool be_BAlignment_IsVerticalSet(void *self);

	// bool be_BAlignment_opEquals(BAlignment *self, const BAlignment* other);
	bool be_BAlignment_opEquals(void *self, void * other);

	// bool be_BAlignment_opNotEquals(BAlignment *self, const BAlignment* other);
	bool be_BAlignment_opNotEquals(void *self, void * other);

	// BAlignment* be_BAlignment_opAssign(BAlignment *self, const BAlignment* other);
	void * be_BAlignment_opAssign(void *self, void * other);

	// void be_BAlignment_horizontal_varSet(BAlignment *self, alignment horizontal);
	void be_BAlignment_horizontal_varSet(void *self, alignment horizontal);

	// alignment be_BAlignment_horizontal_varGet(BAlignment *self);
	alignment be_BAlignment_horizontal_varGet(void *self);

	// void be_BAlignment_vertical_varSet(BAlignment *self, vertical_alignment vertical);
	void be_BAlignment_vertical_varSet(void *self, vertical_alignment vertical);

	// vertical_alignment be_BAlignment_vertical_varGet(BAlignment *self);
	vertical_alignment be_BAlignment_vertical_varGet(void *self);

}


extern (C) {
}


interface IBAlignment
{
	// alignment be_BAlignment_Horizontal(BAlignment *self);
	alignment Horizontal();

	// vertical_alignment be_BAlignment_Vertical(BAlignment *self);
	vertical_alignment Vertical();

	// float be_BAlignment_RelativeHorizontal(BAlignment *self);
	float RelativeHorizontal();

	// float be_BAlignment_RelativeVertical(BAlignment *self);
	float RelativeVertical();

	// void be_BAlignment_SetHorizontal(BAlignment *self, alignment horizontal);
	void SetHorizontal(alignment);

	// void be_BAlignment_SetVertical(BAlignment *self, vertical_alignment vertical);
	void SetVertical(vertical_alignment);

	// bool be_BAlignment_IsHorizontalSet(BAlignment *self);
	bool IsHorizontalSet();

	// bool be_BAlignment_IsVerticalSet(BAlignment *self);
	bool IsVerticalSet();

	// bool be_BAlignment_opEquals(BAlignment *self, const BAlignment& other);
	bool opEquals(BAlignment);

	// bool be_BAlignment_opNotEquals(BAlignment *self, const BAlignment& other);
	//bool opNotEquals();

	// BAlignment& be_BAlignment_opAssign(BAlignment *self, const BAlignment& other);
	//BAlignment& opAssign();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

final class BAlignment : IBAlignment
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BAlignment* be_BAlignment_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BAlignment_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BAlignment* be_BAlignment_ctor_1(void *bindInstPtr, const BAlignment* other);
	this(BAlignment other) {
		if(_InstPtr is null) {
			_InstPtr = be_BAlignment_ctor_1(cast(void *)this, other._InstPtr);
			_OwnsPtr = true;
		}
	}

	// BAlignment* be_BAlignment_ctor_2(void *bindInstPtr, alignment horizontal, vertical_alignment vertical);
	this(alignment horizontal, vertical_alignment vertical) {
		if(_InstPtr is null) {
			_InstPtr = be_BAlignment_ctor_2(cast(void *)this, horizontal, vertical);
			_OwnsPtr = true;
		}
	}

	// void be_BAlignment_dtor(BAlignment* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BAlignment_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// alignment be_BAlignment_Horizontal(BAlignment *self);
	alignment Horizontal() {
		return be_BAlignment_Horizontal(_InstPtr());
	}

	// vertical_alignment be_BAlignment_Vertical(BAlignment *self);
	vertical_alignment Vertical() {
		return be_BAlignment_Vertical(_InstPtr());
	}

	// float be_BAlignment_RelativeHorizontal(BAlignment *self);
	float RelativeHorizontal() {
		return be_BAlignment_RelativeHorizontal(_InstPtr());
	}

	// float be_BAlignment_RelativeVertical(BAlignment *self);
	float RelativeVertical() {
		return be_BAlignment_RelativeVertical(_InstPtr());
	}

	// void be_BAlignment_SetHorizontal(BAlignment *self, alignment horizontal);
	void SetHorizontal(alignment horizontal) {
		be_BAlignment_SetHorizontal(_InstPtr(), horizontal);
	}

	// void be_BAlignment_SetVertical(BAlignment *self, vertical_alignment vertical);
	void SetVertical(vertical_alignment vertical) {
		be_BAlignment_SetVertical(_InstPtr(), vertical);
	}

	// bool be_BAlignment_IsHorizontalSet(BAlignment *self);
	bool IsHorizontalSet() {
		return be_BAlignment_IsHorizontalSet(_InstPtr());
	}

	// bool be_BAlignment_IsVerticalSet(BAlignment *self);
	bool IsVerticalSet() {
		return be_BAlignment_IsVerticalSet(_InstPtr());
	}

	// bool be_BAlignment_opEquals(BAlignment *self, const BAlignment& other);
	bool opEquals(BAlignment other) {
		return 	be_BAlignment_opEquals(_InstPtr, other._InstPtr);
	}

	// bool be_BAlignment_opNotEquals(BAlignment *self, const BAlignment& other);
	//bool opNotEquals();

	// BAlignment& be_BAlignment_opAssign(BAlignment *self, const BAlignment& other);
	//BAlignment& opAssign();

	//void be_BAlignment_horizontal_varSet(BAlignment *self, alignment horizontal)
	void horizontal(alignment _horizontal) {
		be_BAlignment_horizontal_varSet(_InstPtr(), _horizontal);
	}

	//alignment be_BAlignment_horizontal_varGet(BAlignment *self)
	alignment horizontal() {
		return be_BAlignment_horizontal_varGet(_InstPtr());
	}

	//void be_BAlignment_vertical_varSet(BAlignment *self, vertical_alignment vertical)
	void vertical(vertical_alignment _vertical) {
		be_BAlignment_vertical_varSet(_InstPtr(), _vertical);
	}

	//vertical_alignment be_BAlignment_vertical_varGet(BAlignment *self)
	vertical_alignment vertical() {
		return be_BAlignment_vertical_varGet(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


