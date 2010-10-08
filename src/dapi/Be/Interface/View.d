/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.View;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;
import Be.App.Handler;
import Be.App.Cursor;

import Be.Interface.Rect;
import Be.Interface.Point;
import Be.Interface.Polygon;
import Be.Interface.Region;
import Be.Interface.Alignment;
import Be.Interface.Size;
import Be.Interface.Window;

import Be.Interface.GraphicsDefs;
import Be.Interface.InterfaceDefs;

import tango.stdc.stringz;

/* Dummy */
struct escapement_delta { }
struct font_height { }

enum {
	B_PRIMARY_MOUSE_BUTTON				= 0x01,
	B_SECONDARY_MOUSE_BUTTON			= 0x02,
	B_TERTIARY_MOUSE_BUTTON				= 0x04
}

// mouse transit
enum {
	B_ENTERED_VIEW						= 0,
	B_INSIDE_VIEW,
	B_EXITED_VIEW,
	B_OUTSIDE_VIEW
}

// event mask
enum {
	B_POINTER_EVENTS					= 0x00000001,
	B_KEYBOARD_EVENTS					= 0x00000002
}

// event mask options
enum {
	B_LOCK_WINDOW_FOCUS					= 0x00000001,
	B_SUSPEND_VIEW_FOCUS				= 0x00000002,
	B_NO_POINTER_HISTORY				= 0x00000004,
	// NOTE: New in Haiku (unless this flag is
	// specified, both BWindow and BView::GetMouse()
	// will filter out older mouse moved messages)
	B_FULL_POINTER_HISTORY				= 0x00000008
}

enum {
	B_TRACK_WHOLE_RECT,
	B_TRACK_RECT_CORNER
}

// set font mask
enum {
	B_FONT_FAMILY_AND_STYLE				= 0x00000001,
	B_FONT_SIZE							= 0x00000002,
	B_FONT_SHEAR						= 0x00000004,
	B_FONT_ROTATION						= 0x00000008,
	B_FONT_SPACING     					= 0x00000010,
	B_FONT_ENCODING						= 0x00000020,
	B_FONT_FACE							= 0x00000040,
	B_FONT_FLAGS						= 0x00000080,
	B_FONT_FALSE_BOLD_WIDTH				= 0x00000100,
	B_FONT_ALL							= 0x000001FF
}

// view flags
const uint32 B_FULL_UPDATE_ON_RESIZE 	= 0x80000000UL;	/* 31 */
const uint32 _B_RESERVED1_ 				= 0x40000000UL;	/* 30 */
const uint32 B_WILL_DRAW 				= 0x20000000UL;	/* 29 */
const uint32 B_PULSE_NEEDED 			= 0x10000000UL;	/* 28 */
const uint32 B_NAVIGABLE_JUMP 			= 0x08000000UL;	/* 27 */
const uint32 B_FRAME_EVENTS				= 0x04000000UL;	/* 26 */
const uint32 B_NAVIGABLE 				= 0x02000000UL;	/* 25 */
const uint32 B_SUBPIXEL_PRECISE 		= 0x01000000UL;	/* 24 */
const uint32 B_DRAW_ON_CHILDREN 		= 0x00800000UL;	/* 23 */
const uint32 B_INPUT_METHOD_AWARE 		= 0x00400000UL;	/* 23 */
const uint32 _B_RESERVED7_ 				= 0x00200000UL;	/* 22 */
const uint32 B_SUPPORTS_LAYOUT			= 0x00100000UL;	/* 21 */
const uint32 B_INVALIDATE_AFTER_LAYOUT	= 0x00080000UL;	/* 20 */

// #define _RESIZE_MASK_ (0xffff)

const uint32 _VIEW_TOP_				 	= 1UL;
const uint32 _VIEW_LEFT_ 				= 2UL;
const uint32 _VIEW_BOTTOM_			 	= 3UL;
const uint32 _VIEW_RIGHT_ 				= 4UL;
const uint32 _VIEW_CENTER_ 				= 5UL;

template _rule_(uint32 r1, uint32 r2, uint32 r3, uint32 r4) {
	const uint32 _rule_ = ((r1 << 12) | (r2 << 8) | (r3 << 4) | r4);
}

const uint32 B_FOLLOW_NONE 		= 	0;
const uint32 B_FOLLOW_ALL_SIDES	= 	_rule_!(_VIEW_TOP_, _VIEW_LEFT_, _VIEW_BOTTOM_, _VIEW_RIGHT_);
const uint32 B_FOLLOW_ALL		=	B_FOLLOW_ALL_SIDES;

const uint32 B_FOLLOW_LEFT		=	_rule_!(0, _VIEW_LEFT_, 0, _VIEW_LEFT_);
const uint32 B_FOLLOW_RIGHT		=	_rule_!(0, _VIEW_RIGHT_, 0, _VIEW_RIGHT_);
const uint32 B_FOLLOW_LEFT_RIGHT=	_rule_!(0, _VIEW_LEFT_, 0, _VIEW_RIGHT_);
const uint32 B_FOLLOW_H_CENTER	=	_rule_!(0, _VIEW_CENTER_, 0, _VIEW_CENTER_);

const uint32 B_FOLLOW_TOP		=	_rule_!(_VIEW_TOP_, 0, _VIEW_TOP_, 0);
const uint32 B_FOLLOW_BOTTOM	=	_rule_!(_VIEW_BOTTOM_, 0, _VIEW_BOTTOM_, 0);
const uint32 B_FOLLOW_TOP_BOTTOM=	_rule_!(_VIEW_TOP_, 0, _VIEW_BOTTOM_, 0);
const uint32 B_FOLLOW_V_CENTER	=	_rule_!(_VIEW_CENTER_, 0, _VIEW_CENTER_, 0);

