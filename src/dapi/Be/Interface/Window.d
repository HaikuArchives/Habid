/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Window;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Interface.Rect;
import Be.Interface.Point;
import Be.Interface.Size;

import Be.App.Message;
import Be.App.Looper;
import Be.App.Handler;

import Be.Support.Archivable;

import Be.Interface.GraphicsDefs;
import Be.Interface.InterfaceDefs;

import Be.Kernel.OS;

import Be.Interface.View;

import tango.stdc.stringz;

enum window_type {
	B_UNTYPED_WINDOW					= 0,
	B_TITLED_WINDOW 					= 1,
	B_MODAL_WINDOW 						= 3,
	B_DOCUMENT_WINDOW					= 11,
	B_BORDERED_WINDOW					= 20,
	B_FLOATING_WINDOW					= 21
}

enum window_look {
	B_BORDERED_WINDOW_LOOK				= 20,
	B_NO_BORDER_WINDOW_LOOK				= 19,
	B_TITLED_WINDOW_LOOK				= 1,
	B_DOCUMENT_WINDOW_LOOK				= 11,
	B_MODAL_WINDOW_LOOK					= 3,
	B_FLOATING_WINDOW_LOOK				= 7
}

enum window_feel {
	B_NORMAL_WINDOW_FEEL				= 0,
	B_MODAL_SUBSET_WINDOW_FEEL			= 2,
	B_MODAL_APP_WINDOW_FEEL				= 1,
	B_MODAL_ALL_WINDOW_FEEL				= 3,
	B_FLOATING_SUBSET_WINDOW_FEEL		= 5,
	B_FLOATING_APP_WINDOW_FEEL			= 4,
	B_FLOATING_ALL_WINDOW_FEEL			= 6
}

enum window_alignment {
	B_BYTE_ALIGNMENT	= 0,
	B_PIXEL_ALIGNMENT	= 1
}

// window flags
enum {
	B_NOT_MOVABLE						= 0x00000001,
	B_NOT_CLOSABLE						= 0x00000020,
	B_NOT_ZOOMABLE						= 0x00000040,
	B_NOT_MINIMIZABLE					= 0x00004000,
	B_NOT_RESIZABLE						= 0x00000002,
	B_NOT_H_RESIZABLE					= 0x00000004,
	B_NOT_V_RESIZABLE					= 0x00000008,
	B_AVOID_FRONT						= 0x00000080,
	B_AVOID_FOCUS						= 0x00002000,
	B_WILL_ACCEPT_FIRST_CLICK			= 0x00000010,
	B_OUTLINE_RESIZE					= 0x00001000,
	B_NO_WORKSPACE_ACTIVATION			= 0x00000100,
	B_NOT_ANCHORED_ON_ACTIVATE			= 0x00020000,
	B_ASYNCHRONOUS_CONTROLS				= 0x00080000,
	B_QUIT_ON_WINDOW_CLOSE				= 0x00100000,
	B_SAME_POSITION_IN_ALL_WORKSPACES	= 0x00200000,
	B_AUTO_UPDATE_SIZE_LIMITS			= 0x00400000,
	B_CLOSE_ON_ESCAPE					= 0x00800000,
	B_NO_SERVER_SIDE_WINDOW_MODIFIERS	= 0x00000200
}

const uint32 B_CURRENT_WORKSPACE	=		0;
const uint32 B_ALL_WORKSPACES		=		0xffffffff;

