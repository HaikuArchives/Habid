/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


module Support.List;

import Support.BObject;

import Kernel.OS;

import Support.SupportDefs;

import tango.stdc.stringz;

extern (C) extern
{
	// BList * be_BList_ctor_1(int32 count);
	void * be_BList_ctor(int32 count);

	
	// BList * be_BList_ctor_2(BList *anotherList);
	void * be_BList_ctor_1(void *anotherList);

	
	// void be_BList_dtor(BList *self);
	void be_BList_dtor(void *self);


	// BList * be_BList_operator_assign(BList *self, BList *other);
	void * be_BList_operator_assign(void *self, void *other);
	
	
	// bool be_BList_operator_equals(BList *self, BList *other);
	bool be_BList_operator_equals(void *self, void *other);
	
	
	// bool be_BList_operator_not_equals(BList *self, BList *other);
	bool be_BList_operator_not_equals(void *self, void *other);
	
	
	// bool be_BList_AddItem_1(BList *self, void *item, int32 index);
	bool be_BList_AddItem(void *self, void *item, int32 index);
	
	
	// bool be_BList_AddItem_2(BList *self, void *item);
	bool be_BList_AddItem_1(void *self, void *item);
	
	
	// bool be_BList_AddList_1(BList *self, BList *list, int32 index);
	bool be_BList_AddList(void *self, void *list, int32 index);
	
	
	// bool be_BList_AddList_2(BList *self, BList *list);
	bool be_BList_AddList_1(void *self, void *list);
	

	// bool be_BList_RemoveItem_1(BList *self, void *item);
	bool be_BList_RemoveItem(void *self, void *item);
	
	
	// void * be_BList_RemoveItem_2(BList *self, int32 index);
	void * be_BList_RemoveItem_1(void *self, int32 index);
	
	
	// bool be_BList_RemoveItems(BList *self, int32 index, int32 count);
	bool be_BList_RemoveItems(void *self, int32 index, int32 count);
	
	
	// bool be_BList_ReplaceItem(BList *self, int32 index, void *newItem);
	bool be_BList_ReplaceItem(void *self, int32 index, void *newItem);
	
	
	// void be_BList_MakeEmpty(BList *self);
	void be_BList_MakeEmpty(void *self);
	

	// void be_BList_SortItems(BList *self, int(*compareFunc)(const void *, const void *));
	void be_BList_SortItems(void *self, int(*compareFunc)(void *, void *));
	
	
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
	

	// void * be_BList_LastItem(BList *self);
	void * be_BList_LastItem(void *self);
	
	
	// void * be_BList_Items(BList *self);
	void * be_BList_Items(void *self);


	// bool be_BList_HasItem_1(BList *self, void* item);
	bool be_BList_HasItem(void *self, void* item);
	
	
	// bool be_BList_HasItem_2(BList *self, const void* item);
	bool be_BList_HasItem_1(void *self, void* item);
	
	
	// int32 be_BList_IndexOf_1(BList *self, void* item);
	int32 be_BList_IndexOf(void *self, void* item);
	
	
	// int32 be_BList_IndexOf_2(BList *self, const void* item);
	int32 be_BList_IndexOf_1(void *self, void* item);
	
	
	// int32 be_BList_CountItems(BList *self);
	int32 be_BList_CountItems(void *self);
	

	// bool be_BList_IsEmpty(BList *self);
	bool be_BList_IsEmpty(void *self);
	

	// void be_BList_DoForEach_1(BList *self, bool (*func)(void* item));
	void be_BList_DoForEach(void *self, bool (*func)(void* item));
	
	
	// void be_BList_DoForEach_2(BList *self, bool (*func)(void* item, void* arg2), void* arg2);
	void be_BList_DoForEach_1(void *self, bool (*func)(void* item, void* arg2), void* arg2);
}

extern (C)
{
	
}

interface IBList
{
	
	void * _GetInstPtr();
}

final class BList : IBList
{
	mixin(BObject!());
public:
	// BList * be_BList_ctor_1(int32 count);
	this(int32 count = 20) {
		fInstancePointer = be_BList_ctor(count);
		fOwnsPointer = true;
	}

	
	// BList * be_BList_ctor_2(BList *anotherList);
	this(IBList anotherList) {
		if(anotherList._GetInstPtr() is null)
			return;

		fInstancePointer = be_BList_ctor_1(anotherList._GetInstPtr());
		fOwnsPointer = true;
	}
	
	
	// void be_BList_dtor(BList *self);
	~this() {
		if(_GetInstPtr() && fOwnsPointer)
			be_BList_dtor(_GetInstPtr());
		fInstancePointer = null;
		fOwnsPointer = false;
	}


