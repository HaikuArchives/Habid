#include <storage/Statable.h>

#include <hcb-types.h>

#include <storage/HCB_Statable.h>

/* begin import functions */

extern "C" {
	status_t bind_BStatable_GetStat_pure(void *, struct stat *);
//	status_t bind_BStatable_set_stat_pure(void *, struct stat &, uint32);
}

/* end import functions */

/* begin class BStatableBridge */

BStatableBridge::BStatableBridge()
: BStatable() 
{ }
BStatableBridge::~BStatableBridge() 
{ }
	/* Pure virtual functions has to call back into D */
status_t BStatableBridge::GetStat(struct stat *st) const {
	return 0;
}

status_t BStatableBridge::set_stat(struct stat &st, uint32 what) {
	return 0;
}
	
status_t BStatableBridge::_GetStat(struct stat_beos *st) const {
	return 0;
}

/* end class BStatableBridge */

/* begin class BStatableProxy */

BStatableProxy::BStatableProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BStatableBridge()
{ }
BStatableProxy::~BStatableProxy()
{ }
	
status_t BStatableProxy::GetStat(struct stat *st) const {
	return bind_BStatable_GetStat_pure(fBindInstPointer, st);
}
/*	
status_t BStatableProxy::set_stat(struct stat &st, uint32 what) {
	return bind_BStatable_set_stat_pure(fBindInstPointer, st, what);
}
*/

/* end class BStatableBridge */

/* begin export functions */

extern "C" {
	be_BStatable * be_BStatable_ctor(void *bindInstPointer) {
		return (be_BStatable *)new BStatableProxy(bindInstPointer);
	}

	void be_BStatable_dtor(be_BStatable *obj) {
		delete (BStatableProxy *)obj;
	}
	
	
	status_t be_BStatable_GetNodeRef(be_BStatable *instPointer, node_ref *ref) {
		return ((BStatableProxy *)instPointer)->GetNodeRef(ref);
	}

	status_t be_BStatable_GetOwner(be_BStatable *instPointer, uid_t *owner) {
		return ((BStatableProxy *)instPointer)->GetOwner(owner);
	}
	status_t be_BStatable_SetOwner(be_BStatable *instPointer, uid_t owner) {
		return ((BStatableProxy *)instPointer)->SetOwner(owner);
	}

	status_t be_BStatable_GetGroup(be_BStatable *instPointer, gid_t *group) {
		return ((BStatableProxy *)instPointer)->GetGroup(group);
	}
	status_t be_BStatable_SetGroup(be_BStatable *instPointer, gid_t group) {
		return ((BStatableProxy *)instPointer)->SetGroup(group);
	}

	status_t be_BStatable_GetPermissions(be_BStatable *instPointer, mode_t *perms) {
		return ((BStatableProxy *)instPointer)->GetPermissions(perms);
	}
	status_t be_BStatable_SetPermissions(be_BStatable *instPointer, mode_t perms) {
		return ((BStatableProxy *)instPointer)->SetPermissions(perms);
	}

	status_t be_BStatable_GetSize(be_BStatable *instPointer, off_t *size) {
		return ((BStatableProxy *)instPointer)->GetSize(size);
	}

	status_t be_BStatable_GetModificationTime(be_BStatable *instPointer, time_t *mtime) {
		return ((BStatableProxy *)instPointer)->GetModificationTime(mtime);
	}
	status_t be_BStatable_SetModificationTime(be_BStatable *instPointer, time_t mtime) {
		return ((BStatableProxy *)instPointer)->SetModificationTime(mtime);
	}

	status_t be_BStatable_GetCreationTime(be_BStatable *instPointer, time_t *ctime) {
		return ((BStatableProxy *)instPointer)->GetCreationTime(ctime);
	}
	
	status_t be_BStatable_SetCreationTime(be_BStatable *instPointer, time_t ctime) {
		return ((BStatableProxy *)instPointer)->SetCreationTime(ctime);
	}

	status_t be_BStatable_GetAccessTime(be_BStatable *instPointer, time_t *atime) {
		return ((BStatableProxy *)instPointer)->GetAccessTime(atime);
	}
	
	status_t be_BStatable_SetAccessTime(be_BStatable *instPointer, time_t atime) {
		return ((BStatableProxy *)instPointer)->SetAccessTime(atime);
	}

	status_t be_BStatable_GetVolume(be_BStatable *instPointer, be_BVolume *vol) {
		return ((BStatableProxy *)instPointer)->GetVolume((BVolume *)vol);
	}
} 

/* end export functions */
