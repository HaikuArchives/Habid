/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Interface/Window.h"

BWindowBridge::BWindowBridge(BMessage* archive)
: BWindow(archive)
{
}
BWindowBridge::BWindowBridge(BRect frame, const char* title, window_type type, uint32 flags, uint32 workspace)
: BWindow(frame, title, type, flags, workspace)
{
}
BWindowBridge::BWindowBridge(BRect frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace)
: BWindow(frame, title, look, feel, flags, workspace)
{
}
BWindowBridge::~BWindowBridge() { }

BWindowProxy::BWindowProxy(void *bindInstPtr, BMessage* archive)
: fBindInstPtr(bindInstPtr), BLooperProxy(bindInstPtr, archive), BWindowBridge(archive) { }

BWindowProxy::BWindowProxy(void *bindInstPtr, BRect frame, const char* title, window_type type, uint32 flags, uint32 workspace)
: fBindInstPtr(bindInstPtr), BLooperProxy(bindInstPtr, title, B_DISPLAY_PRIORITY, B_LOOPER_PORT_DEFAULT_CAPACITY), BWindowBridge(frame, title, type, flags, workspace) { }

BWindowProxy::BWindowProxy(void *bindInstPtr, BRect frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace)
: fBindInstPtr(bindInstPtr), BLooperProxy(bindInstPtr, title, B_DISPLAY_PRIORITY, B_LOOPER_PORT_DEFAULT_CAPACITY), BWindowBridge(frame, title, look, feel, flags, workspace) { }

BWindowProxy::~BWindowProxy() { }

status_t BWindowProxy::Archive(BMessage* archive, bool deep) const
{
	return bind_BWindow_Archive(fBindInstPtr, archive, deep);
}

status_t BWindowProxy::Archive_super(BMessage* archive, bool deep) const
{
	return BWindow::Archive(archive, deep);
}

void BWindowProxy::Quit() 
{
	 bind_BWindow_Quit(fBindInstPtr);
}

void BWindowProxy::Quit_super() 
{
	 BWindow::Quit();
}

void BWindowProxy::DispatchMessage(BMessage* message, BHandler* handler) 
{
	 bind_BWindow_DispatchMessage(fBindInstPtr, message, handler);
}

void BWindowProxy::DispatchMessage_super(BMessage* message, BHandler* handler) 
{
	 BWindow::DispatchMessage(message, handler);
}

void BWindowProxy::MessageReceived(BMessage* message) 
{
	 bind_BWindow_MessageReceived(fBindInstPtr, message);
}

void BWindowProxy::MessageReceived_super(BMessage* message) 
{
	 BWindow::MessageReceived(message);
}

void BWindowProxy::FrameMoved(BPoint newPosition) 
{
	 bind_BWindow_FrameMoved(fBindInstPtr, &newPosition);
}

void BWindowProxy::FrameMoved_super(BPoint newPosition) 
{
	 BWindow::FrameMoved(newPosition);
}

void BWindowProxy::WorkspacesChanged(uint32 oldWorkspaces, uint32 newWorkspaces) 
{
	 bind_BWindow_WorkspacesChanged(fBindInstPtr, oldWorkspaces, newWorkspaces);
}

void BWindowProxy::WorkspacesChanged_super(uint32 oldWorkspaces, uint32 newWorkspaces) 
{
	 BWindow::WorkspacesChanged(oldWorkspaces, newWorkspaces);
}

void BWindowProxy::WorkspaceActivated(int32 workspace, bool state) 
{
	 bind_BWindow_WorkspaceActivated(fBindInstPtr, workspace, state);
}

void BWindowProxy::WorkspaceActivated_super(int32 workspace, bool state) 
{
	 BWindow::WorkspaceActivated(workspace, state);
}

void BWindowProxy::FrameResized(float newWidth, float newHeight) 
{
	 bind_BWindow_FrameResized(fBindInstPtr, newWidth, newHeight);
}

void BWindowProxy::FrameResized_super(float newWidth, float newHeight) 
{
	 BWindow::FrameResized(newWidth, newHeight);
}

void BWindowProxy::Minimize(bool minimize) 
{
	 bind_BWindow_Minimize(fBindInstPtr, minimize);
}

void BWindowProxy::Minimize_super(bool minimize) 
{
	 BWindow::Minimize(minimize);
}

void BWindowProxy::Zoom(BPoint origin, float width, float height) 
{
	 bind_BWindow_Zoom(fBindInstPtr, &origin, width, height);
}

