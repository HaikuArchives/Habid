/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Support.List;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

extern (C) extern {
	// BList* be_BList_ctor(void *bindInstPtr, int32 count);
	void * be_BList_ctor(void *bindInstPtr, int32 count);

	// BList* be_BList_ctor_1(void *bindInstPtr, const BList * anotherList);
	void * be_BList_ctor_1(void *bindInstPtr, void * anotherList);

	// void be_BList_dtor(BList* self);
	void be_BList_dtor(void* self);

	// BList * be_BList_opAssign(BList *self, const BList* other);
	void * be_BList_opAssign(void *self, void* other);

	// bool be_BList_opEquals(BList *self, const BList* other);
	bool be_BList_opEquals(void *self, void* other);

	// bool be_BList_opNotEquals(BList *self, const BList* other);
	bool be_BList_opNotEquals(void *self, void* other);

	// bool be_BList_AddItem(BList *self, void * item, int32 index);
	bool be_BList_AddItem(void *self, void * item, int32 index);

	// bool be_BList_AddItem_1(BList *self, void * item);
	bool be_BList_AddItem_1(void *self, void * item);

	// bool be_BList_AddList(BList *self, const BList * list, int32 index);
	bool be_BList_AddList(void *self, void * list, int32 index);

	// bool be_BList_AddList_1(BList *self, const BList * list);
	bool be_BList_AddList_1(void *self, void * list);

	// bool be_BList_RemoveItem(BList *self, void * item);
	bool be_BList_RemoveItem(void *self, void * item);

	// void * be_BList_RemoveItem_1(BList *self, int32 index);
	void * be_BList_RemoveItem_1(void *self, int32 index);

	// bool be_BList_RemoveItems(BList *self, int32 index, int32 count);
	bool be_BList_RemoveItems(void *self, int32 index, int32 count);

	// bool be_BList_ReplaceItem(BList *self, int32 index, void * newItem);
	bool be_BList_ReplaceItem(void *self, int32 index, void * newItem);

	// void be_BList_MakeEmpty(BList *self);
	void be_BList_MakeEmpty(void *self);

	// void be_BList_SortItems(BList *self, int (*comparefunc)(const void *, const void *));
	void be_BList_SortItems(void *self, int (*comparefunc)( void *,  void *));

	// bool be_BList_SwapItems(BList *self, int32 indexA, int32 indexB);
	bool be_BList_SwapItems(void *self, int32 indexA, int32 indexB);

	// bool be_BList_MoveItem(BList *self, int32 fromIndex, int32 toIndex);
	bool be_BList_MoveItem(void *self, int32 fromIndex, int32 toIndex);

	// void * be_BList_ItemAt(BList *self, int32 index);
	void * be_BList_ItemAt(void *self, int32 index);

	// void * be_BList_FirstItem(BList *self);
	void * be_BList_FirstItem(void *self);

	// void * be_BList_ItemAtFast(BList *self, int32 index);
	void * be_BList_ItemAtFast(void *self, int32 index);

	// void be_BList_LastItem(BList *self);
	void be_BList_LastItem(void *self);

	// void * be_BList_Items(BList *self);
	void * be_BList_Items(void *self);

	// bool be_BList_HasItem(BList *self, void * item);
	bool be_BList_HasItem(void *self, void * item);

	// bool be_BList_HasItem_1(BList *self, const void * item);
	bool be_BList_HasItem_1(void *self, void * item);

	// int32 be_BList_IndexOf(BList *self, void * item);
	int32 be_BList_IndexOf(void *self, void * item);

	// int32 be_BList_IndexOf_1(BList *self, const void * item);
	int32 be_BList_IndexOf_1(void *self, void * item);

	// int32 be_BList_CountItems(BList *self);
	int32 be_BList_CountItems(void *self);

	// bool be_BList_IsEmpty(BList *self);
	bool be_BList_IsEmpty(void *self);

	// void be_BList_DoForEach(BList *self, bool (*func)(void *item));
	void be_BList_DoForEach(void *self, bool (*func)(void *item));

	// void be_BList_DoForEach_1(BList *self, bool (*func)(void *item, void *arg2), void * arg2);
	void be_BList_DoForEach_1(void *self, bool (*func)(void *item, void *arg2), void * arg2);

}


