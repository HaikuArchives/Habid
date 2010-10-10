/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Picture;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;

import Be.Support.Archivable;
import Be.Support.DataIO;

extern (C) extern {
	// BPictureProxy * be_BPicture_ctor(void *bindInstPtr);
	void * be_BPicture_ctor(void *bindInstPtr);

	// BPictureProxy * be_BPicture_ctor_1(void *bindInstPtr, const BPicture* other);
	void * be_BPicture_ctor_1(void *bindInstPtr, void * other);

	// BPictureProxy * be_BPicture_ctor_2(void *bindInstPtr, BMessage* archive);
	void * be_BPicture_ctor_2(void *bindInstPtr, void* archive);

	// void be_BPicture_dtor(BPicture* self);
	void be_BPicture_dtor(void* self);

	//BArchivable* be_BPicture_Instantiate_static(BMessage* archive)
	void * be_BPicture_Instantiate_static(void* archive);

	// status_t be_BPicture_Archive(BPictureProxy *self, BMessage* archive, bool deep);
	status_t be_BPicture_Archive(void *self, void* archive, bool deep);

	// status_t be_BPicture_Perform(BPictureProxy *self, perform_code d, void* arg);
	status_t be_BPicture_Perform(void *self, perform_code d, void* arg);

	// status_t be_BPicture_Play(BPictureProxy *self, void** callBackTable, int32 tableEntries, void* userData);
	status_t be_BPicture_Play(void *self, void** callBackTable, int32 tableEntries, void* userData);

	// status_t be_BPicture_Flatten(BPictureProxy *self, BDataIO* stream);
	status_t be_BPicture_Flatten(void *self, void* stream);

	// status_t be_BPicture_Unflatten(BPictureProxy *self, BDataIO* stream);
	status_t be_BPicture_Unflatten(void *self, void* stream);

}


extern (C) {
	status_t bind_BPicture_Archive(void *bindInstPtr, void* archive, bool deep) {
		return (cast(BPicture)bindInstPtr).Archive(new BMessage(archive, false), deep);
	}

	status_t bind_BPicture_Perform(void *bindInstPtr, perform_code d, void* arg) {
		return (cast(BPicture)bindInstPtr).Perform(d, arg);
	}

}


interface IBPicture
{
	// BArchivable* be_BPicture_Instantiate(BPicture *self, BMessage* archive);
//	BArchivable* Instantiate();

	// status_t be_BPicture_Archive(BPicture *self, BMessage* archive, bool deep);
	status_t Archive(BMessage, bool);

	// status_t be_BPicture_Perform(BPicture *self, perform_code d, void* arg);
	status_t Perform(perform_code, void *);

	// status_t be_BPicture_Play(BPicture *self, void** callBackTable, int32 tableEntries, void* userData);
//	final status_t Play();

	// status_t be_BPicture_Flatten(BPicture *self, BDataIO* stream);
	final status_t Flatten(IBDataIO);

	// status_t be_BPicture_Unflatten(BPicture *self, BDataIO* stream);
	final status_t Unflatten(IBDataIO);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BPicture : BArchivable, IBPicture
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BPictureProxy * be_BPicture_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BPicture_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
		super();
	}

	// BPictureProxy * be_BPicture_ctor_1(void *bindInstPtr, const BPicture* other);
	this(BPicture other) {
		if(_InstPtr is null) {
			_InstPtr = be_BPicture_ctor_1(cast(void *)this, other._InstPtr);
			_OwnsPtr = true;
		}
		super();
	}

	// BPictureProxy * be_BPicture_ctor_2(void *bindInstPtr, BMessage* archive);
	this(BMessage archive) {
		if(_InstPtr is null) {
			_InstPtr = be_BPicture_ctor_2(cast(void *)this, archive._InstPtr);
			_OwnsPtr = true;
		}
		super(archive);
	}

	// void be_BPicture_dtor(BPicture* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BPicture_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	//BArchivable* be_BPicture_Instantiate_static(BMessage* archive)
	static BPicture Instantiate(BMessage* archive)
	{
		return new BPicture(be_BPicture_Instantiate_static(archive), true);
	}

	// status_t be_BPicture_Archive(BPicture *self, BMessage* archive, bool deep);
	status_t Archive(BMessage archive, bool deep = true) {
		return be_BPicture_Archive(_InstPtr(), archive._InstPtr, deep);
	}

	// status_t be_BPicture_Perform(BPicture *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BPicture_Perform(_InstPtr(), d, arg);
	}
/*
	// status_t be_BPicture_Play(BPicture *self, void** callBackTable, int32 tableEntries, void* userData);
	final status_t Play() {
		return be_BPicture_Play(_InstPtr());
	}
*/
	// status_t be_BPicture_Flatten(BPicture *self, BDataIO* stream);
	final status_t Flatten(IBDataIO stream) {
		return be_BPicture_Flatten(_InstPtr(), stream._InstPtr);
	}

	// status_t be_BPicture_Unflatten(BPicture *self, BDataIO* stream);
	final status_t Unflatten(IBDataIO stream) {
		return be_BPicture_Unflatten(_InstPtr(), stream._InstPtr);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


