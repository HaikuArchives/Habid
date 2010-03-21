module Support.List;

import Support.BObject;
import Support.SupportDefs;

import tango.stdc.posix.sys.types;

extern (C) extern {
	void * be_BList_ctor_1(void *, int32 );
	void * be_BList_ctor_2(void *, void *);
	void be_BList_dtor(void *);
	
	void * be_BList_operator_assign(void *, void *);
	bool be_BList_operator_equals(void *, void *);
	bool be_BList_operator_not_equals(void *, void *);

	// Adding and removing items.
	bool be_BList_AddItem_1(void *, void* , int32);
	
	bool be_BList_AddItem_2(void *, void* );
	bool be_BList_AddList_1(void *, void* , int32);
	bool be_BList_AddList_2(void *, void* );
	bool be_BList_RemoveItem_1(void *, void* );
	void* be_BList_RemoveItem_2(void *, int32);
	bool be_BList_RemoveItems(void *, int32, int32);
	bool be_BList_ReplaceItem(void *, int32, void*);
	void be_BList_MakeEmpty(void *);

	// Reorder items
	void be_BList_SortItems(void *, int function(void*, void*));
	bool be_BList_SwapItems(void *, int32, int32);
	bool be_BList_MoveItem(void *, int32, int32);

	// Retrieve items
	void* be_BList_ItemAt(void *, int32);
	void* be_BList_FirstItem(void *);
	void* be_BList_ItemAtFast(void *, int32);
									// does not check the array bounds!

	void* be_BList_LastItem(void *);
	void* be_BList_Items(void *);

	// Query
	bool be_BList_HasItem_1(void *, void*);
	bool be_BList_HasItem_2(void *, void*);
	int32 be_BList_IndexOf_1(void *, void*);
	int32 be_BList_IndexOf_2(void *, void*);
	int32 be_BList_CountItems(void *);
	bool be_BList_IsEmpty(void *);

	// Iteration
	void be_BList_DoForEach_1(void *, bool function(void* ));
	void be_BList_DoForEach_2(void *, bool function(void* , void* ), void* );
}

extern (C) {
	alias int function(void *, void *) compareFunc;
}

final class BList
{
public:
	mixin BObject;
	
	this(int32 count = 20) {
		if(fInstancePointer is null)
			fInstancePointer = be_BList_ctor_1(cast(void *)this, count);
	}
	
	this(BList anotherList) {
		if(fInstancePointer is null)
			fInstancePointer = be_BList_ctor_2(cast(void *)this, anotherList.fInstancePointer);
	}

	~this() {
		if(fInstancePointer)
			be_BList_dtor(fInstancePointer);
		fInstancePointer = null;
	}

//	void * be_BList_operator_assign(void *, void *);

	bool opEquals(BList other) {
		return be_BList_operator_equals(fInstancePointer, other.fInstancePointer);
	}
	
//	bool be_BList_operator_not_equals(void *, void *);
	
	// Adding and removing items.
	bool AddItem(void *item, int32 index) {
		return be_BList_AddItem_1(fInstancePointer, item, index);
	}
	
	bool AddItem(void *item) {
		return be_BList_AddItem_2(fInstancePointer, item);
	}
	
	bool AddList(void *list, int32 index) {
		return be_BList_AddList_1(fInstancePointer, list, index);
	}
	
	bool AddList(void *list) {
		return be_BList_AddList_2(fInstancePointer, list);
	}
	
	bool RemoveItem(void *item) {
		return be_BList_RemoveItem_1(fInstancePointer, item);
	}
	
	void* RemoveItem(int32 index) {
		return be_BList_RemoveItem_2(fInstancePointer, index);
	}
	
	bool RemoveItems(int32 index, int32 count) {
		return be_BList_RemoveItems(fInstancePointer, index, count);
	}
	
	bool ReplaceItem(int32 index, void *newItem) {
		return be_BList_ReplaceItem(fInstancePointer, index, newItem);
	}
	
	void MakeEmpty() {
		be_BList_MakeEmpty(fInstancePointer);
	}
	

	// Reorder items
	void SortItems(compareFunc func) {
		be_BList_SortItems(fInstancePointer, func);
	}
	
	bool SwapItems(int32 indexA, int32 indexB) {
		return be_BList_SwapItems(fInstancePointer, indexA, indexB);
	}
	
	bool MoveItem(int32 fromIndex, int32 toIndex) {
		return be_BList_MoveItem(fInstancePointer, fromIndex, toIndex);
	}

	// Retrieve items
	void* ItemAt(int32 index) {
		return be_BList_ItemAt(fInstancePointer, index);
	}
	
	void* FirstItem() {
		return be_BList_FirstItem(fInstancePointer);
	}
	
	void* ItemAtFast(int32 index) {
		return be_BList_ItemAtFast(fInstancePointer, index);
	}
									// does not check the array bounds!

	void* LastItem() {
		return be_BList_LastItem(fInstancePointer);
	}
	
	void* Items() {
		return be_BList_Items(fInstancePointer);
	}

	// Query
	bool HasItem(void *item) {
		return be_BList_HasItem_1(fInstancePointer, item);
	}
	
	int32 IndexOf(void *item) {
		return be_BList_IndexOf_1(fInstancePointer, item);
	}
	
	int32 CountItems() {
		return be_BList_CountItems(fInstancePointer);
	}
	
	bool IsEmpty() {
		return be_BList_IsEmpty(fInstancePointer);
	}

	// Iteration
/*
	void DoForEach(bool function(void *) func) {
		be_BList_DoForEach_1(fInstancePointer, func);
	}
	
	void DoForEach(bool function(void *, void *) func, void *arg2) {
		be_BList_DoForEach_2(fInstancePointer, func, arg2);
	}
*/
}
