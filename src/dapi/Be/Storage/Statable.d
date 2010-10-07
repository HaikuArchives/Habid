/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Storage.Statable;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;

import Be.Storage.Node;
import Be.Storage.Directory;
import Be.Storage.Volume;

import tango.stdc.posix.sys.stat;


/* helper struct allowing us to avoid problems with the st_*time macros */
struct stat_beos_time {
	time_t	tv_sec;
}


struct stat_beos {
	dev_t			st_dev;			/* device ID that this file resides on */
	ino_t			st_ino;			/* this file's serial inode ID */
	mode_t			st_mode;		/* file mode (rwx for user, group, etc) */
	nlink_t			st_nlink;		/* number of hard links to this file */
	uid_t			st_uid;			/* user ID of the owner of this file */
	gid_t			st_gid;			/* group ID of the owner of this file */
	off_t			st_size;		/* size in bytes of this file */
	dev_t			st_rdev;		/* device type (not used) */
	blksize_t		st_blksize;		/* preferred block size for I/O */
	stat_beos_time	st_atim;		/* last access time */
	stat_beos_time	st_mtim;		/* last modification time */
	stat_beos_time	st_ctim;		/* last change time, not creation time */
	stat_beos_time	st_crtim;		/* creation time */
}




extern (C) extern {
	// BStatableProxy * be_BStatable_ctor(void *bindInstPtr);
	void * be_BStatable_ctor(void *bindInstPtr);

	// void be_BStatable_dtor(BStatable* self);
	void be_BStatable_dtor(void* self);

	// status_t be_BStatable_GetStat(BStatableProxy *self, struct stat * st);
	status_t be_BStatable_GetStat(void *self, stat_t * st);

	// status_t be_BStatable__GetStat(BStatableProxy *self, struct stat_beos * st);
	status_t be_BStatable__GetStat(void *self, stat_beos * st);

	// bool be_BStatable_IsFile(BStatableProxy *self);
	bool be_BStatable_IsFile(void *self);

	// bool be_BStatable_IsDirectory(BStatableProxy *self);
	bool be_BStatable_IsDirectory(void *self);

	// bool be_BStatable_IsSymLink(BStatableProxy *self);
	bool be_BStatable_IsSymLink(void *self);

	// status_t be_BStatable_GetNodeRef(BStatableProxy *self, node_ref * _ref);
	status_t be_BStatable_GetNodeRef(void *self, node_ref * _ref);

	// status_t be_BStatable_GetOwner(BStatableProxy *self, uid_t * owner);
	status_t be_BStatable_GetOwner(void *self, uid_t * owner);

	// status_t be_BStatable_SetOwner(BStatableProxy *self, uid_t owner);
	status_t be_BStatable_SetOwner(void *self, uid_t owner);

	// status_t be_BStatable_GetGroup(BStatableProxy *self, gid_t * group);
	status_t be_BStatable_GetGroup(void *self, gid_t * group);

	// status_t be_BStatable_SetGroup(BStatableProxy *self, gid_t group);
	status_t be_BStatable_SetGroup(void *self, gid_t group);

	// status_t be_BStatable_GetPermissions(BStatableProxy *self, mode_t * perms);
	status_t be_BStatable_GetPermissions(void *self, mode_t * perms);

	// status_t be_BStatable_SetPermissions(BStatableProxy *self, mode_t perms);
	status_t be_BStatable_SetPermissions(void *self, mode_t perms);

	// status_t be_BStatable_GetSize(BStatableProxy *self, off_t * size);
	status_t be_BStatable_GetSize(void *self, off_t * size);

	// status_t be_BStatable_GetModificationTime(BStatableProxy *self, time_t * mtime);
	status_t be_BStatable_GetModificationTime(void *self, time_t * mtime);

	// status_t be_BStatable_SetModificationTime(BStatableProxy *self, time_t mtime);
	status_t be_BStatable_SetModificationTime(void *self, time_t mtime);

	// status_t be_BStatable_GetCreationTime(BStatableProxy *self, time_t * ctime);
	status_t be_BStatable_GetCreationTime(void *self, time_t * ctime);

	// status_t be_BStatable_SetCreationTime(BStatableProxy *self, time_t ctime);
	status_t be_BStatable_SetCreationTime(void *self, time_t ctime);

	// status_t be_BStatable_GetAccessTime(BStatableProxy *self, time_t * atime);
	status_t be_BStatable_GetAccessTime(void *self, time_t * atime);

	// status_t be_BStatable_SetAccessTime(BStatableProxy *self, time_t atime);
	status_t be_BStatable_SetAccessTime(void *self, time_t atime);

	// status_t be_BStatable_GetVolume(BStatableProxy *self, BVolume * vol);
	status_t be_BStatable_GetVolume(void *self, void * vol);

	// status_t be_BStatable_set_stat(BStatableProxy *self, struct stat * st, uint32 what);
	status_t be_BStatable_set_stat(void *self, stat_t * st, uint32 what);

}


