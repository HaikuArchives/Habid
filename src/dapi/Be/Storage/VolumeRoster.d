/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Storage.Volume;

extern (C) extern {
	// BVolumeRoster* be_BVolumeRoster_ctor(void *bindInstPtr);
	void * be_BVolumeRoster_ctor(void *bindInstPtr);

	// void be_BVolumeRoster_dtor(BVolumeRoster* self);
	void be_BVolumeRoster_dtor(void* self);

	// status_t be_BVolumeRoster_GetNextVolume(BVolumeRoster *self, BVolume* volume);
	status_t be_BVolumeRoster_GetNextVolume(void *self, void* volume);

	// void be_BVolumeRoster_Rewind(BVolumeRoster *self);
	void be_BVolumeRoster_Rewind(void *self);

	// status_t be_BVolumeRoster_GetBootVolume(BVolumeRoster *self, BVolume* volume);
	status_t be_BVolumeRoster_GetBootVolume(void *self, void* volume);

	// status_t be_BVolumeRoster_StartWatching(BVolumeRoster *self, BMessenger *messenger);
	status_t be_BVolumeRoster_StartWatching(void *self, void *messenger);

	// void be_BVolumeRoster_StopWatching(BVolumeRoster *self);
	void be_BVolumeRoster_StopWatching(void *self);

	// BMessenger * be_BVolumeRoster_Messenger(BVolumeRoster *self);
	void * be_BVolumeRoster_Messenger(void *self);

}


extern (C) {
}


interface IBVolumeRoster
{
	// status_t be_BVolumeRoster_GetNextVolume(BVolumeRoster *self, BVolume* volume);
	status_t GetNextVolume(IBVolume);

	// void be_BVolumeRoster_Rewind(BVolumeRoster *self);
	void Rewind();

	// status_t be_BVolumeRoster_GetBootVolume(BVolumeRoster *self, BVolume* volume);
	status_t GetBootVolume(IBVolume);

	// status_t be_BVolumeRoster_StartWatching(BVolumeRoster *self, BMessenger *messenger);
//	status_t StartWatching(IBMessenger);

	// void be_BVolumeRoster_StopWatching(BVolumeRoster *self);
	void StopWatching();

	// BMessenger * be_BVolumeRoster_Messenger(BVolumeRoster *self);
//	BMessenger Messenger();

	void * _InstPtr();
	bool _OwnsPtr();
}

final class BVolumeRoster : IBVolumeRoster
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BVolumeRoster* be_BVolumeRoster_ctor(void *bindInstPtr);
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BVolumeRoster_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// void be_BVolumeRoster_dtor(BVolumeRoster* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BVolumeRoster_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// status_t be_BVolumeRoster_GetNextVolume(BVolumeRoster *self, BVolume* volume);
	status_t GetNextVolume(IBVolume volume) {
		return be_BVolumeRoster_GetNextVolume(_InstPtr(), volume._InstPtr());
	}

	// void be_BVolumeRoster_Rewind(BVolumeRoster *self);
	void Rewind() {
		be_BVolumeRoster_Rewind(_InstPtr());
	}

	// status_t be_BVolumeRoster_GetBootVolume(BVolumeRoster *self, BVolume* volume);
	status_t GetBootVolume(IBVolume volume) {
		return be_BVolumeRoster_GetBootVolume(_InstPtr(), volume._InstPtr());
	}

	// status_t be_BVolumeRoster_StartWatching(BVolumeRoster *self, BMessenger *messenger);
/*
	status_t StartWatching() {
		return be_BVolumeRoster_StartWatching(_InstPtr());
	}
*/
	// void be_BVolumeRoster_StopWatching(BVolumeRoster *self);
	void StopWatching() {
		be_BVolumeRoster_StopWatching(_InstPtr());
	}

	// BMessenger * be_BVolumeRoster_Messenger(BVolumeRoster *self);
/*
	BMessenger Messenger() {
		return be_BVolumeRoster_Messenger(_InstPtr());
	}
*/
	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


