/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <List.h>

extern "C" {
	BList* be_BList_ctor(void *bindInstPtr, int32 count)
	{
		return new BList(count);
	}

	BList* be_BList_ctor_1(void *bindInstPtr, const BList * anotherList)
	{
		return new BList(*anotherList);
	}

	void be_BList_dtor(BList* self)
	{
		delete self;
	}

	BList * be_BList_opAssign(BList *self, const BList* other)
	{
		return &self->operator=(*other);
	}

	bool be_BList_opEquals(BList *self, const BList* other)
	{
		return self->operator==(*other);
	}

	bool be_BList_opNotEquals(BList *self, const BList* other)
	{
		return self->operator!=(*other);
	}

	bool be_BList_AddItem(BList *self, void * item, int32 index)
	{
		return self->AddItem(item, index);
	}

	bool be_BList_AddItem_1(BList *self, void * item)
	{
		return self->AddItem(item);
	}

	bool be_BList_AddList(BList *self, const BList * list, int32 index)
	{
		return self->AddList(list, index);
	}

	bool be_BList_AddList_1(BList *self, const BList * list)
	{
		return self->AddList(list);
	}

	bool be_BList_RemoveItem(BList *self, void * item)
	{
		return self->RemoveItem(item);
	}

	void * be_BList_RemoveItem_1(BList *self, int32 index)
	{
		return self->RemoveItem(index);
	}

	bool be_BList_RemoveItems(BList *self, int32 index, int32 count)
	{
		return self->RemoveItems(index, count);
	}

	bool be_BList_ReplaceItem(BList *self, int32 index, void * newItem)
	{
		return self->ReplaceItem(index, newItem);
	}

	void be_BList_MakeEmpty(BList *self)
	{
		self->MakeEmpty();
	}

	void be_BList_SortItems(BList *self, int (*comparefunc)(const void *, const void *))
	{
		self->SortItems(comparefunc);
	}

	bool be_BList_SwapItems(BList *self, int32 indexA, int32 indexB)
	{
		return self->SwapItems(indexA, indexB);
	}

	bool be_BList_MoveItem(BList *self, int32 fromIndex, int32 toIndex)
	{
		return self->MoveItem(fromIndex, toIndex);
	}

	void * be_BList_ItemAt(BList *self, int32 index)
	{
		return self->ItemAt(index);
	}

	void * be_BList_FirstItem(BList *self)
	{
		return self->FirstItem();
	}

	void * be_BList_ItemAtFast(BList *self, int32 index)
	{
		return self->ItemAtFast(index);
	}

	void be_BList_LastItem(BList *self)
	{
		self->LastItem();
	}

	void * be_BList_Items(BList *self)
	{
		return self->Items();
	}

	bool be_BList_HasItem(BList *self, void * item)
	{
		return self->HasItem(item);
	}

	bool be_BList_HasItem_1(BList *self, const void * item)
	{
		return self->HasItem(item);
	}

	int32 be_BList_IndexOf(BList *self, void * item)
	{
		return self->IndexOf(item);
	}

	int32 be_BList_IndexOf_1(BList *self, const void * item)
	{
		return self->IndexOf(item);
	}

	int32 be_BList_CountItems(BList *self)
	{
		return self->CountItems();
	}

	bool be_BList_IsEmpty(BList *self)
	{
		return self->IsEmpty();
	}

	void be_BList_DoForEach(BList *self, bool (*func)(void *item))
	{
		self->DoForEach(func);
	}

	void be_BList_DoForEach_1(BList *self, bool (*func)(void *item, void *arg2), void * arg2)
	{
		self->DoForEach(func, arg2);
	}

}