extern (C) extern {
	// BViewProxy * be_BView_ctor(void *bindInstPtr, BMessage* archive);
	void * be_BView_ctor(void *bindInstPtr, void * archive);

	// BViewProxy * be_BView_ctor_1(void *bindInstPtr, const char* name, uint32 flags, BLayout* layout);
	void * be_BView_ctor_1(void *bindInstPtr, char* name, uint32 flags, void * layout);

	// BViewProxy * be_BView_ctor_2(void *bindInstPtr, BRect *frame, const char* name, uint32 resizeMask, uint32 flags);
	void * be_BView_ctor_2(void *bindInstPtr, void *frame,  char* name, uint32 resizeMask, uint32 flags);

	// void be_BView_dtor(BView* self);
	void be_BView_dtor(void* self);

	//BArchivable* be_BView_Instantiate_static(BMessage* archive)
	void* be_BView_Instantiate_static(void * archive);

	// status_t be_BView_Archive(BViewProxy *self, BMessage* archive, bool deep);
	status_t be_BView_Archive(void *self, void * archive, bool deep);

	// status_t be_BView_AllUnarchived(BViewProxy *self, const BMessage* archive);
	status_t be_BView_AllUnarchived(void *self, void * archive);

	// status_t be_BView_AllArchived(BViewProxy *self, BMessage* archive);
	status_t be_BView_AllArchived(void *self, void * archive);

	// void be_BView_AttachedToWindow(BViewProxy *self);
	void be_BView_AttachedToWindow(void *self);

	// void be_BView_AllAttached(BViewProxy *self);
	void be_BView_AllAttached(void *self);

	// void be_BView_DetachedFromWindow(BViewProxy *self);
	void be_BView_DetachedFromWindow(void *self);

	// void be_BView_AllDetached(BViewProxy *self);
	void be_BView_AllDetached(void *self);

	// void be_BView_MessageReceived(BViewProxy *self, BMessage* message);
	void be_BView_MessageReceived(void *self, void * message);

	// void be_BView_AddChild(BViewProxy *self, BView* child, BView* before);
	void be_BView_AddChild(void *self, void* child, void* before);

	// bool be_BView_AddChild_1(BViewProxy *self, BLayoutItem* child);
	bool be_BView_AddChild_1(void *self, void * child);

	// bool be_BView_RemoveChild(BViewProxy *self, BView* child);
	bool be_BView_RemoveChild(void *self, void* child);

	// int32 be_BView_CountChildren(BViewProxy *self);
	int32 be_BView_CountChildren(void *self);

	// BView* be_BView_ChildAt(BViewProxy *self, int32 index);
	void* be_BView_ChildAt(void *self, int32 index);

	// BView* be_BView_NextSibling(BViewProxy *self);
	void* be_BView_NextSibling(void *self);

	// BView* be_BView_PreviousSibling(BViewProxy *self);
	void* be_BView_PreviousSibling(void *self);

	// bool be_BView_RemoveSelf(BViewProxy *self);
	bool be_BView_RemoveSelf(void *self);

	// BWindow* be_BView_Window(BViewProxy *self);
	void* be_BView_Window(void *self);

	// void be_BView_Draw(BViewProxy *self, BRect *updateRect);
	void be_BView_Draw(void *self, void *updateRect);

	// void be_BView_MouseDown(BViewProxy *self, BPoint *where);
	void be_BView_MouseDown(void *self, void *where);

	// void be_BView_MouseUp(BViewProxy *self, BPoint *where);
	void be_BView_MouseUp(void *self, void *where);

	// void be_BView_MouseMoved(BViewProxy *self, BPoint *where, uint32 code, const BMessage* dragMessage);
	void be_BView_MouseMoved(void *self, void *where, uint32 code, void * dragMessage);

	// void be_BView_WindowActivated(BViewProxy *self, bool state);
	void be_BView_WindowActivated(void *self, bool state);

	// void be_BView_KeyDown(BViewProxy *self, const char* bytes, int32 numBytes);
	void be_BView_KeyDown(void *self, char* bytes, int32 numBytes);

	// void be_BView_KeyUp(BViewProxy *self, const char* bytes, int32 numBytes);
	void be_BView_KeyUp(void *self, char* bytes, int32 numBytes);

	// void be_BView_Pulse(BViewProxy *self);
	void be_BView_Pulse(void *self);

	// void be_BView_FrameMoved(BViewProxy *self, BPoint *newPosition);
	void be_BView_FrameMoved(void *self, void *newPosition);

	// void be_BView_FrameResized(BViewProxy *self, float newWidth, float newHeight);
	void be_BView_FrameResized(void *self, float newWidth, float newHeight);

	// void be_BView_TargetedByScrollView(BViewProxy *self, BScrollView* scrollView);
	void be_BView_TargetedByScrollView(void *self, void* scrollView);

	// void be_BView_BeginRectTracking(BViewProxy *self, BRect *startRect, uint32 style);
	void be_BView_BeginRectTracking(void *self, void *startRect, uint32 style);

	// void be_BView_EndRectTracking(BViewProxy *self);
	void be_BView_EndRectTracking(void *self);

	// void be_BView_GetMouse(BViewProxy *self, BPoint* location, uint32* buttons, bool checkMessageQueue);
	void be_BView_GetMouse(void *self, void * location, uint32* buttons, bool checkMessageQueue);

	// void be_BView_DragMessage(BViewProxy *self, BMessage* message, BRect *dragRect, BHandler* replyTo);
	void be_BView_DragMessage(void *self, void * message, void *dragRect, void * replyTo);

	// void be_BView_DragMessage_1(BViewProxy *self, BMessage* message, BBitmap* bitmap, BPoint *offset, BHandler* replyTo);
	void be_BView_DragMessage_1(void *self, void * message, void* bitmap, void *offset, void * replyTo);

	// void be_BView_DragMessage_2(BViewProxy *self, BMessage* message, BBitmap* bitmap, drawing_mode dragMode, BPoint *offset, BHandler* replyTo);
	void be_BView_DragMessage_2(void *self, void * message, void* bitmap, drawing_mode dragMode, void *offset, void * replyTo);

	// BView* be_BView_FindView(BViewProxy *self, const char* name);
	void* be_BView_FindView(void *self, char* name);

	// BView* be_BView_Parent(BViewProxy *self);
	void* be_BView_Parent(void *self);

	// BRect * be_BView_Bounds(BViewProxy *self);
	void * be_BView_Bounds(void *self);

	// BRect * be_BView_Frame(BViewProxy *self);
	void * be_BView_Frame(void *self);

	// void be_BView_ConvertToScreen(BViewProxy *self, BPoint* pt);
	void be_BView_ConvertToScreen(void *self, void * pt);

	// BPoint * be_BView_ConvertToScreen_1(BViewProxy *self, BPoint *pt);
	void * be_BView_ConvertToScreen_1(void *self, void *pt);

	// void be_BView_ConvertFromScreen(BViewProxy *self, BPoint* pt);
	void be_BView_ConvertFromScreen(void *self, void * pt);

	// BPoint * be_BView_ConvertFromScreen_1(BViewProxy *self, BPoint *pt);
	void * be_BView_ConvertFromScreen_1(void *self, void *pt);

	// void be_BView_ConvertToScreen_2(BViewProxy *self, BRect* r);
	void be_BView_ConvertToScreen_2(void *self, void * r);

	// BRect * be_BView_ConvertToScreen_3(BViewProxy *self, BRect *r);
	void * be_BView_ConvertToScreen_3(void *self, void *r);

	// void be_BView_ConvertFromScreen_2(BViewProxy *self, BRect* r);
	void be_BView_ConvertFromScreen_2(void *self, void * r);

	// BRect * be_BView_ConvertFromScreen_3(BViewProxy *self, BRect *r);
	void * be_BView_ConvertFromScreen_3(void *self, void *r);

	// void be_BView_ConvertToParent(BViewProxy *self, BPoint* pt);
	void be_BView_ConvertToParent(void *self, void * pt);

	// BPoint * be_BView_ConvertToParent_1(BViewProxy *self, BPoint *pt);
	void * be_BView_ConvertToParent_1(void *self, void *pt);

	// void be_BView_ConvertFromParent(BViewProxy *self, BPoint* pt);
	void be_BView_ConvertFromParent(void *self, void * pt);

	// BPoint * be_BView_ConvertFromParent_1(BViewProxy *self, BPoint *pt);
	void * be_BView_ConvertFromParent_1(void *self, void *pt);

	// void be_BView_ConvertToParent_2(BViewProxy *self, BRect* r);
	void be_BView_ConvertToParent_2(void *self, void * r);

	// BRect * be_BView_ConvertToParent_3(BViewProxy *self, BRect *r);
	void * be_BView_ConvertToParent_3(void *self, void *r);

	// void be_BView_ConvertFromParent_2(BViewProxy *self, BRect* r);
	void be_BView_ConvertFromParent_2(void *self, void * r);

	// BRect * be_BView_ConvertFromParent_3(BViewProxy *self, BRect *r);
	void * be_BView_ConvertFromParent_3(void *self, void *r);

	// BPoint * be_BView_LeftTop(BViewProxy *self);
	void * be_BView_LeftTop(void *self);

	// void be_BView_GetClippingRegion(BViewProxy *self, BRegion* region);
	void be_BView_GetClippingRegion(void *self, void * region);

	// void be_BView_ConstrainClippingRegion(BViewProxy *self, BRegion* region);
	void be_BView_ConstrainClippingRegion(void *self, void * region);

	// void be_BView_ClipToPicture(BViewProxy *self, BPicture* picture, BPoint *where, bool sync);
	void be_BView_ClipToPicture(void *self, void* picture, void *where, bool sync);

	// void be_BView_ClipToPicture_1(BViewProxy *self, BPicture* picture, BPoint *where, bool sync);
	void be_BView_ClipToPicture_1(void *self, void* picture, void *where, bool sync);

	// void be_BView_SetDrawingMode(BViewProxy *self, drawing_mode mode);
	void be_BView_SetDrawingMode(void *self, drawing_mode mode);

	// drawing_mode be_BView_DrawingMode(BViewProxy *self);
	drawing_mode be_BView_DrawingMode(void *self);

	// void be_BView_SetBlendingMode(BViewProxy *self, source_alpha srcAlpha, alpha_function alphaFunc);
	void be_BView_SetBlendingMode(void *self, source_alpha srcAlpha, alpha_function alphaFunc);

	// void be_BView_GetBlendingMode(BViewProxy *self, source_alpha* srcAlpha, alpha_function* alphaFunc);
	void be_BView_GetBlendingMode(void *self, source_alpha* srcAlpha, alpha_function* alphaFunc);

	// void be_BView_SetPenSize(BViewProxy *self, float size);
	void be_BView_SetPenSize(void *self, float size);

	// float be_BView_PenSize(BViewProxy *self);
	float be_BView_PenSize(void *self);

	// void be_BView_SetViewCursor(BViewProxy *self, const BCursor* cursor, bool sync);
	void be_BView_SetViewCursor(void *self, void* cursor, bool sync);

	// void be_BView_SetViewColor(BViewProxy *self, rgb_color c);
	void be_BView_SetViewColor(void *self, rgb_color c);

	// void be_BView_SetViewColor_1(BViewProxy *self, uchar r, uchar g, uchar b, uchar a);
	void be_BView_SetViewColor_1(void *self, uchar r, uchar g, uchar b, uchar a);

	// rgb_color be_BView_ViewColor(BViewProxy *self);
	rgb_color be_BView_ViewColor(void *self);

	// void be_BView_SetViewBitmap(BViewProxy *self, const BBitmap* bitmap, BRect *srcRect, BRect *dstRect, uint32 followFlags, uint32 options);
	void be_BView_SetViewBitmap(void *self, void* bitmap, void *srcRect, void *dstRect, uint32 followFlags, uint32 options);

	// void be_BView_SetViewBitmap_1(BViewProxy *self, const BBitmap* bitmap, uint32 followFlags, uint32 options);
	void be_BView_SetViewBitmap_1(void *self, void* bitmap, uint32 followFlags, uint32 options);

	// void be_BView_ClearViewBitmap(BViewProxy *self);
	void be_BView_ClearViewBitmap(void *self);

	// status_t be_BView_SetViewOverlay(BViewProxy *self, const BBitmap* overlay, BRect *srcRect, BRect *dstRect, rgb_color* colorKey, uint32 followFlags, uint32 options);
	status_t be_BView_SetViewOverlay(void *self, void* overlay, void *srcRect, void *dstRect, rgb_color* colorKey, uint32 followFlags, uint32 options);

	// status_t be_BView_SetViewOverlay_1(BViewProxy *self, const BBitmap* overlay, rgb_color* colorKey, uint32 followFlags, uint32 options);
	status_t be_BView_SetViewOverlay_1(void *self, void* overlay, rgb_color* colorKey, uint32 followFlags, uint32 options);

	// void be_BView_ClearViewOverlay(BViewProxy *self);
	void be_BView_ClearViewOverlay(void *self);

	// void be_BView_SetHighColor(BViewProxy *self, rgb_color a_color);
	void be_BView_SetHighColor(void *self, rgb_color a_color);

	// void be_BView_SetHighColor_1(BViewProxy *self, uchar r, uchar g, uchar b, uchar a);
	void be_BView_SetHighColor_1(void *self, uchar r, uchar g, uchar b, uchar a);

	// rgb_color be_BView_HighColor(BViewProxy *self);
	rgb_color be_BView_HighColor(void *self);

	// void be_BView_SetLowColor(BViewProxy *self, rgb_color a_color);
	void be_BView_SetLowColor(void *self, rgb_color a_color);

	// void be_BView_SetLowColor_1(BViewProxy *self, uchar r, uchar g, uchar b, uchar a);
	void be_BView_SetLowColor_1(void *self, uchar r, uchar g, uchar b, uchar a);

	// rgb_color be_BView_LowColor(BViewProxy *self);
	rgb_color be_BView_LowColor(void *self);

	// void be_BView_SetLineMode(BViewProxy *self, cap_mode lineCap, join_mode lineJoin, float miterLimit);
	void be_BView_SetLineMode(void *self, cap_mode lineCap, join_mode lineJoin, float miterLimit);

	// join_mode be_BView_LineJoinMode(BViewProxy *self);
	join_mode be_BView_LineJoinMode(void *self);

	// cap_mode be_BView_LineCapMode(BViewProxy *self);
	cap_mode be_BView_LineCapMode(void *self);

	// float be_BView_LineMiterLimit(BViewProxy *self);
	float be_BView_LineMiterLimit(void *self);

	// void be_BView_SetOrigin(BViewProxy *self, BPoint *pt);
	void be_BView_SetOrigin(void *self, void *pt);

	// void be_BView_SetOrigin_1(BViewProxy *self, float x, float y);
	void be_BView_SetOrigin_1(void *self, float x, float y);

	// BPoint * be_BView_Origin(BViewProxy *self);
	void * be_BView_Origin(void *self);

	// void be_BView_PushState(BViewProxy *self);
	void be_BView_PushState(void *self);

	// void be_BView_PopState(BViewProxy *self);
	void be_BView_PopState(void *self);

	// void be_BView_MovePenTo(BViewProxy *self, BPoint *pt);
	void be_BView_MovePenTo(void *self, void *pt);

	// void be_BView_MovePenTo_1(BViewProxy *self, float x, float y);
	void be_BView_MovePenTo_1(void *self, float x, float y);

	// void be_BView_MovePenBy(BViewProxy *self, float x, float y);
	void be_BView_MovePenBy(void *self, float x, float y);

	// BPoint * be_BView_PenLocation(BViewProxy *self);
	void * be_BView_PenLocation(void *self);

	// void be_BView_StrokeLine(BViewProxy *self, BPoint *toPt, pattern p);
	void be_BView_StrokeLine(void *self, void *toPt, pattern p);

	// void be_BView_StrokeLine_1(BViewProxy *self, BPoint *a, BPoint *b, pattern p);
	void be_BView_StrokeLine_1(void *self, void *a, void *b, pattern p);

	// void be_BView_BeginLineArray(BViewProxy *self, int32 count);
	void be_BView_BeginLineArray(void *self, int32 count);

	// void be_BView_AddLine(BViewProxy *self, BPoint *a, BPoint *b, rgb_color color);
	void be_BView_AddLine(void *self, void *a, void *b, rgb_color color);

	// void be_BView_EndLineArray(BViewProxy *self);
	void be_BView_EndLineArray(void *self);

	// void be_BView_StrokePolygon(BViewProxy *self, const BPolygon* polygon, bool closed, pattern p);
	void be_BView_StrokePolygon(void *self, void * polygon, bool closed, pattern p);

	// void be_BView_StrokePolygon_1(BViewProxy *self, const BPoint* ptArray, int32 numPts, bool closed, pattern p);
	void be_BView_StrokePolygon_1(void *self, void * ptArray, int32 numPts, bool closed, pattern p);

	// void be_BView_StrokePolygon_2(BViewProxy *self, const BPoint* ptArray, int32 numPts, BRect *bounds, bool closed);
	void be_BView_StrokePolygon_2(void *self, void * ptArray, int32 numPts, void *bounds, bool closed);

	// void be_BView_FillPolygon(BViewProxy *self, const BPolygon* polygon, pattern p);
	void be_BView_FillPolygon(void *self, void * polygon, pattern p);

	// void be_BView_FillPolygon_1(BViewProxy *self, const BPoint* ptArray, int32 numPts, pattern p);
	void be_BView_FillPolygon_1(void *self, void * ptArray, int32 numPts, pattern p);

	// void be_BView_FillPolygon_2(BViewProxy *self, const BPoint* ptArray, int32 numPts, BRect *bounds, pattern p);
	void be_BView_FillPolygon_2(void *self, void * ptArray, int32 numPts, void *bounds, pattern p);

	// void be_BView_FillPolygon_3(BViewProxy *self, const BPolygon* polygon, const BGradient* gradient);
	void be_BView_FillPolygon_3(void *self, void * polygon, void * gradient);

	// void be_BView_FillPolygon_4(BViewProxy *self, const BPoint* ptArray, int32 numPts, const BGradient* gradient);
	void be_BView_FillPolygon_4(void *self, void * ptArray, int32 numPts, void * gradient);

	// void be_BView_FillPolygon_5(BViewProxy *self, const BPoint* ptArray, int32 numPts, BRect *bounds, const BGradient* gradient);
	void be_BView_FillPolygon_5(void *self, void * ptArray, int32 numPts, void *bounds, void * gradient);

	// void be_BView_StrokeRect(BViewProxy *self, BRect *r, pattern p);
	void be_BView_StrokeRect(void *self, void *r, pattern p);

	// void be_BView_FillRect(BViewProxy *self, BRect *r, pattern p);
	void be_BView_FillRect(void *self, void *r, pattern p);

	// void be_BView_FillRect_1(BViewProxy *self, BRect *r, const BGradient* gradient);
	void be_BView_FillRect_1(void *self, void *r, void * gradient);

	// void be_BView_FillRegion(BViewProxy *self, BRegion* region, pattern p);
	void be_BView_FillRegion(void *self, void * region, pattern p);

	// void be_BView_FillRegion_1(BViewProxy *self, BRegion* region, const BGradient* gradient);
	void be_BView_FillRegion_1(void *self, void * region, void * gradient);

	// void be_BView_InvertRect(BViewProxy *self, BRect *r);
	void be_BView_InvertRect(void *self, void *r);

	// void be_BView_StrokeRoundRect(BViewProxy *self, BRect *r, float xRadius, float yRadius, pattern p);
	void be_BView_StrokeRoundRect(void *self, void *r, float xRadius, float yRadius, pattern p);

	// void be_BView_FillRoundRect(BViewProxy *self, BRect *r, float xRadius, float yRadius, pattern p);
	void be_BView_FillRoundRect(void *self, void *r, float xRadius, float yRadius, pattern p);

	// void be_BView_FillRoundRect_1(BViewProxy *self, BRect *r, float xRadius, float yRadius, const BGradient* gradient);
	void be_BView_FillRoundRect_1(void *self, void *r, float xRadius, float yRadius, void * gradient);

	// void be_BView_StrokeEllipse(BViewProxy *self, BPoint *center, float xRadius, float yRadius, pattern p);
	void be_BView_StrokeEllipse(void *self, void *center, float xRadius, float yRadius, pattern p);

	// void be_BView_StrokeEllipse_1(BViewProxy *self, BRect *r, pattern p);
	void be_BView_StrokeEllipse_1(void *self, void *r, pattern p);

	// void be_BView_FillEllipse(BViewProxy *self, BPoint *center, float xRadius, float yRadius, pattern p);
	void be_BView_FillEllipse(void *self, void *center, float xRadius, float yRadius, pattern p);

	// void be_BView_FillEllipse_1(BViewProxy *self, BRect *r, pattern p);
	void be_BView_FillEllipse_1(void *self, void *r, pattern p);

	// void be_BView_FillEllipse_2(BViewProxy *self, BPoint *center, float xRadius, float yRadius, const BGradient* gradient);
	void be_BView_FillEllipse_2(void *self, void *center, float xRadius, float yRadius, void * gradient);

	// void be_BView_FillEllipse_3(BViewProxy *self, BRect *r, const BGradient* gradient);
	void be_BView_FillEllipse_3(void *self, void *r, void * gradient);

	// void be_BView_StrokeArc(BViewProxy *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);
	void be_BView_StrokeArc(void *self, void *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);

	// void be_BView_StrokeArc_1(BViewProxy *self, BRect *r, float startAngle, float arcAngle, pattern p);
	void be_BView_StrokeArc_1(void *self, void *r, float startAngle, float arcAngle, pattern p);

	// void be_BView_FillArc(BViewProxy *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);
	void be_BView_FillArc(void *self, void *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);

	// void be_BView_FillArc_1(BViewProxy *self, BRect *r, float startAngle, float arcAngle, pattern p);
	void be_BView_FillArc_1(void *self, void *r, float startAngle, float arcAngle, pattern p);

	// void be_BView_FillArc_2(BViewProxy *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, const BGradient* gradient);
	void be_BView_FillArc_2(void *self, void *center, float xRadius, float yRadius, float startAngle, float arcAngle, void * gradient);

	// void be_BView_FillArc_3(BViewProxy *self, BRect *r, float startAngle, float arcAngle, const BGradient* gradient);
	void be_BView_FillArc_3(void *self, void *r, float startAngle, float arcAngle, void * gradient);

	// void be_BView_StrokeBezier(BViewProxy *self, BPoint* controlPoints, pattern p);
	void be_BView_StrokeBezier(void *self, void * controlPoints, pattern p);

	// void be_BView_FillBezier(BViewProxy *self, BPoint* controlPoints, pattern p);
	void be_BView_FillBezier(void *self, void * controlPoints, pattern p);

	// void be_BView_FillBezier_1(BViewProxy *self, BPoint* controlPoints, const BGradient* gradient);
	void be_BView_FillBezier_1(void *self, void * controlPoints, void * gradient);

	// void be_BView_StrokeShape(BViewProxy *self, BShape* shape, pattern p);
	void be_BView_StrokeShape(void *self, void* shape, pattern p);

	// void be_BView_FillShape(BViewProxy *self, BShape* shape, pattern p);
	void be_BView_FillShape(void *self, void* shape, pattern p);

	// void be_BView_FillShape_1(BViewProxy *self, BShape* shape, const BGradient* gradien);
	void be_BView_FillShape_1(void *self, void* shape, void * gradien);

	// void be_BView_CopyBits(BViewProxy *self, BRect *src, BRect *dst);
	void be_BView_CopyBits(void *self, void *src, void *dst);

	// void be_BView_DrawBitmapAsync(BViewProxy *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options);
	void be_BView_DrawBitmapAsync(void *self, void* aBitmap, void *bitmapRect, void *viewRect, uint32 options);

	// void be_BView_DrawBitmapAsync_1(BViewProxy *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect);
	void be_BView_DrawBitmapAsync_1(void *self, void* aBitmap, void *bitmapRect, void *viewRect);

	// void be_BView_DrawBitmapAsync_2(BViewProxy *self, const BBitmap* aBitmap, BRect *viewRec);
	void be_BView_DrawBitmapAsync_2(void *self, void* aBitmap, void *viewRec);

	// void be_BView_DrawBitmapAsync_3(BViewProxy *self, const BBitmap* aBitmap, BPoint *where);
	void be_BView_DrawBitmapAsync_3(void *self, void* aBitmap, void *where);

	// void be_BView_DrawBitmapAsync_4(BViewProxy *self, const BBitmap* aBitmap);
	void be_BView_DrawBitmapAsync_4(void *self, void* aBitmap);

	// void be_BView_DrawBitmap(BViewProxy *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options);
	void be_BView_DrawBitmap(void *self, void* aBitmap, void *bitmapRect, void *viewRect, uint32 options);

	// void be_BView_DrawBitmap_1(BViewProxy *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect);
	void be_BView_DrawBitmap_1(void *self, void* aBitmap, void *bitmapRect, void *viewRect);

	// void be_BView_DrawBitmap_2(BViewProxy *self, const BBitmap* aBitmap, BRect *viewRect);
	void be_BView_DrawBitmap_2(void *self, void* aBitmap, void *viewRect);

	// void be_BView_DrawBitmap_3(BViewProxy *self, const BBitmap* aBitmap, BPoint *where);
	void be_BView_DrawBitmap_3(void *self, void* aBitmap, void *where);

	// void be_BView_DrawBitmap_4(BViewProxy *self, const BBitmap* aBitmap);
	void be_BView_DrawBitmap_4(void *self, void* aBitmap);

	// void be_BView_DrawChar(BViewProxy *self, char aChar);
	void be_BView_DrawChar(void *self, char aChar);

	// void be_BView_DrawChar_1(BViewProxy *self, char aChar, BPoint *location);
	void be_BView_DrawChar_1(void *self, char aChar, void *location);

	// void be_BView_DrawString(BViewProxy *self, const char* string, escapement_delta* delta);
	void be_BView_DrawString(void *self, char* string, escapement_delta* delta);

	// void be_BView_DrawString_1(BViewProxy *self, const char* string, BPoint *location, escapement_delta* delta);
	void be_BView_DrawString_1(void *self, char* string, void *location, escapement_delta* delta);

	// void be_BView_DrawString_2(BViewProxy *self, const char* string, int32 length, escapement_delta* delta);
	void be_BView_DrawString_2(void *self, char* string, int32 length, escapement_delta* delta);

	// void be_BView_DrawString_3(BViewProxy *self, const char* string, int32 length, BPoint *location, escapement_delta* delta);
	void be_BView_DrawString_3(void *self, char* string, int32 length, void *location, escapement_delta* delta);

	// void be_BView_DrawString_4(BViewProxy *self, const char* string, const BPoint* locations, int32 locationCount);
	void be_BView_DrawString_4(void *self, char* string, void * locations, int32 locationCount);

	// void be_BView_DrawString_5(BViewProxy *self, const char* string, int32 length, const BPoint* locations, int32 locationCount);
	void be_BView_DrawString_5(void *self, char* string, int32 length, void * locations, int32 locationCount);

	// void be_BView_SetFont(BViewProxy *self, const BFont* font, uint32 mask);
	void be_BView_SetFont(void *self, void* font, uint32 mask);

	// void be_BView_GetFont(BViewProxy *self, BFont* font);
	void be_BView_GetFont(void *self, void* font);

	// void be_BView_TruncateString(BViewProxy *self, BString* in_out, uint32 mode, float width);
	void be_BView_TruncateString(void *self, void* in_out, uint32 mode, float width);

	// float be_BView_StringWidth(BViewProxy *self, const char* string);
	float be_BView_StringWidth(void *self, char* string);

	// float be_BView_StringWidth_1(BViewProxy *self, const char* string, int32 length);
	float be_BView_StringWidth_1(void *self, char* string, int32 length);

	// void be_BView_GetStringWidths(BViewProxy *self, char* stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[]);
	void be_BView_GetStringWidths(void *self, char* stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[]);

	// void be_BView_SetFontSize(BViewProxy *self, float size);
	void be_BView_SetFontSize(void *self, float size);

	// void be_BView_ForceFontAliasing(BViewProxy *self, bool enable);
	void be_BView_ForceFontAliasing(void *self, bool enable);

	// void be_BView_GetFontHeight(BViewProxy *self, font_height* height);
	void be_BView_GetFontHeight(void *self, font_height* height);

	// void be_BView_Invalidate(BViewProxy *self, BRect *invalRect);
	void be_BView_Invalidate(void *self, void *invalRect);

	// void be_BView_Invalidate_1(BViewProxy *self, const BRegion* invalRegion);
	void be_BView_Invalidate_1(void *self, void * invalRegion);

	// void be_BView_Invalidate_2(BViewProxy *self);
	void be_BView_Invalidate_2(void *self);

	// void be_BView_SetDiskMode(BViewProxy *self, char* filename, long offset);
	void be_BView_SetDiskMode(void *self, char* filename, long offset);

	// void be_BView_BeginPicture(BViewProxy *self, BPicture* a_picture);
	void be_BView_BeginPicture(void *self, void* a_picture);

	// void be_BView_AppendToPicture(BViewProxy *self, BPicture* a_picture);
	void be_BView_AppendToPicture(void *self, void* a_picture);

	// BPicture* be_BView_EndPicture(BViewProxy *self);
	void* be_BView_EndPicture(void *self);

	// void be_BView_DrawPicture(BViewProxy *self, const BPicture* a_picture);
	void be_BView_DrawPicture(void *self, void* a_picture);

	// void be_BView_DrawPicture_1(BViewProxy *self, const BPicture* a_picture, BPoint *where);
	void be_BView_DrawPicture_1(void *self, void* a_picture, void *where);

	// void be_BView_DrawPicture_2(BViewProxy *self, const char* filename, long offset, BPoint *where);
	void be_BView_DrawPicture_2(void *self, char* filename, long offset, void *where);

	// void be_BView_DrawPicture_3(BViewProxy *self, const BPicture* a_picture);
	void be_BView_DrawPicture_3(void *self, void* a_picture);

	// void be_BView_DrawPicture_4(BViewProxy *self, const BPicture* a_picture, BPoint *where);
	void be_BView_DrawPicture_4(void *self, void* a_picture, void *where);

	// void be_BView_DrawPicture_5(BViewProxy *self, const char* filename, long offset, BPoint *where);
	void be_BView_DrawPicture_5(void *self, char* filename, long offset, void *where);

	// status_t be_BView_SetEventMask(BViewProxy *self, uint32 mask, uint32 options);
	status_t be_BView_SetEventMask(void *self, uint32 mask, uint32 options);

	// uint32 be_BView_EventMask(BViewProxy *self);
	uint32 be_BView_EventMask(void *self);

	// status_t be_BView_SetMouseEventMask(BViewProxy *self, uint32 mask, uint32 options);
	status_t be_BView_SetMouseEventMask(void *self, uint32 mask, uint32 options);

	// void be_BView_SetFlags(BViewProxy *self, uint32 flags);
	void be_BView_SetFlags(void *self, uint32 flags);

	// uint32 be_BView_Flags(BViewProxy *self);
	uint32 be_BView_Flags(void *self);

	// void be_BView_SetResizingMode(BViewProxy *self, uint32 mode);
	void be_BView_SetResizingMode(void *self, uint32 mode);

	// uint32 be_BView_ResizingMode(BViewProxy *self);
	uint32 be_BView_ResizingMode(void *self);

	// void be_BView_MoveBy(BViewProxy *self, float dh, float dv);
	void be_BView_MoveBy(void *self, float dh, float dv);

	// void be_BView_MoveTo(BViewProxy *self, BPoint *where);
	void be_BView_MoveTo(void *self, void *where);

	// void be_BView_MoveTo_1(BViewProxy *self, float x, float y);
	void be_BView_MoveTo_1(void *self, float x, float y);

	// void be_BView_ResizeBy(BViewProxy *self, float dh, float dv);
	void be_BView_ResizeBy(void *self, float dh, float dv);

	// void be_BView_ResizeTo(BViewProxy *self, float width, float height);
	void be_BView_ResizeTo(void *self, float width, float height);

	// void be_BView_ResizeTo_1(BViewProxy *self, BSize *size);
	void be_BView_ResizeTo_1(void *self, void *size);

	// void be_BView_ScrollBy(BViewProxy *self, float dh, float dv);
	void be_BView_ScrollBy(void *self, float dh, float dv);

	// void be_BView_ScrollTo(BViewProxy *self, float x, float y);
	void be_BView_ScrollTo(void *self, float x, float y);

	// void be_BView_ScrollTo_1(BViewProxy *self, BPoint *where);
	void be_BView_ScrollTo_1(void *self, void *where);

	// void be_BView_MakeFocus(BViewProxy *self, bool focusState);
	void be_BView_MakeFocus(void *self, bool focusState);

	// bool be_BView_IsFocus(BViewProxy *self);
	bool be_BView_IsFocus(void *self);

	// void be_BView_Show(BViewProxy *self);
	void be_BView_Show(void *self);

	// void be_BView_Hide(BViewProxy *self);
	void be_BView_Hide(void *self);

	// bool be_BView_IsHidden(BViewProxy *self);
	bool be_BView_IsHidden(void *self);

	// bool be_BView_IsHidden_1(BViewProxy *self, const BView* looking_from);
	bool be_BView_IsHidden_1(void *self, void* looking_from);

	// void be_BView_Flush(BViewProxy *self);
	void be_BView_Flush(void *self);

	// void be_BView_Sync(BViewProxy *self);
	void be_BView_Sync(void *self);

	// void be_BView_GetPreferredSize(BViewProxy *self, float* width, float* height);
	void be_BView_GetPreferredSize(void *self, float* width, float* height);

	// void be_BView_ResizeToPreferred(BViewProxy *self);
	void be_BView_ResizeToPreferred(void *self);

	// BScrollBar* be_BView_ScrollBar(BViewProxy *self, orientation posture);
	void* be_BView_ScrollBar(void *self, orientation posture);

	// BHandler* be_BView_ResolveSpecifier(BViewProxy *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	void * be_BView_ResolveSpecifier(void *self, void * msg, int32 index, void * specifier, int32 form,  char* property);

	// status_t be_BView_GetSupportedSuites(BViewProxy *self, BMessage* data);
	status_t be_BView_GetSupportedSuites(void *self, void * data);

	// bool be_BView_IsPrinting(BViewProxy *self);
	bool be_BView_IsPrinting(void *self);

	// void be_BView_SetScale(BViewProxy *self, float scale);
	void be_BView_SetScale(void *self, float scale);

	// float be_BView_Scale(BViewProxy *self);
	float be_BView_Scale(void *self);

	// status_t be_BView_Perform(BViewProxy *self, perform_code code, void* data);
	status_t be_BView_Perform(void *self, perform_code code, void* data);

	// void be_BView_DrawAfterChildren(BViewProxy *self, BRect *r);
	void be_BView_DrawAfterChildren(void *self, void *r);

	// BSize * be_BView_MinSize(BViewProxy *self);
	void * be_BView_MinSize(void *self);

	// BSize * be_BView_MaxSize(BViewProxy *self);
	void * be_BView_MaxSize(void *self);

	// BSize * be_BView_PreferredSize(BViewProxy *self);
	void * be_BView_PreferredSize(void *self);

	// BAlignment * be_BView_LayoutAlignment(BViewProxy *self);
	void * be_BView_LayoutAlignment(void *self);

	// void be_BView_SetExplicitMinSize(BViewProxy *self, BSize *size);
	void be_BView_SetExplicitMinSize(void *self, void *size);

	// void be_BView_SetExplicitMaxSize(BViewProxy *self, BSize *size);
	void be_BView_SetExplicitMaxSize(void *self, void *size);

	// void be_BView_SetExplicitPreferredSize(BViewProxy *self, BSize *size);
	void be_BView_SetExplicitPreferredSize(void *self, void *size);

	// void be_BView_SetExplicitAlignment(BViewProxy *self, BAlignment *alignment);
	void be_BView_SetExplicitAlignment(void *self, void *alignment);

	// BSize * be_BView_ExplicitMinSize(BViewProxy *self);
	void * be_BView_ExplicitMinSize(void *self);

	// BSize * be_BView_ExplicitMaxSize(BViewProxy *self);
	void * be_BView_ExplicitMaxSize(void *self);

	// BSize * be_BView_ExplicitPreferredSize(BViewProxy *self);
	void * be_BView_ExplicitPreferredSize(void *self);

	// BAlignment * be_BView_ExplicitAlignment(BViewProxy *self);
	void * be_BView_ExplicitAlignment(void *self);

	// bool be_BView_HasHeightForWidth(BViewProxy *self);
	bool be_BView_HasHeightForWidth(void *self);

	// void be_BView_GetHeightForWidth(BViewProxy *self, float width, float* min, float* max, float* preferred);
	void be_BView_GetHeightForWidth(void *self, float width, float* min, float* max, float* preferred);

	// void be_BView_SetLayout(BViewProxy *self, BLayout* layout);
	void be_BView_SetLayout(void *self, void * layout);

	// BLayout* be_BView_GetLayout(BViewProxy *self);
	void * be_BView_GetLayout(void *self);

	// void be_BView_InvalidateLayout(BViewProxy *self, bool descendants);
	void be_BView_InvalidateLayout(void *self, bool descendants);

	// void be_BView_EnableLayoutInvalidation(BViewProxy *self);
	void be_BView_EnableLayoutInvalidation(void *self);

	// void be_BView_DisableLayoutInvalidation(BViewProxy *self);
	void be_BView_DisableLayoutInvalidation(void *self);

	// bool be_BView_IsLayoutValid(BViewProxy *self);
	bool be_BView_IsLayoutValid(void *self);

	// void be_BView_ResetLayoutInvalidation(BViewProxy *self);
	void be_BView_ResetLayoutInvalidation(void *self);

	// BLayoutContext* be_BView_LayoutContext(BViewProxy *self);
	void * be_BView_LayoutContext(void *self);

	// void be_BView_Layout(BViewProxy *self, bool force);
	void be_BView_Layout(void *self, bool force);

	// void be_BView_Relayout(BViewProxy *self);
	void be_BView_Relayout(void *self);

}


