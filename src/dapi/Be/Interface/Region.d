/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Region;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Interface.Rect;
import Be.Interface.Point;

struct clipping_rect {
	int32	left;
	int32	top;
	int32	right;
	int32	bottom;
}

extern (C) extern {
	// BRegion* be_BRegion_ctor(void *bindInstPtr);
	void * be_BRegion_ctor(void *bindInstPtr);

	// BRegion* be_BRegion_ctor_1(void *bindInstPtr, const BRegion* region);
	void * be_BRegion_ctor_1(void *bindInstPtr, void * region);

	// BRegion* be_BRegion_ctor_2(void *bindInstPtr, const BRect *rect);
	void * be_BRegion_ctor_2(void *bindInstPtr, void *rect);

	// void be_BRegion_dtor(BRegion* self);
	void be_BRegion_dtor(void* self);

	// BRegion * be_BRegion_opAssign(BRegion *self, const BRegion* from);
	void * be_BRegion_opAssign(void *self, void * from);

	// bool be_BRegion_opEquals(BRegion *self, const BRegion* other);
	bool be_BRegion_opEquals(void *self, void * other);

	// void be_BRegion_Set(BRegion *self, BRect *newBounds);
	void be_BRegion_Set(void *self, void *newBounds);

	// void be_BRegion_Set_1(BRegion *self, clipping_rect newBounds);
	void be_BRegion_Set_1(void *self, clipping_rect newBounds);

	// BRect * be_BRegion_Frame(BRegion *self);
	void * be_BRegion_Frame(void *self);

	// clipping_rect be_BRegion_FrameInt(BRegion *self);
	clipping_rect be_BRegion_FrameInt(void *self);

	// BRect * be_BRegion_RectAt(BRegion *self, int32 index);
	void * be_BRegion_RectAt(void *self, int32 index);

	// BRect * be_BRegion_RectAt_1(BRegion *self, int32 index);
	void * be_BRegion_RectAt_1(void *self, int32 index);

	// clipping_rect be_BRegion_RectAtInt(BRegion *self, int32 index);
	clipping_rect be_BRegion_RectAtInt(void *self, int32 index);

	// clipping_rect be_BRegion_RectAtInt_1(BRegion *self, int32 index);
	clipping_rect be_BRegion_RectAtInt_1(void *self, int32 index);

	// int32 be_BRegion_CountRects(BRegion *self);
	int32 be_BRegion_CountRects(void *self);

	// int32 be_BRegion_CountRects_1(BRegion *self);
	int32 be_BRegion_CountRects_1(void *self);

	// bool be_BRegion_Intersects(BRegion *self, BRect *rect);
	bool be_BRegion_Intersects(void *self, void *rect);

	// bool be_BRegion_Intersects_1(BRegion *self, clipping_rect rect);
	bool be_BRegion_Intersects_1(void *self, clipping_rect rect);

	// bool be_BRegion_Contains(BRegion *self, BPoint *point);
	bool be_BRegion_Contains(void *self, void *point);

	// bool be_BRegion_Contains_1(BRegion *self, int32 x, int32 y);
	bool be_BRegion_Contains_1(void *self, int32 x, int32 y);

	// bool be_BRegion_Contains_2(BRegion *self, int32 x, int32 y);
	bool be_BRegion_Contains_2(void *self, int32 x, int32 y);

	// void be_BRegion_PrintToStream(BRegion *self);
	void be_BRegion_PrintToStream(void *self);

	// void be_BRegion_OffsetBy(BRegion *self, int32 x, int32 y);
	void be_BRegion_OffsetBy(void *self, int32 x, int32 y);

	// void be_BRegion_MakeEmpty(BRegion *self);
	void be_BRegion_MakeEmpty(void *self);

	// void be_BRegion_Include(BRegion *self, BRect *rect);
	void be_BRegion_Include(void *self, void *rect);

	// void be_BRegion_Include_1(BRegion *self, clipping_rect rect);
	void be_BRegion_Include_1(void *self, clipping_rect rect);

	// void be_BRegion_Include_2(BRegion *self, const BRegion* region);
	void be_BRegion_Include_2(void *self, void * region);

	// void be_BRegion_Exclude(BRegion *self, BRect *r);
	void be_BRegion_Exclude(void *self, void *r);

	// void be_BRegion_Exclude_1(BRegion *self, clipping_rect r);
	void be_BRegion_Exclude_1(void *self, clipping_rect r);

	// void be_BRegion_Exclude_2(BRegion *self, const BRegion* region);
	void be_BRegion_Exclude_2(void *self, void * region);

	// void be_BRegion_IntersectWith(BRegion *self, const BRegion* region);
	void be_BRegion_IntersectWith(void *self, void * region);

	// void be_BRegion_ExclusiveInclude(BRegion *self, const BRegion* region);
	void be_BRegion_ExclusiveInclude(void *self, void * region);

}