final class BList
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BList* be_BList_ctor(void *bindInstPtr, int32 count);
	this(int32 count = 20) {
		if(_InstPtr is null) {
			_InstPtr = be_BList_ctor(cast(void *)this, count);
			_OwnsPtr = true;
		}
	}

	// BList* be_BList_ctor_1(void *bindInstPtr, const BList * anotherList);
	this(BList anotherList) {
		if(_InstPtr is null) {
			_InstPtr = be_BList_ctor_1(cast(void *)this, anotherList._InstPtr());
			_OwnsPtr = true;
		}
	}

	// void be_BList_dtor(BList* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BList_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// BList & be_BList_opAssign(BList *self, const BList& other);
	//BList & opAssign();

	// bool be_BList_opEquals(BList *self, const BList& other);
	//bool opEquals();

	// bool be_BList_opNotEquals(BList *self, const BList& other);
	//bool opNotEquals();

	// bool be_BList_AddItem(BList *self, void * item, int32 index);
	bool AddItem(void *item, int32 index) {
		return be_BList_AddItem(_InstPtr(), item, index);
	}

	// bool be_BList_AddItem_1(BList *self, void * item);
	bool AddItem(void *item) {
		return be_BList_AddItem_1(_InstPtr(), item);
	}

	// bool be_BList_AddList(BList *self, const BList * list, int32 index);
	bool AddList(BList list, int32 index) {
		return be_BList_AddList(_InstPtr(), list._InstPtr(), index);
	}

	// bool be_BList_AddList_1(BList *self, const BList * list);
	bool AddList(BList list) {
		return be_BList_AddList_1(_InstPtr(), list._InstPtr());
	}

	// bool be_BList_RemoveItem(BList *self, void * item);
	bool RemoveItem(void *item) {
		return be_BList_RemoveItem(_InstPtr(), item);
	}

	// void * be_BList_RemoveItem_1(BList *self, int32 index);
	void * RemoveItem(int32 index) {
		return be_BList_RemoveItem_1(_InstPtr(), index);
	}

	// bool be_BList_RemoveItems(BList *self, int32 index, int32 count);
	bool RemoveItems(int32 index, int32 count) {
		return be_BList_RemoveItems(_InstPtr(), index, count);
	}

	// bool be_BList_ReplaceItem(BList *self, int32 index, void * newItem);
	bool ReplaceItem(int32 index, void *newItem) {
		return be_BList_ReplaceItem(_InstPtr(), index, newItem);
	}

	// void be_BList_MakeEmpty(BList *self);
	void MakeEmpty() {
		be_BList_MakeEmpty(_InstPtr());
	}

	// void be_BList_SortItems(BList *self, int (*comparefunc)(const void *, const void *));
/*
	void SortItems() {
		be_BList_SortItems(_InstPtr());
	}
*/

	// bool be_BList_SwapItems(BList *self, int32 indexA, int32 indexB);
	bool SwapItems(int32 indexA, int32 indexB) {
		return be_BList_SwapItems(_InstPtr(), indexA, indexB);
	}

	// bool be_BList_MoveItem(BList *self, int32 fromIndex, int32 toIndex);
	bool MoveItem(int32 fromIndex, int32 toIndex) {
		return be_BList_MoveItem(_InstPtr(), fromIndex, toIndex);
	}

	// void * be_BList_ItemAt(BList *self, int32 index);
	void * ItemAt(int32 index) {
		return be_BList_ItemAt(_InstPtr(), index);
	}

	// void * be_BList_FirstItem(BList *self);
	void * FirstItem() {
		return be_BList_FirstItem(_InstPtr());
	}

	// void * be_BList_ItemAtFast(BList *self, int32 index);
	void * ItemAtFast(int32 index) {
		return be_BList_ItemAtFast(_InstPtr(), index);
	}

	// void be_BList_LastItem(BList *self);
	void LastItem() {
		be_BList_LastItem(_InstPtr());
	}

	// void * be_BList_Items(BList *self);
	void * Items() {
		return be_BList_Items(_InstPtr());
	}

	// bool be_BList_HasItem(BList *self, void * item);
	bool HasItem(void *item) {
		return be_BList_HasItem(_InstPtr(), item);
	}

	// bool be_BList_HasItem_1(BList *self, const void * item);
/*
	bool HasItem() {
		return be_BList_HasItem_1(_InstPtr());
	}
*/

	// int32 be_BList_IndexOf(BList *self, void * item);
	int32 IndexOf(void *item) {
		return be_BList_IndexOf(_InstPtr(), item);
	}

	// int32 be_BList_IndexOf_1(BList *self, const void * item);
/*
	int32 IndexOf() {
		return be_BList_IndexOf_1(_InstPtr());
	}
*/
	// int32 be_BList_CountItems(BList *self);
	int32 CountItems() {
		return be_BList_CountItems(_InstPtr());
	}

	// bool be_BList_IsEmpty(BList *self);
	bool IsEmpty() {
		return be_BList_IsEmpty(_InstPtr());
	}

	// void be_BList_DoForEach(BList *self, bool (*func)(void *item));
/*
	void DoForEach() {
		be_BList_DoForEach(_InstPtr());
	}
*/
	// void be_BList_DoForEach_1(BList *self, bool (*func)(void *item, void *arg2), void * arg2);
/*
	void DoForEach() {
		be_BList_DoForEach_1(_InstPtr());
	}
*/
	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