extern (C) extern {
	// BWindowProxy * be_BWindow_ctor(void *bindInstPtr, BMessage* archive);
	void * be_BWindow_ctor(void *bindInstPtr, void* archive);

	// BWindowProxy * be_BWindow_ctor_1(void *bindInstPtr, BRect *frame, const char* title, window_type type, uint32 flags, uint32 workspace);
	void * be_BWindow_ctor_1(void *bindInstPtr, void *frame,  char* title, window_type type, uint32 flags, uint32 workspace);

	// BWindowProxy * be_BWindow_ctor_2(void *bindInstPtr, BRect *frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace);
	void * be_BWindow_ctor_2(void *bindInstPtr, void *frame,  char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace);

	// void be_BWindow_dtor(BWindow* self);
	void be_BWindow_dtor(void* self);

	//BArchivable * be_BWindow_Instantiate_static(BMessage* archive)
	BArchivable * be_BWindow_Instantiate_static(void* archive);

	// status_t be_BWindow_Archive(BWindowProxy *self, BMessage* archive, bool deep);
	status_t be_BWindow_Archive(void *self, void* archive, bool deep);

	// void be_BWindow_Quit(BWindowProxy *self);
	void be_BWindow_Quit(void *self);

	// void be_BWindow_Close(BWindowProxy *self);
	void be_BWindow_Close(void *self);

	// void be_BWindow_AddChild(BWindowProxy *self, BView* child, BView* before);
	void be_BWindow_AddChild(void *self, void* child, void* before);

	// void be_BWindow_AddChild_1(BWindowProxy *self, BLayoutItem* child);
	void be_BWindow_AddChild_1(void *self, void* child);

	// bool be_BWindow_RemoveChild(BWindowProxy *self, BView* child);
	bool be_BWindow_RemoveChild(void *self, void* child);

	// int32 be_BWindow_CountChildren(BWindowProxy *self);
	int32 be_BWindow_CountChildren(void *self);

	// BView* be_BWindow_ChildAt(BWindowProxy *self, int32 index);
	void* be_BWindow_ChildAt(void *self, int32 index);

	// void be_BWindow_DispatchMessage(BWindowProxy *self, BMessage* message, BHandler* handler);
	void be_BWindow_DispatchMessage(void *self, void* message, void* handler);

	// void be_BWindow_MessageReceived(BWindowProxy *self, BMessage* message);
	void be_BWindow_MessageReceived(void *self, void* message);

	// void be_BWindow_FrameMoved(BWindowProxy *self, BPoint *newPosition);
	void be_BWindow_FrameMoved(void *self, void *newPosition);

	// void be_BWindow_WorkspacesChanged(BWindowProxy *self, uint32 oldWorkspaces, uint32 newWorkspaces);
	void be_BWindow_WorkspacesChanged(void *self, uint32 oldWorkspaces, uint32 newWorkspaces);

	// void be_BWindow_WorkspaceActivated(BWindowProxy *self, int32 workspace, bool state);
	void be_BWindow_WorkspaceActivated(void *self, int32 workspace, bool state);

	// void be_BWindow_FrameResized(BWindowProxy *self, float newWidth, float newHeight);
	void be_BWindow_FrameResized(void *self, float newWidth, float newHeight);

	// void be_BWindow_Minimize(BWindowProxy *self, bool minimize);
	void be_BWindow_Minimize(void *self, bool minimize);

	// void be_BWindow_Zoom(BWindowProxy *self, BPoint *origin, float width, float height);
	void be_BWindow_Zoom(void *self, void *origin, float width, float height);

	// void be_BWindow_Zoom_1(BWindowProxy *self);
	void be_BWindow_Zoom_1(void *self);

	// void be_BWindow_SetZoomLimits(BWindowProxy *self, float maxWidth, float maxHeight);
	void be_BWindow_SetZoomLimits(void *self, float maxWidth, float maxHeight);

	// void be_BWindow_ScreenChanged(BWindowProxy *self, BRect *screenSize, color_space format);
	void be_BWindow_ScreenChanged(void *self, void *screenSize, color_space format);

	// void be_BWindow_SetPulseRate(BWindowProxy *self, bigtime_t rate);
	void be_BWindow_SetPulseRate(void *self, bigtime_t rate);

	// bigtime_t be_BWindow_PulseRate(BWindowProxy *self);
	bigtime_t be_BWindow_PulseRate(void *self);

	// void be_BWindow_AddShortcut(BWindowProxy *self, uint32 key, uint32 modifiers, BMessage* message);
	void be_BWindow_AddShortcut(void *self, uint32 key, uint32 modifiers, void* message);

	// void be_BWindow_AddShortcut_1(BWindowProxy *self, uint32 key, uint32 modifiers, BMessage* message, BHandler* target);
	void be_BWindow_AddShortcut_1(void *self, uint32 key, uint32 modifiers, void* message, void* target);

	// void be_BWindow_RemoveShortcut(BWindowProxy *self, uint32 key, uint32 modifiers);
	void be_BWindow_RemoveShortcut(void *self, uint32 key, uint32 modifiers);

	// void be_BWindow_SetDefaultButton(BWindowProxy *self, BButton* button);
	void be_BWindow_SetDefaultButton(void *self, void* button);

	// BButton* be_BWindow_DefaultButton(BWindowProxy *self);
	void* be_BWindow_DefaultButton(void *self);

	// void be_BWindow_MenusBeginning(BWindowProxy *self);
	void be_BWindow_MenusBeginning(void *self);

	// void be_BWindow_MenusEnded(BWindowProxy *self);
	void be_BWindow_MenusEnded(void *self);

	// bool be_BWindow_NeedsUpdate(BWindowProxy *self);
	bool be_BWindow_NeedsUpdate(void *self);

	// void be_BWindow_UpdateIfNeeded(BWindowProxy *self);
	void be_BWindow_UpdateIfNeeded(void *self);

	// BView* be_BWindow_FindView(BWindowProxy *self, const char* viewName);
	void* be_BWindow_FindView(void *self, char* viewName);

	// BView* be_BWindow_FindView_1(BWindowProxy *self, BPoint *pt);
	void* be_BWindow_FindView_1(void *self, void *pt);

	// BView* be_BWindow_CurrentFocus(BWindowProxy *self);
	void* be_BWindow_CurrentFocus(void *self);

	// void be_BWindow_Activate(BWindowProxy *self, bool state);
	void be_BWindow_Activate(void *self, bool state);

	// void be_BWindow_WindowActivated(BWindowProxy *self, bool state);
	void be_BWindow_WindowActivated(void *self, bool state);

	// void be_BWindow_ConvertToScreen(BWindowProxy *self, BPoint* point);
	void be_BWindow_ConvertToScreen(void *self, void * point);

	// BPoint * be_BWindow_ConvertToScreen_1(BWindowProxy *self, BPoint *point);
	void * be_BWindow_ConvertToScreen_1(void *self, void *point);

	// void be_BWindow_ConvertFromScreen(BWindowProxy *self, BPoint* point);
	void be_BWindow_ConvertFromScreen(void *self, void * point);

	// BPoint * be_BWindow_ConvertFromScreen_1(BWindowProxy *self, BPoint* point);
	void * be_BWindow_ConvertFromScreen_1(void *self, void * point);

	// void be_BWindow_ConvertToScreen_2(BWindowProxy *self, BRect* rect);
	void be_BWindow_ConvertToScreen_2(void *self, void * rect);

	// BRect * be_BWindow_ConvertToScreen_3(BWindowProxy *self, BRect *rect);
	void * be_BWindow_ConvertToScreen_3(void *self, void *rect);

	// void be_BWindow_ConvertFromScreen_2(BWindowProxy *self, BRect* rect);
	void be_BWindow_ConvertFromScreen_2(void *self, void * rect);

	// BRect * be_BWindow_ConvertFromScreen_3(BWindowProxy *self, BRect *rect);
	void * be_BWindow_ConvertFromScreen_3(void *self, void *rect);

	// void be_BWindow_MoveBy(BWindowProxy *self, float dx, float dy);
	void be_BWindow_MoveBy(void *self, float dx, float dy);

	// void be_BWindow_MoveTo(BWindowProxy *self, BPoint *pt);
	void be_BWindow_MoveTo(void *self, void *pt);

	// void be_BWindow_MoveTo_1(BWindowProxy *self, float x, float y);
	void be_BWindow_MoveTo_1(void *self, float x, float y);

	// void be_BWindow_ResizeBy(BWindowProxy *self, float dx, float dy);
	void be_BWindow_ResizeBy(void *self, float dx, float dy);

	// void be_BWindow_ResizeTo(BWindowProxy *self, float width, float height);
	void be_BWindow_ResizeTo(void *self, float width, float height);

	// void be_BWindow_CenterIn(BWindowProxy *self, const BRect* rect);
	void be_BWindow_CenterIn(void *self, void * rect);

	// void be_BWindow_CenterOnScreen(BWindowProxy *self);
	void be_BWindow_CenterOnScreen(void *self);

	// void be_BWindow_Show(BWindowProxy *self);
	void be_BWindow_Show(void *self);

	// void be_BWindow_Hide(BWindowProxy *self);
	void be_BWindow_Hide(void *self);

	// bool be_BWindow_IsHidden(BWindowProxy *self);
	bool be_BWindow_IsHidden(void *self);

	// bool be_BWindow_IsMinimized(BWindowProxy *self);
	bool be_BWindow_IsMinimized(void *self);

	// void be_BWindow_Flush(BWindowProxy *self);
	void be_BWindow_Flush(void *self);

	// void be_BWindow_Sync(BWindowProxy *self);
	void be_BWindow_Sync(void *self);

	// status_t be_BWindow_SendBehind(BWindowProxy *self, const BWindow* window);
	status_t be_BWindow_SendBehind(void *self, void * window);

	// void be_BWindow_DisableUpdates(BWindowProxy *self);
	void be_BWindow_DisableUpdates(void *self);

	// void be_BWindow_EnableUpdates(BWindowProxy *self);
	void be_BWindow_EnableUpdates(void *self);

	// void be_BWindow_BeginViewTransaction(BWindowProxy *self);
	void be_BWindow_BeginViewTransaction(void *self);

	// void be_BWindow_EndViewTransaction(BWindowProxy *self);
	void be_BWindow_EndViewTransaction(void *self);

	// void be_BWindow_InViewTransaction(BWindowProxy *self);
	void be_BWindow_InViewTransaction(void *self);

	// BRect * be_BWindow_Bounds(BWindowProxy *self);
	void * be_BWindow_Bounds(void *self);

	// BRect * be_BWindow_Frame(BWindowProxy *self);
	void * be_BWindow_Frame(void *self);

	// BRect * be_BWindow_DecoratorFrame(BWindowProxy *self);
	void * be_BWindow_DecoratorFrame(void *self);

	// BSize * be_BWindow_Size(BWindowProxy *self);
	void * be_BWindow_Size(void *self);

	// const char* be_BWindow_Title(BWindowProxy *self);
	char* be_BWindow_Title(void *self);

	// void be_BWindow_SetTitle(BWindowProxy *self, const char* title);
	void be_BWindow_SetTitle(void *self, char* title);

	// bool be_BWindow_IsFront(BWindowProxy *self);
	bool be_BWindow_IsFront(void *self);

	// bool be_BWindow_IsActive(BWindowProxy *self);
	bool be_BWindow_IsActive(void *self);

	// void be_BWindow_SetKeyMenuBar(BWindowProxy *self, BMenuBar* bar);
	void be_BWindow_SetKeyMenuBar(void *self, void* bar);

	// BMenuBar* be_BWindow_KeyMenuBar(BWindowProxy *self);
	void* be_BWindow_KeyMenuBar(void *self);

	// void be_BWindow_SetSizeLimits(BWindowProxy *self, float minWidth, float maxWidth, float minHeight, float maxHeight);
	void be_BWindow_SetSizeLimits(void *self, float minWidth, float maxWidth, float minHeight, float maxHeight);

	// void be_BWindow_GetSizeLimits(BWindowProxy *self, float* minWidth, float* maxWidth, float* minHeight, float* maxHeight);
	void be_BWindow_GetSizeLimits(void *self, float* minWidth, float* maxWidth, float* minHeight, float* maxHeight);

	// status_t be_BWindow_SetDecoratorSettings(BWindowProxy *self, const BMessage* settings);
	status_t be_BWindow_SetDecoratorSettings(void *self, void* settings);

	// status_t be_BWindow_GetDecoratorSettings(BWindowProxy *self, BMessage* settings);
	status_t be_BWindow_GetDecoratorSettings(void *self, void* settings);

	// uint32 be_BWindow_Workspaces(BWindowProxy *self);
	uint32 be_BWindow_Workspaces(void *self);

	// void be_BWindow_SetWorkspaces(BWindowProxy *self, uint32 workspace);
	void be_BWindow_SetWorkspaces(void *self, uint32 workspace);

	// BView* be_BWindow_LastMouseMovedView(BWindowProxy *self);
	void* be_BWindow_LastMouseMovedView(void *self);

	// BHandler* be_BWindow_ResolveSpecifier(BWindowProxy *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	void* be_BWindow_ResolveSpecifier(void *self, void* message, int32 index, void* specifier, int32 form,  char* property);

	// status_t be_BWindow_GetSupportedSuites(BWindowProxy *self, BMessage* data);
	status_t be_BWindow_GetSupportedSuites(void *self, void* data);

	// status_t be_BWindow_AddToSubset(BWindowProxy *self, BWindow* window);
	status_t be_BWindow_AddToSubset(void *self, void * window);

	// status_t be_BWindow_RemoveFromSubset(BWindowProxy *self, BWindow* window);
	status_t be_BWindow_RemoveFromSubset(void *self, void * window);

	// status_t be_BWindow_Perform(BWindowProxy *self, perform_code code, void* data);
	status_t be_BWindow_Perform(void *self, perform_code code, void* data);

	// status_t be_BWindow_SetType(BWindowProxy *self, window_type type);
	status_t be_BWindow_SetType(void *self, window_type type);

	// window_type be_BWindow_Type(BWindowProxy *self);
	window_type be_BWindow_Type(void *self);

	// status_t be_BWindow_SetLook(BWindowProxy *self, window_look look);
	status_t be_BWindow_SetLook(void *self, window_look look);

	// window_look be_BWindow_Look(BWindowProxy *self);
	window_look be_BWindow_Look(void *self);

	// status_t be_BWindow_SetFeel(BWindowProxy *self, window_feel feel);
	status_t be_BWindow_SetFeel(void *self, window_feel feel);

	// window_feel be_BWindow_Feel(BWindowProxy *self);
	window_feel be_BWindow_Feel(void *self);

	// status_t be_BWindow_SetFlags(BWindowProxy *self, uint32 flags);
	status_t be_BWindow_SetFlags(void *self, uint32 flags);

	// uint32 be_BWindow_Flags(BWindowProxy *self);
	uint32 be_BWindow_Flags(void *self);

	// bool be_BWindow_IsModal(BWindowProxy *self);
	bool be_BWindow_IsModal(void *self);

	// bool be_BWindow_IsFloating(BWindowProxy *self);
	bool be_BWindow_IsFloating(void *self);

	// status_t be_BWindow_SetWindowAlignment(BWindowProxy *self, window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset);
	status_t be_BWindow_SetWindowAlignment(void *self, window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset);

	// status_t be_BWindow_GetWindowAlignment(BWindowProxy *self, window_alignment* mode, int32* h, int32* hOffset, int32* width, int32* widthOffset, int32* v, int32* vOffset, int32* height, int32* heightOffset);
	status_t be_BWindow_GetWindowAlignment(void *self, window_alignment* mode, int32* h, int32* hOffset, int32* width, int32* widthOffset, int32* v, int32* vOffset, int32* height, int32* heightOffset);

	// bool be_BWindow_QuitRequested(BWindowProxy *self);
	bool be_BWindow_QuitRequested(void *self);

	// thread_id be_BWindow_Run(BWindowProxy *self);
	thread_id be_BWindow_Run(void *self);

	// void be_BWindow_SetLayout(BWindowProxy *self, BLayout* layout);
	void be_BWindow_SetLayout(void *self, void* layout);

	// BLayout* be_BWindow_GetLayout(BWindowProxy *self);
	void* be_BWindow_GetLayout(void *self);

	// void be_BWindow_InvalidateLayout(BWindowProxy *self, bool descendants);
	void be_BWindow_InvalidateLayout(void *self, bool descendants);

}


