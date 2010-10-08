/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Interface/Window.h"
#include "Interface/View.h"

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
	BWindow * be_BWindow_ctor(void *bindInstPtr, BMessage* archive)
	{
		return (BWindow *)new BWindowProxy(bindInstPtr, archive);
	}

	BWindow * be_BWindow_ctor_1(void *bindInstPtr, BRect *frame, const char* title, window_type type, uint32 flags, uint32 workspace)
	{
		return  (BWindow *)new BWindowProxy(bindInstPtr, *frame, title, type, flags, workspace);
	}

	BWindow * be_BWindow_ctor_2(void *bindInstPtr, BRect *frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace)
	{
		return  (BWindow *)new BWindowProxy(bindInstPtr, *frame, title, look, feel, flags, workspace);
	}

	void be_BWindow_dtor(BWindow* self)
	{
		delete self;
	}

	BArchivable * be_BWindow_Instantiate_static(BMessage* archive)
	{
		return BWindow::Instantiate(archive);
	}

	status_t be_BWindow_Archive(BWindow *self, BMessage* archive, bool deep)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			return proxy->Archive_super(archive, deep);
		else
			return self->Archive(archive, deep);
	}

	void be_BWindow_Quit(BWindow *self)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->Quit_super();
		else
			self->Quit();
	}

	void be_BWindow_Close(BWindow *self)
	{
		self->Close();
	}

	void be_BWindow_AddChild(BWindow *self, BView* child, BView* before)
	{
		self->AddChild(child, before);
	}

	void be_BWindow_AddChild_1(BWindow *self, BLayoutItem* child)
	{
		self->AddChild(child);
	}

	bool be_BWindow_RemoveChild(BWindow *self, BViewProxy* child)
	{
		return self->RemoveChild(child);
	}

	int32 be_BWindow_CountChildren(BWindow *self)
	{
		return self->CountChildren();
	}

	BView* be_BWindow_ChildAt(BWindow *self, int32 index)
	{
		return self->ChildAt(index);
	}

	void be_BWindow_DispatchMessage(BWindow *self, BMessage* message, BHandler* handler)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->DispatchMessage_super(message, handler);
		else
			self->DispatchMessage(message, handler);
	}

	void be_BWindow_MessageReceived(BWindow *self, BMessage* message)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->MessageReceived_super(message);
		else
			self->MessageReceived(message);
	}

	void be_BWindow_FrameMoved(BWindow *self, BPoint *newPosition)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->FrameMoved_super(*newPosition);
		else
			self->FrameMoved(*newPosition);
	}

	void be_BWindow_WorkspacesChanged(BWindow *self, uint32 oldWorkspaces, uint32 newWorkspaces)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->WorkspacesChanged_super(oldWorkspaces, newWorkspaces);
		else
			self->WorkspacesChanged(oldWorkspaces, newWorkspaces);
	}

	void be_BWindow_WorkspaceActivated(BWindow *self, int32 workspace, bool state)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->WorkspaceActivated_super(workspace, state);
		else
			self->WorkspaceActivated(workspace, state);
	}

	void be_BWindow_FrameResized(BWindow *self, float newWidth, float newHeight)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->FrameResized_super(newWidth, newHeight);
		else
			self->FrameResized(newWidth, newHeight);
	}

	void be_BWindow_Minimize(BWindow *self, bool minimize)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->Minimize_super(minimize);
		else
			self->Minimize(minimize);
	}

	void be_BWindow_Zoom(BWindow *self, BPoint *origin, float width, float height)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->Zoom_super(*origin, width, height);
		else
			self->Zoom(*origin, width, height);
	}

	void be_BWindow_Zoom_1(BWindow *self)
	{
		self->Zoom();
	}

	void be_BWindow_SetZoomLimits(BWindow *self, float maxWidth, float maxHeight)
	{
		self->SetZoomLimits(maxWidth, maxHeight);
	}

	void be_BWindow_ScreenChanged(BWindow *self, BRect *screenSize, color_space format)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->ScreenChanged_super(*screenSize, format);
		else
			self->ScreenChanged(*screenSize, format);
	}

	void be_BWindow_SetPulseRate(BWindow *self, bigtime_t rate)
	{
		self->SetPulseRate(rate);
	}

	bigtime_t be_BWindow_PulseRate(BWindow *self)
	{
		return self->PulseRate();
	}

	void be_BWindow_AddShortcut(BWindow *self, uint32 key, uint32 modifiers, BMessage* message)
	{
		self->AddShortcut(key, modifiers, message);
	}

	void be_BWindow_AddShortcut_1(BWindow *self, uint32 key, uint32 modifiers, BMessage* message, BHandler* target)
	{
		self->AddShortcut(key, modifiers, message, target);
	}

	void be_BWindow_RemoveShortcut(BWindow *self, uint32 key, uint32 modifiers)
	{
		self->RemoveShortcut(key, modifiers);
	}

	void be_BWindow_SetDefaultButton(BWindow *self, BButton* button)
	{
		self->SetDefaultButton(button);
	}

	BButton* be_BWindow_DefaultButton(BWindow *self)
	{
		return self->DefaultButton();
	}

	void be_BWindow_MenusBeginning(BWindow *self)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->MenusBeginning_super();
		else
			self->MenusBeginning();
	}

	void be_BWindow_MenusEnded(BWindow *self)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->MenusEnded_super();
		else
			self->MenusEnded();
	}

	bool be_BWindow_NeedsUpdate(BWindow *self)
	{
		return self->NeedsUpdate();
	}

	void be_BWindow_UpdateIfNeeded(BWindow *self)
	{
		self->UpdateIfNeeded();
	}

	BView * be_BWindow_FindView(BWindow *self, const char* viewName)
	{
		return self->FindView(viewName);
	}

	BView * be_BWindow_FindView_1(BWindow *self, BPoint *pt)
	{
		return self->FindView(*pt);
	}

	BView* be_BWindow_CurrentFocus(BWindow *self)
	{
		return self->CurrentFocus();
	}

	void be_BWindow_Activate(BWindow *self, bool state)
	{
		self->Activate(state);
	}

	void be_BWindow_WindowActivated(BWindow *self, bool state)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->WindowActivated_super(state);
		else
			self->WindowActivated(state);
	}

	void be_BWindow_ConvertToScreen(BWindow *self, BPoint* point)
	{
		self->ConvertToScreen(point);
	}

	BPoint * be_BWindow_ConvertToScreen_1(BWindow *self, BPoint *point)
	{
		return new BPoint(self->ConvertToScreen(*point));
	}

	void be_BWindow_ConvertFromScreen(BWindow *self, BPoint* point)
	{
		self->ConvertFromScreen(point);
	}

	BPoint * be_BWindow_ConvertFromScreen_1(BWindow *self, BPoint* point)
	{
		return new BPoint(self->ConvertFromScreen(*point));
	}

	void be_BWindow_ConvertToScreen_2(BWindow *self, BRect* rect)
	{
		self->ConvertToScreen(rect);
	}

	BRect * be_BWindow_ConvertToScreen_3(BWindow *self, BRect *rect)
	{
		return new BRect(self->ConvertToScreen(*rect));
	}

	void be_BWindow_ConvertFromScreen_2(BWindow *self, BRect* rect)
	{
		self->ConvertFromScreen(rect);
	}

	BRect * be_BWindow_ConvertFromScreen_3(BWindow *self, BRect *rect)
	{
		return new BRect(self->ConvertFromScreen(*rect));
	}

	void be_BWindow_MoveBy(BWindow *self, float dx, float dy)
	{
		self->MoveBy(dx, dy);
	}

	void be_BWindow_MoveTo(BWindow *self, BPoint *pt)
	{
		self->MoveTo(*pt);
	}

	void be_BWindow_MoveTo_1(BWindow *self, float x, float y)
	{
		self->MoveTo(x, y);
	}

	void be_BWindow_ResizeBy(BWindow *self, float dx, float dy)
	{
		self->ResizeBy(dx, dy);
	}

	void be_BWindow_ResizeTo(BWindow *self, float width, float height)
	{
		self->ResizeTo(width, height);
	}

	void be_BWindow_CenterIn(BWindow *self, const BRect* rect)
	{
		self->CenterIn(*rect);
	}

	void be_BWindow_CenterOnScreen(BWindow *self)
	{
		self->CenterOnScreen();
	}

	void be_BWindow_Show(BWindow *self)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->Show_super();
		else
			self->Show();
	}

	void be_BWindow_Hide(BWindow *self)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->Hide_super();
		else
			self->Hide();
	}

	bool be_BWindow_IsHidden(BWindow *self)
	{
		return self->IsHidden();
	}

	bool be_BWindow_IsMinimized(BWindow *self)
	{
		return self->IsMinimized();
	}

	void be_BWindow_Flush(BWindow *self)
	{
		self->Flush();
	}

	void be_BWindow_Sync(BWindow *self)
	{
		self->Sync();
	}

	status_t be_BWindow_SendBehind(BWindow *self, const BWindow* window)
	{
		return self->SendBehind(window);
	}

	void be_BWindow_DisableUpdates(BWindow *self)
	{
		self->DisableUpdates();
	}

	void be_BWindow_EnableUpdates(BWindow *self)
	{
		self->EnableUpdates();
	}

	void be_BWindow_BeginViewTransaction(BWindow *self)
	{
		self->BeginViewTransaction();
	}

	void be_BWindow_EndViewTransaction(BWindow *self)
	{
		self->EndViewTransaction();
	}

	void be_BWindow_InViewTransaction(BWindow *self)
	{
		self->InViewTransaction();
	}

	BRect * be_BWindow_Bounds(BWindow *self)
	{
		return new BRect(self->Bounds());
	}

	BRect * be_BWindow_Frame(BWindow *self)
	{
		return new BRect(self->Frame());
	}

	BRect * be_BWindow_DecoratorFrame(BWindow *self)
	{
		return new BRect(self->DecoratorFrame());
	}

	BSize * be_BWindow_Size(BWindow *self)
	{
		return new BSize(self->Size());
	}

	const char* be_BWindow_Title(BWindow *self)
	{
		return self->Title();
	}

	void be_BWindow_SetTitle(BWindow *self, const char* title)
	{
		self->SetTitle(title);
	}

	bool be_BWindow_IsFront(BWindow *self)
	{
		return self->IsFront();
	}

	bool be_BWindow_IsActive(BWindow *self)
	{
		return self->IsActive();
	}

	void be_BWindow_SetKeyMenuBar(BWindow *self, BMenuBar* bar)
	{
		self->SetKeyMenuBar(bar);
	}

	BMenuBar* be_BWindow_KeyMenuBar(BWindow *self)
	{
		return self->KeyMenuBar();
	}

	void be_BWindow_SetSizeLimits(BWindow *self, float minWidth, float maxWidth, float minHeight, float maxHeight)
	{
		self->SetSizeLimits(minWidth, maxWidth, minHeight, maxHeight);
	}

	void be_BWindow_GetSizeLimits(BWindow *self, float* minWidth, float* maxWidth, float* minHeight, float* maxHeight)
	{
		self->GetSizeLimits(minWidth, maxWidth, minHeight, maxHeight);
	}

	status_t be_BWindow_SetDecoratorSettings(BWindow *self, const BMessage* settings)
	{
		return self->SetDecoratorSettings(*settings);
	}

	status_t be_BWindow_GetDecoratorSettings(BWindow *self, BMessage* settings)
	{
		return self->GetDecoratorSettings(settings);
	}

	uint32 be_BWindow_Workspaces(BWindow *self)
	{
		return self->Workspaces();
	}

	void be_BWindow_SetWorkspaces(BWindow *self, uint32 workspace)
	{
		self->SetWorkspaces(workspace);
	}

	BView* be_BWindow_LastMouseMovedView(BWindow *self)
	{
		return self->LastMouseMovedView();
	}

	BHandler* be_BWindow_ResolveSpecifier(BWindow *self, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			return proxy->ResolveSpecifier_super(message, index, specifier, form, property);
		else
			return self->ResolveSpecifier(message, index, specifier, form, property);
	}

	status_t be_BWindow_GetSupportedSuites(BWindow *self, BMessage* data)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			return proxy->GetSupportedSuites_super(data);
		else
			return self->GetSupportedSuites(data);
	}

	status_t be_BWindow_AddToSubset(BWindow *self, BWindow* window)
	{
		return self->AddToSubset(window);
	}

	status_t be_BWindow_RemoveFromSubset(BWindow *self, BWindow* window)
	{
		return self->RemoveFromSubset(window);
	}

	status_t be_BWindow_Perform(BWindow *self, perform_code code, void* data)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			return proxy->Perform_super(code, data);
		else
			return self->Perform(code, data);
	}

	status_t be_BWindow_SetType(BWindow *self, window_type type)
	{
		return self->SetType(type);
	}

	window_type be_BWindow_Type(BWindow *self)
	{
		return self->Type();
	}

	status_t be_BWindow_SetLook(BWindow *self, window_look look)
	{
		return self->SetLook(look);
	}

	window_look be_BWindow_Look(BWindow *self)
	{
		return self->Look();
	}

	status_t be_BWindow_SetFeel(BWindow *self, window_feel feel)
	{
		return self->SetFeel(feel);
	}

	window_feel be_BWindow_Feel(BWindow *self)
	{
		return self->Feel();
	}

	status_t be_BWindow_SetFlags(BWindow *self, uint32 flags)
	{
		return self->SetFlags(flags);
	}

	uint32 be_BWindow_Flags(BWindow *self)
	{
		return self->Flags();
	}

	bool be_BWindow_IsModal(BWindow *self)
	{
		return self->IsModal();
	}

	bool be_BWindow_IsFloating(BWindow *self)
	{
		return self->IsFloating();
	}

	status_t be_BWindow_SetWindowAlignment(BWindow *self, window_alignment mode, int32 h, int32 hOffset, int32 width, int32 widthOffset, int32 v, int32 vOffset, int32 height, int32 heightOffset)
	{
		return self->SetWindowAlignment(mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
	}

	status_t be_BWindow_GetWindowAlignment(BWindow *self, window_alignment* mode, int32* h, int32* hOffset, int32* width, int32* widthOffset, int32* v, int32* vOffset, int32* height, int32* heightOffset)
	{
		return self->GetWindowAlignment(mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
	}

	bool be_BWindow_QuitRequested(BWindow *self)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			return proxy->QuitRequested_super();
		else
			return self->QuitRequested();
	}

	thread_id be_BWindow_Run(BWindow *self)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			return proxy->Run_super();
		else
			return self->Run();
	}

	void be_BWindow_SetLayout(BWindow *self, BLayout* layout)
	{
		BWindowProxy *proxy = dynamic_cast<BWindowProxy *>(self);
		if(proxy)
			proxy->SetLayout_super(layout);
		else
			self->SetLayout(layout);
	}

	BLayout* be_BWindow_GetLayout(BWindow *self)
	{
		return self->GetLayout();
	}

	void be_BWindow_InvalidateLayout(BWindow *self, bool descendants)
	{
		self->InvalidateLayout(descendants);
	}

}


