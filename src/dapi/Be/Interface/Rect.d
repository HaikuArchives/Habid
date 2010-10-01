/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Rect;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Interface.Point;
import Be.Interface.Size;

extern (C) extern {
	// BRect* be_BRect_ctor(void *bindInstPtr);
	void * be_BRect_ctor(void *bindInstPtr);

	// BRect* be_BRect_ctor_1(void *bindInstPtr, const BRect* other);
	void * be_BRect_ctor_1(void *bindInstPtr, void * other);

	// BRect* be_BRect_ctor_2(void *bindInstPtr, float left, float top, float right, float bottom);
	void * be_BRect_ctor_2(void *bindInstPtr, float left, float top, float right, float bottom);

	// BRect* be_BRect_ctor_3(void *bindInstPtr, BPoint *leftTop, BPoint *rightBottom);
	void * be_BRect_ctor_3(void *bindInstPtr, void *leftTop, void *rightBottom);

	// BRect* be_BRect_ctor_4(void *bindInstPtr, BPoint *leftTop, BSize *size);
	void * be_BRect_ctor_4(void *bindInstPtr, void *leftTop, void *size);

	// void be_BRect_dtor(BRect* self);
	void be_BRect_dtor(void* self);

	// BRect * be_BRect_opAssign(BRect *self, const BRect* other);
	void * be_BRect_opAssign(void *self, void * other);

	// void be_BRect_Set(BRect *self, float left, float top, float right, float bottom);
	void be_BRect_Set(void *self, float left, float top, float right, float bottom);

	// void be_BRect_PrintToStream(BRect *self);
	void be_BRect_PrintToStream(void *self);

	// BPoint * be_BRect_LeftTop(BRect *self);
	void * be_BRect_LeftTop(void *self);

	// BPoint * be_BRect_RightBottom(BRect *self);
	void * be_BRect_RightBottom(void *self);

	// BPoint * be_BRect_LeftBottom(BRect *self);
	void * be_BRect_LeftBottom(void *self);

	// BPoint * be_BRect_RightTop(BRect *self);
	void * be_BRect_RightTop(void *self);

	// void be_BRect_SetLeftTop(BRect *self, const BPoint *leftTop);
	void be_BRect_SetLeftTop(void *self, void *leftTop);

	// void be_BRect_SetRightBottom(BRect *self, const BPoint *rightBottom);
	void be_BRect_SetRightBottom(void *self, void *rightBottom);

	// void be_BRect_SetLeftBottom(BRect *self, const BPoint *leftBottom);
	void be_BRect_SetLeftBottom(void *self, void *leftBottom);

	// void be_BRect_SetRightTop(BRect *self, const BPoint *rightTop);
	void be_BRect_SetRightTop(void *self, void *rightTop);

	// void be_BRect_InsetBy(BRect *self, BPoint *inset);
	void be_BRect_InsetBy(void *self, void *inset);

	// void be_BRect_InsetBy_1(BRect *self, float dx, float dy);
	void be_BRect_InsetBy_1(void *self, float dx, float dy);

	// void be_BRect_OffsetBy(BRect *self, BPoint *delta);
	void be_BRect_OffsetBy(void *self, void *delta);

	// void be_BRect_OffsetBy_1(BRect *self, float dx, float dy);
	void be_BRect_OffsetBy_1(void *self, float dx, float dy);

	// void be_BRect_OffsetTo(BRect *self, BPoint *offset);
	void be_BRect_OffsetTo(void *self, void *offset);

	// void be_BRect_OffsetTo_1(BRect *self, float x, float y);
	void be_BRect_OffsetTo_1(void *self, float x, float y);

	// BRect * be_BRect_InsetBySelf(BRect *self, BPoint *inset);
	void * be_BRect_InsetBySelf(void *self, void *inset);

	// BRect * be_BRect_InsetBySelf_1(BRect *self, float dx, float dy);
	void * be_BRect_InsetBySelf_1(void *self, float dx, float dy);

	// BRect * be_BRect_InsetByCopy(BRect *self, BPoint *inset);
	void * be_BRect_InsetByCopy(void *self, void *inset);

	// BRect * be_BRect_InsetByCopy_1(BRect *self, float dx, float dy);
	void * be_BRect_InsetByCopy_1(void *self, float dx, float dy);

	// BRect * be_BRect_OffsetBySelf(BRect *self, BPoint *offset);
	void * be_BRect_OffsetBySelf(void *self, void *offset);

	// BRect * be_BRect_OffsetBySelf_1(BRect *self, float dx, float dy);
	void * be_BRect_OffsetBySelf_1(void *self, float dx, float dy);

	// BRect * be_BRect_OffsetByCopy(BRect *self, BPoint *offset);
	void * be_BRect_OffsetByCopy(void *self, void *offset);

	// BRect * be_BRect_OffsetByCopy_1(BRect *self, float dx, float dy);
	void * be_BRect_OffsetByCopy_1(void *self, float dx, float dy);

	// BRect * be_BRect_OffsetToSelf(BRect *self, BPoint *offset);
	void * be_BRect_OffsetToSelf(void *self, void *offset);

	// BRect * be_BRect_OffsetToSelf_1(BRect *self, float dx, float dy);
	void * be_BRect_OffsetToSelf_1(void *self, float dx, float dy);

	// BRect * be_BRect_OffsetToCopy(BRect *self, BPoint *offset);
	void * be_BRect_OffsetToCopy(void *self, void *offset);

	// BRect * be_BRect_OffsetToCopy_1(BRect *self, float dx, float dy);
	void * be_BRect_OffsetToCopy_1(void *self, float dx, float dy);

	// bool be_BRect_opEquals(BRect *self, BRect *r);
	bool be_BRect_opEquals(void *self, void *r);

	// bool be_BRect_opNotEquals(BRect *self, BRect *r);
	bool be_BRect_opNotEquals(void *self, void *r);

	// BRect * be_BRect_opAnd(BRect *self, BRect *r);
	void * be_BRect_opAnd(void *self, void *r);

	// BRect * be_BRect_opOr(BRect *self, BRect *r);
	void * be_BRect_opOr(void *self, void *r);

	// bool be_BRect_IsValid(BRect *self);
	bool be_BRect_IsValid(void *self);

	// float be_BRect_Width(BRect *self);
	float be_BRect_Width(void *self);

	// int32 be_BRect_IntegerWidth(BRect *self);
	int32 be_BRect_IntegerWidth(void *self);

	// float be_BRect_Height(BRect *self);
	float be_BRect_Height(void *self);

	// int32 be_BRect_IntegerHeight(BRect *self);
	int32 be_BRect_IntegerHeight(void *self);

	// BSize * be_BRect_Size(BRect *self);
	void * be_BRect_Size(void *self);

	// bool be_BRect_Intersects(BRect *self, BRect *r);
	bool be_BRect_Intersects(void *self, void *r);

	// bool be_BRect_Contains(BRect *self, BPoint *p);
	bool be_BRect_Contains(void *self, void *p);

	// bool be_BRect_Contains_1(BRect *self, BRect *r);
	bool be_BRect_Contains_1(void *self, void *r);

	// void be_BRect_left_varSet(BRect *self, float left);
	void be_BRect_left_varSet(void *self, float left);

	// float be_BRect_left_varGet(BRect *self);
	float be_BRect_left_varGet(void *self);

	// void be_BRect_top_varSet(BRect *self, float top);
	void be_BRect_top_varSet(void *self, float top);

	// float be_BRect_top_varGet(BRect *self);
	float be_BRect_top_varGet(void *self);

	// void be_BRect_right_varSet(BRect *self, float right);
	void be_BRect_right_varSet(void *self, float right);

	// float be_BRect_right_varGet(BRect *self);
	float be_BRect_right_varGet(void *self);

	// void be_BRect_bottom_varSet(BRect *self, float bottom);
	void be_BRect_bottom_varSet(void *self, float bottom);

	// float be_BRect_bottom_varGet(BRect *self);
	float be_BRect_bottom_varGet(void *self);

}


