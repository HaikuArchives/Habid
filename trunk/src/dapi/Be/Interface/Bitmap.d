/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Bitmap;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Interface.Rect;
import Be.Interface.Point;
import Be.Interface.View;
import Be.Interface.GraphicsDefs;

import Be.Kernel.OS;

import Be.App.Message;

import Be.Support.Archivable;

enum {
	B_BITMAP_CLEAR_TO_WHITE				= 0x00000001,
	B_BITMAP_ACCEPTS_VIEWS				= 0x00000002,
	B_BITMAP_IS_AREA					= 0x00000004,
	B_BITMAP_IS_LOCKED					= 0x00000008 | B_BITMAP_IS_AREA,
	B_BITMAP_IS_CONTIGUOUS				= 0x00000010 | B_BITMAP_IS_LOCKED,
	B_BITMAP_IS_OFFSCREEN				= 0x00000020,
		// Offscreen but non-overlay bitmaps are not supported on Haiku,
		// but appearantly never were on BeOS either! The accelerant API
		// would need to be extended to so that the app_server can ask
		// the graphics driver to reserve memory for a bitmap and for this
		// to make any sense, an accelerated blit from this memory into
		// the framebuffer needs to be added to the API as well.
	B_BITMAP_WILL_OVERLAY				= 0x00000040 | B_BITMAP_IS_OFFSCREEN,
	B_BITMAP_RESERVE_OVERLAY_CHANNEL	= 0x00000080,

	// Haiku extensions:
	B_BITMAP_NO_SERVER_LINK				= 0x00000100,
		// Cheap to create, object will manage memory itself,
		// no BApplication needs to run, but one can't draw such
		// a BBitmap.
}

const int32 B_ANY_BYTES_PER_ROW	= -1;