extern (C) {
	status_t bind_BView_Archive(void *bindInstPtr, void* archive, bool deep) {
		return (cast(BView)bindInstPtr).Archive(new BMessage(archive, false), deep);
	}

	status_t bind_BView_AllUnarchived(void *bindInstPtr, void* archive) {
		return (cast(BView)bindInstPtr).AllUnarchived(new BMessage(archive, false));
	}

	status_t bind_BView_AllArchived(void *bindInstPtr, void* archive) {
		return (cast(BView)bindInstPtr).AllArchived(new BMessage(archive, false));
	}

	void bind_BView_AttachedToWindow(void *bindInstPtr) {
		(cast(BView)bindInstPtr).AttachedToWindow();
	}

	void bind_BView_AllAttached(void *bindInstPtr) {
		(cast(BView)bindInstPtr).AllAttached();
	}

	void bind_BView_DetachedFromWindow(void *bindInstPtr) {
		(cast(BView)bindInstPtr).DetachedFromWindow();
	}

	void bind_BView_AllDetached(void *bindInstPtr) {
		(cast(BView)bindInstPtr).AllDetached();
	}

	void bind_BView_MessageReceived(void *bindInstPtr, void* message) {
		(cast(BView)bindInstPtr).MessageReceived(new BMessage(message, false));
	}

	void bind_BView_Draw(void *bindInstPtr, void *updateRect) {
		(cast(BView)bindInstPtr).Draw(new BRect(updateRect, false));
	}

	void bind_BView_MouseDown(void *bindInstPtr, void *where) {
		(cast(BView)bindInstPtr).MouseDown(new BPoint(where, false));
	}

	void bind_BView_MouseUp(void *bindInstPtr, void *where) {
		(cast(BView)bindInstPtr).MouseUp(new BPoint(where, false));
	}

	void bind_BView_MouseMoved(void *bindInstPtr, void *where, uint32 code,  void* dragMessage) {
		(cast(BView)bindInstPtr).MouseMoved(new BPoint(where, false), code, new BMessage(dragMessage, false));
	}

	void bind_BView_WindowActivated(void *bindInstPtr, bool state) {
		(cast(BView)bindInstPtr).WindowActivated(state);
	}

	void bind_BView_KeyDown(void *bindInstPtr, char* bytes, int32 numBytes) {
		(cast(BView)bindInstPtr).KeyDown(bytes[0..numBytes], numBytes);
	}

	void bind_BView_KeyUp(void *bindInstPtr, char* bytes, int32 numBytes) {
		(cast(BView)bindInstPtr).KeyUp(bytes[0..numBytes], numBytes);
	}

	void bind_BView_Pulse(void *bindInstPtr) {
		(cast(BView)bindInstPtr).Pulse();
	}

	void bind_BView_FrameMoved(void *bindInstPtr, void *newPosition) {
		(cast(BView)bindInstPtr).FrameMoved(new BPoint(newPosition, false));
	}

	void bind_BView_FrameResized(void *bindInstPtr, float newWidth, float newHeight) {
		return (cast(BView)bindInstPtr).FrameResized(newWidth, newHeight);
	}

	void bind_BView_TargetedByScrollView(void *bindInstPtr, void* scrollView) {
		assert(false, "bind_BView_TargetedByScrollView(void *bindInstPtr, BScrollView* scrollView) Unimplemented");
	}

	void bind_BView_ConstrainClippingRegion(void *bindInstPtr, void* region) {
		assert(false, "bind_BView_ConstrainClippingRegion(void *bindInstPtr, BRegion* region) Unimplemented");
	}

	void bind_BView_SetDrawingMode(void *bindInstPtr, drawing_mode mode) {
		(cast(BView)bindInstPtr).SetDrawingMode(mode);
	}

	void bind_BView_SetPenSize(void *bindInstPtr, float size) {
		(cast(BView)bindInstPtr).SetPenSize(size);
	}

	void bind_BView_SetViewColor(void *bindInstPtr, rgb_color c) {
		(cast(BView)bindInstPtr).SetViewColor(c);
	}

	void bind_BView_SetHighColor(void *bindInstPtr, rgb_color a_color) {
		(cast(BView)bindInstPtr).SetHighColor(a_color);
	}

	void bind_BView_SetLowColor(void *bindInstPtr, rgb_color a_color) {
		(cast(BView)bindInstPtr).SetLowColor(a_color);
	}

	void bind_BView_SetFont(void *bindInstPtr, void* font, uint32 mask) {
		assert(false, "bind_BView_SetFont(void *bindInstPtr, const BFont* font, uint32 mask) Unimplemented");
	}

	void bind_BView_SetFlags(void *bindInstPtr, uint32 flags) {
		(cast(BView)bindInstPtr).SetFlags(flags);
	}

	void bind_BView_SetResizingMode(void *bindInstPtr, uint32 mode) {
		(cast(BView)bindInstPtr).SetResizingMode(mode);
	}

	void bind_BView_ScrollTo_1(void *bindInstPtr, void *where) {
		assert(false, "bind_BView_ScrollTo_1(void *bindInstPtr, BPoint *where) Unimplemented");
	}

	void bind_BView_MakeFocus(void *bindInstPtr, bool focusState) {
//		return (cast(BView)bindInstPtr).MakeFocus(focusState);
	}

	void bind_BView_Show(void *bindInstPtr) {
		(cast(BView)bindInstPtr).Show();
	}

	void bind_BView_Hide(void *bindInstPtr) {
		(cast(BView)bindInstPtr).Hide();
	}

	void bind_BView_GetPreferredSize(void *bindInstPtr, float* width, float* height) {
		assert(false, "bind_BView_GetPreferredSize(void *bindInstPtr, float* width, float* height) Unimplemented");
	}

	void bind_BView_ResizeToPreferred(void *bindInstPtr) {
		assert(false, "bind_BView_ResizeToPreferred(void *bindInstPtr) Unimplemented");
	}

	void* bind_BView_ResolveSpecifier(void *bindInstPtr, void* msg, int32 index, void* specifier, int32 form,  char* property) {
		assert(false, "bind_BView_ResolveSpecifier(void *bindInstPtr, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property) Unimplemented");
	}

	status_t bind_BView_GetSupportedSuites(void *bindInstPtr, void* data) {
		assert(false, "bind_BView_GetSupportedSuites(void *bindInstPtr, BMessage* data) Unimplemented");
	}

	status_t bind_BView_Perform(void *bindInstPtr, perform_code code, void* data) {
		assert(false, "bind_BView_Perform(void *bindInstPtr, perform_code code, void* data) Unimplemented");
	}

	void bind_BView_DrawAfterChildren(void *bindInstPtr, void *r) {
		assert(false, "bind_BView_DrawAfterChildren(void *bindInstPtr, BRect *r) Unimplemented");
	}

	BSize * bind_BView_MinSize(void *bindInstPtr) {
		assert(false, "bind_BView_MinSize(void *bindInstPtr) Unimplemented");
	}

	BSize * bind_BView_MaxSize(void *bindInstPtr) {
		assert(false, "bind_BView_MaxSize(void *bindInstPtr) Unimplemented");
	}

	BSize * bind_BView_PreferredSize(void *bindInstPtr) {
		assert(false, "bind_BView_PreferredSize(void *bindInstPtr) Unimplemented");
	}

	BAlignment * bind_BView_LayoutAlignment(void *bindInstPtr) {
		assert(false, "bind_BView_LayoutAlignment(void *bindInstPtr) Unimplemented");
	}

	bool bind_BView_HasHeightForWidth(void *bindInstPtr) {
		assert(false, "bind_BView_HasHeightForWidth(void *bindInstPtr) Unimplemented");
	}

	void bind_BView_GetHeightForWidth(void *bindInstPtr, float width, float* min, float* max, float* preferred) {
		assert(false, "bind_BView_GetHeightForWidth(void *bindInstPtr, float width, float* min, float* max, float* preferred) Unimplemented");
	}

	void bind_BView_SetLayout(void *bindInstPtr, void* layout) {
		assert(false, "bind_BView_SetLayout(void *bindInstPtr, BLayout* layout) Unimplemented");
	}

	void bind_BView_InvalidateLayout(void *bindInstPtr, bool descendants) {
		return (cast(BView)bindInstPtr).InvalidateLayout(descendants);
	}

}