extern (C) {
}


interface IBRect
{

	// BRect & be_BRect_opAssign(BRect *self, const BRect& other);
	//BRect & opAssign();

	// void be_BRect_Set(BRect *self, float left, float top, float right, float bottom);
	void Set(float, float, float, float);

	// void be_BRect_PrintToStream(BRect *self);
	void PrintToStream();

	// BPoint * be_BRect_LeftTop(BRect *self);
	BPoint LeftTop();

	// BPoint * be_BRect_RightBottom(BRect *self);
	BPoint RightBottom();

	// BPoint * be_BRect_LeftBottom(BRect *self);
	BPoint LeftBottom();

	// BPoint * be_BRect_RightTop(BRect *self);
	BPoint RightTop();

	// void be_BRect_SetLeftTop(BRect *self, const BPoint *leftTop);
	void SetLeftTop(IBPoint);
	// void be_BRect_SetRightBottom(BRect *self, const BPoint *rightBottom);
	void SetRightBottom(IBPoint);

	// void be_BRect_SetLeftBottom(BRect *self, const BPoint *leftBottom);
	void SetLeftBottom(IBPoint);

	// void be_BRect_SetRightTop(BRect *self, const BPoint *rightTop);
	void SetRightTop(IBPoint);

	// void be_BRect_InsetBy(BRect *self, BPoint *inset);
	void InsetBy(IBPoint);

