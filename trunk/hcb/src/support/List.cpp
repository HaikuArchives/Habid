#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_List.h>

/* begin import functions */

extern "C" {
}

/* end import functions */

/* begin class BListBridge */

BListBridge::BListBridge(int32 count)
: BList(count)
{ }

BListBridge::BListBridge(const BList & anotherList)
: BList(anotherList)
{ }

BListBridge::~BListBridge()
{ }

/* end class BListBridge */

/* begin class BListProxy */

BListProxy::BListProxy(void *bindInstPointer, int32 count)
: fBindInstPointer(bindInstPointer), BListBridge(count)
{ }

BListProxy::BListProxy(void *bindInstPointer, const BList & anotherList)
: fBindInstPointer(bindInstPointer), BListBridge(anotherList)
{ }

BListProxy::~BListProxy()
{ }

	
/* end class BListProxy */

/* begin export functions */
 
extern "C" {
	be_BList * be_BList_ctor_1(void *bindInstPointer, int32 count) {
		return (be_BList *)new BListProxy(bindInstPointer, count);
	}
	
	be_BList * be_BList_ctor_2(void *bindInstPointer, const be_BList *anotherList) {
		return (be_BList *)new BListProxy(bindInstPointer, *(BList *)anotherList);
	}
	
	void be_BList_dtor(be_BList *instPointer) {
		delete (BListProxy *)instPointer;
	}
	
	be_BList * be_BList_operator_assign(be_BList *instPointer, const be_BList *other) {
		return (be_BList *)&((BList *)instPointer)->operator=(*(BList *)other);
	}
	
	bool be_BList_operator_equals(be_BList *instPointer, const be_BList *other) {
		return ((BList *)instPointer)->operator==(*(BList *)other);
	}
	
	bool be_BList_operator_not_equals(be_BList *instPointer, const be_BList *other) {
		return ((BList *)instPointer)->operator!=(*(BList *)other);
	}
	
/*
	BList&				operator=(const BList& other);
	bool				operator==(const BList& other);
	bool				operator!=(const BList& other);
*/
	// Adding and removing items.
	bool be_BList_AddItem_1(be_BList *instPointer, void* item, int32 index) {
		return ((BListProxy *)instPointer)->AddItem(item, index);
	}
	
	bool be_BList_AddItem_2(be_BList *instPointer, void* item) {
		return ((BListProxy *)instPointer)->AddItem(item);
	}
	bool be_BList_AddList_1(be_BList *instPointer, const be_BList* list, int32 index) {
		return ((BListProxy *)instPointer)->AddList((BList *)list, index);
	}
	bool be_BList_AddList_2(be_BList *instPointer, const be_BList* list) {
		return ((BListProxy *)instPointer)->AddList((BList *)list);
	}

	bool be_BList_RemoveItem_1(be_BList *instPointer, void* item) {
		return ((BListProxy *)instPointer)->RemoveItem(item);
	}
	void* be_BList_RemoveItem_2(be_BList *instPointer, int32 index) {
		return ((BListProxy *)instPointer)->RemoveItem(index);
	}
	bool be_BList_RemoveItems(be_BList *instPointer, int32 index, int32 count) {
		return ((BListProxy *)instPointer)->RemoveItems(index, count);
	}
	bool be_BList_ReplaceItem(be_BList *instPointer, int32 index, void* newItem) {
		return ((BListProxy *)instPointer)->ReplaceItem(index, newItem);
	}

	void be_BList_MakeEmpty(be_BList *instPointer) {
		return ((BListProxy *)instPointer)->MakeEmpty();
	}

	// Reorder items
	void be_BList_SortItems(be_BList *instPointer, int (*compareFunc)(const void*, const void*)) {
		return ((BListProxy *)instPointer)->SortItems(compareFunc);
	}
	bool be_BList_SwapItems(be_BList *instPointer, int32 indexA, int32 indexB) {
		return ((BListProxy *)instPointer)->SwapItems(indexA, indexB);
	}
	bool be_BList_MoveItem(be_BList *instPointer, int32 fromIndex, int32 toIndex) {
		return ((BListProxy *)instPointer)->MoveItem(fromIndex, toIndex);
	}

	// Retrieve items
	void* be_BList_ItemAt(be_BList *instPointer, int32 index) {
		return ((BListProxy *)instPointer)->ItemAt(index);
	}
	void* be_BList_FirstItem(be_BList *instPointer) {
		return ((BListProxy *)instPointer)->FirstItem();
	}
	void* be_BList_ItemAtFast(be_BList *instPointer, int32 index) {
		return ((BListProxy *)instPointer)->ItemAtFast(index);
	}
									// does not check the array bounds!

	void* be_BList_LastItem(be_BList *instPointer) {
		return ((BListProxy *)instPointer)->LastItem();
	}
	void* be_BList_Items(be_BList *instPointer) {
		return ((BListProxy *)instPointer)->Items();
	}

	// Query
	bool be_BList_HasItem_1(be_BList *instPointer, void* item) {
		return ((BListProxy *)instPointer)->HasItem(item);
	}
	bool be_BList_HasItem_2(be_BList *instPointer, const void* item) {
		return ((BListProxy *)instPointer)->HasItem(item);
	}
	int32 be_BList_IndexOf_1(be_BList *instPointer, void* item) {
		return ((BListProxy *)instPointer)->IndexOf(item);
	}
	int32 be_BList_IndexOf_2(be_BList *instPointer, const void* item) {
		return ((BListProxy *)instPointer)->IndexOf(item);
	}
	int32 be_BList_CountItems(be_BList *instPointer) {
		return ((BListProxy *)instPointer)->CountItems();
	}
	bool be_BList_IsEmpty(be_BList *instPointer) {
		return ((BListProxy *)instPointer)->IsEmpty();
	}

	// Iteration
	void be_BList_DoForEach_1(be_BList *instPointer, bool (*func)(void* item)) {
		return ((BListProxy *)instPointer)->DoForEach(func);
	}
	void be_BList_DoForEach_2(be_BList *instPointer, bool (*func)(void* item, void* arg2), void* arg2) {
		return ((BListProxy *)instPointer)->DoForEach(func, arg2);
	}
}

/* end export functions */

