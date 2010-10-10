/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Interface/Bitmap.h"

BBitmapProxy::BBitmapProxy(void *bindInstPtr, BRect bounds, uint32 flags, color_space colorSpace, int32 bytesPerRow, screen_id screenID)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BBitmap(bounds, flags, colorSpace, bytesPerRow, screenID) { }

BBitmapProxy::BBitmapProxy(void *bindInstPtr, BRect bounds, color_space colorSpace, bool acceptsViews, bool needsContiguous)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BBitmap(bounds, colorSpace, acceptsViews, needsContiguous) { }

BBitmapProxy::BBitmapProxy(void *bindInstPtr, const BBitmap& source, uint32 flags)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BBitmap(source, flags) { }

BBitmapProxy::BBitmapProxy(void *bindInstPtr, const BBitmap& source)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BBitmap(source) { }

BBitmapProxy::BBitmapProxy(void *bindInstPtr, const BBitmap* source, bool acceptsViews, bool needsContiguous)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr), BBitmap(source, acceptsViews, needsContiguous) { }

BBitmapProxy::BBitmapProxy(void *bindInstPtr, BMessage* data)
: fBindInstPtr(bindInstPtr), BArchivableProxy(bindInstPtr, data), BBitmap(data) { }

BBitmapProxy::~BBitmapProxy() { }

status_t BBitmapProxy::Archive(BMessage* data, bool deep) const
{
	return bind_BBitmap_Archive(fBindInstPtr, data, deep);
}

status_t BBitmapProxy::Archive_super(BMessage* data, bool deep) const
{
	return BBitmap::Archive(data, deep);
}

void BBitmapProxy::AddChild(BView* view) 
{
	 bind_BBitmap_AddChild(fBindInstPtr, view);
}

void BBitmapProxy::AddChild_super(BView* view) 
{
	 BBitmap::AddChild(view);
}

bool BBitmapProxy::RemoveChild(BView* view) 
{
	return bind_BBitmap_RemoveChild(fBindInstPtr, view);
}

bool BBitmapProxy::RemoveChild_super(BView* view) 
{
	return BBitmap::RemoveChild(view);
}


