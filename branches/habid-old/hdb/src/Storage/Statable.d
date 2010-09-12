module Storage.Statable;

import tango.stdc.stdlib;
import tango.stdc.posix.sys.types;
import tango.stdc.posix.sys.stat;

import Support.BObject;
import Support.SupportDefs;
import Storage.StorageDefs;

import Storage.Node;
import Storage.Volume;

import Support.types;

extern (C) extern {
	be_BStatable *  be_BStatable_ctor(be_BStatable * bindInstPointer);


	void be_BStatable_dtor(be_BStatable * obj);
	
	status_t be_BStatable_GetNodeRef(be_BStatable * , node_ref *);
	status_t be_BStatable_GetOwner(be_BStatable * , uid_t *);
	status_t be_BStatable_SetOwner(be_BStatable * , uid_t );
	status_t be_BStatable_GetGroup(be_BStatable * , gid_t *);
	status_t be_BStatable_SetGroup(be_BStatable * , gid_t);
	status_t be_BStatable_GetPermissions(be_BStatable * , mode_t *);
	status_t be_BStatable_SetPermissions(be_BStatable * , mode_t);
	status_t be_BStatable_GetSize(be_BStatable * , off_t *);
	status_t be_BStatable_GetModificationTime(be_BStatable * , time_t *);
	status_t be_BStatable_SetModificationTime(be_BStatable * , time_t);
	status_t be_BStatable_GetCreationTime(be_BStatable * , time_t *);
	status_t be_BStatable_SetCreationTime(be_BStatable * , time_t );
	status_t be_BStatable_GetAccessTime(be_BStatable * , time_t *);
	status_t be_BStatable_SetAccessTime(be_BStatable * , time_t);
	status_t be_BStatable_GetVolume(be_BStatable * , be_BVolume * );
}


extern (C) {
	status_t bind_BStatable_GetStat_pure(be_BStatable * bindInstPointer, stat_t *st) {
		return (cast(BStatable)bindInstPointer).GetStat(*st);
	}
/*	
	status_t bind_BStatable_set_stat_pure(be_BStatable * bindInstPointer, ref stat st, uint32 what) {
		return (cast(BStatable)bindInstPointer).set_stat(st, what);
	}
*/
}


class BStatable
{
public:
	mixin(BObject!("be_BStatable", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BStatable_ctor(cast(be_BStatable * )this);
	}

	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BStatable_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	abstract status_t GetStat(ref stat_t st);
//	abstract status_t set_stat(ref stat st, uint32 what);
	
	final status_t GetNodeRef(ref node_ref reference) {
		return be_BStatable_GetNodeRef(fInstancePointer, &reference);
	}

	final status_t GetOwner(ref uid_t owner) {
		return be_BStatable_GetOwner(fInstancePointer, &owner);
	}

	final status_t SetOwner(uid_t owner) {
		return be_BStatable_SetOwner(fInstancePointer, owner);
	}

	final status_t GetGroup(ref gid_t group) {
		return be_BStatable_GetGroup(fInstancePointer, &group);
	}

	final status_t SetGroup(gid_t group) {
		return be_BStatable_SetGroup(fInstancePointer, group);
	}

	final status_t GetPermissions(ref mode_t perms) {
		return be_BStatable_GetPermissions(fInstancePointer, &perms);
	}

	final status_t SetPermissions(mode_t perms) {
		return be_BStatable_SetPermissions(fInstancePointer, perms);
	}

	final status_t GetSize(ref off_t size) {
		return be_BStatable_GetSize(fInstancePointer, &size);
	}

	final status_t GetModificationTime(ref time_t mtime) {
		return be_BStatable_GetModificationTime(fInstancePointer, &mtime);
	}

	final status_t SetModificationTime(time_t mtime) {
		return be_BStatable_SetModificationTime(fInstancePointer, mtime);
	}

	final status_t GetCreationTime(ref time_t ctime) {
		return be_BStatable_GetCreationTime(fInstancePointer, &ctime);
	}

	final status_t SetCreationTime(time_t ctime) {
		return be_BStatable_SetCreationTime(fInstancePointer, ctime);
	}

	final status_t GetAccessTime(ref time_t atime) {
		return be_BStatable_GetAccessTime(fInstancePointer, &atime);
	}

	final status_t SetAccessTime(time_t atime) {
		return be_BStatable_SetAccessTime(fInstancePointer, atime);
	}

	final status_t GetVolume(BVolume vol) {
		return be_BStatable_GetVolume(fInstancePointer, vol.fInstancePointer);
	}
}
