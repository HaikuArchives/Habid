/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Point;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Interface.Rect;
import Be.Interface.Size;

extern (C) extern {
	// BPoint* be_BPoint_ctor(void *bindInstPtr);
	void * be_BPoint_ctor(void *bindInstPtr);

	// BPoint* be_BPoint_ctor_1(void *bindInstPtr, float x, float y);
	void * be_BPoint_ctor_1(void *bindInstPtr, float x, float y);

	// BPoint* be_BPoint_ctor_2(void *bindInstPtr, const BPoint* p);
	void * be_BPoint_ctor_2(void *bindInstPtr, void * p);

	// void be_BPoint_dtor(BPoint* self);
	void be_BPoint_dtor(void* self);

	// BPoint * be_BPoint_opAssign(BPoint *self, const BPoint* other);
	void * be_BPoint_opAssign(void *self, void * other);

	// void be_BPoint_Set(BPoint *self, float x, float y);
	void be_BPoint_Set(void *self, float x, float y);

	// void be_BPoint_ConstrainTo(BPoint *self, BRect *rect);
	void be_BPoint_ConstrainTo(void *self, void *rect);

	// void be_BPoint_PrintToStream(BPoint *self);
	void be_BPoint_PrintToStream(void *self);

	// BPoint * be_BPoint_opSub(BPoint *self);
	void * be_BPoint_opSub(void *self);

	// BPoint * be_BPoint_opAdd(BPoint *self, const BPoint* other);
	void * be_BPoint_opAdd(void *self, void * other);

	// BPoint * be_BPoint_opSub_1(BPoint *self, const BPoint* other);
	void * be_BPoint_opSub_1(void *self, void * other);

	// BPoint * be_BPoint_opAddAssign(BPoint *self, const BPoint* other);
	void * be_BPoint_opAddAssign(void *self, void * other);

	// BPoint * be_BPoint_opSubAssign(BPoint *self, const BPoint* other);
	void * be_BPoint_opSubAssign(void *self, void * other);

	// bool be_BPoint_opNotEquals(BPoint *self, const BPoint* other);
	bool be_BPoint_opNotEquals(void *self, void * other);

	// bool be_BPoint_opEquals(BPoint *self, const BPoint* other);
	bool be_BPoint_opEquals(void *self, void * other);

	// void be_BPoint_x_varSet(BPoint *self, float x);
	void be_BPoint_x_varSet(void *self, float x);

	// float be_BPoint_x_varGet(BPoint *self);
	float be_BPoint_x_varGet(void *self);

	// void be_BPoint_y_varSet(BPoint *self, float y);
	void be_BPoint_y_varSet(void *self, float y);

	// float be_BPoint_y_varGet(BPoint *self);
	float be_BPoint_y_varGet(void *self);

}


extern (C) {
}


interface IBPoint
{
	// BPoint & be_BPoint_opAssign(BPoint *self, const BPoint& other);
	//BPoint & opAssign();

	// void be_BPoint_Set(BPoint *self, float x, float y);
	void Set(float, float);

	// void be_BPoint_ConstrainTo(BPoint *self, BRect *rect);
	void ConstrainTo(IBRect);

	// void be_BPoint_PrintToStream(BPoint *self);
	void PrintToStream();

	// BPoint * be_BPoint_opSub(BPoint *self);
	//BPoint opSub();

	// BPoint * be_BPoint_opAdd(BPoint *self, const BPoint& other);
	//BPoint opAdd();

	// BPoint * be_BPoint_opSub_1(BPoint *self, const BPoint& other);
	//BPoint opSub();

	// BPoint & be_BPoint_opAddAssign(BPoint *self, const BPoint& other);
	//BPoint & opAddAssign();

	// BPoint & be_BPoint_opSubAssign(BPoint *self, const BPoint& other);
	//BPoint & opSubAssign();

	// bool be_BPoint_opNotEquals(BPoint *self, const BPoint& other);
	//bool opNotEquals();

	// bool be_BPoint_opEquals(BPoint *self, const BPoint& other);
	//bool opEquals();

	void * _InstPtr();
	bool _OwnsPtr();
}

final class BPoint : IBPoint
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BPoint* be_BPoint_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPoint_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BPoint* be_BPoint_ctor_1(void *bindInstPtr, float x, float y);
	this(float x, float y) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPoint_ctor_1(cast(void *)this, x, y);
			fOwnsPointer = true;
		}
	}

	// BPoint* be_BPoint_ctor_2(void *bindInstPtr, const BPoint* p);
	this(IBPoint p) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPoint_ctor_2(cast(void *)this, p._InstPtr());
			fOwnsPointer = true;
		}
	}

	// void be_BPoint_dtor(BPoint* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BPoint_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// BPoint & be_BPoint_opAssign(BPoint *self, const BPoint& other);
	//BPoint & opAssign();

	// void be_BPoint_Set(BPoint *self, float x, float y);
	void Set(float x, float y) {
		be_BPoint_Set(_InstPtr(), x, y);
	}

	// void be_BPoint_ConstrainTo(BPoint *self, BRect *rect);
	void ConstrainTo(IBRect rect) {
		be_BPoint_ConstrainTo(_InstPtr(), rect._InstPtr());
	}

	// void be_BPoint_PrintToStream(BPoint *self);
	void PrintToStream() {
		be_BPoint_PrintToStream(_InstPtr());
	}

	// BPoint * be_BPoint_opSub(BPoint *self);
	//BPoint opSub();

	// BPoint * be_BPoint_opAdd(BPoint *self, const BPoint& other);
	//BPoint opAdd();

	// BPoint * be_BPoint_opSub_1(BPoint *self, const BPoint& other);
	//BPoint opSub();

	// BPoint & be_BPoint_opAddAssign(BPoint *self, const BPoint& other);
	//BPoint & opAddAssign();

	// BPoint & be_BPoint_opSubAssign(BPoint *self, const BPoint& other);
	//BPoint & opSubAssign();

	// bool be_BPoint_opNotEquals(BPoint *self, const BPoint& other);
	//bool opNotEquals();

	// bool be_BPoint_opEquals(BPoint *self, const BPoint& other);
	//bool opEquals();

	//void be_BPoint_x_varSet(BPoint *self, float x)
	void x(float _x) {
		be_BPoint_x_varSet(_InstPtr(), _x);
	}

	//float be_BPoint_x_varGet(BPoint *self)
	float x() {
		return be_BPoint_x_varGet(_InstPtr());
	}

	//void be_BPoint_y_varSet(BPoint *self, float y)
	void y(float _y) {
		be_BPoint_y_varSet(_InstPtr(), _y);
	}

	//float be_BPoint_y_varGet(BPoint *self)
	float y() {
		return be_BPoint_y_varGet(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