extern "C" {
	BBitmap *be_BBitmap_ctor(void *bindInstPtr, BRect *bounds, uint32 flags, color_space colorSpace, int32 bytesPerRow, screen_id screenID)
	{
		return (BBitmap* )new BBitmapProxy(bindInstPtr, *bounds, flags, colorSpace, bytesPerRow, screenID);
	}

	BBitmap *be_BBitmap_ctor_1(void *bindInstPtr, BRect *bounds, color_space colorSpace, bool acceptsViews, bool needsContiguous)
	{
		return (BBitmap* )new BBitmapProxy(bindInstPtr, *bounds, colorSpace, acceptsViews, needsContiguous);
	}

	BBitmap *be_BBitmap_ctor_2(void *bindInstPtr, const BBitmap* source, uint32 flags)
	{
		return (BBitmap* )new BBitmapProxy(bindInstPtr, *source, flags);
	}

	BBitmap *be_BBitmap_ctor_3(void *bindInstPtr, const BBitmap* source)
	{
		return (BBitmap* )new BBitmapProxy(bindInstPtr, *source);
	}

	BBitmap *be_BBitmap_ctor_4(void *bindInstPtr, const BBitmap* source, bool acceptsViews, bool needsContiguous)
	{
		return (BBitmap* )new BBitmapProxy(bindInstPtr, source, acceptsViews, needsContiguous);
	}

	BBitmap *be_BBitmap_ctor_5(void *bindInstPtr, BMessage* data)
	{
		return (BBitmap* )new BBitmapProxy(bindInstPtr, data);
	}

	void be_BBitmap_dtor(BBitmap *self)
	{
		delete self;
	}

	BArchivable* be_BBitmap_Instantiate_static(BMessage* data)
	{
		return BBitmap::Instantiate(data);
	}

	status_t be_BBitmap_Archive(BBitmap *self, BMessage* data, bool deep)
	{
		BBitmapProxy *proxy = dynamic_cast<BBitmapProxy *>(self);
		if(proxy)
			return proxy->Archive_super(data, deep);
		else
			return self->Archive(data, deep);
	}

	status_t be_BBitmap_InitCheck(BBitmap *self)
	{
		return self->InitCheck();
	}

	bool be_BBitmap_IsValid(BBitmap *self)
	{
		return self->IsValid();
	}

	status_t be_BBitmap_LockBits(BBitmap *self, uint32* state)
	{
		return self->LockBits(state);
	}

	void be_BBitmap_UnlockBits(BBitmap *self)
	{
		self->UnlockBits();
	}

	area_id be_BBitmap_Area(BBitmap *self)
	{
		return self->Area();
	}

	void* be_BBitmap_Bits(BBitmap *self)
	{
		return self->Bits();
	}

	int32 be_BBitmap_BitsLength(BBitmap *self)
	{
		return self->BitsLength();
	}

	int32 be_BBitmap_BytesPerRow(BBitmap *self)
	{
		return self->BytesPerRow();
	}

	color_space be_BBitmap_ColorSpace(BBitmap *self)
	{
		return self->ColorSpace();
	}

	BRect * be_BBitmap_Bounds(BBitmap *self)
	{
		return new BRect(self->Bounds());
	}
/* Why isnt this located anywhere?
	status_t be_BBitmap_SetDrawingFlags(BBitmap *self, uint32 flags)
	{
		return self->SetDrawingFlags(flags);
	}
*/
	uint32 be_BBitmap_Flags(BBitmap *self)
	{
		return self->Flags();
	}

	void be_BBitmap_SetBits(BBitmap *self, const void* data, int32 length, int32 offset, color_space colorSpace)
	{
		self->SetBits(data, length, offset, colorSpace);
	}

	status_t be_BBitmap_ImportBits(BBitmap *self, const void* data, int32 length, int32 bpr, int32 offset, color_space colorSpace)
	{
		return self->ImportBits(data, length, bpr, offset, colorSpace);
	}

	status_t be_BBitmap_ImportBits_1(BBitmap *self, const void* data, int32 length, int32 bpr, color_space colorSpace, BPoint *from, BPoint *to, int32 width, int32 height)
	{
		return self->ImportBits(data, length, bpr, colorSpace, *from, *to, width, height);
	}

	status_t be_BBitmap_ImportBits_2(BBitmap *self, const BBitmap* bitmap)
	{
		return self->ImportBits(bitmap);
	}

	status_t be_BBitmap_ImportBits_3(BBitmap *self, const BBitmap* bitmap, BPoint *from, BPoint *to, int32 width, int32 height)
	{
		return self->ImportBits(bitmap, *from, *to, width, height);
	}

	status_t be_BBitmap_GetOverlayRestrictions(BBitmap *self, overlay_restrictions* restrictions)
	{
		return self->GetOverlayRestrictions(restrictions);
	}

	void be_BBitmap_AddChild(BBitmap *self, BView* view)
	{
		BBitmapProxy *proxy = dynamic_cast<BBitmapProxy *>(self);
		if(proxy)
			proxy->AddChild_super(view);
		else
			self->AddChild(view);
	}

	bool be_BBitmap_RemoveChild(BBitmap *self, BView* view)
	{
		BBitmapProxy *proxy = dynamic_cast<BBitmapProxy *>(self);
		if(proxy)
			return proxy->RemoveChild_super(view);
		else
			return self->RemoveChild(view);
	}

	int32 be_BBitmap_CountChildren(BBitmap *self)
	{
		return self->CountChildren();
	}

	BView* be_BBitmap_ChildAt(BBitmap *self, int32 index)
	{
		return self->ChildAt(index);
	}

	BView* be_BBitmap_FindView(BBitmap *self, const char* viewName)
	{
		return self->FindView(viewName);
	}

	BView* be_BBitmap_FindView_1(BBitmap *self, BPoint *point)
	{
		return self->FindView(*point);
	}

	bool be_BBitmap_Lock(BBitmap *self)
	{
		return self->Lock();
	}

	void be_BBitmap_Unlock(BBitmap *self)
	{
		self->Unlock();
	}

	bool be_BBitmap_IsLocked(BBitmap *self)
	{
		return self->IsLocked();
	}

	BBitmap* be_BBitmap_opAssign(BBitmap *self, const BBitmap* source)
	{
		return &self->operator=(*source);
	}

}