extern (C) {
	status_t bind_BStatable_GetStat(void *bindInstPtr, stat_t * st) {
		assert(false, "bind_BStatable_GetStat(void *bindInstPtr, struct stat * st) Unimplemented");
	}

	status_t bind_BStatable__GetStat(void *bindInstPtr, stat_beos * st) {
		assert(false, "bind_BStatable__GetStat(void *bindInstPtr, struct stat_beos * st) Unimplemented");
	}

	status_t bind_BStatable_set_stat(void *bindInstPtr, stat_t * st, uint32 what) {
		assert(false, "bind_BStatable_set_stat(void *bindInstPtr, struct stat * st, uint32 what) Unimplemented");
	}

}


interface IBStatable
{
	// status_t be_BStatable_GetStat(BStatable *self, struct stat * st);
	status_t GetStat(inout stat_t);

	// status_t be_BStatable__GetStat(BStatable *self, struct stat_beos * st);
	status_t _GetStat(inout stat_beos);

	// bool be_BStatable_IsFile(BStatable *self);
	bool IsFile();

	// bool be_BStatable_IsDirectory(BStatable *self);
	bool IsDirectory();

	// bool be_BStatable_IsSymLink(BStatable *self);
	bool IsSymLink();

	// status_t be_BStatable_GetNodeRef(BStatable *self, node_ref * _ref);
	status_t GetNodeRef(inout node_ref);

	// status_t be_BStatable_GetOwner(BStatable *self, uid_t * owner);
	status_t GetOwner(inout uid_t);

	// status_t be_BStatable_SetOwner(BStatable *self, uid_t owner);
	status_t SetOwner(uid_t);

	// status_t be_BStatable_GetGroup(BStatable *self, gid_t * group);
	status_t GetGroup(inout gid_t);

	// status_t be_BStatable_SetGroup(BStatable *self, gid_t group);
	status_t SetGroup(gid_t);

	// status_t be_BStatable_GetPermissions(BStatable *self, mode_t * perms);
	status_t GetPermissions(inout mode_t);

	// status_t be_BStatable_SetPermissions(BStatable *self, mode_t perms);
	status_t SetPermissions(mode_t);

	// status_t be_BStatable_GetSize(BStatable *self, off_t * size);
	status_t GetSize(inout off_t);

	// status_t be_BStatable_GetModificationTime(BStatable *self, time_t * mtime);
	status_t GetModificationTime(inout time_t);

	// status_t be_BStatable_SetModificationTime(BStatable *self, time_t mtime);
	status_t SetModificationTime(time_t);

	// status_t be_BStatable_GetCreationTime(BStatable *self, time_t * ctime);
	status_t GetCreationTime(inout time_t);

	// status_t be_BStatable_SetCreationTime(BStatable *self, time_t ctime);
	status_t SetCreationTime(time_t);

	// status_t be_BStatable_GetAccessTime(BStatable *self, time_t * atime);
	status_t GetAccessTime(inout time_t);

	// status_t be_BStatable_SetAccessTime(BStatable *self, time_t atime);
	status_t SetAccessTime(time_t);

	// status_t be_BStatable_GetVolume(BStatable *self, BVolume * vol);
	status_t GetVolume(BVolume);

	// status_t be_BStatable_set_stat(BStatable *self, struct stat & st, uint32 what);
	status_t set_stat(stat_t, uint32);

	void * _InstPtr();
	void _InstPtr(void *ptr);
	
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

class BStatable : IBStatable
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// BStatableProxy * be_BStatable_ctor(void *bindInstPtr);
	this() {
		if(_InstPtr is null) {
			_InstPtr = be_BStatable_ctor(cast(void *)this);
			_OwnsPtr = true;
		}
	}

	// void be_BStatable_dtor(BStatable* self);
	~this() {
		if(_InstPtr !is null && _OwnsPtr) {
			be_BStatable_dtor(_InstPtr());
			_InstPtr = null;
			_OwnsPtr = false;
		}
	}