extern (C) extern {
	// BBitmapProxy * be_BBitmap_ctor(void *bindInstPtr, BRect *bounds, uint32 flags, color_space colorSpace, int32 bytesPerRow, screen_id screenID);
	void * be_BBitmap_ctor(void *bindInstPtr, void *bounds, uint32 flags, color_space colorSpace, int32 bytesPerRow, screen_id screenID);

	// BBitmapProxy * be_BBitmap_ctor_1(void *bindInstPtr, BRect *bounds, color_space colorSpace, bool acceptsViews, bool needsContiguous);
	void * be_BBitmap_ctor_1(void *bindInstPtr, void *bounds, color_space colorSpace, bool acceptsViews, bool needsContiguous);

	// BBitmapProxy * be_BBitmap_ctor_2(void *bindInstPtr, const BBitmap* source, uint32 flags);
	void * be_BBitmap_ctor_2(void *bindInstPtr, void * source, uint32 flags);

	// BBitmapProxy * be_BBitmap_ctor_3(void *bindInstPtr, const BBitmap* source);
	void * be_BBitmap_ctor_3(void *bindInstPtr, void * source);

	// BBitmapProxy * be_BBitmap_ctor_4(void *bindInstPtr, const BBitmap* source, bool acceptsViews, bool needsContiguous);
	void * be_BBitmap_ctor_4(void *bindInstPtr, void * source, bool acceptsViews, bool needsContiguous);

	// BBitmapProxy * be_BBitmap_ctor_5(void *bindInstPtr, BMessage* data);
	void * be_BBitmap_ctor_5(void *bindInstPtr, void* data);

	// void be_BBitmap_dtor(BBitmap* self);
	void be_BBitmap_dtor(void* self);

	//BArchivable* be_BBitmap_Instantiate_static(BMessage* data)
	void * be_BBitmap_Instantiate_static(void* data);

	// status_t be_BBitmap_Archive(BBitmapProxy *self, BMessage* data, bool deep);
	status_t be_BBitmap_Archive(void *self, void* data, bool deep);

	// status_t be_BBitmap_InitCheck(BBitmapProxy *self);
	status_t be_BBitmap_InitCheck(void *self);

	// bool be_BBitmap_IsValid(BBitmapProxy *self);
	bool be_BBitmap_IsValid(void *self);

	// status_t be_BBitmap_LockBits(BBitmapProxy *self, uint32* state);
	status_t be_BBitmap_LockBits(void *self, uint32* state);

	// void be_BBitmap_UnlockBits(BBitmapProxy *self);
	void be_BBitmap_UnlockBits(void *self);

	// area_id be_BBitmap_Area(BBitmapProxy *self);
	area_id be_BBitmap_Area(void *self);

	// void* be_BBitmap_Bits(BBitmapProxy *self);
	void* be_BBitmap_Bits(void *self);

	// int32 be_BBitmap_BitsLength(BBitmapProxy *self);
	int32 be_BBitmap_BitsLength(void *self);

	// int32 be_BBitmap_BytesPerRow(BBitmapProxy *self);
	int32 be_BBitmap_BytesPerRow(void *self);

	// color_space be_BBitmap_ColorSpace(BBitmapProxy *self);
	color_space be_BBitmap_ColorSpace(void *self);

	// BRect * be_BBitmap_Bounds(BBitmapProxy *self);
	void * be_BBitmap_Bounds(void *self);

	// status_t be_BBitmap_SetDrawingFlags(BBitmapProxy *self, uint32 flags);
	status_t be_BBitmap_SetDrawingFlags(void *self, uint32 flags);

	// uint32 be_BBitmap_Flags(BBitmapProxy *self);
	uint32 be_BBitmap_Flags(void *self);

	// void be_BBitmap_SetBits(BBitmapProxy *self, const void* data, int32 length, int32 offset, color_space colorSpace);
	void be_BBitmap_SetBits(void *self, void* data, int32 length, int32 offset, color_space colorSpace);

	// status_t be_BBitmap_ImportBits(BBitmapProxy *self, const void* data, int32 length, int32 bpr, int32 offset, color_space colorSpace);
	status_t be_BBitmap_ImportBits(void *self, void* data, int32 length, int32 bpr, int32 offset, color_space colorSpace);

	// status_t be_BBitmap_ImportBits_1(BBitmapProxy *self, const void* data, int32 length, int32 bpr, color_space colorSpace, BPoint *from, BPoint *to, int32 width, int32 height);
	status_t be_BBitmap_ImportBits_1(void *self, void* data, int32 length, int32 bpr, color_space colorSpace, void *from, void *to, int32 width, int32 height);

	// status_t be_BBitmap_ImportBits_2(BBitmapProxy *self, const BBitmap* bitmap);
	status_t be_BBitmap_ImportBits_2(void *self, void * bitmap);

	// status_t be_BBitmap_ImportBits_3(BBitmapProxy *self, const BBitmap* bitmap, BPoint *from, BPoint *to, int32 width, int32 height);
	status_t be_BBitmap_ImportBits_3(void *self, void * bitmap, void *from, void *to, int32 width, int32 height);

	// status_t be_BBitmap_GetOverlayRestrictions(BBitmapProxy *self, overlay_restrictions* restrictions);
	status_t be_BBitmap_GetOverlayRestrictions(void *self, overlay_restrictions* restrictions);

	// void be_BBitmap_AddChild(BBitmapProxy *self, BView* view);
	void be_BBitmap_AddChild(void *self, void* view);

	// bool be_BBitmap_RemoveChild(BBitmapProxy *self, BView* view);
	bool be_BBitmap_RemoveChild(void *self, void* view);

	// int32 be_BBitmap_CountChildren(BBitmapProxy *self);
	int32 be_BBitmap_CountChildren(void *self);

	// BView* be_BBitmap_ChildAt(BBitmapProxy *self, int32 index);
	void* be_BBitmap_ChildAt(void *self, int32 index);

	// BView* be_BBitmap_FindView(BBitmapProxy *self, const char* viewName);
	void* be_BBitmap_FindView(void *self, char* viewName);

	// BView* be_BBitmap_FindView_1(BBitmapProxy *self, BPoint *point);
	void* be_BBitmap_FindView_1(void *self, void *point);

	// bool be_BBitmap_Lock(BBitmapProxy *self);
	bool be_BBitmap_Lock(void *self);

	// void be_BBitmap_Unlock(BBitmapProxy *self);
	void be_BBitmap_Unlock(void *self);

	// bool be_BBitmap_IsLocked(BBitmapProxy *self);
	bool be_BBitmap_IsLocked(void *self);

	// BBitmap* be_BBitmap_opAssign(BBitmap *self, const BBitmap* source);
	void * be_BBitmap_opAssign(void *self, void * source);

}