interface IBView
{
	// BArchivable* be_BView_Instantiate(BView *self, BMessage* archive);
//	BArchivable* Instantiate();

	// status_t be_BView_Archive(BView *self, BMessage* archive, bool deep);
	status_t Archive(BMessage, bool);

	// status_t be_BView_AllUnarchived(BView *self, const BMessage* archive);
	status_t AllUnarchived(BMessage);

	// status_t be_BView_AllArchived(BView *self, BMessage* archive);
	status_t AllArchived(BMessage);

	// void be_BView_AttachedToWindow(BView *self);
	void AttachedToWindow();

	// void be_BView_AllAttached(BView *self);
	void AllAttached();

	// void be_BView_DetachedFromWindow(BView *self);
	void DetachedFromWindow();

	// void be_BView_AllDetached(BView *self);
	void AllDetached();

	// void be_BView_MessageReceived(BView *self, BMessage* message);
	void MessageReceived(BMessage);

	// void be_BView_AddChild(BView *self, BView* child, BView* before);
	void AddChild(BView, BView);

	// bool be_BView_AddChild_1(BView *self, BLayoutItem* child);
//	bool AddChild(BLayoutItem);

	// bool be_BView_RemoveChild(BView *self, BView* child);
	bool RemoveChild(BView);

	// int32 be_BView_CountChildren(BView *self);
	int32 CountChildren();

	// BView* be_BView_ChildAt(BView *self, int32 index);
	BView ChildAt(int32 index);

	// BView* be_BView_NextSibling(BView *self);
	BView NextSibling();

	// BView* be_BView_PreviousSibling(BView *self);
	BView PreviousSibling();

	// bool be_BView_RemoveSelf(BView *self);
	bool RemoveSelf();


	// BWindow* be_BView_Window(BView *self);
	BWindow Window();

	// void be_BView_Draw(BView *self, BRect *updateRect);
	void Draw(BRect);

	// void be_BView_MouseDown(BView *self, BPoint *where);
	void MouseDown(BPoint);

	// void be_BView_MouseUp(BView *self, BPoint *where);
	void MouseUp(BPoint);

	// void be_BView_MouseMoved(BView *self, BPoint *where, uint32 code, const BMessage* dragMessage);
	void MouseMoved(BPoint, uint32, BMessage);

	// void be_BView_WindowActivated(BView *self, bool state);
	void WindowActivated(bool);

	// void be_BView_KeyDown(BView *self, const char* bytes, int32 numBytes);
	void KeyDown(char [], int32);

	// void be_BView_KeyUp(BView *self, const char* bytes, int32 numBytes);
	void KeyUp(char [], int32);

	// void be_BView_Pulse(BView *self);
	void Pulse();

	// void be_BView_FrameMoved(BView *self, BPoint *newPosition);
	void FrameMoved(BPoint);

	// void be_BView_FrameResized(BView *self, float newWidth, float newHeight);
	void FrameResized(float, float);

	// void be_BView_TargetedByScrollView(BView *self, BScrollView* scrollView);
//	void TargetedByScrollView(BScrollView);

	// void be_BView_BeginRectTracking(BView *self, BRect *startRect, uint32 style);
	void BeginRectTracking(BRect, uint32);

	// void be_BView_EndRectTracking(BView *self);
	void EndRectTracking();

	// void be_BView_GetMouse(BView *self, BPoint* location, uint32* buttons, bool checkMessageQueue);
	void GetMouse(BPoint, inout uint32 [], bool);

	// void be_BView_DragMessage(BView *self, BMessage* message, BRect *dragRect, BHandler* replyTo);
	void DragMessage(BMessage, BRect, BHandler);

	// void be_BView_DragMessage_1(BView *self, BMessage* message, BBitmap* bitmap, BPoint *offset, BHandler* replyTo);
//	void DragMessage(BMessage, BBitmap, BPoint, BHandler);

	// void be_BView_DragMessage_2(BView *self, BMessage* message, BBitmap* bitmap, drawing_mode dragMode, BPoint *offset, BHandler* replyTo);
//	void DragMessage(BMessage, BBitmap, drawing_mode, BPoint, BHandler);

	// BView* be_BView_FindView(BView *self, const char* name);
	BView FindView(char []);

	// BView* be_BView_Parent(BView *self);
	BView Parent();

	// BRect * be_BView_Bounds(BView *self);
	BRect Bounds();

	// BRect * be_BView_Frame(BView *self);
	BRect Frame();

	// void be_BView_ConvertToScreen(BView *self, BPoint* pt);
	void ConvertToScreen(BPoint pt);

	// BPoint * be_BView_ConvertToScreen_1(BView *self, BPoint *pt);
	BPoint ConvertToScreen(BPoint pt);

	// void be_BView_ConvertFromScreen(BView *self, BPoint* pt);
	void ConvertFromScreen(BPoint pt);

	// BPoint * be_BView_ConvertFromScreen_1(BView *self, BPoint *pt);
	BPoint ConvertFromScreen(BPoint pt);

	// void be_BView_ConvertToScreen_2(BView *self, BRect* r);
	void ConvertToScreen(BRect r);

	// BRect * be_BView_ConvertToScreen_3(BView *self, BRect *r);
	BRect ConvertToScreen(BRect r);

	// void be_BView_ConvertFromScreen_2(BView *self, BRect* r);
	void ConvertFromScreen(BRect r);

	// BRect * be_BView_ConvertFromScreen_3(BView *self, BRect *r);
	BRect ConvertFromScreen(BRect r);

	// void be_BView_ConvertToParent(BView *self, BPoint* pt);
	void ConvertToParent(BPoint pt);

	// BPoint * be_BView_ConvertToParent_1(BView *self, BPoint *pt);
	BPoint ConvertToParent(BPoint pt);

	// void be_BView_ConvertFromParent(BView *self, BPoint* pt);
	void ConvertFromParent(BPoint pt);

	// BPoint * be_BView_ConvertFromParent_1(BView *self, BPoint *pt);
	BPoint ConvertFromParent(BPoint pt);

	// void be_BView_ConvertToParent_2(BView *self, BRect* r);
	void ConvertToParent(BRect r);

	// BRect * be_BView_ConvertToParent_3(BView *self, BRect *r);
	BRect ConvertToParent(BRect r);

	// void be_BView_ConvertFromParent_2(BView *self, BRect* r);
	void ConvertFromParent(BRect r);

	// BRect * be_BView_ConvertFromParent_3(BView *self, BRect *r);
	BRect ConvertFromParent(BRect r);

	// BPoint * be_BView_LeftTop(BView *self);
	BPoint LeftTop();

	// void be_BView_GetClippingRegion(BView *self, BRegion* region);
	void GetClippingRegion(BRegion);

	// void be_BView_ConstrainClippingRegion(BView *self, BRegion* region);
	void ConstrainClippingRegion(BRegion);

	// void be_BView_ClipToPicture(BView *self, BPicture* picture, BPoint *where, bool sync);
//	void ClipToPicture(BPicture, BPoint, bool);

	// void be_BView_ClipToPicture_1(BView *self, BPicture* picture, BPoint *where, bool sync);
//	void ClipToPicture(BPicture, BPoint, bool);

	// void be_BView_SetDrawingMode(BView *self, drawing_mode mode);
	void SetDrawingMode(drawing_mode);

	// drawing_mode be_BView_DrawingMode(BView *self);
	drawing_mode DrawingMode();

	// void be_BView_SetBlendingMode(BView *self, source_alpha srcAlpha, alpha_function alphaFunc);
	void SetBlendingMode(source_alpha, alpha_function);

	// void be_BView_GetBlendingMode(BView *self, source_alpha* srcAlpha, alpha_function* alphaFunc);
	void GetBlendingMode(inout source_alpha, inout alpha_function);

	// void be_BView_SetPenSize(BView *self, float size);
	void SetPenSize(float);

	// float be_BView_PenSize(BView *self);
	float PenSize();

	// void be_BView_SetViewCursor(BView *self, const BCursor* cursor, bool sync);
	void SetViewCursor(BCursor, bool);

	// void be_BView_SetViewColor(BView *self, rgb_color c);
	void SetViewColor(rgb_color);

	// void be_BView_SetViewColor_1(BView *self, uchar r, uchar g, uchar b, uchar a);
	void SetViewColor(uchar, uchar, uchar, uchar);

	// rgb_color be_BView_ViewColor(BView *self);
	rgb_color ViewColor();
/*
	// void be_BView_SetViewBitmap(BView *self, const BBitmap* bitmap, BRect *srcRect, BRect *dstRect, uint32 followFlags, uint32 options);
	void SetViewBitmap(BBitmap, BRect, BRect, uint32, uint32);

	// void be_BView_SetViewBitmap_1(BView *self, const BBitmap* bitmap, uint32 followFlags, uint32 options);
	void SetViewBitmap();
*/
	// void be_BView_ClearViewBitmap(BView *self);
	void ClearViewBitmap();
/*
	// status_t be_BView_SetViewOverlay(BView *self, const BBitmap* overlay, BRect *srcRect, BRect *dstRect, rgb_color* colorKey, uint32 followFlags, uint32 options);
	status_t SetViewOverlay();

	// status_t be_BView_SetViewOverlay_1(BView *self, const BBitmap* overlay, rgb_color* colorKey, uint32 followFlags, uint32 options);
	status_t SetViewOverlay();
*/
	// void be_BView_ClearViewOverlay(BView *self);
	void ClearViewOverlay();

	// void be_BView_SetHighColor(BView *self, rgb_color a_color);
	void SetHighColor(rgb_color);

	// void be_BView_SetHighColor_1(BView *self, uchar r, uchar g, uchar b, uchar a);
	void SetHighColor(uchar, uchar, uchar, uchar);

	// rgb_color be_BView_HighColor(BView *self);
	rgb_color HighColor();

	// void be_BView_SetLowColor(BView *self, rgb_color a_color);
	void SetLowColor(rgb_color);

	// void be_BView_SetLowColor_1(BView *self, uchar r, uchar g, uchar b, uchar a);
	void SetLowColor(uchar, uchar, uchar, uchar);

	// rgb_color be_BView_LowColor(BView *self);
	rgb_color LowColor();

	// void be_BView_SetLineMode(BView *self, cap_mode lineCap, join_mode lineJoin, float miterLimit);
	void SetLineMode(cap_mode, join_mode, float);

	// join_mode be_BView_LineJoinMode(BView *self);
	join_mode LineJoinMode();

	// cap_mode be_BView_LineCapMode(BView *self);
	cap_mode LineCapMode();

	// float be_BView_LineMiterLimit(BView *self);
	float LineMiterLimit();

	// void be_BView_SetOrigin(BView *self, BPoint *pt);
	void SetOrigin(BPoint);

	// void be_BView_SetOrigin_1(BView *self, float x, float y);
	void SetOrigin(float, float);

	// BPoint * be_BView_Origin(BView *self);
	BPoint Origin();

	// void be_BView_PushState(BView *self);
	void PushState();

	// void be_BView_PopState(BView *self);
	void PopState();

	// void be_BView_MovePenTo(BView *self, BPoint *pt);
	void MovePenTo(BPoint);

	// void be_BView_MovePenTo_1(BView *self, float x, float y);
	void MovePenTo(float, float);

	// void be_BView_MovePenBy(BView *self, float x, float y);
	void MovePenBy(float, float);

	// BPoint * be_BView_PenLocation(BView *self);
	BPoint PenLocation();

	// void be_BView_StrokeLine(BView *self, BPoint *toPt, pattern p);
	void StrokeLine(BPoint, pattern);

	// void be_BView_StrokeLine_1(BView *self, BPoint *a, BPoint *b, pattern p);
	void StrokeLine(BPoint, BPoint, pattern);

	// void be_BView_BeginLineArray(BView *self, int32 count);
	void BeginLineArray(int32);