void BWindowProxy::Zoom_super(BPoint origin, float width, float height) 
{
	 BWindow::Zoom(origin, width, height);
}

void BWindowProxy::ScreenChanged(BRect screenSize, color_space format) 
{
	 bind_BWindow_ScreenChanged(fBindInstPtr, &screenSize, format);
}

void BWindowProxy::ScreenChanged_super(BRect screenSize, color_space format) 
{
	 BWindow::ScreenChanged(screenSize, format);
}

void BWindowProxy::MenusBeginning() 
{
	 bind_BWindow_MenusBeginning(fBindInstPtr);
}

void BWindowProxy::MenusBeginning_super() 
{
	 BWindow::MenusBeginning();
}

void BWindowProxy::MenusEnded() 
{
	 bind_BWindow_MenusEnded(fBindInstPtr);
}

void BWindowProxy::MenusEnded_super() 
{
	 BWindow::MenusEnded();
}

void BWindowProxy::WindowActivated(bool state) 
{
	 bind_BWindow_WindowActivated(fBindInstPtr, state);
}

void BWindowProxy::WindowActivated_super(bool state) 
{
	 BWindow::WindowActivated(state);
}

void BWindowProxy::Show() 
{
	 bind_BWindow_Show(fBindInstPtr);
}

void BWindowProxy::Show_super() 
{
	 BWindow::Show();
}

void BWindowProxy::Hide() 
{
	 bind_BWindow_Hide(fBindInstPtr);
}

void BWindowProxy::Hide_super() 
{
	 BWindow::Hide();
}

BHandler* BWindowProxy::ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return bind_BWindow_ResolveSpecifier(fBindInstPtr, message, index, specifier, form, property);
}

BHandler* BWindowProxy::ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) 
{
	return BWindow::ResolveSpecifier(message, index, specifier, form, property);
}

status_t BWindowProxy::GetSupportedSuites(BMessage* data) 
{
	return bind_BWindow_GetSupportedSuites(fBindInstPtr, data);
}

status_t BWindowProxy::GetSupportedSuites_super(BMessage* data) 
{
	return BWindow::GetSupportedSuites(data);
}

status_t BWindowProxy::Perform(perform_code code, void* data) 
{
	return bind_BWindow_Perform(fBindInstPtr, code, data);
}

status_t BWindowProxy::Perform_super(perform_code code, void* data) 
{
	return BWindow::Perform(code, data);
}

bool BWindowProxy::QuitRequested() 
{
	return bind_BWindow_QuitRequested(fBindInstPtr);
}

bool BWindowProxy::QuitRequested_super() 
{
	return BWindow::QuitRequested();
}

thread_id BWindowProxy::Run() 
{
	return bind_BWindow_Run(fBindInstPtr);
}

thread_id BWindowProxy::Run_super() 
{
	return BWindow::Run();
}

void BWindowProxy::SetLayout(BLayout* layout) 
{
	 bind_BWindow_SetLayout(fBindInstPtr, layout);
}

void BWindowProxy::SetLayout_super(BLayout* layout) 
{
	 BWindow::SetLayout(layout);
}


