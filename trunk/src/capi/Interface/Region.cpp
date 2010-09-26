/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Region.h>
#include <Rect.h>

extern "C" {
	BRegion* be_BRegion_ctor(void *bindInstPtr)
	{
		return new BRegion();
	}

	BRegion* be_BRegion_ctor_1(void *bindInstPtr, const BRegion* region)
	{
		return new BRegion(*region);
	}

	BRegion* be_BRegion_ctor_2(void *bindInstPtr, const BRect *rect)
	{
		return new BRegion(*rect);
	}

	void be_BRegion_dtor(BRegion* self)
	{
		delete self;
	}

	BRegion * be_BRegion_opAssign(BRegion *self, const BRegion* from)
	{
		return &self->operator=(*from);
	}

	bool be_BRegion_opEquals(BRegion *self, const BRegion* other)
	{
		return self->operator==(*other);
	}

	void be_BRegion_Set(BRegion *self, BRect *newBounds)
	{
		self->Set(*newBounds);
	}

	void be_BRegion_Set_1(BRegion *self, clipping_rect newBounds)
	{
		self->Set(newBounds);
	}

	BRect * be_BRegion_Frame(BRegion *self)
	{
		return new BRect(self->Frame());
	}

	clipping_rect be_BRegion_FrameInt(BRegion *self)
	{
		return self->FrameInt();
	}

	BRect * be_BRegion_RectAt(BRegion *self, int32 index)
	{
		return new BRect(self->RectAt(index));
	}

	BRect * be_BRegion_RectAt_1(BRegion *self, int32 index)
	{
		return new BRect(self->RectAt(index));
	}

	clipping_rect be_BRegion_RectAtInt(BRegion *self, int32 index)
	{
		return self->RectAtInt(index);
	}

	clipping_rect be_BRegion_RectAtInt_1(BRegion *self, int32 index)
	{
		return self->RectAtInt(index);
	}

	int32 be_BRegion_CountRects(BRegion *self)
	{
		return self->CountRects();
	}

	int32 be_BRegion_CountRects_1(BRegion *self)
	{
		return self->CountRects();
	}

	bool be_BRegion_Intersects(BRegion *self, BRect *rect)
	{
		return self->Intersects(*rect);
	}

	bool be_BRegion_Intersects_1(BRegion *self, clipping_rect rect)
	{
		return self->Intersects(rect);
	}

	bool be_BRegion_Contains(BRegion *self, BPoint *point)
	{
		return self->Contains(*point);
	}

	bool be_BRegion_Contains_1(BRegion *self, int32 x, int32 y)
	{
		return self->Contains(x, y);
	}

	bool be_BRegion_Contains_2(BRegion *self, int32 x, int32 y)
	{
		return self->Contains(x, y);
	}

	void be_BRegion_PrintToStream(BRegion *self)
	{
		self->PrintToStream();
	}

	void be_BRegion_OffsetBy(BRegion *self, int32 x, int32 y)
	{
		self->OffsetBy(x, y);
	}

	void be_BRegion_MakeEmpty(BRegion *self)
	{
		self->MakeEmpty();
	}

	void be_BRegion_Include(BRegion *self, BRect *rect)
	{
		self->Include(*rect);
	}

	void be_BRegion_Include_1(BRegion *self, clipping_rect rect)
	{
		self->Include(rect);
	}

	void be_BRegion_Include_2(BRegion *self, const BRegion* region)
	{
		self->Include(region);
	}

	void be_BRegion_Exclude(BRegion *self, BRect *r)
	{
		self->Exclude(*r);
	}

	void be_BRegion_Exclude_1(BRegion *self, clipping_rect r)
	{
		self->Exclude(r);
	}

	void be_BRegion_Exclude_2(BRegion *self, const BRegion* region)
	{
		self->Exclude(region);
	}

	void be_BRegion_IntersectWith(BRegion *self, const BRegion* region)
	{
		self->IntersectWith(region);
	}

	void be_BRegion_ExclusiveInclude(BRegion *self, const BRegion* region)
	{
		self->ExclusiveInclude(region);
	}

}


