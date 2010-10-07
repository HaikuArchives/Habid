/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.Archivable;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.App.Message;


extern (C) extern {
	// BArchivableProxy * be_BArchivable_ctor(void *bindInstPtr);
	void * be_BArchivable_ctor(void *bindInstPtr);

	// BArchivableProxy * be_BArchivable_ctor_1(void *bindInstPtr, BMessage* from);
	void * be_BArchivable_ctor_1(void *bindInstPtr, void* from);

	// void be_BArchivable_dtor(BArchivable* self);
	void be_BArchivable_dtor(void* self);

	// status_t be_BArchivable_Archive(BArchivableProxy *self, BMessage* into, bool deep);
	status_t be_BArchivable_Archive(void *self, void* into, bool deep);

	//BArchivable * be_BArchivable_Instantiate_static(BMessage * archive)
	BArchivable * be_BArchivable_Instantiate_static(void * archive);

	// status_t be_BArchivable_Perform(BArchivableProxy *self, perform_code d, void* arg);
	status_t be_BArchivable_Perform(void *self, perform_code d, void* arg);

	// status_t be_BArchivable_AllUnarchived(BArchivableProxy *self, const BMessage* archive);
	status_t be_BArchivable_AllUnarchived(void *self, void* archive);

	// status_t be_BArchivable_AllArchived(BArchivableProxy *self, BMessage* archive);
	status_t be_BArchivable_AllArchived(void *self, void* archive);

}


extern (C) {
	status_t bind_BArchivable_Archive(void *bindInstPtr, void* into, bool deep) {
		return (cast(BArchivable)bindInstPtr).Archive(new BMessage(into, false), deep);
	}

	status_t bind_BArchivable_Perform(void *bindInstPtr, perform_code d, void* arg) {
		return (cast(BArchivable)bindInstPtr).Perform(d, arg);
	}

	status_t bind_BArchivable_AllUnarchived(void *bindInstPtr, void* archive) {
		return (cast(BArchivable)bindInstPtr).AllUnarchived(new BMessage(archive, false));
	}

	status_t bind_BArchivable_AllArchived(void *bindInstPtr, void* archive) {
		return (cast(BArchivable)bindInstPtr).AllArchived(new BMessage(archive, false));
	}

}


interface IBArchivable
{
	// status_t be_BArchivable_Archive(BArchivable *self, BMessage* into, bool deep);
	status_t Archive(BMessage, bool);

	// BArchivable * be_BArchivable_Instantiate(BArchivable *self, BMessage * archive);
	static IBArchivable Instantiate(BMessage);

	// status_t be_BArchivable_Perform(BArchivable *self, perform_code d, void* arg);
	status_t Perform(perform_code, void*);

	// status_t be_BArchivable_AllUnarchived(BArchivable *self, const BMessage* archive);
	status_t AllUnarchived(BMessage);

	// status_t be_BArchivable_AllArchived(BArchivable *self, BMessage* archive);
	status_t AllArchived(BMessage);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BArchivable : IBArchivable
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BArchivableProxy * be_BArchivable_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BArchivable_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// BArchivableProxy * be_BArchivable_ctor_1(void *bindInstPtr, BMessage* from);
	this(BMessage from) {
		if(_InstPtr is null) {
			_InstPtr = be_BArchivable_ctor_1(cast(void *)this, from._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BArchivable_dtor(BArchivable* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BArchivable_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BArchivable_Archive(BArchivable *self, BMessage* into, bool deep);
	status_t Archive(BMessage into, bool deep = true) {
		return be_BArchivable_Archive(_InstPtr(), into._InstPtr(), deep);
	}

	//BArchivable * be_BArchivable_Instantiate_static(BMessage * archive)
	static IBArchivable Instantiate(BMessage archive)
	{
		return new BArchivable(archive._InstPtr(), true);
	}

	// status_t be_BArchivable_Perform(BArchivable *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BArchivable_Perform(_InstPtr(), d, arg);
	}

	// status_t be_BArchivable_AllUnarchived(BArchivable *self, const BMessage* archive);
	status_t AllUnarchived(BMessage archive) {
		return be_BArchivable_AllUnarchived(_InstPtr(), archive._InstPtr());
	}

	// status_t be_BArchivable_AllArchived(BArchivable *self, BMessage* archive);
	status_t AllArchived(BMessage archive) {
		return be_BArchivable_AllArchived(_InstPtr(), archive._InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


