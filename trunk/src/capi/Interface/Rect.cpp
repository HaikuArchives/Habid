/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Point.h>
#include <Rect.h>

extern "C" {
	BRect* be_BRect_ctor(void *bindInstPtr)
	{
		return new BRect();
	}

	BRect* be_BRect_ctor_1(void *bindInstPtr, const BRect* other)
	{
		return new BRect(*other);
	}

	BRect* be_BRect_ctor_2(void *bindInstPtr, float left, float top, float right, float bottom)
	{
		return new BRect(left, top, right, bottom);
	}

	BRect* be_BRect_ctor_3(void *bindInstPtr, BPoint *leftTop, BPoint *rightBottom)
	{
		return new BRect(*leftTop, *rightBottom);
	}

	BRect* be_BRect_ctor_4(void *bindInstPtr, BPoint *leftTop, BSize *size)
	{
		return new BRect(*leftTop, *size);
	}

	void be_BRect_dtor(BRect* self)
	{
		delete self;
	}

	BRect * be_BRect_opAssign(BRect *self, const BRect* other)
	{
		return &self->operator=(*other);
	}

	void be_BRect_Set(BRect *self, float left, float top, float right, float bottom)
	{
		self->Set(left, top, right, bottom);
	}

	void be_BRect_PrintToStream(BRect *self)
	{
		self->PrintToStream();
	}

	BPoint * be_BRect_LeftTop(BRect *self)
	{
		return new BPoint(self->LeftTop());
	}

	BPoint * be_BRect_RightBottom(BRect *self)
	{
		return new BPoint(self->RightBottom());
	}

	BPoint * be_BRect_LeftBottom(BRect *self)
	{
		return new BPoint(self->LeftBottom());
	}

	BPoint * be_BRect_RightTop(BRect *self)
	{
		return new BPoint(self->RightTop());
	}

	void be_BRect_SetLeftTop(BRect *self, const BPoint *leftTop)
	{
		self->SetLeftTop(*leftTop);
	}

	void be_BRect_SetRightBottom(BRect *self, const BPoint *rightBottom)
	{
		self->SetRightBottom(*rightBottom);
	}

	void be_BRect_SetLeftBottom(BRect *self, const BPoint *leftBottom)
	{
		self->SetLeftBottom(*leftBottom);
	}

	void be_BRect_SetRightTop(BRect *self, const BPoint *rightTop)
	{
		self->SetRightTop(*rightTop);
	}

	void be_BRect_InsetBy(BRect *self, BPoint *inset)
	{
		self->InsetBy(*inset);
	}

	void be_BRect_InsetBy_1(BRect *self, float dx, float dy)
	{
		self->InsetBy(dx, dy);
	}

	void be_BRect_OffsetBy(BRect *self, BPoint *delta)
	{
		self->OffsetBy(*delta);
	}

	void be_BRect_OffsetBy_1(BRect *self, float dx, float dy)
	{
		self->OffsetBy(dx, dy);
	}

	void be_BRect_OffsetTo(BRect *self, BPoint *offset)
	{
		self->OffsetTo(*offset);
	}

	void be_BRect_OffsetTo_1(BRect *self, float x, float y)
	{
		self->OffsetTo(x, y);
	}

	BRect * be_BRect_InsetBySelf(BRect *self, BPoint *inset)
	{
		return &self->InsetBySelf(*inset);
	}

	BRect * be_BRect_InsetBySelf_1(BRect *self, float dx, float dy)
	{
		return &self->InsetBySelf(dx, dy);
	}

	BRect * be_BRect_InsetByCopy(BRect *self, BPoint *inset)
	{
		return new BRect(self->InsetByCopy(*inset));
	}

	BRect * be_BRect_InsetByCopy_1(BRect *self, float dx, float dy)
	{
		return new BRect(self->InsetByCopy(dx, dy));
	}

	BRect * be_BRect_OffsetBySelf(BRect *self, BPoint *offset)
	{
		return &self->OffsetBySelf(*offset);
	}

	BRect * be_BRect_OffsetBySelf_1(BRect *self, float dx, float dy)
	{
		return &self->OffsetBySelf(dx, dy);
	}

	BRect * be_BRect_OffsetByCopy(BRect *self, BPoint *offset)
	{
		return new BRect(self->OffsetByCopy(*offset));
	}

	BRect * be_BRect_OffsetByCopy_1(BRect *self, float dx, float dy)
	{
		return new BRect(self->OffsetByCopy(dx, dy));
	}

	BRect * be_BRect_OffsetToSelf(BRect *self, BPoint *offset)
	{
		return &self->OffsetToSelf(*offset);
	}

	BRect * be_BRect_OffsetToSelf_1(BRect *self, float dx, float dy)
	{
		return &self->OffsetToSelf(dx, dy);
	}

	BRect * be_BRect_OffsetToCopy(BRect *self, BPoint *offset)
	{
		return new BRect(self->OffsetToCopy(*offset));
	}

	BRect * be_BRect_OffsetToCopy_1(BRect *self, float dx, float dy)
	{
		return new BRect(self->OffsetToCopy(dx, dy));
	}

	bool be_BRect_opEquals(BRect *self, BRect *r)
	{
		return self->operator==(*r);
	}

	bool be_BRect_opNotEquals(BRect *self, BRect *r)
	{
		return self->operator!=(*r);
	}

	BRect * be_BRect_opAnd(BRect *self, BRect *r)
	{
		 return new BRect(self->operator&(*r));
	}

	BRect * be_BRect_opOr(BRect *self, BRect *r)
	{
		 return new BRect(self->operator|(*r));
	}

	bool be_BRect_IsValid(BRect *self)
	{
		return self->IsValid();
	}

	float be_BRect_Width(BRect *self)
	{
		return self->Width();
	}

	int32 be_BRect_IntegerWidth(BRect *self)
	{
		return self->IntegerWidth();
	}

	float be_BRect_Height(BRect *self)
	{
		return self->Height();
	}

	int32 be_BRect_IntegerHeight(BRect *self)
	{
		return self->IntegerHeight();
	}

	BSize * be_BRect_Size(BRect *self)
	{
		return new BSize(self->Size());
	}

	bool be_BRect_Intersects(BRect *self, BRect *r)
	{
		return self->Intersects(*r);
	}

	bool be_BRect_Contains(BRect *self, BPoint *p)
	{
		return self->Contains(*p);
	}

	bool be_BRect_Contains_1(BRect *self, BRect *r)
	{
		return self->Contains(*r);
	}

	void be_BRect_left_varSet(BRect *self, float left)
	{
		self->left = left;
	}

	float be_BRect_left_varGet(BRect *self)
	{
		return self->left;
	}
	void be_BRect_top_varSet(BRect *self, float top)
	{
		self->top = top;
	}

	float be_BRect_top_varGet(BRect *self)
	{
		return self->top;
	}
	void be_BRect_right_varSet(BRect *self, float right)
	{
		self->right = right;
	}

	float be_BRect_right_varGet(BRect *self)
	{
		return self->right;
	}
	void be_BRect_bottom_varSet(BRect *self, float bottom)
	{
		self->bottom = bottom;
	}

	float be_BRect_bottom_varGet(BRect *self)
	{
		return self->bottom;
	}
}