	// void be_BRect_InsetBy_1(BRect *self, float dx, float dy);
	void InsetBy(float, float);

	// void be_BRect_OffsetBy(BRect *self, BPoint *delta);
	void OffsetBy(IBPoint);

	// void be_BRect_OffsetBy_1(BRect *self, float dx, float dy);
	void OffsetBy(float, float);

	// void be_BRect_OffsetTo(BRect *self, BPoint *offset);
	void OffsetTo(IBPoint);

	// void be_BRect_OffsetTo_1(BRect *self, float x, float y);
	void OffsetTo(float, float);

	// BRect & be_BRect_InsetBySelf(BRect *self, BPoint *inset);
	BRect InsetBySelf(IBPoint);

	// BRect & be_BRect_InsetBySelf_1(BRect *self, float dx, float dy);
	BRect InsetBySelf(float, float);

	// BRect * be_BRect_InsetByCopy(BRect *self, BPoint *inset);
	BRect InsetByCopy(IBPoint);

	// BRect * be_BRect_InsetByCopy_1(BRect *self, float dx, float dy);
	BRect InsetByCopy(float, float);

	// BRect & be_BRect_OffsetBySelf(BRect *self, BPoint *offset);
	BRect OffsetBySelf(IBPoint);

	// BRect & be_BRect_OffsetBySelf_1(BRect *self, float dx, float dy);
	BRect OffsetBySelf(float, float);

	// BRect * be_BRect_OffsetByCopy(BRect *self, BPoint *offset);
	BRect OffsetByCopy(IBPoint);

	// BRect * be_BRect_OffsetByCopy_1(BRect *self, float dx, float dy);
	BRect OffsetByCopy(float, float);

	// BRect & be_BRect_OffsetToSelf(BRect *self, BPoint *offset);
	BRect OffsetToSelf(IBPoint);

	// BRect & be_BRect_OffsetToSelf_1(BRect *self, float dx, float dy);
	BRect OffsetToSelf(float, float);

	// BRect * be_BRect_OffsetToCopy(BRect *self, BPoint *offset);
	BRect OffsetToCopy(IBPoint);

	// BRect * be_BRect_OffsetToCopy_1(BRect *self, float dx, float dy);
	BRect OffsetToCopy(float, float);

	// bool be_BRect_opEquals(BRect *self, BRect *r);
	//bool opEquals();

	// bool be_BRect_opNotEquals(BRect *self, BRect *r);
	//bool opNotEquals();

