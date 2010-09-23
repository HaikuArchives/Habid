/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <VolumeRoster.h>

extern "C" {
	BVolumeRoster* be_BVolumeRoster_ctor(void *bindInstPtr)
	{
		return new BVolumeRoster();
	}

	void be_BVolumeRoster_dtor(BVolumeRoster* self)
	{
		delete self;
	}

	status_t be_BVolumeRoster_GetNextVolume(BVolumeRoster *self, BVolume* volume)
	{
		return self->GetNextVolume(volume);
	}

	void be_BVolumeRoster_Rewind(BVolumeRoster *self)
	{
		self->Rewind();
	}

	status_t be_BVolumeRoster_GetBootVolume(BVolumeRoster *self, BVolume* volume)
	{
		return self->GetBootVolume(volume);
	}

	status_t be_BVolumeRoster_StartWatching(BVolumeRoster *self, BMessenger *messenger)
	{
		return self->StartWatching(*messenger);
	}

	void be_BVolumeRoster_StopWatching(BVolumeRoster *self)
	{
		self->StopWatching();
	}

	BMessenger * be_BVolumeRoster_Messenger(BVolumeRoster *self)
	{
		return new BMessenger(self->Messenger());
	}

}