	// BList * be_BList_operator_assign(BList *self, BList *other);
//	void * be_BList_operator_assign(void *self, void *other);
	
	
	// bool be_BList_operator_equals(BList *self, BList *other);
//	bool be_BList_operator_equals(void *self, void *other);
	
	
	// bool be_BList_operator_not_equals(BList *self, BList *other);
//	bool be_BList_operator_not_equals(void *self, void *other);
	
	
	// bool be_BList_AddItem_1(BList *self, void *item, int32 index);
	bool AddItem(void *item, int32 index) {
		return be_BList_AddItem(_GetInstPtr(), item, index);
	}
	
	
	// bool be_BList_AddItem_2(BList *self, void *item);
	bool AddItem(void *item) {
		return be_BList_AddItem_1(_GetInstPtr(), item);
	}
	
	
	// bool be_BList_AddList_1(BList *self, BList *list, int32 index);
	bool AddList(IBList list, int32 index) {
		return be_BList_AddList(_GetInstPtr(), list._GetInstPtr(), index);
	}
	
	
	// bool be_BList_AddList_2(BList *self, BList *list);
	bool AddList(IBList list) {
		return be_BList_AddList_1(_GetInstPtr(), list._GetInstPtr());
	}
	

	// bool be_BList_RemoveItem_1(BList *self, void *item);
	bool RemoveItem(void *item) {
		return be_BList_RemoveItem(_GetInstPtr(), item);
	}
	
	
	// void * be_BList_RemoveItem_2(BList *self, int32 index);
	void * RemoveItem(int32 index) {
		return be_BList_RemoveItem_1(_GetInstPtr(), index);
	}
	
	
	// bool be_BList_RemoveItems(BList *self, int32 index, int32 count);
	bool RemoveItems(int32 index, int32 count) {
		return be_BList_RemoveItems(_GetInstPtr(), index, count);
	}
	
	
	// bool be_BList_ReplaceItem(BList *self, int32 index, void *newItem);
	bool ReplaceItem(int32 index, void *newItem) {
		return be_BList_ReplaceItem(_GetInstPtr(), index, newItem);
	}
	
	
	// void be_BList_MakeEmpty(BList *self);
	void MakeEmpty() {
		be_BList_MakeEmpty(_GetInstPtr());
	}
	

	// void be_BList_SortItems(BList *self, int(*compareFunc)(const void *, const void *));
//	void be_BList_SortItems(void *self, int(*compareFunc)(void *, void *));
	
	
	// bool be_BList_SwapItems(BList *self, int32 indexA, int32 indexB);
	bool SwapItems(int32 indexA, int32 indexB) {
		return be_BList_SwapItems(_GetInstPtr(), indexA, indexB);
	}
	
	
	// bool be_BList_MoveItem(BList *self, int32 fromIndex, int32 toIndex);
	bool MoveItem(int32 fromIndex, int32 toIndex) {
		return be_BList_MoveItem(_GetInstPtr(), fromIndex, toIndex);
	}
	

	// void * be_BList_ItemAt(BList *self, int32 index);
	void * ItemAt(int32 index) {
		return be_BList_ItemAt(_GetInstPtr(), index);
	}
	
	
	// void * be_BList_FirstItem(BList *self);
	void * FirstItem() {
		return be_BList_FirstItem(_GetInstPtr());
	}
	
	
	// void * be_BList_ItemAtFast(BList *self, int32 index);
	void * ItemAtFast(int32 index) {
		return be_BList_ItemAtFast(_GetInstPtr(), index);
	}
	

	// void * be_BList_LastItem(BList *self);
	void * LastItem() {
		return be_BList_LastItem(_GetInstPtr());
	}
	
	
	// void * be_BList_Items(BList *self);
	void * Items() {
		return be_BList_Items(_GetInstPtr());
	}


	// bool be_BList_HasItem_1(BList *self, void* item);
	bool HasItem(void *item) {
		return be_BList_HasItem(_GetInstPtr(), item);
	}
	
	
	// bool be_BList_HasItem_2(BList *self, const void* item);
//	bool be_BList_HasItem_2(void *self, void* item);
	
	
	// int32 be_BList_IndexOf_1(BList *self, void* item);
	int32 IndexOf(void *item) {
		return be_BList_IndexOf(_GetInstPtr(), item);
	}
	
	
	// int32 be_BList_IndexOf_2(BList *self, const void* item);
//	int32 be_BList_IndexOf_2(void *self, void* item);
	
	
	// int32 be_BList_CountItems(BList *self);
	int32 CountItems() {
		return be_BList_CountItems(_GetInstPtr());
	}
	

	// bool be_BList_IsEmpty(BList *self);
	bool IsEmpty() {
		return be_BList_IsEmpty(_GetInstPtr());
	}
	

	// void be_BList_DoForEach_1(BList *self, bool (*func)(void* item));
//	void be_BList_DoForEach_1(void *self, bool (*func)(void* item));
	
	
	// void be_BList_DoForEach_2(BList *self, bool (*func)(void* item, void* arg2), void* arg2);
//	void be_BList_DoForEach_2(void *self, bool (*func)(void* item, void* arg2), void* arg2);
	
	void * _GetInstPtr() {
		return fInstancePointer;
	}
	
}