extern (C) {
}


interface IBRegion
{
	// BRegion & be_BRegion_opAssign(BRegion *self, const BRegion& from);
	//BRegion & opAssign();

	// bool be_BRegion_opEquals(BRegion *self, const BRegion& other);
	bool opEquals(BRegion);

	// void be_BRegion_Set(BRegion *self, BRect *newBounds);
	void Set(BRect);

	// void be_BRegion_Set_1(BRegion *self, clipping_rect newBounds);
	void Set(clipping_rect);

	// BRect * be_BRegion_Frame(BRegion *self);
	BRect Frame();

	// clipping_rect be_BRegion_FrameInt(BRegion *self);
	clipping_rect FrameInt();

	// BRect * be_BRegion_RectAt(BRegion *self, int32 index);
	BRect RectAt(int32);

	// BRect * be_BRegion_RectAt_1(BRegion *self, int32 index);
//	BRect RectAt();

	// clipping_rect be_BRegion_RectAtInt(BRegion *self, int32 index);
	clipping_rect RectAtInt(int32);

	// clipping_rect be_BRegion_RectAtInt_1(BRegion *self, int32 index);
//	clipping_rect RectAtInt();

	// int32 be_BRegion_CountRects(BRegion *self);
	int32 CountRects();

	// int32 be_BRegion_CountRects_1(BRegion *self);
//	int32 CountRects();

	// bool be_BRegion_Intersects(BRegion *self, BRect *rect);
	bool Intersects(BRect);

	// bool be_BRegion_Intersects_1(BRegion *self, clipping_rect rect);
	bool Intersects(clipping_rect);

	// bool be_BRegion_Contains(BRegion *self, BPoint *point);
	bool Contains(BPoint);

	// bool be_BRegion_Contains_1(BRegion *self, int32 x, int32 y);
	bool Contains(int32, int32);

	// bool be_BRegion_Contains_2(BRegion *self, int32 x, int32 y);
//	bool Contains();

	// void be_BRegion_PrintToStream(BRegion *self);
	void PrintToStream();

	// void be_BRegion_OffsetBy(BRegion *self, int32 x, int32 y);
	void OffsetBy(int32, int32);

	// void be_BRegion_MakeEmpty(BRegion *self);
	void MakeEmpty();

	// void be_BRegion_Include(BRegion *self, BRect *rect);
	void Include(BRect);

	// void be_BRegion_Include_1(BRegion *self, clipping_rect rect);
	void Include(clipping_rect);

	// void be_BRegion_Include_2(BRegion *self, const BRegion* region);
	void Include(BRegion);

	// void be_BRegion_Exclude(BRegion *self, BRect *r);
	void Exclude(BRect);

	// void be_BRegion_Exclude_1(BRegion *self, clipping_rect r);
	void Exclude(clipping_rect);

	// void be_BRegion_Exclude_2(BRegion *self, const BRegion* region);
	void Exclude(BRegion);

	// void be_BRegion_IntersectWith(BRegion *self, const BRegion* region);
	void IntersectWith(BRegion);

	// void be_BRegion_ExclusiveInclude(BRegion *self, const BRegion* region);
	void ExclusiveInclude(BRegion);

	void * _InstPtr();
	bool _OwnsPtr();
}

final class BRegion : IBRegion
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BRegion* be_BRegion_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BRegion_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BRegion* be_BRegion_ctor_1(void *bindInstPtr, const BRegion* region);
	this(BRegion region) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BRegion_ctor_1(cast(void *)this, region._InstPtr());
			fOwnsPointer = true;
		}
	}

	// BRegion* be_BRegion_ctor_2(void *bindInstPtr, const BRect *rect);
	this(BRect rect) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BRegion_ctor_2(cast(void *)this, rect._InstPtr());
			fOwnsPointer = true;
		}
	}

	// void be_BRegion_dtor(BRegion* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BRegion_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// BRegion & be_BRegion_opAssign(BRegion *self, const BRegion& from);
	//BRegion & opAssign();

	// bool be_BRegion_opEquals(BRegion *self, const BRegion& other);
	bool opEquals(BRegion other) {
		return be_BRegion_opEquals(_InstPtr(), other._InstPtr());	
	}

	// void be_BRegion_Set(BRegion *self, BRect *newBounds);
	void Set(BRect newBounds) {
		be_BRegion_Set(_InstPtr(), newBounds._InstPtr());
	}

	// void be_BRegion_Set_1(BRegion *self, clipping_rect newBounds);
	void Set(clipping_rect newBounds) {
		be_BRegion_Set_1(_InstPtr(), newBounds);
	}

	// BRect * be_BRegion_Frame(BRegion *self);
	BRect Frame() {
		return new BRect(be_BRegion_Frame(_InstPtr()), true);
	}

	// clipping_rect be_BRegion_FrameInt(BRegion *self);
	clipping_rect FrameInt() {
		return be_BRegion_FrameInt(_InstPtr());
	}

	// BRect * be_BRegion_RectAt(BRegion *self, int32 index);
	BRect RectAt(int32 index) {
		return new BRect(be_BRegion_RectAt(_InstPtr(), index), true);
	}

	// BRect * be_BRegion_RectAt_1(BRegion *self, int32 index);
