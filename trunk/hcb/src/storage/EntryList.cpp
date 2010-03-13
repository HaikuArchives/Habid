#include <hcb-types.h>

#include <storage/HCB_EntryList.h>

extern "C" {
	status_t bind_BEntryList_GetNextEntry_pure(void *, BEntry *entry, bool traverse);
	status_t bind_BEntryList_GetNextRef_pure(void *, entry_ref *ref);
	int32 bind_BEntryList_GetNextDirents_pure(void *, struct dirent *buf, size_t length, int32 count);
	status_t bind_BEntryList_Rewind_pure(void *);
	int32 bind_BEntryList_CountEntries_pure(void *);	
}

BEntryListBridge::BEntryListBridge()
: BEntryList()
{ }

BEntryListBridge::~BEntryListBridge()
{ }

status_t BEntryListBridge::GetNextEntry(BEntry *entry, bool traverse) {
	return 0;
}

status_t BEntryListBridge::GetNextRef(entry_ref *ref) {
	return 0;
}

int32 BEntryListBridge::GetNextDirents(struct dirent *buf, size_t length, int32 count) {
	return 0;
}

status_t BEntryListBridge::Rewind() {
	return 0;
}

int32 BEntryListBridge::CountEntries() {
	return 0;
}



BEntryListProxy::BEntryListProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BEntryListBridge()
{ }

BEntryListProxy::~BEntryListProxy()
{ }

status_t BEntryListProxy::GetNextEntry(BEntry *entry, bool traverse) {
	return bind_BEntryList_GetNextEntry_pure(fBindInstPointer, entry, traverse);
}

status_t BEntryListProxy::GetNextRef(entry_ref *ref) {
	return bind_BEntryList_GetNextRef_pure(fBindInstPointer, ref);
}

int32 BEntryListProxy::GetNextDirents(struct dirent *buf, size_t length, int32 count) {
	return bind_BEntryList_GetNextDirents_pure(fBindInstPointer, buf, length, count);
}

status_t BEntryListProxy::Rewind() {
	return bind_BEntryList_Rewind_pure(fBindInstPointer);
}

int32 BEntryListProxy::CountEntries() {
	return bind_BEntryList_CountEntries_pure(fBindInstPointer);
}

extern "C" {
	be_BEntryList *be_BEntryList_ctor(void *bindInstPointer) {
		return (be_BEntryList *)new BEntryListProxy(bindInstPointer);
	}
	
	void be_BEntryList_dtor(be_BEntryList *instPointer) {
		delete (BEntryListProxy *)instPointer;
	}
}