	// void be_BView_AddLine(BView *self, BPoint *a, BPoint *b, rgb_color color);
	void AddLine(BPoint, BPoint, rgb_color);

	// void be_BView_EndLineArray(BView *self);
	void EndLineArray();

	// void be_BView_StrokePolygon(BView *self, const BPolygon* polygon, bool closed, pattern p);
	void StrokePolygon(BPolygon, bool, pattern);

	// void be_BView_StrokePolygon_1(BView *self, const BPoint* ptArray, int32 numPts, bool closed, pattern p);
//	void StrokePolygon(BPoint [], int32, bool, pattern);

	// void be_BView_StrokePolygon_2(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, bool closed);
//	void StrokePolygon(BPoint [], int32, BRect, bool);

	// void be_BView_FillPolygon(BView *self, const BPolygon* polygon, pattern p);
	void FillPolygon(BPolygon, pattern);

	// void be_BView_FillPolygon_1(BView *self, const BPoint* ptArray, int32 numPts, pattern p);
//	void FillPolygon(BPoint [], int32, pattern);

	// void be_BView_FillPolygon_2(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, pattern p);
//	void FillPolygon(BPoint [], int32, BRect, pattern);

	// void be_BView_FillPolygon_3(BView *self, const BPolygon* polygon, const BGradient& gradient);
//	void FillPolygon(BPolygon, BGradient);
/*
	// void be_BView_FillPolygon_4(BView *self, const BPoint* ptArray, int32 numPts, const BGradient& gradient);
	void FillPolygon(BPoint [], int32, BGradient);

	// void be_BView_FillPolygon_5(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, const BGradient& gradient);
	void FillPolygon();
*/
	// void be_BView_StrokeRect(BView *self, BRect *r, pattern p);
	void StrokeRect(BRect, pattern);

	// void be_BView_FillRect(BView *self, BRect *r, pattern p);
	void FillRect(BRect, pattern);

	// void be_BView_FillRect_1(BView *self, BRect *r, const BGradient& gradient);
//	void FillRect(BRect, BGradient);

	// void be_BView_FillRegion(BView *self, BRegion* region, pattern p);
	void FillRegion(BRegion, pattern);

	// void be_BView_FillRegion_1(BView *self, BRegion* region, const BGradient& gradient);
//	void FillRegion(BRegion, BGradient);

	// void be_BView_InvertRect(BView *self, BRect *r);
	void InvertRect(BRect);

	// void be_BView_StrokeRoundRect(BView *self, BRect *r, float xRadius, float yRadius, pattern p);
	void StrokeRoundRect(BRect, float, float, pattern);

	// void be_BView_FillRoundRect(BView *self, BRect *r, float xRadius, float yRadius, pattern p);
	void FillRoundRect(BRect, float, float, pattern);

	// void be_BView_FillRoundRect_1(BView *self, BRect *r, float xRadius, float yRadius, const BGradient& gradient);
//	void FillRoundRect(BRect, float float, BGradient);

	// void be_BView_StrokeEllipse(BView *self, BPoint *center, float xRadius, float yRadius, pattern p);
	void StrokeEllipse(BPoint, float, float, pattern);

	// void be_BView_StrokeEllipse_1(BView *self, BRect *r, pattern p);
	void StrokeEllipse(BRect, pattern);

	// void be_BView_FillEllipse(BView *self, BPoint *center, float xRadius, float yRadius, pattern p);
	void FillEllipse(BPoint, float, float, pattern);

	// void be_BView_FillEllipse_1(BView *self, BRect *r, pattern p);
	void FillEllipse(BRect, pattern);

	// void be_BView_FillEllipse_2(BView *self, BPoint *center, float xRadius, float yRadius, const BGradient& gradient);
//	void FillEllipse(BPoint, float, float, BGradient);

	// void be_BView_FillEllipse_3(BView *self, BRect *r, const BGradient& gradient);
//	void FillEllipse(BRect, BGradient);

	// void be_BView_StrokeArc(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);
	void StrokeArc(BPoint, float, float, float, float, pattern);

	// void be_BView_StrokeArc_1(BView *self, BRect *r, float startAngle, float arcAngle, pattern p);
	void StrokeArc(BRect, float, float, pattern);

	// void be_BView_FillArc(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);
	void FillArc(BPoint, float, float, float, float, pattern);

	// void be_BView_FillArc_1(BView *self, BRect *r, float startAngle, float arcAngle, pattern p);
	void FillArc(BRect, float, float, pattern);

	// void be_BView_FillArc_2(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, const BGradient& gradient);
//	void FillArc(BPoint, float, float, float, float, BGradient);

	// void be_BView_FillArc_3(BView *self, BRect *r, float startAngle, float arcAngle, const BGradient& gradient);
//	void FillArc(BRect, float, float, BGradient);

	// void be_BView_StrokeBezier(BView *self, BPoint* controlPoints, pattern p);
//	void StrokeBezier();

	// void be_BView_FillBezier(BView *self, BPoint* controlPoints, pattern p);
//	void FillBezier();

	// void be_BView_FillBezier_1(BView *self, BPoint* controlPoints, const BGradient& gradient);
//	void FillBezier();

	// void be_BView_StrokeShape(BView *self, BShape* shape, pattern p);
//	void StrokeShape();

	// void be_BView_FillShape(BView *self, BShape* shape, pattern p);
//	void FillShape();

	// void be_BView_FillShape_1(BView *self, BShape* shape, const BGradient& gradien);
//	void FillShape();

	// void be_BView_CopyBits(BView *self, BRect *src, BRect *dst);
	void CopyBits(BRect, BRect);
/*
	// void be_BView_DrawBitmapAsync(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options);
	void DrawBitmapAsync();

	// void be_BView_DrawBitmapAsync_1(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect);
	void DrawBitmapAsync();

	// void be_BView_DrawBitmapAsync_2(BView *self, const BBitmap* aBitmap, BRect *viewRec);
	void DrawBitmapAsync();

	// void be_BView_DrawBitmapAsync_3(BView *self, const BBitmap* aBitmap, BPoint *where);
	void DrawBitmapAsync();

	// void be_BView_DrawBitmapAsync_4(BView *self, const BBitmap* aBitmap);
	void DrawBitmapAsync();

	// void be_BView_DrawBitmap(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options);
	void DrawBitmap();

	// void be_BView_DrawBitmap_1(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect);
	void DrawBitmap();

	// void be_BView_DrawBitmap_2(BView *self, const BBitmap* aBitmap, BRect *viewRect);
	void DrawBitmap();

	// void be_BView_DrawBitmap_3(BView *self, const BBitmap* aBitmap, BPoint *where);
	void DrawBitmap();

	// void be_BView_DrawBitmap_4(BView *self, const BBitmap* aBitmap);
	void DrawBitmap();
*/
	// void be_BView_DrawChar(BView *self, char aChar);
	void DrawChar(char);

	// void be_BView_DrawChar_1(BView *self, char aChar, BPoint *location);
	void DrawChar(char, BPoint);

	// void be_BView_DrawString(BView *self, const char* string, escapement_delta* delta);
	void DrawString(char [], escapement_delta);

	// void be_BView_DrawString_1(BView *self, const char* string, BPoint *location, escapement_delta* delta);
	void DrawString(char [], BPoint, escapement_delta);

	// void be_BView_DrawString_2(BView *self, const char* string, int32 length, escapement_delta* delta);
	void DrawString(char [], int32, escapement_delta);

	// void be_BView_DrawString_3(BView *self, const char* string, int32 length, BPoint *location, escapement_delta* delta);
	void DrawString(char [], int32, BPoint, escapement_delta);

	// void be_BView_DrawString_4(BView *self, const char* string, const BPoint* locations, int32 locationCount);
//	void DrawString(char [], BPoint [], int32);

	// void be_BView_DrawString_5(BView *self, const char* string, int32 length, const BPoint* locations, int32 locationCount);
//	void DrawString(char [], int32, BPoint [], int32);
/*
	// void be_BView_SetFont(BView *self, const BFont* font, uint32 mask);
	void SetFont();

	// void be_BView_GetFont(BView *self, BFont* font);
	void GetFont();

	// void be_BView_TruncateString(BView *self, BString* in_out, uint32 mode, float width);
	void TruncateString();

	// float be_BView_StringWidth(BView *self, const char* string);
	float StringWidth();

	// float be_BView_StringWidth_1(BView *self, const char* string, int32 length);
	float StringWidth();

	// void be_BView_GetStringWidths(BView *self, char* stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[]);
	void GetStringWidths();

	// void be_BView_SetFontSize(BView *self, float size);
	void SetFontSize();

	// void be_BView_ForceFontAliasing(BView *self, bool enable);
	void ForceFontAliasing();

	// void be_BView_GetFontHeight(BView *self, font_height* height);
	void GetFontHeight();

	// void be_BView_Invalidate(BView *self, BRect *invalRect);
	void Invalidate();

	// void be_BView_Invalidate_1(BView *self, const BRegion* invalRegion);
	void Invalidate();

	// void be_BView_Invalidate_2(BView *self);
	void Invalidate();

	// void be_BView_SetDiskMode(BView *self, char* filename, long offset);
	void SetDiskMode();

	// void be_BView_BeginPicture(BView *self, BPicture* a_picture);
	void BeginPicture();

	// void be_BView_AppendToPicture(BView *self, BPicture* a_picture);
	void AppendToPicture();

	// BPicture* be_BView_EndPicture(BView *self);
	BPicture* EndPicture();

	// void be_BView_DrawPicture(BView *self, const BPicture* a_picture);
	void DrawPicture();

	// void be_BView_DrawPicture_1(BView *self, const BPicture* a_picture, BPoint *where);
	void DrawPicture();

	// void be_BView_DrawPicture_2(BView *self, const char* filename, long offset, BPoint *where);
	void DrawPicture();

	// void be_BView_DrawPicture_3(BView *self, const BPicture* a_picture);
	void DrawPicture();

	// void be_BView_DrawPicture_4(BView *self, const BPicture* a_picture, BPoint *where);
	void DrawPicture();

	// void be_BView_DrawPicture_5(BView *self, const char* filename, long offset, BPoint *where);
	void DrawPicture();

	// status_t be_BView_SetEventMask(BView *self, uint32 mask, uint32 options);
	status_t SetEventMask();

	// uint32 be_BView_EventMask(BView *self);
	uint32 EventMask();

	// status_t be_BView_SetMouseEventMask(BView *self, uint32 mask, uint32 options);
	status_t SetMouseEventMask();
*/
	// void be_BView_SetFlags(BView *self, uint32 flags);
	void SetFlags(uint32);

	// uint32 be_BView_Flags(BView *self);
	uint32 Flags();

	// void be_BView_SetResizingMode(BView *self, uint32 mode);
	void SetResizingMode(uint32);

	// uint32 be_BView_ResizingMode(BView *self);
	uint32 ResizingMode();
/*
	// void be_BView_MoveBy(BView *self, float dh, float dv);
	void MoveBy();

	// void be_BView_MoveTo(BView *self, BPoint *where);
	void MoveTo();

	// void be_BView_MoveTo_1(BView *self, float x, float y);
	void MoveTo();

	// void be_BView_ResizeBy(BView *self, float dh, float dv);
	void ResizeBy();

	// void be_BView_ResizeTo(BView *self, float width, float height);
	void ResizeTo();

	// void be_BView_ResizeTo_1(BView *self, BSize *size);
	void ResizeTo();

	// void be_BView_ScrollBy(BView *self, float dh, float dv);
	void ScrollBy();

	// void be_BView_ScrollTo(BView *self, float x, float y);
	void ScrollTo();

	// void be_BView_ScrollTo_1(BView *self, BPoint *where);
	void ScrollTo();

	// void be_BView_MakeFocus(BView *self, bool focusState);
	void MakeFocus();

	// bool be_BView_IsFocus(BView *self);
	bool IsFocus();
*/
	// void be_BView_Show(BView *self);
	void Show();

	// void be_BView_Hide(BView *self);
	void Hide();
/*
	// bool be_BView_IsHidden(BView *self);
	bool IsHidden();

	// bool be_BView_IsHidden_1(BView *self, const BView* looking_from);
	bool IsHidden();

	// void be_BView_Flush(BView *self);
	void Flush();

	// void be_BView_Sync(BView *self);
	void Sync();

	// void be_BView_GetPreferredSize(BView *self, float* width, float* height);
	void GetPreferredSize();

	// void be_BView_ResizeToPreferred(BView *self);
	void ResizeToPreferred();

	// BScrollBar* be_BView_ScrollBar(BView *self, orientation posture);
	BScrollBar* ScrollBar();

	// BHandler* be_BView_ResolveSpecifier(BView *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler* ResolveSpecifier();

	// status_t be_BView_GetSupportedSuites(BView *self, BMessage* data);
	status_t GetSupportedSuites();

	// bool be_BView_IsPrinting(BView *self);
	bool IsPrinting();

	// void be_BView_SetScale(BView *self, float scale);
	void SetScale();

	// float be_BView_Scale(BView *self);
	float Scale();

	// status_t be_BView_Perform(BView *self, perform_code code, void* data);
	status_t Perform();

	// void be_BView_DrawAfterChildren(BView *self, BRect *r);
	void DrawAfterChildren();

	// BSize * be_BView_MinSize(BView *self);
	BSize MinSize();

	// BSize * be_BView_MaxSize(BView *self);
	BSize MaxSize();

	// BSize * be_BView_PreferredSize(BView *self);
	BSize PreferredSize();

	// BAlignment * be_BView_LayoutAlignment(BView *self);
	BAlignment LayoutAlignment();

	// void be_BView_SetExplicitMinSize(BView *self, BSize *size);
	void SetExplicitMinSize();

	// void be_BView_SetExplicitMaxSize(BView *self, BSize *size);
	void SetExplicitMaxSize();

	// void be_BView_SetExplicitPreferredSize(BView *self, BSize *size);
	void SetExplicitPreferredSize();

	// void be_BView_SetExplicitAlignment(BView *self, BAlignment *alignment);
	void SetExplicitAlignment();

	// BSize * be_BView_ExplicitMinSize(BView *self);
	BSize ExplicitMinSize();

	// BSize * be_BView_ExplicitMaxSize(BView *self);
	BSize ExplicitMaxSize();

	// BSize * be_BView_ExplicitPreferredSize(BView *self);
	BSize ExplicitPreferredSize();

	// BAlignment * be_BView_ExplicitAlignment(BView *self);
	BAlignment ExplicitAlignment();

	// bool be_BView_HasHeightForWidth(BView *self);
	bool HasHeightForWidth();

	// void be_BView_GetHeightForWidth(BView *self, float width, float* min, float* max, float* preferred);
	void GetHeightForWidth();

	// void be_BView_SetLayout(BView *self, BLayout* layout);
	void SetLayout();

	// BLayout* be_BView_GetLayout(BView *self);
	BLayout* GetLayout();
*/
	// void be_BView_InvalidateLayout(BView *self, bool descendants);
	void InvalidateLayout(bool);
/*
	// void be_BView_EnableLayoutInvalidation(BView *self);
	void EnableLayoutInvalidation();

	// void be_BView_DisableLayoutInvalidation(BView *self);
	void DisableLayoutInvalidation();

	// bool be_BView_IsLayoutValid(BView *self);
	bool IsLayoutValid();

	// void be_BView_ResetLayoutInvalidation(BView *self);
	void ResetLayoutInvalidation();

	// BLayoutContext* be_BView_LayoutContext(BView *self);
	BLayoutContext* LayoutContext();

	// void be_BView_Layout(BView *self, bool force);
	void Layout();

	// void be_BView_Relayout(BView *self);
	void Relayout();
*/
	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BView : BHandler, IBView
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BViewProxy * be_BView_ctor(void *bindInstPtr, BMessage* archive);
	this(BMessage archive) {
		if(_InstPtr is null) {
			_InstPtr = be_BView_ctor(cast(void *)this, archive._InstPtr);
			_OwnsPtr = true;
		}
		super(archive);
	}