/*
	BRect RectAt() {
		return be_BRegion_RectAt_1(_InstPtr());
	}
*/

	// clipping_rect be_BRegion_RectAtInt(BRegion *self, int32 index);
	clipping_rect RectAtInt(int32 index) {
		return be_BRegion_RectAtInt(_InstPtr(), index);
	}

	// clipping_rect be_BRegion_RectAtInt_1(BRegion *self, int32 index);
/*
	clipping_rect RectAtInt() {
		return be_BRegion_RectAtInt_1(_InstPtr());
	}
*/

	// int32 be_BRegion_CountRects(BRegion *self);
	int32 CountRects() {
		return be_BRegion_CountRects(_InstPtr());
	}

	// int32 be_BRegion_CountRects_1(BRegion *self);
/*
	int32 CountRects() {
		return be_BRegion_CountRects_1(_InstPtr());
	}
*/
	// bool be_BRegion_Intersects(BRegion *self, BRect *rect);
	bool Intersects(BRect rect) {
		return be_BRegion_Intersects(_InstPtr(), rect._InstPtr());
	}

	// bool be_BRegion_Intersects_1(BRegion *self, clipping_rect rect);
	bool Intersects(clipping_rect rect) {
		return be_BRegion_Intersects_1(_InstPtr(), rect);
	}

	// bool be_BRegion_Contains(BRegion *self, BPoint *point);
	bool Contains(BPoint point) {
		return be_BRegion_Contains(_InstPtr(), point._InstPtr());
	}

	// bool be_BRegion_Contains_1(BRegion *self, int32 x, int32 y);
	bool Contains(int32 x, int32 y) {
		return be_BRegion_Contains_1(_InstPtr(), x, y);
	}

	// bool be_BRegion_Contains_2(BRegion *self, int32 x, int32 y);
/*
	bool Contains() {
		return be_BRegion_Contains_2(_InstPtr());
	}
*/

	// void be_BRegion_PrintToStream(BRegion *self);
	void PrintToStream() {
		be_BRegion_PrintToStream(_InstPtr());
	}

	// void be_BRegion_OffsetBy(BRegion *self, int32 x, int32 y);
	void OffsetBy(int32 x, int32 y) {
		be_BRegion_OffsetBy(_InstPtr(), x, y);
	}

	// void be_BRegion_MakeEmpty(BRegion *self);
	void MakeEmpty() {
		be_BRegion_MakeEmpty(_InstPtr());
	}

	// void be_BRegion_Include(BRegion *self, BRect *rect);
	void Include(BRect rect) {
		be_BRegion_Include(_InstPtr(), rect._InstPtr());
	}

	// void be_BRegion_Include_1(BRegion *self, clipping_rect rect);
	void Include(clipping_rect rect) {
		be_BRegion_Include_1(_InstPtr(), rect);
	}

	// void be_BRegion_Include_2(BRegion *self, const BRegion* region);
	void Include(BRegion region) {
		be_BRegion_Include_2(_InstPtr(), region._InstPtr());
	}

	// void be_BRegion_Exclude(BRegion *self, BRect *r);
	void Exclude(BRect rect) {
		be_BRegion_Exclude(_InstPtr(), rect._InstPtr());
	}

	// void be_BRegion_Exclude_1(BRegion *self, clipping_rect r);
	void Exclude(clipping_rect rect) {
		be_BRegion_Exclude_1(_InstPtr(), rect);
	}

	// void be_BRegion_Exclude_2(BRegion *self, const BRegion* region);
	void Exclude(BRegion region) {
		be_BRegion_Exclude_2(_InstPtr(), region._InstPtr());
	}

	// void be_BRegion_IntersectWith(BRegion *self, const BRegion* region);
	void IntersectWith(BRegion region) {
		be_BRegion_IntersectWith(_InstPtr(), region._InstPtr());
	}

	// void be_BRegion_ExclusiveInclude(BRegion *self, const BRegion* region);
	void ExclusiveInclude(BRegion region) {
		be_BRegion_ExclusiveInclude(_InstPtr(), region._InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