extern "C" {
	BWindowProxy * be_BWindow_ctor(void *bindInstPtr, BMessage* archive)
	{
		return new BWindowProxy(bindInstPtr, archive);
	}

	BWindowProxy * be_BWindow_ctor_1(void *bindInstPtr, BRect *frame, const char* title, window_type type, uint32 flags, uint32 workspace)
	{
		return new BWindowProxy(bindInstPtr, *frame, title, type, flags, workspace);
	}

	BWindowProxy * be_BWindow_ctor_2(void *bindInstPtr, BRect *frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace)
	{
		return new BWindowProxy(bindInstPtr, *frame, title, look, feel, flags, workspace);
	}

	void be_BWindow_dtor(BWindow* self)
	{
		delete self;
	}

	BArchivable * be_BWindow_Instantiate_static(BMessage* archive)
	{
		return BWindow::Instantiate(archive);
	}

	status_t be_BWindow_Archive(BWindowProxy *self, BMessage* archive, bool deep)
	{
		return self->Archive_super(archive, deep);
	}

	void be_BWindow_Quit(BWindowProxy *self)
	{
		self->Quit_super();
	}

	void be_BWindow_Close(BWindowProxy *self)
	{
		self->Close();
	}

	void be_BWindow_AddChild(BWindowProxy *self, BView* child, BView* before)
	{
		self->AddChild(child, before);
	}

	void be_BWindow_AddChild_1(BWindowProxy *self, BLayoutItem* child)
	{
		self->AddChild(child);
	}

	bool be_BWindow_RemoveChild(BWindowProxy *self, BView* child)
	{
		return self->RemoveChild(child);
	}

	int32 be_BWindow_CountChildren(BWindowProxy *self)
	{
		return self->CountChildren();
	}

	BView* be_BWindow_ChildAt(BWindowProxy *self, int32 index)
	{
		return self->ChildAt(index);
	}

	void be_BWindow_DispatchMessage(BWindowProxy *self, BMessage* message, BHandler* handler)
	{
		self->DispatchMessage_super(message, handler);
	}

	void be_BWindow_MessageReceived(BWindowProxy *self, BMessage* message)
	{
		self->MessageReceived_super(message);
	}

	void be_BWindow_FrameMoved(BWindowProxy *self, BPoint *newPosition)
	{
		self->FrameMoved_super(*newPosition);
	}

	void be_BWindow_WorkspacesChanged(BWindowProxy *self, uint32 oldWorkspaces, uint32 newWorkspaces)
	{
		self->WorkspacesChanged_super(oldWorkspaces, newWorkspaces);
	}

	void be_BWindow_WorkspaceActivated(BWindowProxy *self, int32 workspace, bool state)
	{
		self->WorkspaceActivated_super(workspace, state);
	}

	void be_BWindow_FrameResized(BWindowProxy *self, float newWidth, float newHeight)
	{
		self->FrameResized_super(newWidth, newHeight);
	}

	void be_BWindow_Minimize(BWindowProxy *self, bool minimize)
	{
		self->Minimize_super(minimize);
	}

	void be_BWindow_Zoom(BWindowProxy *self, BPoint *origin, float width, float height)
	{
		self->Zoom_super(*origin, width, height);
	}

	void be_BWindow_Zoom_1(BWindow *self)
	{
		self->Zoom();
	}

	void be_BWindow_SetZoomLimits(BWindowProxy *self, float maxWidth, float maxHeight)
	{
		self->SetZoomLimits(maxWidth, maxHeight);
	}

	void be_BWindow_ScreenChanged(BWindowProxy *self, BRect *screenSize, color_space format)
	{
		self->ScreenChanged_super(*screenSize, format);
	}

	void be_BWindow_SetPulseRate(BWindowProxy *self, bigtime_t rate)
	{
		self->SetPulseRate(rate);
	}

	bigtime_t be_BWindow_PulseRate(BWindowProxy *self)
	{
		return self->PulseRate();
	}

	void be_BWindow_AddShortcut(BWindowProxy *self, uint32 key, uint32 modifiers, BMessage* message)
	{
		self->AddShortcut(key, modifiers, message);
	}

	void be_BWindow_AddShortcut_1(BWindowProxy *self, uint32 key, uint32 modifiers, BMessage* message, BHandler* target)
	{
		self->AddShortcut(key, modifiers, message, target);
	}

	void be_BWindow_RemoveShortcut(BWindowProxy *self, uint32 key, uint32 modifiers)
	{
		self->RemoveShortcut(key, modifiers);
	}

	void be_BWindow_SetDefaultButton(BWindowProxy *self, BButton* button)
	{
		self->SetDefaultButton(button);
	}

	BButton* be_BWindow_DefaultButton(BWindowProxy *self)
	{
		return self->DefaultButton();
	}

	void be_BWindow_MenusBeginning(BWindowProxy *self)
	{
		self->MenusBeginning_super();
	}

	void be_BWindow_MenusEnded(BWindowProxy *self)
	{
		self->MenusEnded_super();
	}

	bool be_BWindow_NeedsUpdate(BWindowProxy *self)
	{
		return self->NeedsUpdate();
	}

	void be_BWindow_UpdateIfNeeded(BWindowProxy *self)
	{
		self->UpdateIfNeeded();
	}

	BView* be_BWindow_FindView(BWindowProxy *self, const char* viewName)
	{
		return self->FindView(viewName);
	}

	BView* be_BWindow_FindView_1(BWindowProxy *self, BPoint *pt)
	{
		return self->FindView(*pt);
	}

	BView* be_BWindow_CurrentFocus(BWindowProxy *self)
	{
		return self->CurrentFocus();
	}

	void be_BWindow_Activate(BWindowProxy *self, bool state)
	{
		self->Activate(state);
	}

	void be_BWindow_WindowActivated(BWindowProxy *self, bool state)
	{
		self->WindowActivated_super(state);
	}

	void be_BWindow_ConvertToScreen(BWindowProxy *self, BPoint* point)
	{
		self->ConvertToScreen(point);
	}

	BPoint * be_BWindow_ConvertToScreen_1(BWindowProxy *self, BPoint *point)
	{
		return new BPoint(self->ConvertToScreen(*point));
	}

	void be_BWindow_ConvertFromScreen(BWindowProxy *self, BPoint* point)
	{
		self->ConvertFromScreen(point);
	}

	BPoint * be_BWindow_ConvertFromScreen_1(BWindowProxy *self, BPoint* point)
	{
		return new BPoint(self->ConvertFromScreen(*point));
	}

	void be_BWindow_ConvertToScreen_2(BWindowProxy *self, BRect* rect)
	{
		self->ConvertToScreen(rect);
	}

	BRect * be_BWindow_ConvertToScreen_3(BWindowProxy *self, BRect *rect)
	{
		return new BRect(self->ConvertToScreen(*rect));
	}

	void be_BWindow_ConvertFromScreen_2(BWindowProxy *self, BRect* rect)
	{
		self->ConvertFromScreen(rect);
	}

	BRect * be_BWindow_ConvertFromScreen_3(BWindowProxy *self, BRect *rect)
	{
		return new BRect(self->ConvertFromScreen(*rect));
	}

	void be_BWindow_MoveBy(BWindowProxy *self, float dx, float dy)
	{
		self->MoveBy(dx, dy);
	}

	void be_BWindow_MoveTo(BWindowProxy *self, BPoint *pt)
	{
		self->MoveTo(*pt);
	}

	void be_BWindow_MoveTo_1(BWindowProxy *self, float x, float y)
	{
		self->MoveTo(x, y);
	}

	void be_BWindow_ResizeBy(BWindowProxy *self, float dx, float dy)
	{
		self->ResizeBy(dx, dy);
	}

	void be_BWindow_ResizeTo(BWindowProxy *self, float width, float height)
	{
		self->ResizeTo(width, height);
	}

	void be_BWindow_CenterIn(BWindowProxy *self, const BRect* rect)
	{
		self->CenterIn(*rect);
	}

	void be_BWindow_CenterOnScreen(BWindowProxy *self)
	{
		self->CenterOnScreen();
	}

	void be_BWindow_Show(BWindowProxy *self)
	{
		self->Show_super();
	}

	void be_BWindow_Hide(BWindowProxy *self)
	{
		self->Hide_super();
	}

	bool be_BWindow_IsHidden(BWindowProxy *self)
	{
		return self->IsHidden();
	}

	bool be_BWindow_IsMinimized(BWindowProxy *self)
	{
		return self->IsMinimized();
	}

	void be_BWindow_Flush(BWindowProxy *self)
	{
		self->Flush();
	}

	void be_BWindow_Sync(BWindowProxy *self)
	{
		self->Sync();
	}

	status_t be_BWindow_SendBehind(BWindowProxy *self, const BWindow* window)
	{
		return self->SendBehind(window);
	}

	void be_BWindow_DisableUpdates(BWindowProxy *self)
	{
		self->DisableUpdates();
	}

	void be_BWindow_EnableUpdates(BWindowProxy *self)
	{
		self->EnableUpdates();
	}

	void be_BWindow_BeginViewTransaction(BWindowProxy *self)
	{
		self->BeginViewTransaction();
	}

	void be_BWindow_EndViewTransaction(BWindowProxy *self)
	{
		self->EndViewTransaction();
	}

	void be_BWindow_InViewTransaction(BWindowProxy *self)
	{
		self->InViewTransaction();
	}

	BRect * be_BWindow_Bounds(BWindowProxy *self)
	{
		return new BRect(self->Bounds());
	}

	BRect * be_BWindow_Frame(BWindowProxy *self)
	{
		return new BRect(self->Frame());
	}

	BRect * be_BWindow_DecoratorFrame(BWindowProxy *self)
	{
		return new BRect(self->DecoratorFrame());
	}

	BSize * be_BWindow_Size(BWindowProxy *self)
	{
		return new BSize(self->Size());
	}

	const char* be_BWindow_Title(BWindowProxy *self)
	{
		return self->Title();
	}

	void be_BWindow_SetTitle(BWindowProxy *self, const char* title)
	{
		self->SetTitle(title);
	}

	bool be_BWindow_IsFront(BWindowProxy *self)
	{
		return self->IsFront();
	}

	bool be_BWindow_IsActive(BWindowProxy *self)
	{
		return self->IsActive();
	}

	void be_BWindow_SetKeyMenuBar(BWindowProxy *self, BMenuBar* bar)
	{
		self->SetKeyMenuBar(bar);
	}

	BMenuBar* be_BWindow_KeyMenuBar(BWindowProxy *self)
	{
		return self->KeyMenuBar();
	}

	void be_BWindow_SetSizeLimits(BWindowProxy *self, float minWidth, float maxWidth, float minHeight, float maxHeight)
	{
		self->SetSizeLimits(minWidth, maxWidth, minHeight, maxHeight);
	}

	void be_BWindow_GetSizeLimits(BWindowProxy *self, float* minWidth, float* maxWidth, float* minHeight, float* maxHeight)
	{
		self->GetSizeLimits(minWidth, maxWidth, minHeight, maxHeight);
	}

	status_t be_BWindow_SetDecoratorSettings(BWindowProxy *self, const BMessage* settings)
	{
		return self->SetDecoratorSettings(*settings);
	}

	status_t be_BWindow_GetDecoratorSettings(BWindowProxy *self, BMessage* settings)
	{
		return self->GetDecoratorSettings(settings);
	}

	uint32 be_BWindow_Workspaces(BWindowProxy *self)
	{
		return self->Workspaces();
	}

	void be_BWindow_SetWorkspaces(BWindowProxy *self, uint32 workspace)
	{
		self->SetWorkspaces(workspace);
	}

	BView* be_BWindow_LastMouseMovedView(BWindowProxy *self)
	{
		return self->LastMouseMovedView();
	}

	BHandler* be_BWindow_ResolveSpecifier(BWindowProxy *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property)
	{
		return self->ResolveSpecifier_super(message, index, specifier, form, property);
	}

	status_t be_BWindow_GetSupportedSuites(BWindowProxy *self, BMessage* data)
	{
		return self->GetSupportedSuites_super(data);
	}

	status_t be_BWindow_AddToSubset(BWindowProxy *self, BWindow* window)
	{
		return self->AddToSubset(window);
	}

	status_t be_BWindow_RemoveFromSubset(BWindowProxy *self, BWindow* window)
	{
		return self->RemoveFromSubset(window);
	}

	status_t be_BWindow_Perform(BWindowProxy *self, perform_code code, void* data)
	{
		return self->Perform_super(code, data);
	}

	status_t be_BWindow_SetType(BWindowProxy *self, window_type type)
	{
		return self->SetType(type);
	}

	window_type be_BWindow_Type(BWindowProxy *self)
	{
		return self->Type();
	}

	status_t be_BWindow_SetLook(BWindowProxy *self, window_look look)
	{
		return self->SetLook(look);
	}

	window_look be_BWindow_Look(BWindowProxy *self)
	{
		return self->Look();
	}

	status_t be_BWindow_SetFeel(BWindowProxy *self, window_feel feel)
	{
		return self->SetFeel(feel);
	}

	window_feel be_BWindow_Feel(BWindowProxy *self)
	{
		return self->Feel();
	}

	status_t be_BWindow_SetFlags(BWindow *self, uint32 flags)
	{
		return self->SetFlags(flags);
	}

	uint32 be_BWindow_Flags(BWindowProxy *self)
	{
		return self->Flags();
	}

	bool be_BWindow_IsModal(BWindowProxy *self)
	{
		return self->IsModal();
	}

	bool be_BWindow_IsFloating(BWindowProxy *self)
	{
		return self->IsFloating();
	}

	status_t be_BWindow_SetWindowAlignment(BWindowProxy *self, window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset)
	{
		return self->SetWindowAlignment(mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
	}

	status_t be_BWindow_GetWindowAlignment(BWindowProxy *self, window_alignment* mode, int32* h, int32* hOffset, int32* width, int32* widthOffset, int32* v, int32* vOffset, int32* height, int32* heightOffset)
	{
		return self->GetWindowAlignment(mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
	}

	bool be_BWindow_QuitRequested(BWindowProxy *self)
	{
		return self->QuitRequested_super();
	}

	thread_id be_BWindow_Run(BWindowProxy *self)
	{
		return self->Run_super();
	}

	void be_BWindow_SetLayout(BWindowProxy *self, BLayout* layout)
	{
		self->SetLayout_super(layout);
	}

	BLayout* be_BWindow_GetLayout(BWindowProxy *self)
	{
		return self->GetLayout();
	}

	void be_BWindow_InvalidateLayout(BWindowProxy *self, bool descendants)
	{
		self->InvalidateLayout(descendants);
	}

}


