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

extern (C) extern {
	void *be_BEntryList_ctor(void *bindInstPointer);
	void be_BEntryList_dtor(void *instPointer);
}

extern (C) {
	status_t bind_BEntryList_GetNextEntry_pure(void *instPointer, void *entry, bool traverse) {
		return (cast(BEntryList *)instPointer).GetNextEntry(cast(BEntry)entry, traverse);
	}
	
	status_t bind_BEntryList_GetNextRef_pure(void *instPointer, entry_ref *reference) {
		return (cast(BEntryList *)instPointer).GetNextRef(*reference);
	}
	
	int32 bind_BEntryList_GetNextDirents_pure(void *instPointer, dirent *buf, size_t length, int32 count) {
		return (cast(BEntryList *)instPointer).GetNextDirents(buf[0..length], count);
	}
	
	status_t bind_BEntryList_Rewind_pure(void *instPointer) {
		return (cast(BEntryList *)instPointer).Rewind();
	}
	int32 bind_BEntryList_CountEntries_pure(void *instPointer) {
		return (cast(BEntryList *)instPointer).CountEntries();
	}
}

class BEntryList
{
public:
	mixin BObject;
	
	this() {
		if(fInstancePointer is null) {
			fInstancePointer = be_BEntryList_ctor(cast(void *)this);
		}
	}
	
	~this() {
		if(fInstancePointer !is null)
			be_BEntryList_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	abstract status_t GetNextEntry(BEntry entry, bool traverse = false);
	abstract status_t GetNextRef(ref entry_ref reference);
	abstract int32 GetNextDirents(dirent [] buf, int32 count);
	abstract status_t Rewind();
	abstract int32 CountEntries();
}
