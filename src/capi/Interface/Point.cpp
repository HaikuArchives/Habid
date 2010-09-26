/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Point.h>
#include <Rect.h>

extern "C" {
	BPoint* be_BPoint_ctor(void *bindInstPtr)
	{
		return new BPoint();
	}

	BPoint* be_BPoint_ctor_1(void *bindInstPtr, float x, float y)
	{
		return new BPoint(x, y);
	}

	BPoint* be_BPoint_ctor_2(void *bindInstPtr, const BPoint* p)
	{
		return new BPoint(*p);
	}

	void be_BPoint_dtor(BPoint* self)
	{
		delete self;
	}

	BPoint * be_BPoint_opAssign(BPoint *self, const BPoint* other)
	{
		return &self->operator=(*other);
	}

	void be_BPoint_Set(BPoint *self, float x, float y)
	{
		self->Set(x, y);
	}

	void be_BPoint_ConstrainTo(BPoint *self, BRect *rect)
	{
		self->ConstrainTo(*rect);
	}

	void be_BPoint_PrintToStream(BPoint *self)
	{
		self->PrintToStream();
	}

	BPoint * be_BPoint_opSub(BPoint *self)
	{
		 return new BPoint(self->operator-());
	}

	BPoint * be_BPoint_opAdd(BPoint *self, const BPoint* other)
	{
		 return new BPoint(self->operator+(*other));
	}

	BPoint * be_BPoint_opSub_1(BPoint *self, const BPoint* other)
	{
		 return new BPoint(self->operator-(*other));
	}

	BPoint * be_BPoint_opAddAssign(BPoint *self, const BPoint* other)
	{
		return &self->operator+=(*other);
	}

	BPoint * be_BPoint_opSubAssign(BPoint *self, const BPoint* other)
	{
		return &self->operator-=(*other);
	}

	bool be_BPoint_opNotEquals(BPoint *self, const BPoint* other)
	{
		return self->operator!=(*other);
	}

	bool be_BPoint_opEquals(BPoint *self, const BPoint* other)
	{
		return self->operator==(*other);
	}

	void be_BPoint_x_varSet(BPoint *self, float x)
	{
		self->x = x;
	}

	float be_BPoint_x_varGet(BPoint *self)
	{
		return self->x;
	}
	void be_BPoint_y_varSet(BPoint *self, float y)
	{
		self->y = y;
	}

	float be_BPoint_y_varGet(BPoint *self)
	{
		return self->y;
	}
}


