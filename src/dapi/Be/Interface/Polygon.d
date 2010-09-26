/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Polygon;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;


import Be.Interface.Point;
import Be.Interface.Rect;

extern (C) extern {
	// BPolygon* be_BPolygon_ctor(void *bindInstPtr);
	void * be_BPolygon_ctor(void *bindInstPtr);

	// BPolygon* be_BPolygon_ctor_1(void *bindInstPtr, const BPoint* points, int32 count);
	void * be_BPolygon_ctor_1(void *bindInstPtr, void * points, int32 count);

	// BPolygon* be_BPolygon_ctor_2(void *bindInstPtr, const BPolygon* other);
	void * be_BPolygon_ctor_2(void *bindInstPtr, void * other);

	// BPolygon* be_BPolygon_ctor_3(void *bindInstPtr, const BPolygon* other);
	void * be_BPolygon_ctor_3(void *bindInstPtr, void * other);

	// void be_BPolygon_dtor(BPolygon* self);
	void be_BPolygon_dtor(void* self);

	// BPolygon * be_BPolygon_opAssign(BPolygon *self, const BPolygon* other);
	void * be_BPolygon_opAssign(void *self, void * other);

	// BRect * be_BPolygon_Frame(BPolygon *self);
	void * be_BPolygon_Frame(void *self);

	// void be_BPolygon_AddPoints(BPolygon *self, const BPoint* points, int32 count);
	void be_BPolygon_AddPoints(void *self, void * points, int32 count);

	// int32 be_BPolygon_CountPoints(BPolygon *self);
	int32 be_BPolygon_CountPoints(void *self);

	// void be_BPolygon_MapTo(BPolygon *self, BRect *srcRect, BRect *dstRect);
	void be_BPolygon_MapTo(void *self, void *srcRect, void *dstRect);

	// void be_BPolygon_PrintToStream(BPolygon *self);
	void be_BPolygon_PrintToStream(void *self);

}


extern (C) {
}


interface IBPolygon
{
	// BPolygon & be_BPolygon_opAssign(BPolygon *self, const BPolygon& other);
	//BPolygon & opAssign();

	// BRect * be_BPolygon_Frame(BPolygon *self);
	BRect Frame();

	// void be_BPolygon_AddPoints(BPolygon *self, const BPoint* points, int32 count);
//	void AddPoints(IBPoint [] points, int32 count);

	// int32 be_BPolygon_CountPoints(BPolygon *self);
	int32 CountPoints();

	// void be_BPolygon_MapTo(BPolygon *self, BRect *srcRect, BRect *dstRect);
	void MapTo(BRect srcRect, BRect dstRect);

	// void be_BPolygon_PrintToStream(BPolygon *self);
	void PrintToStream();

	void * _InstPtr();
	bool _OwnsPtr();
}

final class BPolygon : IBPolygon
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BPolygon* be_BPolygon_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPolygon_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BPolygon* be_BPolygon_ctor_1(void *bindInstPtr, const BPoint* points, int32 count);
/*
	this(IBPoint [] points, int32 count) {
		if(fInstancePointer is null) {
			void * [] ptrList;
			foreach(point; points)
				ptrList ~= point._InstPtr();
				
			fInstancePointer = be_BPolygon_ctor_1(cast(void *)this, ptrList.ptr, count);
			fOwnsPointer = true;
		}
	}
*/
	// BPolygon* be_BPolygon_ctor_2(void *bindInstPtr, const BPolygon* other);
	this(BPolygon other) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPolygon_ctor_2(cast(void *)this, other._InstPtr());
			fOwnsPointer = true;
		}
	}

	// BPolygon* be_BPolygon_ctor_3(void *bindInstPtr, const BPolygon* other);
/*
	this(IBPolygon other) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BPolygon_ctor_3(cast(void *)this);
			fOwnsPointer = true;
		}
	}
*/
	// void be_BPolygon_dtor(BPolygon* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BPolygon_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// BPolygon & be_BPolygon_opAssign(BPolygon *self, const BPolygon& other);
	//BPolygon & opAssign();

	// BRect * be_BPolygon_Frame(BPolygon *self);
	BRect Frame() {
		return new BRect(be_BPolygon_Frame(_InstPtr()), true);
	}

	// void be_BPolygon_AddPoints(BPolygon *self, const BPoint* points, int32 count);
/*
	void AddPoints(IBPoint [] points, int32 count) {
		be_BPolygon_AddPoints(_InstPtr(), ptrList.ptr, count);
	}
*/
	// int32 be_BPolygon_CountPoints(BPolygon *self);
	int32 CountPoints() {
		return be_BPolygon_CountPoints(_InstPtr());
	}

	// void be_BPolygon_MapTo(BPolygon *self, BRect *srcRect, BRect *dstRect);
	void MapTo(BRect srcRect, BRect dstRect) {
		be_BPolygon_MapTo(_InstPtr(), srcRect._InstPtr(), dstRect._InstPtr());
	}

	// void be_BPolygon_PrintToStream(BPolygon *self);
	void PrintToStream() {
		be_BPolygon_PrintToStream(_InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