extern (C) {
	status_t bind_BWindow_Archive(void *bindInstPtr, void* archive, bool deep) {
		return (cast(BWindow)bindInstPtr).Archive(new BMessage(archive, false), deep);
	}

	void bind_BWindow_Quit(void *bindInstPtr) {
		(cast(BWindow)bindInstPtr).Quit();
	}

	void bind_BWindow_DispatchMessage(void *bindInstPtr, void* message, void* handler) {
		(cast(BWindow)bindInstPtr).DispatchMessage(new BMessage(message, false), new BHandler(handler, false));
	}

	void bind_BWindow_MessageReceived(void *bindInstPtr, void* message) {
		(cast(BWindow)bindInstPtr).MessageReceived(new BMessage(message, false));
	}

	void bind_BWindow_FrameMoved(void *bindInstPtr, void *newPosition) {
		(cast(BWindow)bindInstPtr).FrameMoved(new BPoint(newPosition, false));
	}

	void bind_BWindow_WorkspacesChanged(void *bindInstPtr, uint32 oldWorkspaces, uint32 newWorkspaces) {
		(cast(BWindow)bindInstPtr).WorkspacesChanged(oldWorkspaces, newWorkspaces);
	}

	void bind_BWindow_WorkspaceActivated(void *bindInstPtr, int32 workspace, bool state) {
		(cast(BWindow)bindInstPtr).WorkspaceActivated(workspace, state);
	}

	void bind_BWindow_FrameResized(void *bindInstPtr, float newWidth, float newHeight) {
		(cast(BWindow)bindInstPtr).FrameResized(newWidth, newHeight);
	}

	void bind_BWindow_Minimize(void *bindInstPtr, bool minimize) {
		(cast(BWindow)bindInstPtr).Minimize(minimize);
	}

	void bind_BWindow_Zoom(void *bindInstPtr, void *origin, float width, float height) {
		(cast(BWindow)bindInstPtr).Zoom(new BPoint(origin, false), width, height);
	}

	void bind_BWindow_ScreenChanged(void *bindInstPtr, void *screenSize, color_space format) {
		(cast(BWindow)bindInstPtr).ScreenChanged(new BRect(screenSize, false), format);
	}

	void bind_BWindow_MenusBeginning(void *bindInstPtr) {
		(cast(BWindow)bindInstPtr).MenusBeginning();
	}

	void bind_BWindow_MenusEnded(void *bindInstPtr) {
		(cast(BWindow)bindInstPtr).MenusEnded();
	}

	void bind_BWindow_WindowActivated(void *bindInstPtr, bool state) {
		(cast(BWindow)bindInstPtr).WindowActivated(state);
	}

	void bind_BWindow_Show(void *bindInstPtr) {
		(cast(BWindow)bindInstPtr).Show();
	}

	void bind_BWindow_Hide(void *bindInstPtr) {
		(cast(BWindow)bindInstPtr).Hide();
	}

	void* bind_BWindow_ResolveSpecifier(void *bindInstPtr, void* message, int32 index, void* specifier, int32 form,  char* property) {
		assert(false, "bind_BWindow_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) Unimplemented");
	}

	status_t bind_BWindow_GetSupportedSuites(void *bindInstPtr, void* data) {
		assert(false, "bind_BWindow_GetSupportedSuites(void *bindInstPtr, BMessage* data) Unimplemented");
	}

	status_t bind_BWindow_Perform(void *bindInstPtr, perform_code code, void* data) {
		assert(false, "bind_BWindow_Perform(void *bindInstPtr, perform_code code, void* data) Unimplemented");
	}

	bool bind_BWindow_QuitRequested(void *bindInstPtr) {
		return (cast(BWindow)bindInstPtr).QuitRequested();
	}

	thread_id bind_BWindow_Run(void *bindInstPtr) {
		return (cast(BWindow)bindInstPtr).Run();
	}

	void bind_BWindow_SetLayout(void *bindInstPtr, void* layout) {
		assert(false, "bind_BWindow_SetLayout(void *bindInstPtr, BLayout* layout) Unimplemented");
	}

}