	// BRect * be_BRect_opAnd(BRect *self, BRect *r);
	//BRect opAnd();

	// BRect * be_BRect_opOr(BRect *self, BRect *r);
	//BRect opOr();

	// bool be_BRect_IsValid(BRect *self);
	bool IsValid();

	// float be_BRect_Width(BRect *self);
	float Width();

	// int32 be_BRect_IntegerWidth(BRect *self);
	int32 IntegerWidth();

	// float be_BRect_Height(BRect *self);
	float Height();

	// int32 be_BRect_IntegerHeight(BRect *self);
	int32 IntegerHeight();

	// BSize * be_BRect_Size(BRect *self);
	BSize Size();

	// bool be_BRect_Intersects(BRect *self, BRect *r);
	bool Intersects(IBRect);

	// bool be_BRect_Contains(BRect *self, BPoint *p);
	bool Contains(IBPoint);

	// bool be_BRect_Contains_1(BRect *self, BRect *r);
	bool Contains(IBRect);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);

}

final class BRect : IBRect
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BRect* be_BRect_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BRect_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BRect* be_BRect_ctor_1(void *bindInstPtr, const BRect* other);
	this(IBRect other) {
		if(_InstPtr is null) {
			_InstPtr = be_BRect_ctor_1(cast(void *)this, other._InstPtr());
			_OwnsPtr = true;
		}
	}

	// BRect* be_BRect_ctor_2(void *bindInstPtr, float left, float top, float right, float bottom);
	this(float left, float top, float right, float bottom) {
		if(_InstPtr is null) {
			_InstPtr = be_BRect_ctor_2(cast(void *)this, left, top, right, bottom);
			_OwnsPtr = true;
		}
	}

	// BRect* be_BRect_ctor_3(void *bindInstPtr, BPoint *leftTop, BPoint *rightBottom);
	this(IBPoint leftTop, IBPoint rightBottom) {
		if(_InstPtr is null) {
			_InstPtr = be_BRect_ctor_3(cast(void *)this, leftTop._InstPtr(), rightBottom._InstPtr());
			_OwnsPtr = true;
		}
	}

	// BRect* be_BRect_ctor_4(void *bindInstPtr, BPoint *leftTop, BSize *size);
	this(IBPoint leftTop, IBSize size) {
		if(_InstPtr is null) {
			_InstPtr = be_BRect_ctor_4(cast(void *)this, leftTop._InstPtr(), size._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BRect_dtor(BRect* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BRect_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// BRect & be_BRect_opAssign(BRect *self, const BRect& other);
	//BRect & opAssign();

	// void be_BRect_Set(BRect *self, float left, float top, float right, float bottom);
	void Set(float left, float top, float right, float bottom) {
		be_BRect_Set(_InstPtr(), left, top, right, bottom);
	}

	// void be_BRect_PrintToStream(BRect *self);
	void PrintToStream() {
		be_BRect_PrintToStream(_InstPtr());
	}

	// BPoint * be_BRect_LeftTop(BRect *self);
	BPoint LeftTop() {
		return new BPoint(be_BRect_LeftTop(_InstPtr()), true);
	}

	// BPoint * be_BRect_RightBottom(BRect *self);
	BPoint RightBottom() {
		return new BPoint(be_BRect_RightBottom(_InstPtr()), true);
	}

	// BPoint * be_BRect_LeftBottom(BRect *self);
	BPoint LeftBottom() {
		return new BPoint(be_BRect_LeftBottom(_InstPtr()), true);
	}

	// BPoint * be_BRect_RightTop(BRect *self);
	BPoint RightTop() {
		return new BPoint(be_BRect_RightTop(_InstPtr()), true);
	}

	// void be_BRect_SetLeftTop(BRect *self, const BPoint *leftTop);
	void SetLeftTop(IBPoint leftTop) {
		be_BRect_SetLeftTop(_InstPtr(), leftTop._InstPtr());
	}

	// void be_BRect_SetRightBottom(BRect *self, const BPoint *rightBottom);
	void SetRightBottom(IBPoint rightBottom) {
		be_BRect_SetRightBottom(_InstPtr(), rightBottom._InstPtr());
	}

	// void be_BRect_SetLeftBottom(BRect *self, const BPoint *leftBottom);
	void SetLeftBottom(IBPoint leftBottom) {
		be_BRect_SetLeftBottom(_InstPtr(), leftBottom._InstPtr());
	}

	// void be_BRect_SetRightTop(BRect *self, const BPoint *rightTop);
	void SetRightTop(IBPoint rightTop) {
		be_BRect_SetRightTop(_InstPtr(), rightTop._InstPtr());
	}

	// void be_BRect_InsetBy(BRect *self, BPoint *inset);
	void InsetBy(IBPoint inset) {
		be_BRect_InsetBy(_InstPtr(), inset._InstPtr());
	}

	// void be_BRect_InsetBy_1(BRect *self, float dx, float dy);
	void InsetBy(float dx, float dy) {
		be_BRect_InsetBy_1(_InstPtr(), dx, dy);
	}

	// void be_BRect_OffsetBy(BRect *self, BPoint *delta);
	void OffsetBy(IBPoint delta) {
		be_BRect_OffsetBy(_InstPtr(), delta._InstPtr());
	}

	// void be_BRect_OffsetBy_1(BRect *self, float dx, float dy);
	void OffsetBy(float dx, float dy) {
		be_BRect_OffsetBy_1(_InstPtr(), dx, dy);
	}

	// void be_BRect_OffsetTo(BRect *self, BPoint *offset);
	void OffsetTo(IBPoint offset) {
		be_BRect_OffsetTo(_InstPtr(), offset._InstPtr());
	}

	// void be_BRect_OffsetTo_1(BRect *self, float x, float y);
	void OffsetTo(float x, float y) {
		be_BRect_OffsetTo_1(_InstPtr(), x, y);
	}

	// BRect & be_BRect_InsetBySelf(BRect *self, BPoint *inset);
	BRect InsetBySelf(IBPoint inset) {
		be_BRect_InsetBySelf(_InstPtr(), inset._InstPtr());
		return this;
	}

	// BRect & be_BRect_InsetBySelf_1(BRect *self, float dx, float dy);
	BRect InsetBySelf(float dx, float dy) {
		be_BRect_InsetBySelf_1(_InstPtr(), dx, dy);
		return this;
	}

	// BRect * be_BRect_InsetByCopy(BRect *self, BPoint *inset);
	BRect InsetByCopy(IBPoint inset) {
		return new BRect(be_BRect_InsetByCopy(_InstPtr(), inset._InstPtr()), true);
	}

	// BRect * be_BRect_InsetByCopy_1(BRect *self, float dx, float dy);
	BRect InsetByCopy(float dx, float dy) {
		return new BRect(be_BRect_InsetByCopy_1(_InstPtr(), dx, dy), true);
	}

	// BRect & be_BRect_OffsetBySelf(BRect *self, BPoint *offset);
	BRect OffsetBySelf(IBPoint offset) {
		be_BRect_OffsetBySelf(_InstPtr(), offset._InstPtr());
		return this;
	}

	// BRect & be_BRect_OffsetBySelf_1(BRect *self, float dx, float dy);
	BRect OffsetBySelf(float dx, float dy) {
		be_BRect_OffsetBySelf_1(_InstPtr(), dx, dy);
		return this;
	}

	// BRect * be_BRect_OffsetByCopy(BRect *self, BPoint *offset);
	BRect OffsetByCopy(IBPoint offset) {
		return new BRect(be_BRect_OffsetByCopy(_InstPtr(), offset._InstPtr()), true);
	}

	// BRect * be_BRect_OffsetByCopy_1(BRect *self, float dx, float dy);
	BRect OffsetByCopy(float dx, float dy) {
		return new BRect(be_BRect_OffsetByCopy_1(_InstPtr(), dx, dy), true);
	}

	// BRect & be_BRect_OffsetToSelf(BRect *self, BPoint *offset);
	BRect OffsetToSelf(IBPoint offset) {
		be_BRect_OffsetToSelf(_InstPtr(), offset._InstPtr());
		return this;
	}

	// BRect & be_BRect_OffsetToSelf_1(BRect *self, float dx, float dy);
	BRect OffsetToSelf(float dx, float dy) {
		be_BRect_OffsetToSelf_1(_InstPtr(), dx, dy);
		return this;
	}

	// BRect * be_BRect_OffsetToCopy(BRect *self, BPoint *offset);
	BRect OffsetToCopy(IBPoint offset) {
		return new BRect(be_BRect_OffsetToCopy(_InstPtr(), offset._InstPtr()), true);
	}

	// BRect * be_BRect_OffsetToCopy_1(BRect *self, float dx, float dy);
	BRect OffsetToCopy(float dx, float dy) {
		return new BRect(be_BRect_OffsetToCopy_1(_InstPtr(), dx, dy), true);
	}

	// bool be_BRect_opEquals(BRect *self, BRect *r);
	//bool opEquals();

	// bool be_BRect_opNotEquals(BRect *self, BRect *r);
	//bool opNotEquals();

	// BRect * be_BRect_opAnd(BRect *self, BRect *r);
	//BRect opAnd();

	// BRect * be_BRect_opOr(BRect *self, BRect *r);
	//BRect opOr();

	// bool be_BRect_IsValid(BRect *self);
	bool IsValid() {
		return be_BRect_IsValid(_InstPtr());
	}

	// float be_BRect_Width(BRect *self);
	float Width() {
		return be_BRect_Width(_InstPtr());
	}

	// int32 be_BRect_IntegerWidth(BRect *self);
	int32 IntegerWidth() {
		return be_BRect_IntegerWidth(_InstPtr());
	}

	// float be_BRect_Height(BRect *self);
	float Height() {
		return be_BRect_Height(_InstPtr());
	}

	// int32 be_BRect_IntegerHeight(BRect *self);
	int32 IntegerHeight() {
		return be_BRect_IntegerHeight(_InstPtr());
	}

	// BSize * be_BRect_Size(BRect *self);
	BSize Size() {
		return new BSize(be_BRect_Size(_InstPtr()), true);
	}

	// bool be_BRect_Intersects(BRect *self, BRect *r);
	bool Intersects(IBRect r) {
		return be_BRect_Intersects(_InstPtr(), r._InstPtr());
	}

	// bool be_BRect_Contains(BRect *self, BPoint *p);
	bool Contains(IBPoint p) {
		return be_BRect_Contains(_InstPtr(), p._InstPtr());
	}

	// bool be_BRect_Contains_1(BRect *self, BRect *r);
	bool Contains(IBRect r) {
		return be_BRect_Contains_1(_InstPtr(), r._InstPtr());
	}

	//void be_BRect_left_varSet(BRect *self, float left)
	void left(float _left) {
		be_BRect_left_varSet(_InstPtr(), _left);
	}

	//float be_BRect_left_varGet(BRect *self)
	float left() {
		return be_BRect_left_varGet(_InstPtr());
	}

	//void be_BRect_top_varSet(BRect *self, float top)
	void top(float _top) {
		be_BRect_top_varSet(_InstPtr(), _top);
	}

	//float be_BRect_top_varGet(BRect *self)
	float top() {
		return be_BRect_top_varGet(_InstPtr());
	}

	//void be_BRect_right_varSet(BRect *self, float right)
	void right(float _right) {
		be_BRect_right_varSet(_InstPtr(), _right);
	}

	//float be_BRect_right_varGet(BRect *self)
	float right() {
		return be_BRect_right_varGet(_InstPtr());
	}

	//void be_BRect_bottom_varSet(BRect *self, float bottom)
	void bottom(float _bottom) {
		be_BRect_bottom_varSet(_InstPtr(), _bottom);
	}

	//float be_BRect_bottom_varGet(BRect *self)
	float bottom() {
		return be_BRect_bottom_varGet(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