	// status_t be_BStatable_GetStat(BStatable *self, struct stat * st);
	status_t GetStat(inout stat_t st) {
		return be_BStatable_GetStat(_InstPtr(), &st);
	}

	// status_t be_BStatable__GetStat(BStatable *self, struct stat_beos * st);
	status_t _GetStat(inout stat_beos st) {
		return be_BStatable__GetStat(_InstPtr(), &st);
	}

	// bool be_BStatable_IsFile(BStatable *self);
	bool IsFile() {
		return be_BStatable_IsFile(_InstPtr());
	}

	// bool be_BStatable_IsDirectory(BStatable *self);
	bool IsDirectory() {
		return be_BStatable_IsDirectory(_InstPtr());
	}

	// bool be_BStatable_IsSymLink(BStatable *self);
	bool IsSymLink() {
		return be_BStatable_IsSymLink(_InstPtr());
	}

	// status_t be_BStatable_GetNodeRef(BStatable *self, node_ref * _ref);
	status_t GetNodeRef(inout node_ref _ref) {
		return be_BStatable_GetNodeRef(_InstPtr(), &_ref);
	}

	// status_t be_BStatable_GetOwner(BStatable *self, uid_t * owner);
	status_t GetOwner(inout uid_t owner) {
		return be_BStatable_GetOwner(_InstPtr(), &owner);
	}

	// status_t be_BStatable_SetOwner(BStatable *self, uid_t owner);
	status_t SetOwner(uid_t owner) {
		return be_BStatable_SetOwner(_InstPtr(), owner);
	}

	// status_t be_BStatable_GetGroup(BStatable *self, gid_t * group);
	status_t GetGroup(inout gid_t group) {
		return be_BStatable_GetGroup(_InstPtr(), &group);
	}

	// status_t be_BStatable_SetGroup(BStatable *self, gid_t group);
	status_t SetGroup(gid_t group) {
		return be_BStatable_SetGroup(_InstPtr(), group);
	}

	// status_t be_BStatable_GetPermissions(BStatable *self, mode_t * perms);
	status_t GetPermissions(inout mode_t perms) {
		return be_BStatable_GetPermissions(_InstPtr(), &perms);
	}

	// status_t be_BStatable_SetPermissions(BStatable *self, mode_t perms);
	status_t SetPermissions(mode_t perms) {
		return be_BStatable_SetPermissions(_InstPtr(), perms);
	}

	// status_t be_BStatable_GetSize(BStatable *self, off_t * size);
	status_t GetSize(inout off_t size) {
		return be_BStatable_GetSize(_InstPtr(), &size);
	}

	// status_t be_BStatable_GetModificationTime(BStatable *self, time_t * mtime);
	status_t GetModificationTime(inout time_t mtime) {
		return be_BStatable_GetModificationTime(_InstPtr(), &mtime);
	}

	// status_t be_BStatable_SetModificationTime(BStatable *self, time_t mtime);
	status_t SetModificationTime(time_t mtime) {
		return be_BStatable_SetModificationTime(_InstPtr(), mtime);
	}

	// status_t be_BStatable_GetCreationTime(BStatable *self, time_t * ctime);
	status_t GetCreationTime(inout time_t ctime) {
		return be_BStatable_GetCreationTime(_InstPtr(), &ctime);
	}

	// status_t be_BStatable_SetCreationTime(BStatable *self, time_t ctime);
	status_t SetCreationTime(time_t ctime) {
		return be_BStatable_SetCreationTime(_InstPtr(), ctime);
	}

	// status_t be_BStatable_GetAccessTime(BStatable *self, time_t * atime);
	status_t GetAccessTime(inout time_t atime) {
		return be_BStatable_GetAccessTime(_InstPtr(), &atime);
	}

	// status_t be_BStatable_SetAccessTime(BStatable *self, time_t atime);
	status_t SetAccessTime(time_t atime) {
		return be_BStatable_SetAccessTime(_InstPtr(), atime);
	}

	// status_t be_BStatable_GetVolume(BStatable *self, BVolume * vol);
	status_t GetVolume(BVolume vol) {
		return be_BStatable_GetVolume(_InstPtr(), vol._InstPtr());
	}

	// status_t be_BStatable_set_stat(BStatable *self, struct stat & st, uint32 what);
	status_t set_stat(stat_t st, uint32 what) {
		return be_BStatable_set_stat(_InstPtr(), &st, what);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