	// BViewProxy * be_BView_ctor_1(void *bindInstPtr, const char* name, uint32 flags, BLayout* layout);
	this(char [] name, uint32 flags/*, BLayout layout*/) {
		if(_InstPtr is null) {
			_InstPtr = be_BView_ctor_1(cast(void *)this, toStringz(name), flags, null);
			_OwnsPtr = true;
		}
		super(name);
	}

	// BViewProxy * be_BView_ctor_2(void *bindInstPtr, BRect *frame, const char* name, uint32 resizeMask, uint32 flags);
	this(BRect rect, char [] name, uint32 resizeMask, uint32 flags) {
		if(_InstPtr is null) {
			_InstPtr = be_BView_ctor_2(cast(void *)this, rect._InstPtr, toStringz(name), resizeMask, flags);
			_OwnsPtr = true;
		}
		super(name);
	}

	// void be_BView_dtor(BView* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BView_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	//BArchivable* be_BView_Instantiate_static(BMessage* archive)
	static BView Instantiate(BMessage* archive)
	{
		return new BView(be_BView_Instantiate_static(archive._InstPtr), true);
	}

	// status_t be_BView_Archive(BView *self, BMessage* archive, bool deep);
	status_t Archive(BMessage archive, bool deep = true) {
		return be_BView_Archive(_InstPtr(), archive._InstPtr, deep);
	}

	// status_t be_BView_AllUnarchived(BView *self, const BMessage* archive);
	status_t AllUnarchived(BMessage archive) {
		return be_BView_AllUnarchived(_InstPtr(), archive._InstPtr);
	}

	// status_t be_BView_AllArchived(BView *self, BMessage* archive);
	status_t AllArchived(BMessage archive) {
		return be_BView_AllArchived(_InstPtr(), archive._InstPtr);
	}

	// void be_BView_AttachedToWindow(BView *self);
	void AttachedToWindow() {
		be_BView_AttachedToWindow(_InstPtr());
	}

	// void be_BView_AllAttached(BView *self);
	void AllAttached() {
		be_BView_AllAttached(_InstPtr());
	}

	// void be_BView_DetachedFromWindow(BView *self);
	void DetachedFromWindow() {
		be_BView_DetachedFromWindow(_InstPtr());
	}

	// void be_BView_AllDetached(BView *self);
	void AllDetached() {
		be_BView_AllDetached(_InstPtr());
	}

	// void be_BView_MessageReceived(BView *self, BMessage* message);
	void MessageReceived(BMessage message) {
		be_BView_MessageReceived(_InstPtr(), message._InstPtr);
	}

	// void be_BView_AddChild(BView *self, BView* child, BView* before);
	void AddChild(BView child, BView before = null) {
		child._OwnsPtr = false; // BView owns this now
		be_BView_AddChild(_InstPtr(), child._InstPtr, before is null ? null : before._InstPtr);
	}

	// bool be_BView_AddChild_1(BView *self, BLayoutItem* child);
/*
	bool AddChild(BLayoutItem child) {
		return be_BView_AddChild_1(_InstPtr(), child._InstPtr);
	}
*/
	// bool be_BView_RemoveChild(BView *self, BView* child);
	bool RemoveChild(BView child) {
		child._OwnsPtr = true; // Ok we own it again :P
		return be_BView_RemoveChild(_InstPtr(), child._InstPtr);
	}

	// int32 be_BView_CountChildren(BView *self);
	int32 CountChildren() {
		return be_BView_CountChildren(_InstPtr());
	}

	// BView* be_BView_ChildAt(BView *self, int32 index);
	BView ChildAt(int32 index) {
		return new BView(be_BView_ChildAt(_InstPtr(), index), false);
	}

	// BView* be_BView_NextSibling(BView *self);
	BView NextSibling() {
		return new BView(be_BView_NextSibling(_InstPtr()), false);
	}

	// BView* be_BView_PreviousSibling(BView *self);
	BView PreviousSibling() {
		return new BView(be_BView_PreviousSibling(_InstPtr()), false);
	}

	// bool be_BView_RemoveSelf(BView *self);
	bool RemoveSelf() {
		return be_BView_RemoveSelf(_InstPtr());
	}

	// BWindow* be_BView_Window(BView *self);
	BWindow Window() {
		return new BWindow(be_BView_Window(_InstPtr()), false);
	}
	
	// void be_BView_Draw(BView *self, BRect *updateRect);
	void Draw(BRect updateRect) {
		be_BView_Draw(_InstPtr(), updateRect._InstPtr);
	}

	// void be_BView_MouseDown(BView *self, BPoint *where);
	void MouseDown(BPoint where) {
		be_BView_MouseDown(_InstPtr(), where._InstPtr);
	}

	// void be_BView_MouseUp(BView *self, BPoint *where);
	void MouseUp(BPoint where) {
		be_BView_MouseUp(_InstPtr(), where._InstPtr);
	}

	// void be_BView_MouseMoved(BView *self, BPoint *where, uint32 code, const BMessage* dragMessage);
	void MouseMoved(BPoint where, uint32 code, BMessage dragMessage) {
		be_BView_MouseMoved(_InstPtr(), where._InstPtr, code, dragMessage._InstPtr);
	}

	// void be_BView_WindowActivated(BView *self, bool state);
	void WindowActivated(bool state) {
		be_BView_WindowActivated(_InstPtr(), state);
	}

	// void be_BView_KeyDown(BView *self, const char* bytes, int32 numBytes);
	void KeyDown(char [] bytes, int32 numBytes) {
		be_BView_KeyDown(_InstPtr(), toStringz(bytes), numBytes);
	}

	// void be_BView_KeyUp(BView *self, const char* bytes, int32 numBytes);
	void KeyUp(char [] bytes, int32 numBytes) {
		be_BView_KeyUp(_InstPtr(), toStringz(bytes), numBytes);
	}

	// void be_BView_Pulse(BView *self);
	void Pulse() {
		be_BView_Pulse(_InstPtr());
	}

	// void be_BView_FrameMoved(BView *self, BPoint *newPosition);
	void FrameMoved(BPoint where) {
		be_BView_FrameMoved(_InstPtr(), where._InstPtr);
	}

	// void be_BView_FrameResized(BView *self, float newWidth, float newHeight);
	void FrameResized(float newWidth, float newHeight) {
		be_BView_FrameResized(_InstPtr(), newWidth, newHeight);
	}

	// void be_BView_TargetedByScrollView(BView *self, BScrollView* scrollView);
/*
	void TargetedByScrollView(BSCrollView scrollView) {
		be_BView_TargetedByScrollView(_InstPtr(), scrollView._InstPtr);
	}
*/

	// void be_BView_BeginRectTracking(BView *self, BRect *startRect, uint32 style);
	void BeginRectTracking(BRect startRect, uint32 style) {
		be_BView_BeginRectTracking(_InstPtr(), startRect._InstPtr, style);
	}

	// void be_BView_EndRectTracking(BView *self);
	void EndRectTracking() {
		be_BView_EndRectTracking(_InstPtr());
	}

	// void be_BView_GetMouse(BView *self, BPoint* location, uint32* buttons, bool checkMessageQueue);
	void GetMouse(BPoint location, inout uint32 [] buttons, bool checkMessageQueue) {
		be_BView_GetMouse(_InstPtr(), location._InstPtr, buttons.ptr, checkMessageQueue);
	}

	// void be_BView_DragMessage(BView *self, BMessage* message, BRect *dragRect, BHandler* replyTo);
	void DragMessage(BMessage message, BRect dragRect, BHandler replyTo) {
		be_BView_DragMessage(_InstPtr(), message._InstPtr, dragRect._InstPtr, replyTo._InstPtr);
	}
/*
	// void be_BView_DragMessage_1(BView *self, BMessage* message, BBitmap* bitmap, BPoint *offset, BHandler* replyTo);
	void DragMessage() {
		be_BView_DragMessage_1(_InstPtr());
	}

	// void be_BView_DragMessage_2(BView *self, BMessage* message, BBitmap* bitmap, drawing_mode dragMode, BPoint *offset, BHandler* replyTo);
	void DragMessage() {
		be_BView_DragMessage_2(_InstPtr());
	}
*/
	// BView* be_BView_FindView(BView *self, const char* name);
	BView FindView(char [] name) {
		return new BView(be_BView_FindView(_InstPtr(), toStringz(name)), false);
	}

	// BView* be_BView_Parent(BView *self);
	BView Parent() {
		return new BView(be_BView_Parent(_InstPtr()), false);
	}

	// BRect * be_BView_Bounds(BView *self);
	BRect Bounds() {
		return new BRect(be_BView_Bounds(_InstPtr()), false);
	}

	// BRect * be_BView_Frame(BView *self);
	BRect Frame() {
		return new BRect(be_BView_Frame(_InstPtr()), false);
	}

	// void be_BView_ConvertToScreen(BView *self, BPoint* pt);
	void ConvertToScreen(BPoint pt) {
		be_BView_ConvertToScreen(_InstPtr(), pt._InstPtr);
	}

	// BPoint * be_BView_ConvertToScreen_1(BView *self, BPoint *pt);
	BPoint ConvertToScreen(BPoint pt) {
		return new BPoint(be_BView_ConvertToScreen_1(_InstPtr(), pt._InstPtr), true);
	}

	// void be_BView_ConvertFromScreen(BView *self, BPoint* pt);
	void ConvertFromScreen(BPoint pt) {
		be_BView_ConvertFromScreen(_InstPtr(), pt._InstPtr);
	}

	// BPoint * be_BView_ConvertFromScreen_1(BView *self, BPoint *pt);
	BPoint ConvertFromScreen(BPoint pt) {
		return new BPoint(be_BView_ConvertFromScreen_1(_InstPtr(), pt._InstPtr), true);
	}

	// void be_BView_ConvertToScreen_2(BView *self, BRect* r);
	void ConvertToScreen(BRect r) {
		be_BView_ConvertToScreen_2(_InstPtr(), r._InstPtr);
	}

	// BRect * be_BView_ConvertToScreen_3(BView *self, BRect *r);
	BRect ConvertToScreen(BRect r) {
		return new BRect(be_BView_ConvertToScreen_3(_InstPtr(), r._InstPtr), true);
	}

	// void be_BView_ConvertFromScreen_2(BView *self, BRect* r);
	void ConvertFromScreen(BRect r) {
		be_BView_ConvertFromScreen_2(_InstPtr(), r._InstPtr);
	}

	// BRect * be_BView_ConvertFromScreen_3(BView *self, BRect *r);
	BRect ConvertFromScreen(BRect r) {
		return new BRect(be_BView_ConvertFromScreen_3(_InstPtr(), r._InstPtr), true);
	}

	// void be_BView_ConvertToParent(BView *self, BPoint* pt);
	void ConvertToParent(BPoint pt) {
		be_BView_ConvertToParent(_InstPtr(), pt._InstPtr);
	}

	// BPoint * be_BView_ConvertToParent_1(BView *self, BPoint *pt);
	BPoint ConvertToParent(BPoint pt) {
		return new BPoint(be_BView_ConvertToParent_1(_InstPtr(), pt._InstPtr), true);
	}

	// void be_BView_ConvertFromParent(BView *self, BPoint* pt);
	void ConvertFromParent(BPoint pt) {
		be_BView_ConvertFromParent(_InstPtr(), pt._InstPtr);
	}

	// BPoint * be_BView_ConvertFromParent_1(BView *self, BPoint *pt);
	BPoint ConvertFromParent(BPoint pt) {
		return new BPoint(be_BView_ConvertFromParent_1(_InstPtr(), pt._InstPtr), true);
	}

	// void be_BView_ConvertToParent_2(BView *self, BRect* r);
	void ConvertToParent(BRect r) {
		be_BView_ConvertToParent_2(_InstPtr(), r._InstPtr);
	}

	// BRect * be_BView_ConvertToParent_3(BView *self, BRect *r);
	BRect ConvertToParent(BRect r) {
		return new BRect(be_BView_ConvertToParent_3(_InstPtr(), r._InstPtr), true);
	}

	// void be_BView_ConvertFromParent_2(BView *self, BRect* r);
	void ConvertFromParent(BRect r) {
		be_BView_ConvertFromParent_2(_InstPtr(), r._InstPtr);
	}

	// BRect * be_BView_ConvertFromParent_3(BView *self, BRect *r);
	BRect ConvertFromParent(BRect r) {
		return new BRect(be_BView_ConvertFromParent_3(_InstPtr(), r._InstPtr), true);
	}

	// BPoint * be_BView_LeftTop(BView *self);
	BPoint LeftTop() {
		return new BPoint(be_BView_LeftTop(_InstPtr()), true);
	}

	// void be_BView_GetClippingRegion(BView *self, BRegion* region);
	void GetClippingRegion(BRegion region) {
		be_BView_GetClippingRegion(_InstPtr(), region._InstPtr);
	}

	// void be_BView_ConstrainClippingRegion(BView *self, BRegion* region);
	void ConstrainClippingRegion(BRegion region) {
		be_BView_ConstrainClippingRegion(_InstPtr(), region._InstPtr);
	}
/*
	// void be_BView_ClipToPicture(BView *self, BPicture* picture, BPoint *where, bool sync);
	void ClipToPicture(BPicture picture, BPoint where, bool sync = true) {
		be_BView_ClipToPicture(_InstPtr(), picture._InstPtr, where._InstPtr, sync);
	}

	// void be_BView_ClipToPicture_1(BView *self, BPicture* picture, BPoint *where, bool sync);
	void ClipToPicture(BPicture picture, BPoint where, bool sync = true) {
		be_BView_ClipToPicture_1(_InstPtr(), picture._InstPtr, where._InstPtr, sync);
	}
*/
	// void be_BView_SetDrawingMode(BView *self, drawing_mode mode);
	void SetDrawingMode(drawing_mode mode) {
		be_BView_SetDrawingMode(_InstPtr(), mode);
	}

	// drawing_mode be_BView_DrawingMode(BView *self);
	drawing_mode DrawingMode() {
		return be_BView_DrawingMode(_InstPtr());
	}

	// void be_BView_SetBlendingMode(BView *self, source_alpha srcAlpha, alpha_function alphaFunc);
	void SetBlendingMode(source_alpha srcAlpha, alpha_function alphaFunc) {
		be_BView_SetBlendingMode(_InstPtr(), srcAlpha, alphaFunc);
	}

	// void be_BView_GetBlendingMode(BView *self, source_alpha* srcAlpha, alpha_function* alphaFunc);
	void GetBlendingMode(inout source_alpha srcAlpha, inout alpha_function alphaFunc) {
		be_BView_GetBlendingMode(_InstPtr(), &srcAlpha, &alphaFunc);
	}

	// void be_BView_SetPenSize(BView *self, float size);
	void SetPenSize(float size) {
		be_BView_SetPenSize(_InstPtr(), size);
	}

	// float be_BView_PenSize(BView *self);
	float PenSize() {
		return be_BView_PenSize(_InstPtr());
	}

	// void be_BView_SetViewCursor(BView *self, const BCursor* cursor, bool sync);
	void SetViewCursor(BCursor cursor, bool sync = true) {
		be_BView_SetViewCursor(_InstPtr(), cursor._InstPtr, sync);
	}

	// void be_BView_SetViewColor(BView *self, rgb_color c);
	void SetViewColor(rgb_color c) {
		be_BView_SetViewColor(_InstPtr(), c);
	}

	// void be_BView_SetViewColor_1(BView *self, uchar r, uchar g, uchar b, uchar a);
	void SetViewColor(uchar r, uchar g, uchar b, uchar a = 255) {
		be_BView_SetViewColor_1(_InstPtr(), r, g, b, a);
	}

