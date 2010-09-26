/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Polygon.h>
#include <Rect.h>

extern "C" {
	BPolygon* be_BPolygon_ctor(void *bindInstPtr)
	{
		return new BPolygon();
	}

	BPolygon* be_BPolygon_ctor_1(void *bindInstPtr, const BPoint* points, int32 count)
	{
		return new BPolygon(points, count);
	}

	BPolygon* be_BPolygon_ctor_2(void *bindInstPtr, const BPolygon* other)
	{
		return new BPolygon(*other);
	}

	BPolygon* be_BPolygon_ctor_3(void *bindInstPtr, const BPolygon* other)
	{
		return new BPolygon(other);
	}

	void be_BPolygon_dtor(BPolygon* self)
	{
		delete self;
	}

	BPolygon * be_BPolygon_opAssign(BPolygon *self, const BPolygon* other)
	{
		return &self->operator=(*other);
	}

	BRect * be_BPolygon_Frame(BPolygon *self)
	{
		return new BRect(self->Frame());
	}

	void be_BPolygon_AddPoints(BPolygon *self, const BPoint* points, int32 count)
	{
		self->AddPoints(points, count);
	}

	int32 be_BPolygon_CountPoints(BPolygon *self)
	{
		return self->CountPoints();
	}

	void be_BPolygon_MapTo(BPolygon *self, BRect *srcRect, BRect *dstRect)
	{
		self->MapTo(*srcRect, *dstRect);
	}

	void be_BPolygon_PrintToStream(BPolygon *self)
	{
		self->PrintToStream();
	}

}


