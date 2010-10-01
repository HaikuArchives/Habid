/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.App.Cursor;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;
import Be.Support.Archivable;

import Be.App.Message;


enum BCursorID {
	B_CURSOR_ID_SYSTEM_DEFAULT					= 1,

	B_CURSOR_ID_CONTEXT_MENU					= 3,
	B_CURSOR_ID_COPY							= 4,
	B_CURSOR_ID_CREATE_LINK						= 29,
	B_CURSOR_ID_CROSS_HAIR						= 5,
	B_CURSOR_ID_FOLLOW_LINK						= 6,
	B_CURSOR_ID_GRAB							= 7,
	B_CURSOR_ID_GRABBING						= 8,
	B_CURSOR_ID_HELP							= 9,
	B_CURSOR_ID_I_BEAM							= 2,
	B_CURSOR_ID_I_BEAM_HORIZONTAL				= 10,
	B_CURSOR_ID_MOVE							= 11,
	B_CURSOR_ID_NO_CURSOR						= 12,
	B_CURSOR_ID_NOT_ALLOWED						= 13,
	B_CURSOR_ID_PROGRESS						= 14,
	B_CURSOR_ID_RESIZE_NORTH					= 15,
	B_CURSOR_ID_RESIZE_EAST						= 16,
	B_CURSOR_ID_RESIZE_SOUTH					= 17,
	B_CURSOR_ID_RESIZE_WEST						= 18,
	B_CURSOR_ID_RESIZE_NORTH_EAST				= 19,
	B_CURSOR_ID_RESIZE_NORTH_WEST				= 20,
	B_CURSOR_ID_RESIZE_SOUTH_EAST				= 21,
	B_CURSOR_ID_RESIZE_SOUTH_WEST				= 22,
	B_CURSOR_ID_RESIZE_NORTH_SOUTH				= 23,
	B_CURSOR_ID_RESIZE_EAST_WEST				= 24,
	B_CURSOR_ID_RESIZE_NORTH_EAST_SOUTH_WEST	= 25,
	B_CURSOR_ID_RESIZE_NORTH_WEST_SOUTH_EAST	= 26,
	B_CURSOR_ID_ZOOM_IN							= 27,
	B_CURSOR_ID_ZOOM_OUT						= 28
}


extern (C) extern {
	// BCursorProxy * be_BCursor_ctor(void *bindInstPtr, const void* cursorData);
	void * be_BCursor_ctor(void *bindInstPtr, void* cursorData);

	// BCursorProxy * be_BCursor_ctor_1(void *bindInstPtr, const BCursor* other);
	void * be_BCursor_ctor_1(void *bindInstPtr, void * other);

	// BCursorProxy * be_BCursor_ctor_2(void *bindInstPtr, BCursorID *id);
	void * be_BCursor_ctor_2(void *bindInstPtr, BCursorID id);

	// BCursorProxy * be_BCursor_ctor_3(void *bindInstPtr, BMessage* data);
	void * be_BCursor_ctor_3(void *bindInstPtr, void* data);

	// void be_BCursor_dtor(BCursor* self);
	void be_BCursor_dtor(void* self);

	// status_t be_BCursor_Archive(BCursorProxy *self, BMessage* archive, bool deep);
	status_t be_BCursor_Archive(void *self, void* archive, bool deep);

	//BArchivable* be_BCursor_Instantiate_static(BMessage* archive)
	void * be_BCursor_Instantiate_static(void* archive);

	// BCursor* be_BCursor_opAssign(BCursor *self, const BCursor* other);
	void * be_BCursor_opAssign(void *self, void * other);

	// bool be_BCursor_opEquals(BCursor *self, const BCursor* other);
	bool be_BCursor_opEquals(void *self, void * other);

	// bool be_BCursor_opNotEquals(BCursor *self, const BCursor* other);
	bool be_BCursor_opNotEquals(void *self, void * other);

}


extern (C) {
	status_t bind_BCursor_Archive(void *bindInstPtr, BMessage* archive, bool deep) {
		return (cast(BCursor)bindInstPtr).Archive(new BMessage(archive, false), deep);
	}
}


interface IBCursor
{
	// status_t be_BCursor_Archive(BCursor *self, BMessage* archive, bool deep);
	status_t Archive(BMessage, bool);

	// BArchivable* be_BCursor_Instantiate(BCursor *self, BMessage* archive);
//	BArchivable* Instantiate();

	// BCursor& be_BCursor_opAssign(BCursor *self, const BCursor& other);
	//BCursor& opAssign();

	// bool be_BCursor_opEquals(BCursor *self, const BCursor& other);
	bool opEquals(BCursor);

	// bool be_BCursor_opNotEquals(BCursor *self, const BCursor& other);
	//bool opNotEquals();

	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BCursor : BArchivable, IBCursor
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BCursorProxy * be_BCursor_ctor(void *bindInstPtr, const void* cursorData);
	this(void [] cursorData) {
		if(_InstPtr is null) {
			_InstPtr = be_BCursor_ctor(cast(void *)this, cursorData.ptr);
			_OwnsPtr = true;
		}
	}

	// BCursorProxy * be_BCursor_ctor_1(void *bindInstPtr, const BCursor* other);
	this(BCursor other) {
		if(_InstPtr is null) {
			_InstPtr = be_BCursor_ctor_1(cast(void *)this, other._InstPtr);
			_OwnsPtr = true;
		}
	}

	// BCursorProxy * be_BCursor_ctor_2(void *bindInstPtr, BCursorID id);
	this(BCursorID id) {
		if(_InstPtr is null) {
			_InstPtr = be_BCursor_ctor_2(cast(void *)this, id);
			_OwnsPtr = true;
		}
	}

	// BCursorProxy * be_BCursor_ctor_3(void *bindInstPtr, BMessage* data);
	this(BMessage data) {
		if(_InstPtr is null) {
			_InstPtr = be_BCursor_ctor_3(cast(void *)this, data._InstPtr);
			_OwnsPtr = true;
		}
	}

	// void be_BCursor_dtor(BCursor* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BCursor_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BCursor_Archive(BCursor *self, BMessage* archive, bool deep);
	status_t Archive(BMessage archive, bool deep = true) {
		return be_BCursor_Archive(_InstPtr(), archive._InstPtr, deep);
	}

	//BArchivable* be_BCursor_Instantiate_static(BMessage* archive)
	static IBArchivable Instantiate(BMessage archive)
	{
		return new BCursor(be_BCursor_Instantiate_static(archive._InstPtr), true);
	}

	// BCursor& be_BCursor_opAssign(BCursor *self, const BCursor& other);
	//BCursor& opAssign();

	// bool be_BCursor_opEquals(BCursor *self, const BCursor& other);
	bool opEquals(BCursor other) {
		return 	be_BCursor_opEquals(_InstPtr, other._InstPtr);
	}

	// bool be_BCursor_opNotEquals(BCursor *self, const BCursor& other);
	//bool opNotEquals();

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