	// rgb_color be_BView_ViewColor(BView *self);
	rgb_color ViewColor() {
		return rgb_color(be_BView_ViewColor(_InstPtr()));
	}
/*
	// void be_BView_SetViewBitmap(BView *self, const BBitmap* bitmap, BRect *srcRect, BRect *dstRect, uint32 followFlags, uint32 options);
	void SetViewBitmap(BBitmpa bitmap, BRect srcRect, BRect dstRect, uint32 followFlags = B_FOLLOW_TOP | B_FOLLOW_LEFT, uint32 options = B_TILE_BITMAP) {
		be_BView_SetViewBitmap(_InstPtr());
	}

	// void be_BView_SetViewBitmap_1(BView *self, const BBitmap* bitmap, uint32 followFlags, uint32 options);
	void SetViewBitmap() {
		be_BView_SetViewBitmap_1(_InstPtr());
	}
*/
	// void be_BView_ClearViewBitmap(BView *self);
	void ClearViewBitmap() {
		be_BView_ClearViewBitmap(_InstPtr());
	}
/*
	// status_t be_BView_SetViewOverlay(BView *self, const BBitmap* overlay, BRect *srcRect, BRect *dstRect, rgb_color* colorKey, uint32 followFlags, uint32 options);
	status_t SetViewOverlay() {
		return be_BView_SetViewOverlay(_InstPtr());
	}

	// status_t be_BView_SetViewOverlay_1(BView *self, const BBitmap* overlay, rgb_color* colorKey, uint32 followFlags, uint32 options);
	status_t SetViewOverlay() {
		return be_BView_SetViewOverlay_1(_InstPtr());
	}
*/
	// void be_BView_ClearViewOverlay(BView *self);
	void ClearViewOverlay() {
		be_BView_ClearViewOverlay(_InstPtr());
	}

	// void be_BView_SetHighColor(BView *self, rgb_color a_color);
	void SetHighColor(rgb_color color) {
		be_BView_SetHighColor(_InstPtr(), color);
	}

	// void be_BView_SetHighColor_1(BView *self, uchar r, uchar g, uchar b, uchar a);
	void SetHighColor(uchar r, uchar g, uchar b, uchar a = 255) {
		be_BView_SetHighColor_1(_InstPtr(), r, g, b, a);
	}

	// rgb_color be_BView_HighColor(BView *self);
	rgb_color HighColor() {
		return be_BView_HighColor(_InstPtr());
	}

	// void be_BView_SetLowColor(BView *self, rgb_color a_color);
	void SetLowColor(rgb_color color) {
		be_BView_SetLowColor(_InstPtr(), color);
	}

	// void be_BView_SetLowColor_1(BView *self, uchar r, uchar g, uchar b, uchar a);
	void SetLowColor(uchar r, uchar g, uchar b, uchar a = 255) {
		be_BView_SetLowColor_1(_InstPtr(), r, g, b, a);
	}

	// rgb_color be_BView_LowColor(BView *self);
	rgb_color LowColor() {
		return be_BView_LowColor(_InstPtr());
	}

	// void be_BView_SetLineMode(BView *self, cap_mode lineCap, join_mode lineJoin, float miterLimit);
	void SetLineMode(cap_mode lineCap, join_mode lineJoin, float miterLimit) {
		be_BView_SetLineMode(_InstPtr(), lineCap, lineJoin, miterLimit);
	}

	// join_mode be_BView_LineJoinMode(BView *self);
	join_mode LineJoinMode() {
		return be_BView_LineJoinMode(_InstPtr());
	}

	// cap_mode be_BView_LineCapMode(BView *self);
	cap_mode LineCapMode() {
		return be_BView_LineCapMode(_InstPtr());
	}

	// float be_BView_LineMiterLimit(BView *self);
	float LineMiterLimit() {
		return be_BView_LineMiterLimit(_InstPtr());
	}

	// void be_BView_SetOrigin(BView *self, BPoint *pt);
	void SetOrigin(BPoint pt) {
		be_BView_SetOrigin(_InstPtr(), pt._InstPtr);
	}

	// void be_BView_SetOrigin_1(BView *self, float x, float y);
	void SetOrigin(float x, float y) {
		be_BView_SetOrigin_1(_InstPtr(), x, y);
	}

	// BPoint * be_BView_Origin(BView *self);
	BPoint Origin() {
		return new BPoint(be_BView_Origin(_InstPtr()), true);
	}

	// void be_BView_PushState(BView *self);
	void PushState() {
		be_BView_PushState(_InstPtr());
	}

	// void be_BView_PopState(BView *self);
	void PopState() {
		be_BView_PopState(_InstPtr());
	}

	// void be_BView_MovePenTo(BView *self, BPoint *pt);
	void MovePenTo(BPoint pt) {
		be_BView_MovePenTo(_InstPtr(), pt._InstPtr);
	}

	// void be_BView_MovePenTo_1(BView *self, float x, float y);
	void MovePenTo(float x, float y) {
		be_BView_MovePenTo_1(_InstPtr(), x, y);
	}

	// void be_BView_MovePenBy(BView *self, float x, float y);
	void MovePenBy(float x, float y) {
		be_BView_MovePenBy(_InstPtr(), x, y);
	}

	// BPoint * be_BView_PenLocation(BView *self);
	BPoint PenLocation() {
		return new BPoint(be_BView_PenLocation(_InstPtr()), true);
	}

	// void be_BView_StrokeLine(BView *self, BPoint *toPt, pattern p);
	void StrokeLine(BPoint toPt, pattern p) {
		be_BView_StrokeLine(_InstPtr(), toPt._InstPtr, p);
	}

	// void be_BView_StrokeLine_1(BView *self, BPoint *a, BPoint *b, pattern p);
	void StrokeLine(BPoint a, BPoint b, pattern p) {
		be_BView_StrokeLine_1(_InstPtr(), a._InstPtr, b._InstPtr, p);
	}

	// void be_BView_BeginLineArray(BView *self, int32 count);
	void BeginLineArray(int32 count) {
		be_BView_BeginLineArray(_InstPtr(), count);
	}

	// void be_BView_AddLine(BView *self, BPoint *a, BPoint *b, rgb_color color);
	void AddLine(BPoint a, BPoint b, rgb_color color) {
		be_BView_AddLine(_InstPtr(), a._InstPtr, b._InstPtr, color);
	}

	// void be_BView_EndLineArray(BView *self);
	void EndLineArray() {
		be_BView_EndLineArray(_InstPtr());
	}

	// void be_BView_StrokePolygon(BView *self, const BPolygon* polygon, bool closed, pattern p);
	void StrokePolygon(BPolygon polygon, bool closed, pattern p) {
		be_BView_StrokePolygon(_InstPtr(), polygon._InstPtr, closed, p);
	}
/*
	// void be_BView_StrokePolygon_1(BView *self, const BPoint* ptArray, int32 numPts, bool closed, pattern p);
	void StrokePolygon(BPoint [] ptArray, int32 numPts, bool closed, pattern p) {
		be_BView_StrokePolygon_1(_InstPtr());
	}

	// void be_BView_StrokePolygon_2(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, bool closed);
	void StrokePolygon(BPoint [] ptArray, int32 numPts, BRect bounds, bool closed) {
		be_BView_StrokePolygon_2(_InstPtr());
	}
*/
	// void be_BView_FillPolygon(BView *self, const BPolygon* polygon, pattern p);
	void FillPolygon(BPolygon polygon, pattern p) {
		be_BView_FillPolygon(_InstPtr(), polygon._InstPtr, p);
	}
/*
	// void be_BView_FillPolygon_1(BView *self, const BPoint* ptArray, int32 numPts, pattern p);
	void FillPolygon(BPoint [] ptArray, int32 numPts, pattern p) {
		be_BView_FillPolygon_1(_InstPtr());
	}

	// void be_BView_FillPolygon_2(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, pattern p);
	void FillPolygon(BPoint [] ptArray, int32 numPts, BRect, pattern p) {
		be_BView_FillPolygon_2(_InstPtr());
	}

	// void be_BView_FillPolygon_3(BView *self, const BPolygon* polygon, const BGradient& gradient);
	void FillPolygon(BPolygon, BGradient) {
		be_BView_FillPolygon_3(_InstPtr());
	}

	// void be_BView_FillPolygon_4(BView *self, const BPoint* ptArray, int32 numPts, const BGradient& gradient);
	void FillPolygon() {
		be_BView_FillPolygon_4(_InstPtr());
	}

	// void be_BView_FillPolygon_5(BView *self, const BPoint* ptArray, int32 numPts, BRect *bounds, const BGradient& gradient);
	void FillPolygon() {
		be_BView_FillPolygon_5(_InstPtr());
	}
*/
	// void be_BView_StrokeRect(BView *self, BRect *r, pattern p);
	void StrokeRect(BRect r, pattern p) {
		be_BView_StrokeRect(_InstPtr(), r._InstPtr, p);
	}

	// void be_BView_FillRect(BView *self, BRect *r, pattern p);
	void FillRect(BRect r, pattern p) {
		be_BView_FillRect(_InstPtr(), r._InstPtr, p);
	}
/*
	// void be_BView_FillRect_1(BView *self, BRect *r, const BGradient& gradient);
	void FillRect() {
		be_BView_FillRect_1(_InstPtr());
	}
*/
	// void be_BView_FillRegion(BView *self, BRegion* region, pattern p);
	void FillRegion(BRegion region, pattern p) {
		be_BView_FillRegion(_InstPtr(), region._InstPtr, p);
	}
/*
	// void be_BView_FillRegion_1(BView *self, BRegion* region, const BGradient& gradient);
	void FillRegion(BRegion region, BGradient gradient) {
		be_BView_FillRegion_1(_InstPtr());
	}
*/
	// void be_BView_InvertRect(BView *self, BRect *r);
	void InvertRect(BRect r) {
		be_BView_InvertRect(_InstPtr(), r._InstPtr);
	}

	// void be_BView_StrokeRoundRect(BView *self, BRect *r, float xRadius, float yRadius, pattern p);
	void StrokeRoundRect(BRect r, float xRadius, float yRadius, pattern p) {
		be_BView_StrokeRoundRect(_InstPtr(), r._InstPtr, xRadius, yRadius, p);
	}

	// void be_BView_FillRoundRect(BView *self, BRect *r, float xRadius, float yRadius, pattern p);
	void FillRoundRect(BRect r, float xRadius, float yRadius, pattern p) {
		be_BView_FillRoundRect(_InstPtr(), r._InstPtr, xRadius, yRadius, p);
	}
/*
	// void be_BView_FillRoundRect_1(BView *self, BRect *r, float xRadius, float yRadius, const BGradient& gradient);
	void FillRoundRect() {
		be_BView_FillRoundRect_1(_InstPtr());
	}
*/
	// void be_BView_StrokeEllipse(BView *self, BPoint *center, float xRadius, float yRadius, pattern p);
	void StrokeEllipse(BPoint center, float xRadius, float yRadius, pattern p) {
		be_BView_StrokeEllipse(_InstPtr(), center._InstPtr, xRadius, yRadius, p);
	}

	// void be_BView_StrokeEllipse_1(BView *self, BRect *r, pattern p);
	void StrokeEllipse(BRect r, pattern p) {
		be_BView_StrokeEllipse_1(_InstPtr(), r._InstPtr, p);
	}

	// void be_BView_FillEllipse(BView *self, BPoint *center, float xRadius, float yRadius, pattern p);
	void FillEllipse(BPoint center, float xRadius, float yRadius, pattern p) {
		be_BView_FillEllipse(_InstPtr(), center._InstPtr, xRadius, yRadius, p);
	}

	// void be_BView_FillEllipse_1(BView *self, BRect *r, pattern p);
	void FillEllipse(BRect r, pattern p) {
		be_BView_FillEllipse_1(_InstPtr(), r._InstPtr, p);
	}
/*
	// void be_BView_FillEllipse_2(BView *self, BPoint *center, float xRadius, float yRadius, const BGradient& gradient);
	void FillEllipse() {
		be_BView_FillEllipse_2(_InstPtr());
	}

	// void be_BView_FillEllipse_3(BView *self, BRect *r, const BGradient& gradient);
	void FillEllipse() {
		be_BView_FillEllipse_3(_InstPtr());
	}
*/
	// void be_BView_StrokeArc(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);
	void StrokeArc(BPoint center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p) {
		be_BView_StrokeArc(_InstPtr(), center._InstPtr, xRadius, yRadius, startAngle, arcAngle, p);
	}

	// void be_BView_StrokeArc_1(BView *self, BRect *r, float startAngle, float arcAngle, pattern p);
	void StrokeArc(BRect r, float startAngle, float arcAngle, pattern p) {
		be_BView_StrokeArc_1(_InstPtr(), r._InstPtr, startAngle, arcAngle, p);
	}

	// void be_BView_FillArc(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p);
	void FillArc(BPoint center, float xRadius, float yRadius, float startAngle, float arcAngle, pattern p) {
		be_BView_FillArc(_InstPtr(), center._InstPtr, xRadius, yRadius, startAngle, arcAngle, p);
	}

	// void be_BView_FillArc_1(BView *self, BRect *r, float startAngle, float arcAngle, pattern p);
	void FillArc(BRect r, float startAngle, float arcAngle, pattern p) {
		be_BView_FillArc_1(_InstPtr(), r._InstPtr, startAngle, arcAngle, p);
	}
/*
	// void be_BView_FillArc_2(BView *self, BPoint *center, float xRadius, float yRadius, float startAngle, float arcAngle, const BGradient& gradient);
	void FillArc() {
		be_BView_FillArc_2(_InstPtr());
	}

	// void be_BView_FillArc_3(BView *self, BRect *r, float startAngle, float arcAngle, const BGradient& gradient);
	void FillArc() {
		be_BView_FillArc_3(_InstPtr());
	}

	// void be_BView_StrokeBezier(BView *self, BPoint* controlPoints, pattern p);
	void StrokeBezier() {
		be_BView_StrokeBezier(_InstPtr());
	}

	// void be_BView_FillBezier(BView *self, BPoint* controlPoints, pattern p);
	void FillBezier() {
		be_BView_FillBezier(_InstPtr());
	}

	// void be_BView_FillBezier_1(BView *self, BPoint* controlPoints, const BGradient& gradient);
	void FillBezier() {
		be_BView_FillBezier_1(_InstPtr());
	}

	// void be_BView_StrokeShape(BView *self, BShape* shape, pattern p);
	void StrokeShape(BShape shape, pattern p) {
		be_BView_StrokeShape(_InstPtr(), shape._InstPtr, p);
	}

	// void be_BView_FillShape(BView *self, BShape* shape, pattern p);
	void FillShape(BShape shape, pattern p) {
		be_BView_FillShape(_InstPtr(), shape._InstPtr, p);
	}

	// void be_BView_FillShape_1(BView *self, BShape* shape, const BGradient& gradien);
	void FillShape() {
		be_BView_FillShape_1(_InstPtr());
	}
*/
	// void be_BView_CopyBits(BView *self, BRect *src, BRect *dst);
	void CopyBits(BRect src, BRect dst) {
		be_BView_CopyBits(_InstPtr(), src._InstPtr, dst._InstPtr);
	}
/*
	// void be_BView_DrawBitmapAsync(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options);
	void DrawBitmapAsync() {
		be_BView_DrawBitmapAsync(_InstPtr());
	}

	// void be_BView_DrawBitmapAsync_1(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect);
	void DrawBitmapAsync() {
		be_BView_DrawBitmapAsync_1(_InstPtr());
	}

	// void be_BView_DrawBitmapAsync_2(BView *self, const BBitmap* aBitmap, BRect *viewRec);
	void DrawBitmapAsync() {
		be_BView_DrawBitmapAsync_2(_InstPtr());
	}

	// void be_BView_DrawBitmapAsync_3(BView *self, const BBitmap* aBitmap, BPoint *where);
	void DrawBitmapAsync() {
		be_BView_DrawBitmapAsync_3(_InstPtr());
	}

	// void be_BView_DrawBitmapAsync_4(BView *self, const BBitmap* aBitmap);
	void DrawBitmapAsync() {
		be_BView_DrawBitmapAsync_4(_InstPtr());
	}

	// void be_BView_DrawBitmap(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect, uint32 options);
	void DrawBitmap() {
		be_BView_DrawBitmap(_InstPtr());
	}

	// void be_BView_DrawBitmap_1(BView *self, const BBitmap* aBitmap, BRect *bitmapRect, BRect *viewRect);
	void DrawBitmap() {
		be_BView_DrawBitmap_1(_InstPtr());
	}

	// void be_BView_DrawBitmap_2(BView *self, const BBitmap* aBitmap, BRect *viewRect);
	void DrawBitmap() {
		be_BView_DrawBitmap_2(_InstPtr());
	}

	// void be_BView_DrawBitmap_3(BView *self, const BBitmap* aBitmap, BPoint *where);
	void DrawBitmap() {
		be_BView_DrawBitmap_3(_InstPtr());
	}

	// void be_BView_DrawBitmap_4(BView *self, const BBitmap* aBitmap);
	void DrawBitmap() {
		be_BView_DrawBitmap_4(_InstPtr());
	}
*/
	// void be_BView_DrawChar(BView *self, char aChar);
	void DrawChar(char aChar) {
		be_BView_DrawChar(_InstPtr(), aChar);
	}

