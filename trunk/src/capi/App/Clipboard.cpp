/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Clipboard.h>

extern "C" {
	BClipboard* be_BClipboard_ctor(void *bindInstPtr, const char* name, bool transient)
	{
		return new BClipboard(name, transient);
	}

	void be_BClipboard_dtor(BClipboard* self)
	{
		delete self;
	}

	const char* be_BClipboard_Name(BClipboard *self)
	{
		return self->Name();
	}

	uint32 be_BClipboard_LocalCount(BClipboard *self)
	{
		return self->LocalCount();
	}

	uint32 be_BClipboard_SystemCount(BClipboard *self)
	{
		return self->SystemCount();
	}

	status_t be_BClipboard_StartWatching(BClipboard *self, BMessenger *target)
	{
		return self->StartWatching(*target);
	}

	status_t be_BClipboard_StopWatching(BClipboard *self, BMessenger *target)
	{
		return self->StopWatching(*target);
	}

	bool be_BClipboard_Lock(BClipboard *self)
	{
		return self->Lock();
	}

	void be_BClipboard_Unlock(BClipboard *self)
	{
		self->Unlock();
	}

	bool be_BClipboard_IsLocked(BClipboard *self)
	{
		return self->IsLocked();
	}

	status_t be_BClipboard_Clear(BClipboard *self)
	{
		return self->Clear();
	}

	status_t be_BClipboard_Commit(BClipboard *self)
	{
		return self->Commit();
	}

	status_t be_BClipboard_Commit_1(BClipboard *self, bool failIfChanged)
	{
		return self->Commit(failIfChanged);
	}

	status_t be_BClipboard_Revert(BClipboard *self)
	{
		return self->Revert();
	}

	BMessenger * be_BClipboard_DataSource(BClipboard *self)
	{
		return new BMessenger(self->DataSource());
	}

	BMessage* be_BClipboard_Data(BClipboard *self)
	{
		return self->Data();
	}

}


