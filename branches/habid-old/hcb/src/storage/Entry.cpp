#include <storage/HCB_Entry.h>

#include <stdio.h>

extern "C" {
	status_t bind_BEntry_GetStat_virtual(void *, struct stat *);
}

/* begin class BEntryProxy */

BEntryProxy::BEntryProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BStatableProxy(fBindInstPointer), BEntry()
{ }

BEntryProxy::BEntryProxy(void *bindInstPointer, const BDirectory* dir, const char* path, bool traverse)
: fBindInstPointer(bindInstPointer), BStatableProxy(fBindInstPointer), BEntry(dir, path, traverse)
{ }

BEntryProxy::BEntryProxy(void *bindInstPointer, const entry_ref* ref, bool traverse)
: fBindInstPointer(bindInstPointer), BStatableProxy(fBindInstPointer), BEntry(ref, traverse)
{ }

BEntryProxy::BEntryProxy(void *bindInstPointer, const char* path, bool traverse)
: fBindInstPointer(bindInstPointer), BStatableProxy(fBindInstPointer), BEntry(path, traverse)
{ }

BEntryProxy::BEntryProxy(void *bindInstPointer, const BEntry& entry)
: fBindInstPointer(bindInstPointer), BStatableProxy(fBindInstPointer), BEntry(entry)
{ }

BEntryProxy::~BEntryProxy()
{ }

status_t	BEntryProxy::GetStat(struct stat *stat) const {
	return bind_BEntry_GetStat_virtual(fBindInstPointer, stat);
}

status_t	BEntryProxy::super_GetStat(struct stat *stat) const {
	return BEntry::GetStat(stat);
}

/* end class BEntryProxy */

#include <stdio.h>
extern "C" {
	be_BEntry * be_BEntry_ctor_1(void *bindInstPointer) {
		return (be_BEntry *)new BEntryProxy(bindInstPointer);
	}
	
	be_BEntry * be_BEntry_ctor_2(void *bindInstPointer, const be_BDirectory *dir, const char *path, bool traverse) {
		return (be_BEntry *)new BEntryProxy(bindInstPointer, (const BDirectory *)dir, path, traverse);
	}
	be_BEntry * be_BEntry_ctor_3(void *bindInstPointer, const entry_ref *ref, bool traverse) {
		return (be_BEntry *)new BEntryProxy(bindInstPointer, ref, traverse);
	}
	be_BEntry * be_BEntry_ctor_4(void *bindInstPointer, const char *path, bool traverse) {
		return (be_BEntry *)new BEntryProxy(bindInstPointer, path, traverse);
	}
	be_BEntry * be_BEntry_ctor_5(void *bindInstPointer, const be_BEntry *entry) {
		return (be_BEntry *)new BEntryProxy(bindInstPointer, *((const BEntry *)entry));
	}

	void be_BEntry_dtor(be_BEntry *instPointer) {
		delete (BEntryProxy *)instPointer;
	}
	
	status_t be_BEntry_InitCheck(be_BEntry *instPointer) {
		return ((BEntryProxy *)instPointer)->InitCheck();
	}

	bool be_BEntry_Exists(be_BEntry *instPointer) {
		return ((BEntryProxy *)instPointer)->Exists();
	}

	status_t be_BEntry_GetStat(be_BEntry *instPointer, struct stat* stat) {
		return ((BEntryProxy *)instPointer)->GetStat(stat);
	}
	status_t be_BEntry_GetStat_super(be_BEntry *instPointer, struct stat* stat) {
		return ((BEntryProxy *)instPointer)->super_GetStat(stat);
	}

	status_t be_BEntry_SetTo_1(be_BEntry *instPointer, const be_BDirectory* dir, const char* path, bool traverse) {
		return ((BEntryProxy *)instPointer)->SetTo((BDirectory *)dir, path, traverse);
	}
	
	status_t be_BEntry_SetTo_2(be_BEntry *instPointer, const entry_ref* ref, bool traverse) {
		return ((BEntryProxy *)instPointer)->SetTo(ref, traverse);
	}
	
	status_t be_BEntry_SetTo_3(be_BEntry *instPointer, const char* path, bool traverse) {
		return ((BEntryProxy *)instPointer)->SetTo(path, traverse);
	}
	
	void be_BEntry_Unset(be_BEntry *instPointer) {
		return ((BEntryProxy *)instPointer)->Unset();
	}

	status_t be_BEntry_GetRef(be_BEntry *instPointer, entry_ref* ref) {
		return ((BEntryProxy *)instPointer)->GetRef(ref);
	}
	
	status_t be_BEntry_GetPath(be_BEntry *instPointer, be_BPath* path) {
		return ((BEntryProxy *)instPointer)->GetPath((BPath *)path);
	}
	
	status_t be_BEntry_GetParent_1(be_BEntry *instPointer, be_BEntry* entry) {
		return ((BEntryProxy *)instPointer)->GetParent((BEntry *)entry);
	}
	
	status_t be_BEntry_GetParent_2(be_BEntry *instPointer, be_BDirectory* dir) {
		return ((BEntryProxy *)instPointer)->GetParent((BDirectory *)dir);
	}
	
	status_t be_BEntry_GetName(be_BEntry *instPointer, char* buffer) {
		return ((BEntryProxy *)instPointer)->GetName(buffer);
	}

	status_t be_BEntry_Rename(be_BEntry *instPointer, const char* path, bool clobber) {
		return ((BEntryProxy *)instPointer)->Rename(path, clobber);
	}
	
	status_t be_BEntry_MoveTo(be_BEntry *instPointer, be_BDirectory* dir, const char* path, bool clobber) {
		return ((BEntryProxy *)instPointer)->MoveTo((BDirectory *)dir, path, clobber);
	}
	
	status_t be_BEntry_Remove(be_BEntry *instPointer) {
		return ((BEntryProxy *)instPointer)->Remove();
	}
	
	status_t be_BEntry_operator_equals(be_BEntry *instPointer, const be_BEntry *item) {
		return ((BEntryProxy *)instPointer)->operator==(*(const BEntryProxy *)item);
	}
	
	status_t be_BEntry_operator_notequals(be_BEntry *instPointer, const be_BEntry *item) {
		return ((BEntryProxy *)instPointer)->operator!=(*(const BEntryProxy *)item);
	}
/*
	be_BEntry * be_BEntry_operator_assign(be_BEntry *instPointer, const be_BEntry *item) {
		return (be_BEntry *)&(((BEntryProxy *)instPointer)->operator=(*(const BEntryProxy *)item));
	}
*/
}

