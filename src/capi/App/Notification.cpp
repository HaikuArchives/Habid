/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Notification.h>

extern "C" {
	BNotification* be_BNotification_ctor(void *bindInstPtr, notification_type type)
	{
		return new BNotification(type);
	}

	void be_BNotification_dtor(BNotification* self)
	{
		delete self;
	}

	notification_type be_BNotification_Type(BNotification *self)
	{
		return self->Type();
	}

	const char* be_BNotification_Application(BNotification *self)
	{
		return self->Application();
	}

	void be_BNotification_SetApplication(BNotification *self, const BString* app)
	{
		self->SetApplication(*app);
	}

	const char* be_BNotification_Title(BNotification *self)
	{
		return self->Title();
	}

	void be_BNotification_SetTitle(BNotification *self, const BString* title)
	{
		self->SetTitle(*title);
	}

	const char* be_BNotification_Content(BNotification *self)
	{
		return self->Content();
	}

	void be_BNotification_SetContent(BNotification *self, const BString* content)
	{
		self->SetContent(*content);
	}

	const char* be_BNotification_MessageID(BNotification *self)
	{
		return self->MessageID();
	}

	void be_BNotification_SetMessageID(BNotification *self, const BString* id)
	{
		self->SetMessageID(*id);
	}

	float be_BNotification_Progress(BNotification *self)
	{
		return self->Progress();
	}

	void be_BNotification_SetProgress(BNotification *self, float progress)
	{
		self->SetProgress(progress);
	}

	const char* be_BNotification_OnClickApp(BNotification *self)
	{
		return self->OnClickApp();
	}

	void be_BNotification_SetOnClickApp(BNotification *self, const BString* app)
	{
		self->SetOnClickApp(*app);
	}

	const entry_ref* be_BNotification_OnClickFile(BNotification *self)
	{
		return self->OnClickFile();
	}

	status_t be_BNotification_SetOnClickFile(BNotification *self, const entry_ref* file)
	{
		return self->SetOnClickFile(file);
	}

	status_t be_BNotification_AddOnClickRef(BNotification *self, const entry_ref* ref)
	{
		return self->AddOnClickRef(ref);
	}

	int32 be_BNotification_CountOnClickRefs(BNotification *self)
	{
		return self->CountOnClickRefs();
	}

	const entry_ref* be_BNotification_OnClickRefAt(BNotification *self, int32 index)
	{
		return self->OnClickRefAt(index);
	}

	status_t be_BNotification_AddOnClickArg(BNotification *self, const BString* arg)
	{
		return self->AddOnClickArg(*arg);
	}

	int32 be_BNotification_CountOnClickArgs(BNotification *self)
	{
		return self->CountOnClickArgs();
	}

	const char* be_BNotification_OnClickArgAt(BNotification *self, int32 index)
	{
		return self->OnClickArgAt(index);
	}

	const BBitmap* be_BNotification_Icon(BNotification *self)
	{
		return self->Icon();
	}

	status_t be_BNotification_SetIcon(BNotification *self, const BBitmap* icon)
	{
		return self->SetIcon(icon);
	}

}