extern (C) {
	status_t bind_BBitmap_Archive(void *bindInstPtr, BMessage* data, bool deep) {
		assert(false, "bind_BBitmap_Archive(void *bindInstPtr, BMessage* data, bool deep) Unimplemented");
	}

	void bind_BBitmap_AddChild(void *bindInstPtr, BView* view) {
		assert(false, "bind_BBitmap_AddChild(void *bindInstPtr, BView* view) Unimplemented");
	}

	bool bind_BBitmap_RemoveChild(void *bindInstPtr, BView* view) {
		assert(false, "bind_BBitmap_RemoveChild(void *bindInstPtr, BView* view) Unimplemented");
	}

}


interface IBBitmap
{
	// BArchivable* be_BBitmap_Instantiate(BBitmap *self, BMessage* data);
//	BArchivable* Instantiate();
/*
	// status_t be_BBitmap_Archive(BBitmap *self, BMessage* data, bool deep);
	status_t Archive();

	// status_t be_BBitmap_InitCheck(BBitmap *self);
	status_t InitCheck();

	// bool be_BBitmap_IsValid(BBitmap *self);
	bool IsValid();

	// status_t be_BBitmap_LockBits(BBitmap *self, uint32* state);
	status_t LockBits();

	// void be_BBitmap_UnlockBits(BBitmap *self);
	void UnlockBits();

	// area_id be_BBitmap_Area(BBitmap *self);
	area_id Area();

	// void* be_BBitmap_Bits(BBitmap *self);
	void* Bits();

	// int32 be_BBitmap_BitsLength(BBitmap *self);
	int32 BitsLength();

	// int32 be_BBitmap_BytesPerRow(BBitmap *self);
	int32 BytesPerRow();

	// color_space be_BBitmap_ColorSpace(BBitmap *self);
	color_space ColorSpace();

	// BRect * be_BBitmap_Bounds(BBitmap *self);
	BRect Bounds();

	// status_t be_BBitmap_SetDrawingFlags(BBitmap *self, uint32 flags);
	status_t SetDrawingFlags();

	// uint32 be_BBitmap_Flags(BBitmap *self);
	uint32 Flags();

	// void be_BBitmap_SetBits(BBitmap *self, const void* data, int32 length, int32 offset, color_space colorSpace);
	void SetBits();

	// status_t be_BBitmap_ImportBits(BBitmap *self, const void* data, int32 length, int32 bpr, int32 offset, color_space colorSpace);
	status_t ImportBits();

	// status_t be_BBitmap_ImportBits_1(BBitmap *self, const void* data, int32 length, int32 bpr, color_space colorSpace, BPoint *from, BPoint *to, int32 width, int32 height);
	status_t ImportBits();

	// status_t be_BBitmap_ImportBits_2(BBitmap *self, const BBitmap* bitmap);
	status_t ImportBits();

	// status_t be_BBitmap_ImportBits_3(BBitmap *self, const BBitmap* bitmap, BPoint *from, BPoint *to, int32 width, int32 height);
	status_t ImportBits();

	// status_t be_BBitmap_GetOverlayRestrictions(BBitmap *self, overlay_restrictions* restrictions);
	status_t GetOverlayRestrictions();

	// void be_BBitmap_AddChild(BBitmap *self, BView* view);
	void AddChild();

	// bool be_BBitmap_RemoveChild(BBitmap *self, BView* view);
	bool RemoveChild();

	// int32 be_BBitmap_CountChildren(BBitmap *self);
	int32 CountChildren();

	// BView* be_BBitmap_ChildAt(BBitmap *self, int32 index);
	BView* ChildAt();

	// BView* be_BBitmap_FindView(BBitmap *self, const char* viewName);
	BView* FindView();

	// BView* be_BBitmap_FindView_1(BBitmap *self, BPoint *point);
	BView* FindView();

	// bool be_BBitmap_Lock(BBitmap *self);
	bool Lock();

	// void be_BBitmap_Unlock(BBitmap *self);
	void Unlock();

	// bool be_BBitmap_IsLocked(BBitmap *self);
	bool IsLocked();

	// BBitmap& be_BBitmap_opAssign(BBitmap *self, const BBitmap& source);
	//BBitmap& opAssign();
*/
	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BBitmap : BArchivable, IBBitmap
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BBitmapProxy * be_BBitmap_ctor(void *bindInstPtr, BRect *bounds, uint32 flags, color_space colorSpace, int32 bytesPerRow, screen_id screenID);
	this(BRect bounds, uint32 flags, color_space colorSpace, int32 bytesPerRow = B_ANY_BYTES_PER_ROW, screen_id screenID = B_MAIN_SCREEN_ID) {
		if(_InstPtr is null) {
			_InstPtr = be_BBitmap_ctor(cast(void *)this, bounds._InstPtr, flags, colorSpace, bytesPerRow, screenID);
			_OwnsPtr = true;
		}
	}

