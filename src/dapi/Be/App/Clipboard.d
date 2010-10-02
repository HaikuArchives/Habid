/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Clipboard;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;
import Be.App.Messenger;

import Be.Support.HelperFunctions;

import tango.stdc.stringz;


const B_CLIPBOARD_CHANGED = MakeValue("CLCH");



extern (C) extern {
	// BClipboard* be_BClipboard_ctor(void *bindInstPtr, const char* name, bool transient);
	void * be_BClipboard_ctor(void *bindInstPtr, char* name, bool transient);

	// void be_BClipboard_dtor(BClipboard* self);
	void be_BClipboard_dtor(void* self);

	// const char* be_BClipboard_Name(BClipboard *self);
	char* be_BClipboard_Name(void *self);

	// uint32 be_BClipboard_LocalCount(BClipboard *self);
	uint32 be_BClipboard_LocalCount(void *self);

	// uint32 be_BClipboard_SystemCount(BClipboard *self);
	uint32 be_BClipboard_SystemCount(void *self);

	// status_t be_BClipboard_StartWatching(BClipboard *self, BMessenger *target);
	status_t be_BClipboard_StartWatching(void *self, void *target);

	// status_t be_BClipboard_StopWatching(BClipboard *self, BMessenger *target);
	status_t be_BClipboard_StopWatching(void *self, void *target);

	// bool be_BClipboard_Lock(BClipboard *self);
	bool be_BClipboard_Lock(void *self);

	// void be_BClipboard_Unlock(BClipboard *self);
	void be_BClipboard_Unlock(void *self);

	// bool be_BClipboard_IsLocked(BClipboard *self);
	bool be_BClipboard_IsLocked(void *self);

	// status_t be_BClipboard_Clear(BClipboard *self);
	status_t be_BClipboard_Clear(void *self);

	// status_t be_BClipboard_Commit(BClipboard *self);
	status_t be_BClipboard_Commit(void *self);

	// status_t be_BClipboard_Commit_1(BClipboard *self, bool failIfChanged);
	status_t be_BClipboard_Commit_1(void *self, bool failIfChanged);

	// status_t be_BClipboard_Revert(BClipboard *self);
	status_t be_BClipboard_Revert(void *self);

	// BMessenger * be_BClipboard_DataSource(BClipboard *self);
	void * be_BClipboard_DataSource(void *self);

	// BMessage* be_BClipboard_Data(BClipboard *self);
	BMessage* be_BClipboard_Data(void *self);

}


extern (C) {
}


interface IBClipboard
{
	// const char* be_BClipboard_Name(BClipboard *self);
	char [] Name();

	// uint32 be_BClipboard_LocalCount(BClipboard *self);
	uint32 LocalCount();

	// uint32 be_BClipboard_SystemCount(BClipboard *self);
	uint32 SystemCount();

	// status_t be_BClipboard_StartWatching(BClipboard *self, BMessenger *target);
	status_t StartWatching(BMessenger);

	// status_t be_BClipboard_StopWatching(BClipboard *self, BMessenger *target);
	status_t StopWatching(BMessenger);

	// bool be_BClipboard_Lock(BClipboard *self);
	bool Lock();

	// void be_BClipboard_Unlock(BClipboard *self);
	void Unlock();

	// bool be_BClipboard_IsLocked(BClipboard *self);
	bool IsLocked();

	// status_t be_BClipboard_Clear(BClipboard *self);
	status_t Clear();

	// status_t be_BClipboard_Commit(BClipboard *self);
	status_t Commit();

	// status_t be_BClipboard_Commit_1(BClipboard *self, bool failIfChanged);
	status_t Commit(bool);

	// status_t be_BClipboard_Revert(BClipboard *self);
	status_t Revert();

	// BMessenger * be_BClipboard_DataSource(BClipboard *self);
	BMessenger DataSource();

	// BMessage* be_BClipboard_Data(BClipboard *self);
	BMessage Data();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

final class BClipboard : IBClipboard
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BClipboard* be_BClipboard_ctor(void *bindInstPtr, const char* name, bool transient);
	this(char [] name, bool transient = false) {
		if(_InstPtr is null) {
			_InstPtr = be_BClipboard_ctor(cast(void *)this, toStringz(name), transient);
			_OwnsPtr = true;
		}
	}

	// void be_BClipboard_dtor(BClipboard* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BClipboard_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// const char* be_BClipboard_Name(BClipboard *self);
	char [] Name() {
		return fromStringz(be_BClipboard_Name(_InstPtr())).dup;
	}

	// uint32 be_BClipboard_LocalCount(BClipboard *self);
	uint32 LocalCount() {
		return be_BClipboard_LocalCount(_InstPtr());
	}

	// uint32 be_BClipboard_SystemCount(BClipboard *self);
	uint32 SystemCount() {
		return be_BClipboard_SystemCount(_InstPtr());
	}

	// status_t be_BClipboard_StartWatching(BClipboard *self, BMessenger *target);
	status_t StartWatching(BMessenger target) {
		return be_BClipboard_StartWatching(_InstPtr(), target._InstPtr);
	}

	// status_t be_BClipboard_StopWatching(BClipboard *self, BMessenger *target);
	status_t StopWatching(BMessenger target) {
		return be_BClipboard_StopWatching(_InstPtr(), target._InstPtr);
	}

	// bool be_BClipboard_Lock(BClipboard *self);
	bool Lock() {
		return be_BClipboard_Lock(_InstPtr());
	}

	// void be_BClipboard_Unlock(BClipboard *self);
	void Unlock() {
		be_BClipboard_Unlock(_InstPtr());
	}

	// bool be_BClipboard_IsLocked(BClipboard *self);
	bool IsLocked() {
		return be_BClipboard_IsLocked(_InstPtr());
	}

	// status_t be_BClipboard_Clear(BClipboard *self);
	status_t Clear() {
		return be_BClipboard_Clear(_InstPtr());
	}

	// status_t be_BClipboard_Commit(BClipboard *self);
	status_t Commit() {
		return be_BClipboard_Commit(_InstPtr());
	}

	// status_t be_BClipboard_Commit_1(BClipboard *self, bool failIfChanged);
	status_t Commit(bool failIfChanged) {
		return be_BClipboard_Commit_1(_InstPtr(), failIfChanged);
	}

	// status_t be_BClipboard_Revert(BClipboard *self);
	status_t Revert() {
		return be_BClipboard_Revert(_InstPtr());
	}

	// BMessenger * be_BClipboard_DataSource(BClipboard *self);
	BMessenger DataSource() {
		return new BMessenger(be_BClipboard_DataSource(_InstPtr()), false);
	}

	// BMessage* be_BClipboard_Data(BClipboard *self);
	BMessage Data() {
		return new BMessage(be_BClipboard_Data(_InstPtr()), false);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


