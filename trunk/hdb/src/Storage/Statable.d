module Storage.Statable;

import tango.stdc.stdlib;
import tango.stdc.posix.sys.types;

import Support.BObject;
import Support.SupportDefs;
import Storage.StorageDefs;

import Storage.Node;
import Storage.Volume;

struct stat
{
	int dummy;
}

extern (C) extern {
	void * be_BStatable_ctor(void *bindInstPointer);


	void be_BStatable_dtor(void *obj);
	
	status_t be_BStatable_GetNodeRef(void *, node_ref *);
	status_t be_BStatable_GetOwner(void *, uid_t *);
	status_t be_BStatable_SetOwner(void *, uid_t );
	status_t be_BStatable_GetGroup(void *, gid_t *);
	status_t be_BStatable_SetGroup(void *, gid_t);
	status_t be_BStatable_GetPermissions(void *, mode_t *);
	status_t be_BStatable_SetPermissions(void *, mode_t);
	status_t be_BStatable_GetSize(void *, off_t *);
	status_t be_BStatable_GetModificationTime(void *, time_t *);
	status_t be_BStatable_SetModificationTime(void *, time_t);
	status_t be_BStatable_GetCreationTime(void *, time_t *);
	status_t be_BStatable_SetCreationTime(void *, time_t );
	status_t be_BStatable_GetAccessTime(void *, time_t *);
	status_t be_BStatable_SetAccessTime(void *, time_t);
	status_t be_BStatable_GetVolume(void *, void *);
}


extern (C) {
	status_t bind_BStatable_GetStat_pure(void *bindInstPointer, out stat st) {
		return (cast(BStatable)bindInstPointer).GetStat(st);
	}
	
	status_t bind_BStatable_set_stat_pure(void *bindInstPointer, out stat st, uint32 what) {
		return (cast(BStatable)bindInstPointer).set_stat(st, what);
	}
}


class BStatable
{
	mixin BObject;

	this() {
		fInstancePointer = be_BStatable_ctor(cast(void *)this);
	}

	~this() {
		if(fInstancePointer !is null)
			be_BStatable_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	abstract status_t GetStat(ref stat st);
	abstract status_t set_stat(ref stat st, uint32 what);
	
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