	// void be_BView_DrawChar_1(BView *self, char aChar, BPoint *location);
	void DrawChar(char aChar, BPoint location) {
		be_BView_DrawChar_1(_InstPtr(), aChar, location._InstPtr);
	}

	// void be_BView_DrawString(BView *self, const char* string, escapement_delta* delta);
	void DrawString(char [] string, escapement_delta delta) {
		be_BView_DrawString(_InstPtr(), toStringz(string), &delta);
	}

	// void be_BView_DrawString_1(BView *self, const char* string, BPoint *location, escapement_delta* delta);
	void DrawString(char [] string, BPoint location, escapement_delta delta) {
		be_BView_DrawString_1(_InstPtr(), toStringz(string), location._InstPtr, &delta);
	}

	// void be_BView_DrawString_2(BView *self, const char* string, int32 length, escapement_delta* delta);
	void DrawString(char [] string, int32 length, escapement_delta delta) {
		be_BView_DrawString_2(_InstPtr(), toStringz(string), length, &delta);
	}

	// void be_BView_DrawString_3(BView *self, const char* string, int32 length, BPoint *location, escapement_delta* delta);
	void DrawString(char [] string, int32 length, BPoint location, escapement_delta delta) {
		be_BView_DrawString_3(_InstPtr(), toStringz(string), length, location._InstPtr, &delta);
	}

/*
	// void be_BView_DrawString_4(BView *self, const char* string, const BPoint* locations, int32 locationCount);
	void DrawString(char [] string, BPoint [] locations, int32 locationCount) {
		be_BView_DrawString_4(_InstPtr(), toStringz(string), locations._InstPtr, locationCount);
	}

	// void be_BView_DrawString_5(BView *self, const char* string, int32 length, const BPoint* locations, int32 locationCount);
	void DrawString(char [] string, int32 length, BPoint [] locations, int32 locationCount) {
		be_BView_DrawString_5(_InstPtr(), toStringz(string), length, locations._InstPtr, locationCount);
	}

	// void be_BView_SetFont(BView *self, const BFont* font, uint32 mask);
	void SetFont() {
		be_BView_SetFont(_InstPtr());
	}

	// void be_BView_GetFont(BView *self, BFont* font);
	void GetFont() {
		be_BView_GetFont(_InstPtr());
	}

	// void be_BView_TruncateString(BView *self, BString* in_out, uint32 mode, float width);
	void TruncateString() {
		be_BView_TruncateString(_InstPtr());
	}

	// float be_BView_StringWidth(BView *self, const char* string);
	float StringWidth() {
		return be_BView_StringWidth(_InstPtr());
	}

	// float be_BView_StringWidth_1(BView *self, const char* string, int32 length);
	float StringWidth() {
		return be_BView_StringWidth_1(_InstPtr());
	}

	// void be_BView_GetStringWidths(BView *self, char* stringArray[], int32 lengthArray[], int32 numStrings, float widthArray[]);
	void GetStringWidths() {
		be_BView_GetStringWidths(_InstPtr());
	}

	// void be_BView_SetFontSize(BView *self, float size);
	void SetFontSize() {
		be_BView_SetFontSize(_InstPtr());
	}

	// void be_BView_ForceFontAliasing(BView *self, bool enable);
	void ForceFontAliasing() {
		be_BView_ForceFontAliasing(_InstPtr());
	}

	// void be_BView_GetFontHeight(BView *self, font_height* height);
	void GetFontHeight() {
		be_BView_GetFontHeight(_InstPtr());
	}

	// void be_BView_Invalidate(BView *self, BRect *invalRect);
	void Invalidate() {
		be_BView_Invalidate(_InstPtr());
	}

	// void be_BView_Invalidate_1(BView *self, const BRegion* invalRegion);
	void Invalidate() {
		be_BView_Invalidate_1(_InstPtr());
	}

	// void be_BView_Invalidate_2(BView *self);
	void Invalidate() {
		be_BView_Invalidate_2(_InstPtr());
	}

	// void be_BView_SetDiskMode(BView *self, char* filename, long offset);
	void SetDiskMode() {
		be_BView_SetDiskMode(_InstPtr());
	}

	// void be_BView_BeginPicture(BView *self, BPicture* a_picture);
	void BeginPicture() {
		be_BView_BeginPicture(_InstPtr());
	}

	// void be_BView_AppendToPicture(BView *self, BPicture* a_picture);
	void AppendToPicture() {
		be_BView_AppendToPicture(_InstPtr());
	}

	// BPicture* be_BView_EndPicture(BView *self);
	BPicture* EndPicture() {
		return be_BView_EndPicture(_InstPtr());
	}

	// void be_BView_DrawPicture(BView *self, const BPicture* a_picture);
	void DrawPicture() {
		be_BView_DrawPicture(_InstPtr());
	}

	// void be_BView_DrawPicture_1(BView *self, const BPicture* a_picture, BPoint *where);
	void DrawPicture() {
		be_BView_DrawPicture_1(_InstPtr());
	}

	// void be_BView_DrawPicture_2(BView *self, const char* filename, long offset, BPoint *where);
	void DrawPicture() {
		be_BView_DrawPicture_2(_InstPtr());
	}

	// void be_BView_DrawPicture_3(BView *self, const BPicture* a_picture);
	void DrawPicture() {
		be_BView_DrawPicture_3(_InstPtr());
	}

	// void be_BView_DrawPicture_4(BView *self, const BPicture* a_picture, BPoint *where);
	void DrawPicture() {
		be_BView_DrawPicture_4(_InstPtr());
	}

	// void be_BView_DrawPicture_5(BView *self, const char* filename, long offset, BPoint *where);
	void DrawPicture() {
		be_BView_DrawPicture_5(_InstPtr());
	}

	// status_t be_BView_SetEventMask(BView *self, uint32 mask, uint32 options);
	status_t SetEventMask() {
		return be_BView_SetEventMask(_InstPtr());
	}

	// uint32 be_BView_EventMask(BView *self);
	uint32 EventMask() {
		return be_BView_EventMask(_InstPtr());
	}

	// status_t be_BView_SetMouseEventMask(BView *self, uint32 mask, uint32 options);
	status_t SetMouseEventMask() {
		return be_BView_SetMouseEventMask(_InstPtr());
	}
*/
	// void be_BView_SetFlags(BView *self, uint32 flags);
	void SetFlags(uint32 flags) {
		be_BView_SetFlags(_InstPtr(), flags);
	}

	// uint32 be_BView_Flags(BView *self);
	uint32 Flags() {
		return be_BView_Flags(_InstPtr());
	}

	// void be_BView_SetResizingMode(BView *self, uint32 mode);
	void SetResizingMode(uint32 mode) {
		be_BView_SetResizingMode(_InstPtr(), mode);
	}

	// uint32 be_BView_ResizingMode(BView *self);
	uint32 ResizingMode() {
		return be_BView_ResizingMode(_InstPtr());
	}
/*
	// void be_BView_MoveBy(BView *self, float dh, float dv);
	void MoveBy() {
		be_BView_MoveBy(_InstPtr());
	}

	// void be_BView_MoveTo(BView *self, BPoint *where);
	void MoveTo() {
		be_BView_MoveTo(_InstPtr());
	}

	// void be_BView_MoveTo_1(BView *self, float x, float y);
	void MoveTo() {
		be_BView_MoveTo_1(_InstPtr());
	}

	// void be_BView_ResizeBy(BView *self, float dh, float dv);
	void ResizeBy() {
		be_BView_ResizeBy(_InstPtr());
	}

	// void be_BView_ResizeTo(BView *self, float width, float height);
	void ResizeTo() {
		be_BView_ResizeTo(_InstPtr());
	}

	// void be_BView_ResizeTo_1(BView *self, BSize *size);
	void ResizeTo() {
		be_BView_ResizeTo_1(_InstPtr());
	}

	// void be_BView_ScrollBy(BView *self, float dh, float dv);
	void ScrollBy() {
		be_BView_ScrollBy(_InstPtr());
	}

	// void be_BView_ScrollTo(BView *self, float x, float y);
	void ScrollTo() {
		be_BView_ScrollTo(_InstPtr());
	}

	// void be_BView_ScrollTo_1(BView *self, BPoint *where);
	void ScrollTo() {
		be_BView_ScrollTo_1(_InstPtr());
	}

	// void be_BView_MakeFocus(BView *self, bool focusState);
	void MakeFocus() {
		be_BView_MakeFocus(_InstPtr());
	}

	// bool be_BView_IsFocus(BView *self);
	bool IsFocus() {
		return be_BView_IsFocus(_InstPtr());
	}
*/
	// void be_BView_Show(BView *self);
	void Show() {
		be_BView_Show(_InstPtr());
	}

	// void be_BView_Hide(BView *self);
	void Hide() {
		be_BView_Hide(_InstPtr());
	}
/*
	// bool be_BView_IsHidden(BView *self);
	bool IsHidden() {
		return be_BView_IsHidden(_InstPtr());
	}

	// bool be_BView_IsHidden_1(BView *self, const BView* looking_from);
	bool IsHidden() {
		return be_BView_IsHidden_1(_InstPtr());
	}

	// void be_BView_Flush(BView *self);
	void Flush() {
		be_BView_Flush(_InstPtr());
	}

	// void be_BView_Sync(BView *self);
	void Sync() {
		be_BView_Sync(_InstPtr());
	}

	// void be_BView_GetPreferredSize(BView *self, float* width, float* height);
	void GetPreferredSize() {
		be_BView_GetPreferredSize(_InstPtr());
	}

	// void be_BView_ResizeToPreferred(BView *self);
	void ResizeToPreferred() {
		be_BView_ResizeToPreferred(_InstPtr());
	}

	// BScrollBar* be_BView_ScrollBar(BView *self, orientation posture);
	BScrollBar* ScrollBar() {
		return be_BView_ScrollBar(_InstPtr());
	}

	// BHandler* be_BView_ResolveSpecifier(BView *self, BMessage* msg, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler* ResolveSpecifier() {
		return be_BView_ResolveSpecifier(_InstPtr());
	}

	// status_t be_BView_GetSupportedSuites(BView *self, BMessage* data);
	status_t GetSupportedSuites() {
		return be_BView_GetSupportedSuites(_InstPtr());
	}

	// bool be_BView_IsPrinting(BView *self);
	bool IsPrinting() {
		return be_BView_IsPrinting(_InstPtr());
	}

	// void be_BView_SetScale(BView *self, float scale);
	void SetScale() {
		be_BView_SetScale(_InstPtr());
	}

	// float be_BView_Scale(BView *self);
	float Scale() {
		return be_BView_Scale(_InstPtr());
	}

	// status_t be_BView_Perform(BView *self, perform_code code, void* data);
	status_t Perform() {
		return be_BView_Perform(_InstPtr());
	}

	// void be_BView_DrawAfterChildren(BView *self, BRect *r);
	void DrawAfterChildren() {
		be_BView_DrawAfterChildren(_InstPtr());
	}

	// BSize * be_BView_MinSize(BView *self);
	BSize MinSize() {
		return be_BView_MinSize(_InstPtr());
	}

	// BSize * be_BView_MaxSize(BView *self);
	BSize MaxSize() {
		return be_BView_MaxSize(_InstPtr());
	}

	// BSize * be_BView_PreferredSize(BView *self);
	BSize PreferredSize() {
		return be_BView_PreferredSize(_InstPtr());
	}

	// BAlignment * be_BView_LayoutAlignment(BView *self);
	BAlignment LayoutAlignment() {
		return be_BView_LayoutAlignment(_InstPtr());
	}

	// void be_BView_SetExplicitMinSize(BView *self, BSize *size);
	void SetExplicitMinSize() {
		be_BView_SetExplicitMinSize(_InstPtr());
	}

	// void be_BView_SetExplicitMaxSize(BView *self, BSize *size);
	void SetExplicitMaxSize() {
		be_BView_SetExplicitMaxSize(_InstPtr());
	}

	// void be_BView_SetExplicitPreferredSize(BView *self, BSize *size);
	void SetExplicitPreferredSize() {
		be_BView_SetExplicitPreferredSize(_InstPtr());
	}

	// void be_BView_SetExplicitAlignment(BView *self, BAlignment *alignment);
	void SetExplicitAlignment() {
		be_BView_SetExplicitAlignment(_InstPtr());
	}

	// BSize * be_BView_ExplicitMinSize(BView *self);
	BSize ExplicitMinSize() {
		return be_BView_ExplicitMinSize(_InstPtr());
	}

	// BSize * be_BView_ExplicitMaxSize(BView *self);
	BSize ExplicitMaxSize() {
		return be_BView_ExplicitMaxSize(_InstPtr());
	}

	// BSize * be_BView_ExplicitPreferredSize(BView *self);
	BSize ExplicitPreferredSize() {
		return be_BView_ExplicitPreferredSize(_InstPtr());
	}

	// BAlignment * be_BView_ExplicitAlignment(BView *self);
	BAlignment ExplicitAlignment() {
		return be_BView_ExplicitAlignment(_InstPtr());
	}

	// bool be_BView_HasHeightForWidth(BView *self);
	bool HasHeightForWidth() {
		return be_BView_HasHeightForWidth(_InstPtr());
	}

	// void be_BView_GetHeightForWidth(BView *self, float width, float* min, float* max, float* preferred);
	void GetHeightForWidth() {
		be_BView_GetHeightForWidth(_InstPtr());
	}

	// void be_BView_SetLayout(BView *self, BLayout* layout);
	void SetLayout() {
		be_BView_SetLayout(_InstPtr());
	}

	// BLayout* be_BView_GetLayout(BView *self);
	BLayout* GetLayout() {
		return be_BView_GetLayout(_InstPtr());
	}
*/
	// void be_BView_InvalidateLayout(BView *self, bool descendants);
	void InvalidateLayout(bool descendants) {
		be_BView_InvalidateLayout(_InstPtr(), descendants);
	}
/*
	// void be_BView_EnableLayoutInvalidation(BView *self);
	void EnableLayoutInvalidation() {
		be_BView_EnableLayoutInvalidation(_InstPtr());
	}

	// void be_BView_DisableLayoutInvalidation(BView *self);
	void DisableLayoutInvalidation() {
		be_BView_DisableLayoutInvalidation(_InstPtr());
	}

	// bool be_BView_IsLayoutValid(BView *self);
	bool IsLayoutValid() {
		return be_BView_IsLayoutValid(_InstPtr());
	}

	// void be_BView_ResetLayoutInvalidation(BView *self);
	void ResetLayoutInvalidation() {
		be_BView_ResetLayoutInvalidation(_InstPtr());
	}

	// BLayoutContext* be_BView_LayoutContext(BView *self);
	BLayoutContext* LayoutContext() {
		return be_BView_LayoutContext(_InstPtr());
	}

	// void be_BView_Layout(BView *self, bool force);
	void Layout() {
		be_BView_Layout(_InstPtr());
	}

	// void be_BView_Relayout(BView *self);
	void Relayout() {
		be_BView_Relayout(_InstPtr());
	}
*/
	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