	// BBitmapProxy * be_BBitmap_ctor_1(void *bindInstPtr, BRect *bounds, color_space colorSpace, bool acceptsViews, bool needsContiguous);
	this(BRect bounds, color_space colorSpace, bool acceptsViews = false, bool needsContiguous = false) {
		if(_InstPtr is null) {
			_InstPtr = be_BBitmap_ctor_1(cast(void *)this, bounds._InstPtr, colorSpace, acceptsViews, needsContiguous);
			_OwnsPtr = true;
		}
	}

	// BBitmapProxy * be_BBitmap_ctor_2(void *bindInstPtr, const BBitmap* source, uint32 flags);
	this(BBitmap source, uint32 flags) {
		if(_InstPtr is null) {
			_InstPtr = be_BBitmap_ctor_2(cast(void *)this, source._InstPtr, flags);
			_OwnsPtr = true;
		}
	}

	// BBitmapProxy * be_BBitmap_ctor_3(void *bindInstPtr, const BBitmap* source);
	this(BBitmap source) {
		if(_InstPtr is null) {
			_InstPtr = be_BBitmap_ctor_3(cast(void *)this, source._InstPtr);
			_OwnsPtr = true;
		}
	}

	// BBitmapProxy * be_BBitmap_ctor_4(void *bindInstPtr, const BBitmap* source, bool acceptsViews, bool needsContiguous);
	this(BBitmap source, bool acceptsViews = false, bool needsContiguous = false) {
		if(_InstPtr is null) {
			_InstPtr = be_BBitmap_ctor_4(cast(void *)this, source._InstPtr, acceptsViews, needsContiguous);
			_OwnsPtr = true;
		}
	}

	// BBitmapProxy * be_BBitmap_ctor_5(void *bindInstPtr, BMessage* data);
	this(BMessage data) {
		if(_InstPtr is null) {
			_InstPtr = be_BBitmap_ctor_5(cast(void *)this, data._InstPtr);
			_OwnsPtr = true;
		}
	}

