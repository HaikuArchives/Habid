module Storage.EntryList;

import Support.BObject;

import Storage.Entry;

import Storage.Statable;

import Support.SupportDefs;
import Storage.StorageDefs;

import tango.stdc.posix.sys.types;
import tango.stdc.posix.dirent;

import tango.stdc.stringz;
import tango.stdc.string;

import Support.types;

extern (C) extern {
	be_BEntryList * be_BEntryList_ctor(be_BEntryList * bindInstPointer);
	void be_BEntryList_dtor(be_BEntryList * instPointer);
}

extern (C) {
	status_t bind_BEntryList_GetNextEntry_pure(be_BEntryList *instPointer, be_BEntry *entry, bool traverse) {
		return (cast(BEntryList *)instPointer).GetNextEntry(cast(BEntry)entry, traverse);
	}
	
	status_t bind_BEntryList_GetNextRef_pure(be_BEntryList * instPointer, entry_ref *reference) {
		return (cast(BEntryList *)instPointer).GetNextRef(*reference);
	}
	
	int32 bind_BEntryList_GetNextDirents_pure(be_BEntryList * instPointer, dirent *buf, size_t length, int32 count) {
		return (cast(BEntryList *)instPointer).GetNextDirents(buf[0..length], count);
	}
	
	status_t bind_BEntryList_Rewind_pure(be_BEntryList * instPointer) {
		return (cast(BEntryList *)instPointer).Rewind();
	}
	int32 bind_BEntryList_CountEntries_pure(be_BEntryList * instPointer) {
		return (cast(BEntryList *)instPointer).CountEntries();
	}
}

class BEntryList
{
public:
	mixin(BObject!("be_BEntryList", true, null));
	
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BEntryList_ctor(cast(be_BEntryList *)this);
		}
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BEntryList_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	abstract status_t GetNextEntry(BEntry entry, bool traverse = false);
	abstract status_t GetNextRef(ref entry_ref reference);
	abstract int32 GetNextDirents(dirent [] buf, int32 count);
	abstract status_t Rewind();
	abstract int32 CountEntries();
}