interface IBWindow
{

	// BArchivable * be_BWindow_Instantiate(BWindow *self, BMessage* archive);
//	BArchivable * Instantiate();

	// status_t be_BWindow_Archive(BWindow *self, BMessage* archive, bool deep);
	status_t Archive(BMessage, bool);

	// void be_BWindow_Quit(BWindow *self);
	void Quit();

	// void be_BWindow_Close(BWindow *self);
	void Close();

	// void be_BWindow_AddChild(BWindow *self, BView* child, BView* before);
	void AddChild(BView, BView);

	// void be_BWindow_AddChild_1(BWindow *self, BLayoutItem* child);
//	void AddChild(BLayoutItem);

	// bool be_BWindow_RemoveChild(BWindow *self, BView* child);
	bool RemoveChild(BView);

	// int32 be_BWindow_CountChildren(BWindow *self);
	int32 CountChildren();

	// BView* be_BWindow_ChildAt(BWindow *self, int32 index);
	BView ChildAt(int32);

	// void be_BWindow_DispatchMessage(BWindow *self, BMessage* message, BHandler* handler);
	void DispatchMessage(BMessage, BHandler);

	// void be_BWindow_MessageReceived(BWindow *self, BMessage* message);
	void MessageReceived(BMessage);

	// void be_BWindow_FrameMoved(BWindow *self, BPoint *newPosition);
	void FrameMoved(BPoint);

	// void be_BWindow_WorkspacesChanged(BWindow *self, uint32 oldWorkspaces, uint32 newWorkspaces);
	void WorkspacesChanged(uint32, uint32);

	// void be_BWindow_WorkspaceActivated(BWindow *self, int32 workspace, bool state);
	void WorkspaceActivated(int32, bool);

	// void be_BWindow_FrameResized(BWindow *self, float newWidth, float newHeight);
	void FrameResized(float, float);

	// void be_BWindow_Minimize(BWindow *self, bool minimize);
	void Minimize(bool);

	// void be_BWindow_Zoom(BWindow *self, BPoint *origin, float width, float height);
	void Zoom(BPoint, float, float);

	// void be_BWindow_Zoom_1(BWindow *self);
	void Zoom();

	// void be_BWindow_SetZoomLimits(BWindow *self, float maxWidth, float maxHeight);
	void SetZoomLimits(float, float);

	// void be_BWindow_ScreenChanged(BWindow *self, BRect *screenSize, color_space format);
	void ScreenChanged(BRect, color_space);

	// void be_BWindow_SetPulseRate(BWindow *self, bigtime_t rate);
	void SetPulseRate(bigtime_t);

	// bigtime_t be_BWindow_PulseRate(BWindow *self);
	bigtime_t PulseRate();

	// void be_BWindow_AddShortcut(BWindow *self, uint32 key, uint32 modifiers, BMessage* message);
	void AddShortcut(uint32, uint32, BMessage);

	// void be_BWindow_AddShortcut_1(BWindow *self, uint32 key, uint32 modifiers, BMessage* message, BHandler* target);
	void AddShortcut(uint32, uint32, BMessage, BHandler);

	// void be_BWindow_RemoveShortcut(BWindow *self, uint32 key, uint32 modifiers);
	void RemoveShortcut(uint32, uint32);
/*
	// void be_BWindow_SetDefaultButton(BWindow *self, BButton* button);
	void SetDefaultButton();

	// BButton* be_BWindow_DefaultButton(BWindow *self);
	BButton* DefaultButton();
*/
	// void be_BWindow_MenusBeginning(BWindow *self);
	void MenusBeginning();

	// void be_BWindow_MenusEnded(BWindow *self);
	void MenusEnded();

	// bool be_BWindow_NeedsUpdate(BWindow *self);
	bool NeedsUpdate();

	// void be_BWindow_UpdateIfNeeded(BWindow *self);
	void UpdateIfNeeded();

	// BView* be_BWindow_FindView(BWindow *self, const char* viewName);
	BView FindView(char []);

	// BView* be_BWindow_FindView_1(BWindow *self, BPoint *pt);
	BView FindView(BPoint);

	// BView* be_BWindow_CurrentFocus(BWindow *self);
	BView CurrentFocus();

	// void be_BWindow_Activate(BWindow *self, bool state);
	void Activate(bool);

	// void be_BWindow_WindowActivated(BWindow *self, bool state);
	void WindowActivated(bool);

	// void be_BWindow_ConvertToScreen(BWindow *self, BPoint* point);
	void ConvertToScreen(BPoint);

	// BPoint * be_BWindow_ConvertToScreen_1(BWindow *self, BPoint *point);
	BPoint ConvertToScreen(BPoint);

	// void be_BWindow_ConvertFromScreen(BWindow *self, BPoint* point);
	void ConvertFromScreen(BPoint);

	// BPoint * be_BWindow_ConvertFromScreen_1(BWindow *self, BPoint* point);
	BPoint ConvertFromScreen(BPoint);

	// void be_BWindow_ConvertToScreen_2(BWindow *self, BRect* rect);
	void ConvertToScreen(BRect);

	// BRect * be_BWindow_ConvertToScreen_3(BWindow *self, BRect *rect);
	BRect ConvertToScreen(BRect);

	// void be_BWindow_ConvertFromScreen_2(BWindow *self, BRect* rect);
	void ConvertFromScreen(BRect);

	// BRect * be_BWindow_ConvertFromScreen_3(BWindow *self, BRect *rect);
	BRect ConvertFromScreen(BRect);