	// void be_BBitmap_dtor(BBitmap* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BBitmap_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}
/*
	//BArchivable* be_BBitmap_Instantiate_static(BMessage* data)
	static BArchivable* Instantiate(BMessage* data)
	{
	}

	// status_t be_BBitmap_Archive(BBitmap *self, BMessage* data, bool deep);
	status_t Archive() {
		return be_BBitmap_Archive(_InstPtr());
	}

	// status_t be_BBitmap_InitCheck(BBitmap *self);
	status_t InitCheck() {
		return be_BBitmap_InitCheck(_InstPtr());
	}

	// bool be_BBitmap_IsValid(BBitmap *self);
	bool IsValid() {
		return be_BBitmap_IsValid(_InstPtr());
	}

	// status_t be_BBitmap_LockBits(BBitmap *self, uint32* state);
	status_t LockBits() {
		return be_BBitmap_LockBits(_InstPtr());
	}

	// void be_BBitmap_UnlockBits(BBitmap *self);
	void UnlockBits() {
		be_BBitmap_UnlockBits(_InstPtr());
	}

	// area_id be_BBitmap_Area(BBitmap *self);
	area_id Area() {
		return be_BBitmap_Area(_InstPtr());
	}

	// void* be_BBitmap_Bits(BBitmap *self);
	void* Bits() {
		return be_BBitmap_Bits(_InstPtr());
	}

	// int32 be_BBitmap_BitsLength(BBitmap *self);
	int32 BitsLength() {
		return be_BBitmap_BitsLength(_InstPtr());
	}

	// int32 be_BBitmap_BytesPerRow(BBitmap *self);
	int32 BytesPerRow() {
		return be_BBitmap_BytesPerRow(_InstPtr());
	}

	// color_space be_BBitmap_ColorSpace(BBitmap *self);
	color_space ColorSpace() {
		return be_BBitmap_ColorSpace(_InstPtr());
	}

	// BRect * be_BBitmap_Bounds(BBitmap *self);
	BRect Bounds() {
		return be_BBitmap_Bounds(_InstPtr());
	}

	// status_t be_BBitmap_SetDrawingFlags(BBitmap *self, uint32 flags);
	status_t SetDrawingFlags() {
		return be_BBitmap_SetDrawingFlags(_InstPtr());
	}

	// uint32 be_BBitmap_Flags(BBitmap *self);
	uint32 Flags() {
		return be_BBitmap_Flags(_InstPtr());
	}

	// void be_BBitmap_SetBits(BBitmap *self, const void* data, int32 length, int32 offset, color_space colorSpace);
	void SetBits() {
		be_BBitmap_SetBits(_InstPtr());
	}

	// status_t be_BBitmap_ImportBits(BBitmap *self, const void* data, int32 length, int32 bpr, int32 offset, color_space colorSpace);
	status_t ImportBits() {
		return be_BBitmap_ImportBits(_InstPtr());
	}

	// status_t be_BBitmap_ImportBits_1(BBitmap *self, const void* data, int32 length, int32 bpr, color_space colorSpace, BPoint *from, BPoint *to, int32 width, int32 height);
	status_t ImportBits() {
		return be_BBitmap_ImportBits_1(_InstPtr());
	}

	// status_t be_BBitmap_ImportBits_2(BBitmap *self, const BBitmap* bitmap);
	status_t ImportBits() {
		return be_BBitmap_ImportBits_2(_InstPtr());
	}

	// status_t be_BBitmap_ImportBits_3(BBitmap *self, const BBitmap* bitmap, BPoint *from, BPoint *to, int32 width, int32 height);
	status_t ImportBits() {
		return be_BBitmap_ImportBits_3(_InstPtr());
	}

	// status_t be_BBitmap_GetOverlayRestrictions(BBitmap *self, overlay_restrictions* restrictions);
	status_t GetOverlayRestrictions() {
		return be_BBitmap_GetOverlayRestrictions(_InstPtr());
	}

	// void be_BBitmap_AddChild(BBitmap *self, BView* view);
	void AddChild() {
		be_BBitmap_AddChild(_InstPtr());
	}

	// bool be_BBitmap_RemoveChild(BBitmap *self, BView* view);
	bool RemoveChild() {
		return be_BBitmap_RemoveChild(_InstPtr());
	}

	// int32 be_BBitmap_CountChildren(BBitmap *self);
	int32 CountChildren() {
		return be_BBitmap_CountChildren(_InstPtr());
	}

	// BView* be_BBitmap_ChildAt(BBitmap *self, int32 index);
	BView* ChildAt() {
		return be_BBitmap_ChildAt(_InstPtr());
	}

	// BView* be_BBitmap_FindView(BBitmap *self, const char* viewName);
	BView* FindView() {
		return be_BBitmap_FindView(_InstPtr());
	}

	// BView* be_BBitmap_FindView_1(BBitmap *self, BPoint *point);
	BView* FindView() {
		return be_BBitmap_FindView_1(_InstPtr());
	}

	// bool be_BBitmap_Lock(BBitmap *self);
	bool Lock() {
		return be_BBitmap_Lock(_InstPtr());
	}

	// void be_BBitmap_Unlock(BBitmap *self);
	void Unlock() {
		be_BBitmap_Unlock(_InstPtr());
	}

	// bool be_BBitmap_IsLocked(BBitmap *self);
	bool IsLocked() {
		return be_BBitmap_IsLocked(_InstPtr());
	}

	// BBitmap& be_BBitmap_opAssign(BBitmap *self, const BBitmap& source);
	//BBitmap& opAssign();
*/
	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


