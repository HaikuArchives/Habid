/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Alignment.h>

extern "C" {
	BAlignment* be_BAlignment_ctor(void *bindInstPtr)
	{
		return new BAlignment();
	}

	BAlignment* be_BAlignment_ctor_1(void *bindInstPtr, const BAlignment* other)
	{
		return new BAlignment(*other);
	}

	BAlignment* be_BAlignment_ctor_2(void *bindInstPtr, alignment horizontal, vertical_alignment vertical)
	{
		return new BAlignment(horizontal, vertical);
	}

	void be_BAlignment_dtor(BAlignment* self)
	{
		delete self;
	}

	alignment be_BAlignment_Horizontal(BAlignment *self)
	{
		return self->Horizontal();
	}

	vertical_alignment be_BAlignment_Vertical(BAlignment *self)
	{
		return self->Vertical();
	}

	float be_BAlignment_RelativeHorizontal(BAlignment *self)
	{
		return self->RelativeHorizontal();
	}

	float be_BAlignment_RelativeVertical(BAlignment *self)
	{
		return self->RelativeVertical();
	}

	void be_BAlignment_SetHorizontal(BAlignment *self, alignment horizontal)
	{
		self->SetHorizontal(horizontal);
	}

	void be_BAlignment_SetVertical(BAlignment *self, vertical_alignment vertical)
	{
		self->SetVertical(vertical);
	}

	bool be_BAlignment_IsHorizontalSet(BAlignment *self)
	{
		return self->IsHorizontalSet();
	}

	bool be_BAlignment_IsVerticalSet(BAlignment *self)
	{
		return self->IsVerticalSet();
	}

	bool be_BAlignment_opEquals(BAlignment *self, const BAlignment* other)
	{
		return self->operator==(*other);
	}

	bool be_BAlignment_opNotEquals(BAlignment *self, const BAlignment* other)
	{
		return self->operator!=(*other);
	}

	BAlignment* be_BAlignment_opAssign(BAlignment *self, const BAlignment* other)
	{
		return &self->operator=(*other);
	}

	void be_BAlignment_horizontal_varSet(BAlignment *self, alignment horizontal)
	{
		self->horizontal = horizontal;
	}

	alignment be_BAlignment_horizontal_varGet(BAlignment *self)
	{
		return self->horizontal;
	}
	void be_BAlignment_vertical_varSet(BAlignment *self, vertical_alignment vertical)
	{
		self->vertical = vertical;
	}

	vertical_alignment be_BAlignment_vertical_varGet(BAlignment *self)
	{
		return self->vertical;
	}
}