	// void be_BWindow_MoveBy(BWindow *self, float dx, float dy);
	void MoveBy(float, float);

	// void be_BWindow_MoveTo(BWindow *self, BPoint *pt);
	void MoveTo(BPoint);

	// void be_BWindow_MoveTo_1(BWindow *self, float x, float y);
	void MoveTo(float, float);

	// void be_BWindow_ResizeBy(BWindow *self, float dx, float dy);
	void ResizeBy(float, float);

	// void be_BWindow_ResizeTo(BWindow *self, float width, float height);
	void ResizeTo(float, float);

	// void be_BWindow_CenterIn(BWindow *self, const BRect& rect);
	void CenterIn(BRect);

	// void be_BWindow_CenterOnScreen(BWindow *self);
	void CenterOnScreen();

	// void be_BWindow_Show(BWindow *self);
	void Show();

	// void be_BWindow_Hide(BWindow *self);
	void Hide();

	// bool be_BWindow_IsHidden(BWindow *self);
	bool IsHidden();

	// bool be_BWindow_IsMinimized(BWindow *self);
	bool IsMinimized();

	// void be_BWindow_Flush(BWindow *self);
	void Flush();

	// void be_BWindow_Sync(BWindow *self);
	void Sync();

	// status_t be_BWindow_SendBehind(BWindow *self, const BWindow* window);
	status_t SendBehind(BWindow);

	// void be_BWindow_DisableUpdates(BWindow *self);
	void DisableUpdates();

	// void be_BWindow_EnableUpdates(BWindow *self);
	void EnableUpdates();

	// void be_BWindow_BeginViewTransaction(BWindow *self);
	void BeginViewTransaction();

	// void be_BWindow_EndViewTransaction(BWindow *self);
	void EndViewTransaction();

	// void be_BWindow_InViewTransaction(BWindow *self);
	void InViewTransaction();

	// BRect * be_BWindow_Bounds(BWindow *self);
	BRect Bounds();

	// BRect * be_BWindow_Frame(BWindow *self);
	BRect Frame();

	// BRect * be_BWindow_DecoratorFrame(BWindow *self);
	BRect DecoratorFrame();

	// BSize * be_BWindow_Size(BWindow *self);
	BSize Size();

	// const char* be_BWindow_Title(BWindow *self);
	char [] Title();

	// void be_BWindow_SetTitle(BWindow *self, const char* title);
	void SetTitle(char [] title);

	// bool be_BWindow_IsFront(BWindow *self);
	bool IsFront();

	// bool be_BWindow_IsActive(BWindow *self);
	bool IsActive();
/*
	// void be_BWindow_SetKeyMenuBar(BWindow *self, BMenuBar* bar);
	void SetKeyMenuBar();

	// BMenuBar* be_BWindow_KeyMenuBar(BWindow *self);
	BMenuBar* KeyMenuBar();
*/
	// void be_BWindow_SetSizeLimits(BWindow *self, float minWidth, float maxWidth, float minHeight, float maxHeight);
	void SetSizeLimits(float, float, float, float);

	// void be_BWindow_GetSizeLimits(BWindow *self, float* minWidth, float* maxWidth, float* minHeight, float* maxHeight);
	void GetSizeLimits(inout float, inout float, inout float, inout float);

	// status_t be_BWindow_SetDecoratorSettings(BWindow *self, const BMessage& settings);
	status_t SetDecoratorSettings(BMessage);

	// status_t be_BWindow_GetDecoratorSettings(BWindow *self, BMessage* settings);
	status_t GetDecoratorSettings(BMessage);

	// uint32 be_BWindow_Workspaces(BWindow *self);
	uint32 Workspaces();

	// void be_BWindow_SetWorkspaces(BWindow *self, uint32 workspace);
	void SetWorkspaces(uint32);

	// BView* be_BWindow_LastMouseMovedView(BWindow *self);
	BView LastMouseMovedView();

	// BHandler* be_BWindow_ResolveSpecifier(BWindow *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage, int32, BMessage, int32, char []);

	// status_t be_BWindow_GetSupportedSuites(BWindow *self, BMessage* data);
	status_t GetSupportedSuites(BMessage);

	// status_t be_BWindow_AddToSubset(BWindow *self, BWindow* window);
	status_t AddToSubset(BWindow);

	// status_t be_BWindow_RemoveFromSubset(BWindow *self, BWindow* window);
	status_t RemoveFromSubset(BWindow);

	// status_t be_BWindow_Perform(BWindow *self, perform_code code, void* data);
	status_t Perform(perform_code, void *);

	// status_t be_BWindow_SetType(BWindow *self, window_type type);
	status_t SetType(window_type);

	// window_type be_BWindow_Type(BWindow *self);
	window_type Type();

	// status_t be_BWindow_SetLook(BWindow *self, window_look look);
	status_t SetLook(window_look);

	// window_look be_BWindow_Look(BWindow *self);
	window_look Look();

	// status_t be_BWindow_SetFeel(BWindow *self, window_feel feel);
	status_t SetFeel(window_feel);

	// window_feel be_BWindow_Feel(BWindow *self);
	window_feel Feel();

	// status_t be_BWindow_SetFlags(BWindow *self, uint32 flags);
	status_t SetFlags(uint32);

	// uint32 be_BWindow_Flags(BWindow *self);
	uint32 Flags();

	// bool be_BWindow_IsModal(BWindow *self);
	bool IsModal();

	// bool be_BWindow_IsFloating(BWindow *self);
	bool IsFloating();

	// status_t be_BWindow_SetWindowAlignment(BWindow *self, window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset);
	status_t SetWindowAlignment(window_alignment, int32, int32, int32, int32, int32, int32, int32, int32);

	// status_t be_BWindow_GetWindowAlignment(BWindow *self, window_alignment* mode, int32* h, int32* hOffset, int32* width, int32* widthOffset, int32* v, int32* vOffset, int32* height, int32* heightOffset);
	status_t GetWindowAlignment(inout window_alignment, inout int32, inout int32, inout int32, inout int32, inout int32, inout int32, inout int32, inout int32);

	// bool be_BWindow_QuitRequested(BWindow *self);
	bool QuitRequested();

	// thread_id be_BWindow_Run(BWindow *self);
	thread_id Run();
/*
	// void be_BWindow_SetLayout(BWindow *self, BLayout* layout);
	void SetLayout();

	// BLayout* be_BWindow_GetLayout(BWindow *self);
	BLayout* GetLayout();

	// void be_BWindow_InvalidateLayout(BWindow *self, bool descendants);
	void InvalidateLayout();
*/
	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BWindow : BLooper, IBWindow
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BWindowProxy * be_BWindow_ctor(void *bindInstPtr, BMessage* archive);
	this(BMessage archive) {
		if(_InstPtr is null) {
			_InstPtr = be_BWindow_ctor(cast(void *)this, archive._InstPtr);
			_OwnsPtr = false;
		}
		super();
	}

	// BWindowProxy * be_BWindow_ctor_1(void *bindInstPtr, BRect *frame, const char* title, window_type type, uint32 flags, uint32 workspace);
	this(BRect frame, char [] title, window_type type, uint32 flags, uint32 workspace = B_CURRENT_WORKSPACE) {
		if(_InstPtr is null) {
			_InstPtr = be_BWindow_ctor_1(cast(void *)this, frame._InstPtr, toStringz(title), type, flags, workspace);
			_OwnsPtr = false;
		}
		super();
	}

