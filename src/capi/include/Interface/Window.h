/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#ifndef HABID_BWindow_
#define HABID_BWindow_

#include <Window.h>
#include "App/Looper.h"

class BWindowBridge
: public BWindow
{
public:
	BWindowBridge(BMessage* archive);
	BWindowBridge(BRect frame, const char* title, window_type type, uint32 flags, uint32 workspace);
	BWindowBridge(BRect frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace);
	~BWindowBridge();

};


class BWindowProxy
: public  BLooperProxy, public BWindowBridge
{
	void *fBindInstPtr;
public:
	BWindowProxy(void *bindInstPtr, BMessage* archive);
	BWindowProxy(void *bindInstPtr, BRect frame, const char* title, window_type type, uint32 flags, uint32 workspace);
	BWindowProxy(void *bindInstPtr, BRect frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspace);
	~BWindowProxy();

	virtual status_t Archive(BMessage* archive, bool deep) const;
	virtual status_t Archive_super(BMessage* archive, bool deep) const;
	virtual void Quit() ;
	virtual void Quit_super() ;
	virtual void DispatchMessage(BMessage* message, BHandler* handler) ;
	virtual void DispatchMessage_super(BMessage* message, BHandler* handler) ;
	virtual void MessageReceived(BMessage* message) ;
	virtual void MessageReceived_super(BMessage* message) ;
	virtual void FrameMoved(BPoint newPosition) ;
	virtual void FrameMoved_super(BPoint newPosition) ;
	virtual void WorkspacesChanged(uint32 oldWorkspaces, uint32 newWorkspaces) ;
	virtual void WorkspacesChanged_super(uint32 oldWorkspaces, uint32 newWorkspaces) ;
	virtual void WorkspaceActivated(int32 workspace, bool state) ;
	virtual void WorkspaceActivated_super(int32 workspace, bool state) ;
	virtual void FrameResized(float newWidth, float newHeight) ;
	virtual void FrameResized_super(float newWidth, float newHeight) ;
	virtual void Minimize(bool minimize) ;
	virtual void Minimize_super(bool minimize) ;
	virtual void Zoom(BPoint origin, float width, float height) ;
	virtual void Zoom_super(BPoint origin, float width, float height) ;
	virtual void ScreenChanged(BRect screenSize, color_space format) ;
	virtual void ScreenChanged_super(BRect screenSize, color_space format) ;
	virtual void MenusBeginning() ;
	virtual void MenusBeginning_super() ;
	virtual void MenusEnded() ;
	virtual void MenusEnded_super() ;
	virtual void WindowActivated(bool state) ;
	virtual void WindowActivated_super(bool state) ;
	virtual void Show() ;
	virtual void Show_super() ;
	virtual void Hide() ;
	virtual void Hide_super() ;
	virtual BHandler* ResolveSpecifier(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual BHandler* ResolveSpecifier_super(BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property) ;
	virtual status_t GetSupportedSuites(BMessage* data) ;
	virtual status_t GetSupportedSuites_super(BMessage* data) ;
	virtual status_t Perform(perform_code code, void* data) ;
	virtual status_t Perform_super(perform_code code, void* data) ;
	virtual bool QuitRequested() ;
	virtual bool QuitRequested_super() ;
	virtual thread_id Run() ;
	virtual thread_id Run_super() ;
	virtual void SetLayout(BLayout* layout) ;
	virtual void SetLayout_super(BLayout* layout) ;
};


/* BWindow */
extern "C" {
	status_t bind_BWindow_Archive(void *bindInstPtr, BMessage* archive, bool deep);
	void bind_BWindow_Quit(void *bindInstPtr);
	void bind_BWindow_DispatchMessage(void *bindInstPtr, BMessage* message, BHandler* handler);
	void bind_BWindow_MessageReceived(void *bindInstPtr, BMessage* message);
	void bind_BWindow_FrameMoved(void *bindInstPtr, BPoint *newPosition);
	void bind_BWindow_WorkspacesChanged(void *bindInstPtr, uint32 oldWorkspaces, uint32 newWorkspaces);
	void bind_BWindow_WorkspaceActivated(void *bindInstPtr, int32 workspace, bool state);
	void bind_BWindow_FrameResized(void *bindInstPtr, float newWidth, float newHeight);
	void bind_BWindow_Minimize(void *bindInstPtr, bool minimize);
	void bind_BWindow_Zoom(void *bindInstPtr, BPoint *origin, float width, float height);
	void bind_BWindow_ScreenChanged(void *bindInstPtr, BRect *screenSize, color_space format);
	void bind_BWindow_MenusBeginning(void *bindInstPtr);
	void bind_BWindow_MenusEnded(void *bindInstPtr);
	void bind_BWindow_WindowActivated(void *bindInstPtr, bool state);
	void bind_BWindow_Show(void *bindInstPtr);
	void bind_BWindow_Hide(void *bindInstPtr);
	BHandler* bind_BWindow_ResolveSpecifier(void *bindInstPtr, BMessage* message, int32 index, BMessage* specifier, int32 form, const char* property);
	status_t bind_BWindow_GetSupportedSuites(void *bindInstPtr, BMessage* data);
	status_t bind_BWindow_Perform(void *bindInstPtr, perform_code code, void* data);
	bool bind_BWindow_QuitRequested(void *bindInstPtr);
	thread_id bind_BWindow_Run(void *bindInstPtr);
	void bind_BWindow_SetLayout(void *bindInstPtr, BLayout* layout);
}

#endif // HABID_BWindow_

