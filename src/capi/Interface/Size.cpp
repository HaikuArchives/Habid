/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Size.h>

extern "C" {
	BSize* be_BSize_ctor(void *bindInstPtr)
	{
		return new BSize();
	}

	BSize* be_BSize_ctor_1(void *bindInstPtr, const BSize* other)
	{
		return new BSize(*other);
	}

	BSize* be_BSize_ctor_2(void *bindInstPtr, float width, float height)
	{
		return new BSize(width, height);
	}

	void be_BSize_dtor(BSize* self)
	{
		delete self;
	}

	float be_BSize_Width(BSize *self)
	{
		return self->Width();
	}

	float be_BSize_Height(BSize *self)
	{
		return self->Height();
	}

	void be_BSize_Set(BSize *self, float width, float height)
	{
		self->Set(width, height);
	}

	void be_BSize_SetWidth(BSize *self, float width)
	{
		self->SetWidth(width);
	}

	void be_BSize_SetHeight(BSize *self, float height)
	{
		self->SetHeight(height);
	}

	int32 be_BSize_IntegerWidth(BSize *self)
	{
		return self->IntegerWidth();
	}

	int32 be_BSize_IntegerHeight(BSize *self)
	{
		return self->IntegerHeight();
	}

	bool be_BSize_IsWidthSet(BSize *self)
	{
		return self->IsWidthSet();
	}

	bool be_BSize_IsHeightSet(BSize *self)
	{
		return self->IsHeightSet();
	}

	bool be_BSize_opEquals(BSize *self, const BSize* other)
	{
		return self->operator==(*other);
	}

	bool be_BSize_opNotEquals(BSize *self, const BSize* other)
	{
		return self->operator!=(*other);
	}

	BSize * be_BSize_opAssign(BSize *self, const BSize* other)
	{
		return &self->operator=(*other);
	}

	void be_BSize_width_varSet(BSize *self, float width)
	{
		self->width = width;
	}

	float be_BSize_width_varGet(BSize *self)
	{
		return self->width;
	}
	void be_BSize_height_varSet(BSize *self, float height)
	{
		self->height = height;
	}

	float be_BSize_height_varGet(BSize *self)
	{
		return self->height;
	}
}