	// BWindowProxy * be_BWindow_ctor_2(void *bindInstPtr, BRect *frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace);
	this(BRect frame, char [] title, window_look look, window_feel feel, uint32 flags, uint32 workspace = B_CURRENT_WORKSPACE) {
		if(_InstPtr is null) {
			_InstPtr = be_BWindow_ctor_2(cast(void *)this, frame._InstPtr, toStringz(title), look, feel, flags, workspace);
			_OwnsPtr = false;
		}
		super();
	}

	// void be_BWindow_dtor(BWindow* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BWindow_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	//BArchivable * be_BWindow_Instantiate_static(BMessage* archive)
	static BArchivable Instantiate(BMessage archive)
	{
		return new BArchivable(be_BWindow_Instantiate_static(archive._InstPtr), true);
	}

	// status_t be_BWindow_Archive(BWindow *self, BMessage* archive, bool deep);
	status_t Archive(BMessage archive, bool deep = true) {
		return be_BWindow_Archive(_InstPtr(), archive._InstPtr, deep);
	}

	// void be_BWindow_Quit(BWindow *self);
	void Quit() {
		be_BWindow_Quit(_InstPtr());
	}

	// void be_BWindow_Close(BWindow *self);
	void Close() {
		be_BWindow_Close(_InstPtr());
	}

	// void be_BWindow_AddChild(BWindow *self, BView* child, BView* before);
	void AddChild(BView child, BView before = null) {
		child._OwnsPtr = false; // Turn over the power to the BWindow..
		be_BWindow_AddChild(_InstPtr(), child._InstPtr, null); //, before is null ? null : before._InstPtr);
	}
/*
	// void be_BWindow_AddChild_1(BWindow *self, BLayoutItem* child);
	void AddChild(BLayoutItem child) {
		be_BWindow_AddChild_1(_InstPtr(), child._InstPtr);
	}
*/
	// bool be_BWindow_RemoveChild(BWindow *self, BView* child);
	bool RemoveChild(BView child) {
		child._OwnsPtr = true; // We got the power back, so we manage the memeory
		return be_BWindow_RemoveChild(_InstPtr(), child._InstPtr);
	}

	// int32 be_BWindow_CountChildren(BWindow *self);
	int32 CountChildren() {
		return be_BWindow_CountChildren(_InstPtr());
	}

	// BView* be_BWindow_ChildAt(BWindow *self, int32 index);
	BView ChildAt(int32 index) {
		return new BView(be_BWindow_ChildAt(_InstPtr(), index), false);
	}

	// void be_BWindow_DispatchMessage(BWindow *self, BMessage* message, BHandler* handler);
	void DispatchMessage(BMessage message, BHandler handler) {
		be_BWindow_DispatchMessage(_InstPtr(), message._InstPtr, handler._InstPtr);
	}

	// void be_BWindow_MessageReceived(BWindow *self, BMessage* message);
	void MessageReceived(BMessage message) {
		be_BWindow_MessageReceived(_InstPtr(), message._InstPtr);
	}

	// void be_BWindow_FrameMoved(BWindow *self, BPoint *newPosition);
	void FrameMoved(BPoint newPosition) {
		be_BWindow_FrameMoved(_InstPtr(), newPosition._InstPtr);
	}

	// void be_BWindow_WorkspacesChanged(BWindow *self, uint32 oldWorkspaces, uint32 newWorkspaces);
	void WorkspacesChanged(uint32 oldWorkspaces, uint32 newWorkspaces) {
		be_BWindow_WorkspacesChanged(_InstPtr(), oldWorkspaces, newWorkspaces);
	}

	// void be_BWindow_WorkspaceActivated(BWindow *self, int32 workspace, bool state);
	void WorkspaceActivated(int32 workspace, bool state) {
		be_BWindow_WorkspaceActivated(_InstPtr(), workspace, state);
	}

	// void be_BWindow_FrameResized(BWindow *self, float newWidth, float newHeight);
	void FrameResized(float newWidth, float newHeight) {
		be_BWindow_FrameResized(_InstPtr(), newWidth, newHeight);
	}

	// void be_BWindow_Minimize(BWindow *self, bool minimize);
	void Minimize(bool minimize) {
		be_BWindow_Minimize(_InstPtr(), minimize);
	}

	// void be_BWindow_Zoom(BWindow *self, BPoint *origin, float width, float height);
	void Zoom(BPoint origin, float width, float height) {
		be_BWindow_Zoom(_InstPtr(), origin._InstPtr, width, height);
	}

	// void be_BWindow_Zoom_1(BWindow *self);
	void Zoom() {
		be_BWindow_Zoom_1(_InstPtr());
	}

	// void be_BWindow_SetZoomLimits(BWindow *self, float maxWidth, float maxHeight);
	void SetZoomLimits(float maxWidth, float maxHeight) {
		be_BWindow_SetZoomLimits(_InstPtr(), maxWidth, maxHeight);
	}

	// void be_BWindow_ScreenChanged(BWindow *self, BRect *screenSize, color_space format);
	void ScreenChanged(BRect screenSize, color_space format) {
		be_BWindow_ScreenChanged(_InstPtr(), screenSize._InstPtr, format);
	}

	// void be_BWindow_SetPulseRate(BWindow *self, bigtime_t rate);
	void SetPulseRate(bigtime_t rate) {
		be_BWindow_SetPulseRate(_InstPtr(), rate);
	}

	// bigtime_t be_BWindow_PulseRate(BWindow *self);
	bigtime_t PulseRate() {
		return be_BWindow_PulseRate(_InstPtr());
	}

	// void be_BWindow_AddShortcut(BWindow *self, uint32 key, uint32 modifiers, BMessage* message);
	void AddShortcut(uint32 key, uint32 modifiers, BMessage message) {
		be_BWindow_AddShortcut(_InstPtr(), key, modifiers, message._InstPtr);
	}

	// void be_BWindow_AddShortcut_1(BWindow *self, uint32 key, uint32 modifiers, BMessage* message, BHandler* target);
	void AddShortcut(uint32 key, uint32 modifiers, BMessage message, BHandler target) {
		be_BWindow_AddShortcut_1(_InstPtr(), key, modifiers, message._InstPtr, target._InstPtr);
	}

	// void be_BWindow_RemoveShortcut(BWindow *self, uint32 key, uint32 modifiers);
	void RemoveShortcut(uint32 key, uint32 modifiers) {
		be_BWindow_RemoveShortcut(_InstPtr(), key, modifiers);
	}
/*
	// void be_BWindow_SetDefaultButton(BWindow *self, BButton* button);
	void SetDefaultButton(BButton button) {
		be_BWindow_SetDefaultButton(_InstPtr(), button._InstPtr);
	}

	// BButton* be_BWindow_DefaultButton(BWindow *self);
	BButton* DefaultButton() {
		return be_BWindow_DefaultButton(_InstPtr());
	}
*/
	// void be_BWindow_MenusBeginning(BWindow *self);
	void MenusBeginning() {
		be_BWindow_MenusBeginning(_InstPtr());
	}

	// void be_BWindow_MenusEnded(BWindow *self);
	void MenusEnded() {
		be_BWindow_MenusEnded(_InstPtr());
	}

	// bool be_BWindow_NeedsUpdate(BWindow *self);
	bool NeedsUpdate() {
		return be_BWindow_NeedsUpdate(_InstPtr());
	}

