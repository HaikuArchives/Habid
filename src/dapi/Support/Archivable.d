/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Support.Archivable;

import Support.SupportDefs;
import Support.types;
import Support.BObject;

import App.Message;

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
	status_t Archive(IBMessage, bool);

	// BArchivable * be_BArchivable_Instantiate(BArchivable *self, BMessage * archive);
	static IBArchivable Instantiate(IBMessage);

	// status_t be_BArchivable_Perform(BArchivable *self, perform_code d, void* arg);
	status_t Perform(perform_code, void*);

	// status_t be_BArchivable_AllUnarchived(BArchivable *self, const BMessage* archive);
	status_t AllUnarchived(IBMessage);

	// status_t be_BArchivable_AllArchived(BArchivable *self, BMessage* archive);
	status_t AllArchived(IBMessage);

	void * _InstPtr();
	bool _OwnsPtr();
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
		if(fInstancePointer is null) {
			fInstancePointer = be_BArchivable_ctor(cast(void *)this);
			fOwnsPointer = true;
		}
	}

	// BArchivableProxy * be_BArchivable_ctor_1(void *bindInstPtr, BMessage* from);
	this(IBMessage from) {
		if(fInstancePointer is null) {
			fInstancePointer = be_BArchivable_ctor_1(cast(void *)this, from._InstPtr());
			fOwnsPointer = true;
		}
	}

	// void be_BArchivable_dtor(BArchivable* self);
	~this() {
		if(fInstancePointer !is null && fOwnsPointer) {
			be_BArchivable_dtor(_InstPtr());
			fInstancePointer = null;
			fOwnsPointer = false;
		}
	}

	// status_t be_BArchivable_Archive(BArchivable *self, BMessage* into, bool deep);
	status_t Archive(IBMessage into, bool deep = true) {
		return be_BArchivable_Archive(_InstPtr(), into._InstPtr(), deep);
	}

	//BArchivable * be_BArchivable_Instantiate_static(BMessage * archive)
	static IBArchivable Instantiate(IBMessage archive)
	{
		return new BArchivable(archive._InstPtr(), true);
	}

	// status_t be_BArchivable_Perform(BArchivable *self, perform_code d, void* arg);
	status_t Perform(perform_code d, void *arg) {
		return be_BArchivable_Perform(_InstPtr(), d, arg);
	}

	// status_t be_BArchivable_AllUnarchived(BArchivable *self, const BMessage* archive);
	status_t AllUnarchived(IBMessage archive) {
		return be_BArchivable_AllUnarchived(_InstPtr(), archive._InstPtr());
	}

	// status_t be_BArchivable_AllArchived(BArchivable *self, BMessage* archive);
	status_t AllArchived(IBMessage archive) {
		return be_BArchivable_AllArchived(_InstPtr(), archive._InstPtr());
	}

	void * _InstPtr() { return fInstancePointer; }
	bool _OwnsPtr() { return fOwnsPointer; }
}