	// void be_BWindow_UpdateIfNeeded(BWindow *self);
	void UpdateIfNeeded() {
		be_BWindow_UpdateIfNeeded(_InstPtr());
	}

	// BView* be_BWindow_FindView(BWindow *self, const char* viewName);
	BView FindView(char [] name) {
		return new BView(be_BWindow_FindView(_InstPtr(), toStringz(name)), false);
	}

	// BView* be_BWindow_FindView_1(BWindow *self, BPoint *pt);
	BView FindView(BPoint pt) {
		return new BView(be_BWindow_FindView_1(_InstPtr(), pt._InstPtr), false);
	}

	// BView* be_BWindow_CurrentFocus(BWindow *self);
	BView CurrentFocus() {
		return new BView(be_BWindow_CurrentFocus(_InstPtr()), false);
	}

	// void be_BWindow_Activate(BWindow *self, bool state);
	void Activate(bool state) {
		be_BWindow_Activate(_InstPtr(), state);
	}

	// void be_BWindow_WindowActivated(BWindow *self, bool state);
	void WindowActivated(bool state) {
		be_BWindow_WindowActivated(_InstPtr(), state);
	}

	// void be_BWindow_ConvertToScreen(BWindow *self, BPoint* point);
	void ConvertToScreen(BPoint point) {
		be_BWindow_ConvertToScreen(_InstPtr(), point._InstPtr);
	}

	// BPoint * be_BWindow_ConvertToScreen_1(BWindow *self, BPoint *point);
	BPoint ConvertToScreen(BPoint point) {
		return new BPoint(be_BWindow_ConvertToScreen_1(_InstPtr(), point._InstPtr), false);
	}

	// void be_BWindow_ConvertFromScreen(BWindow *self, BPoint* point);
	void ConvertFromScreen(BPoint point) {
		be_BWindow_ConvertFromScreen(_InstPtr(), point._InstPtr);
	}

	// BPoint * be_BWindow_ConvertFromScreen_1(BWindow *self, BPoint* point);
	BPoint ConvertFromScreen(BPoint point) {
		return new BPoint(be_BWindow_ConvertFromScreen_1(_InstPtr(), point._InstPtr), false);
	}

	// void be_BWindow_ConvertToScreen_2(BWindow *self, BRect* rect);
	void ConvertToScreen(BRect rect) {
		be_BWindow_ConvertToScreen_2(_InstPtr(), rect._InstPtr);
	}

	// BRect * be_BWindow_ConvertToScreen_3(BWindow *self, BRect *rect);
	BRect ConvertToScreen(BRect rect) {
		return new BRect(be_BWindow_ConvertToScreen_3(_InstPtr(), rect._InstPtr), false);
	}

	// void be_BWindow_ConvertFromScreen_2(BWindow *self, BRect* rect);
	void ConvertFromScreen(BRect rect) {
		be_BWindow_ConvertFromScreen_2(_InstPtr(), rect._InstPtr);
	}

	// BRect * be_BWindow_ConvertFromScreen_3(BWindow *self, BRect *rect);
	BRect ConvertFromScreen(BRect rect) {
		return new BRect(be_BWindow_ConvertFromScreen_3(_InstPtr(), rect._InstPtr), false);
	}

	// void be_BWindow_MoveBy(BWindow *self, float dx, float dy);
	void MoveBy(float dx, float dy) {
		be_BWindow_MoveBy(_InstPtr(), dx, dy);
	}

	// void be_BWindow_MoveTo(BWindow *self, BPoint *pt);
	void MoveTo(BPoint pt) {
		be_BWindow_MoveTo(_InstPtr(), pt._InstPtr);
	}

	// void be_BWindow_MoveTo_1(BWindow *self, float x, float y);
	void MoveTo(float x, float y) {
		be_BWindow_MoveTo_1(_InstPtr(), x, y);
	}

	// void be_BWindow_ResizeBy(BWindow *self, float dx, float dy);
	void ResizeBy(float dx, float dy) {
		be_BWindow_ResizeBy(_InstPtr(), dx, dy);
	}

	// void be_BWindow_ResizeTo(BWindow *self, float width, float height);
	void ResizeTo(float width, float height) {
		be_BWindow_ResizeTo(_InstPtr(), width, height);
	}

	// void be_BWindow_CenterIn(BWindow *self, const BRect& rect);
	void CenterIn(BRect rect) {
		be_BWindow_CenterIn(_InstPtr(), rect._InstPtr);
	}

	// void be_BWindow_CenterOnScreen(BWindow *self);
	void CenterOnScreen() {
		be_BWindow_CenterOnScreen(_InstPtr());
	}

	// void be_BWindow_Show(BWindow *self);
	void Show() {
		be_BWindow_Show(_InstPtr());
	}

	// void be_BWindow_Hide(BWindow *self);
	void Hide() {
		be_BWindow_Hide(_InstPtr());
	}

	// bool be_BWindow_IsHidden(BWindow *self);
	bool IsHidden() {
		return be_BWindow_IsHidden(_InstPtr());
	}

	// bool be_BWindow_IsMinimized(BWindow *self);
	bool IsMinimized() {
		return be_BWindow_IsMinimized(_InstPtr());
	}

	// void be_BWindow_Flush(BWindow *self);
	void Flush() {
		be_BWindow_Flush(_InstPtr());
	}

	// void be_BWindow_Sync(BWindow *self);
	void Sync() {
		be_BWindow_Sync(_InstPtr());
	}

	// status_t be_BWindow_SendBehind(BWindow *self, const BWindow* window);
	status_t SendBehind(BWindow window) {
		return be_BWindow_SendBehind(_InstPtr(), window._InstPtr);
	}

	// void be_BWindow_DisableUpdates(BWindow *self);
	void DisableUpdates() {
		be_BWindow_DisableUpdates(_InstPtr());
	}

	// void be_BWindow_EnableUpdates(BWindow *self);
	void EnableUpdates() {
		be_BWindow_EnableUpdates(_InstPtr());
	}

	// void be_BWindow_BeginViewTransaction(BWindow *self);
	void BeginViewTransaction() {
		be_BWindow_BeginViewTransaction(_InstPtr());
	}

	// void be_BWindow_EndViewTransaction(BWindow *self);
	void EndViewTransaction() {
		be_BWindow_EndViewTransaction(_InstPtr());
	}

	// void be_BWindow_InViewTransaction(BWindow *self);
	void InViewTransaction() {
		be_BWindow_InViewTransaction(_InstPtr());
	}

	// BRect * be_BWindow_Bounds(BWindow *self);
	BRect Bounds() {
		return new BRect(be_BWindow_Bounds(_InstPtr()), true);
	}

	// BRect * be_BWindow_Frame(BWindow *self);
	BRect Frame() {
		return new BRect(be_BWindow_Frame(_InstPtr()), true);
	}

	// BRect * be_BWindow_DecoratorFrame(BWindow *self);
	BRect DecoratorFrame() {
		return new BRect(be_BWindow_DecoratorFrame(_InstPtr()), true);
	}

	// BSize * be_BWindow_Size(BWindow *self);
	BSize Size() {
		return new BSize(be_BWindow_Size(_InstPtr()), true);
	}

	// const char* be_BWindow_Title(BWindow *self);
	char [] Title() {
		return fromStringz(be_BWindow_Title(_InstPtr())).dup;
	}

	// void be_BWindow_SetTitle(BWindow *self, const char* title);
	void SetTitle(char [] title) {
		be_BWindow_SetTitle(_InstPtr(), toStringz(title));
	}

	// bool be_BWindow_IsFront(BWindow *self);
	bool IsFront() {
		return be_BWindow_IsFront(_InstPtr());
	}

	// bool be_BWindow_IsActive(BWindow *self);
	bool IsActive() {
		return be_BWindow_IsActive(_InstPtr());
	}
/*
	// void be_BWindow_SetKeyMenuBar(BWindow *self, BMenuBar* bar);
	void SetKeyMenuBar() {
		be_BWindow_SetKeyMenuBar(_InstPtr());
	}

	// BMenuBar* be_BWindow_KeyMenuBar(BWindow *self);
	BMenuBar* KeyMenuBar() {
		return be_BWindow_KeyMenuBar(_InstPtr());
	}
*/
	// void be_BWindow_SetSizeLimits(BWindow *self, float minWidth, float maxWidth, float minHeight, float maxHeight);
	void SetSizeLimits(float minWidth, float maxWidth, float minHeight, float maxHeight) {
		be_BWindow_SetSizeLimits(_InstPtr(), minWidth, maxWidth, minHeight, maxHeight);
	}

	// void be_BWindow_GetSizeLimits(BWindow *self, float* minWidth, float* maxWidth, float* minHeight, float* maxHeight);
	void GetSizeLimits(inout float minWidth, inout float maxWidth, inout float minHeight, inout float maxHeight) {
		be_BWindow_GetSizeLimits(_InstPtr(), &minWidth, &maxWidth, &minHeight, &maxHeight);
	}

	// status_t be_BWindow_SetDecoratorSettings(BWindow *self, const BMessage& settings);
	status_t SetDecoratorSettings(BMessage settings) {
		return be_BWindow_SetDecoratorSettings(_InstPtr(), settings._InstPtr);
	}

	// status_t be_BWindow_GetDecoratorSettings(BWindow *self, BMessage* settings);
	status_t GetDecoratorSettings(BMessage settings) {
		return be_BWindow_GetDecoratorSettings(_InstPtr(), settings._InstPtr);
	}

	// uint32 be_BWindow_Workspaces(BWindow *self);
	uint32 Workspaces() {
		return be_BWindow_Workspaces(_InstPtr());
	}

	// void be_BWindow_SetWorkspaces(BWindow *self, uint32 workspace);
	void SetWorkspaces(uint32 workspace) {
		be_BWindow_SetWorkspaces(_InstPtr(), workspace);
	}

	// BView* be_BWindow_LastMouseMovedView(BWindow *self);
	BView LastMouseMovedView() {
		return new BView(be_BWindow_LastMouseMovedView(_InstPtr()), false);
	}

	// BHandler* be_BWindow_ResolveSpecifier(BWindow *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	BHandler ResolveSpecifier(BMessage message, int32 index, BMessage specifier, int32 form, char [] property) {
		return new BHandler(be_BWindow_ResolveSpecifier(_InstPtr(), message._InstPtr, index, specifier._InstPtr, form, toStringz(property)), false);
	}

	// status_t be_BWindow_GetSupportedSuites(BWindow *self, BMessage* data);
	status_t GetSupportedSuites(BMessage data) {
		return be_BWindow_GetSupportedSuites(_InstPtr(), data._InstPtr);
	}

	// status_t be_BWindow_AddToSubset(BWindow *self, BWindow* window);
	status_t AddToSubset(BWindow window) {
		return be_BWindow_AddToSubset(_InstPtr(), window._InstPtr);
	}

	// status_t be_BWindow_RemoveFromSubset(BWindow *self, BWindow* window);
	status_t RemoveFromSubset(BWindow window) {
		return be_BWindow_RemoveFromSubset(_InstPtr(), window._InstPtr);
	}

	// status_t be_BWindow_Perform(BWindow *self, perform_code code, void* data);
	status_t Perform(perform_code code, void *data) {
		return be_BWindow_Perform(_InstPtr(), code, data);
	}

	// status_t be_BWindow_SetType(BWindow *self, window_type type);
	status_t SetType(window_type type) {
		return be_BWindow_SetType(_InstPtr(), type);
	}

	// window_type be_BWindow_Type(BWindow *self);
	window_type Type() {
		return be_BWindow_Type(_InstPtr());
	}

	// status_t be_BWindow_SetLook(BWindow *self, window_look look);
	status_t SetLook(window_look look) {
		return be_BWindow_SetLook(_InstPtr(), look);
	}

	// window_look be_BWindow_Look(BWindow *self);
	window_look Look() {
		return be_BWindow_Look(_InstPtr());
	}

	// status_t be_BWindow_SetFeel(BWindow *self, window_feel feel);
	status_t SetFeel(window_feel feel) {
		return be_BWindow_SetFeel(_InstPtr(), feel);
	}

	// window_feel be_BWindow_Feel(BWindow *self);
	window_feel Feel() {
		return be_BWindow_Feel(_InstPtr());
	}

	// status_t be_BWindow_SetFlags(BWindow *self, uint32 flags);
	status_t SetFlags(uint32 flags) {
		return be_BWindow_SetFlags(_InstPtr(), flags);
	}

	// uint32 be_BWindow_Flags(BWindow *self);
	uint32 Flags() {
		return be_BWindow_Flags(_InstPtr());
	}

	// bool be_BWindow_IsModal(BWindow *self);
	bool IsModal() {
		return be_BWindow_IsModal(_InstPtr());
	}

	// bool be_BWindow_IsFloating(BWindow *self);
	bool IsFloating() {
		return be_BWindow_IsFloating(_InstPtr());
	}

	// status_t be_BWindow_SetWindowAlignment(BWindow *self, window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset);
	status_t SetWindowAlignment(window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset) {
		return be_BWindow_SetWindowAlignment(_InstPtr(), mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
	}

	// status_t be_BWindow_GetWindowAlignment(BWindow *self, window_alignment* mode, int32* h, int32* hOffset, int32* width, int32* widthOffset, int32* v, int32* vOffset, int32* height, int32* heightOffset);
	status_t GetWindowAlignment(inout window_alignment mode, inout int32 h, inout int32 hOffset, inout int32 width, inout int32 widthOffset, inout int32 v, inout int32 vOffset, inout int32 height, inout int32 heightOffset) {
		return be_BWindow_GetWindowAlignment(_InstPtr(), &mode, &h, &hOffset, &width, &widthOffset, &v, &vOffset, &height, &heightOffset);
	}

	// bool be_BWindow_QuitRequested(BWindow *self);
	bool QuitRequested() {
		return be_BWindow_QuitRequested(_InstPtr());
	}

	// thread_id be_BWindow_Run(BWindow *self);
	thread_id Run() {
		return be_BWindow_Run(_InstPtr());
	}
/*
	// void be_BWindow_SetLayout(BWindow *self, BLayout* layout);
	void SetLayout() {
		be_BWindow_SetLayout(_InstPtr());
	}

	// BLayout* be_BWindow_GetLayout(BWindow *self);
	BLayout* GetLayout() {
		return be_BWindow_GetLayout(_InstPtr());
	}

	// void be_BWindow_InvalidateLayout(BWindow *self, bool descendants);
	void InvalidateLayout() {
		be_BWindow_InvalidateLayout(_InstPtr());
	}
*/
	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


