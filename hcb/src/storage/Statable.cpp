#include <storage/Statable.h>

#include <hcb-types.h>

extern "C" {
	status_t bind_BStatable_GetStat_pure(void *, struct stat *);
	status_t bind_BStatable_set_stat_pure(void *, struct stat &, uint32);
//	status_t bind_BStatable__GetStat(void *, struct stat_beos *);
}

class BStatableBridge : public BStatable
{
private:
	void *fBindInstPointer;
public:
	BStatableBridge(void *bindInstPointer) : fBindInstPointer(bindInstPointer),
											 BStatable() {}

	~BStatableBridge() {}

	/* Pure virtual functions has to call back into D */
	status_t GetStat(struct stat *st) const {
		return bind_BStatable_GetStat_pure(fBindInstPointer, st);
	}

	status_t set_stat(struct stat &st, uint32 what) {
		return bind_BStatable_set_stat_pure(fBindInstPointer, st, what);
	}
	
	status_t _GetStat(struct stat_beos *st) const {
//		return bind_BStatable__GetStat(fBindInstPointer, st);
		/*	
			This is here for beos compatability only, so lets just shut the
			compiler up and be done with it, we do not care about BeOS compat
			in other languages anyhow i guess =) Kick me if im wrong? :)
		*/
		return 0;
	}
};


extern "C" {
	be_BStatable * be_BStatable_ctor(void *bindInstPointer) {
		return (be_BStatable *)new BStatableBridge(bindInstPointer);
	}

	void be_BStatable_dtor(be_BStatable *obj) {
		delete (BStatableBridge *)obj;
	}
	
	
	status_t be_BStatable_GetNodeRef(be_BStatable *instPointer, node_ref *ref) {
		return ((BStatableBridge *)instPointer)->GetNodeRef(ref);
	}

	status_t be_BStatable_GetOwner(be_BStatable *instPointer, uid_t *owner) {
		return ((BStatableBridge *)instPointer)->GetOwner(owner);
	}
	status_t be_BStatable_SetOwner(be_BStatable *instPointer, uid_t owner) {
		return ((BStatableBridge *)instPointer)->SetOwner(owner);
	}

	status_t be_BStatable_GetGroup(be_BStatable *instPointer, gid_t *group) {
		return ((BStatableBridge *)instPointer)->GetGroup(group);
	}
	status_t be_BStatable_SetGroup(be_BStatable *instPointer, gid_t group) {
		return ((BStatableBridge *)instPointer)->SetGroup(group);
	}

	status_t be_BStatable_GetPermissions(be_BStatable *instPointer, mode_t *perms) {
		return ((BStatableBridge *)instPointer)->GetPermissions(perms);
	}
	status_t be_BStatable_SetPermissions(be_BStatable *instPointer, mode_t perms) {
		return ((BStatableBridge *)instPointer)->SetPermissions(perms);
	}

	status_t be_BStatable_GetSize(be_BStatable *instPointer, off_t *size) {
		return ((BStatableBridge *)instPointer)->GetSize(size);
	}

	status_t be_BStatable_GetModificationTime(be_BStatable *instPointer, time_t *mtime) {
		return ((BStatableBridge *)instPointer)->GetModificationTime(mtime);
	}
	status_t be_BStatable_SetModificationTime(be_BStatable *instPointer, time_t mtime) {
		return ((BStatableBridge *)instPointer)->SetModificationTime(mtime);
	}

	status_t be_BStatable_GetCreationTime(be_BStatable *instPointer, time_t *ctime) {
		return ((BStatableBridge *)instPointer)->GetCreationTime(ctime);
	}
	
	status_t be_BStatable_SetCreationTime(be_BStatable *instPointer, time_t ctime) {
		return ((BStatableBridge *)instPointer)->SetCreationTime(ctime);
	}

	status_t be_BStatable_GetAccessTime(be_BStatable *instPointer, time_t *atime) {
		return ((BStatableBridge *)instPointer)->GetAccessTime(atime);
	}
	
	status_t be_BStatable_SetAccessTime(be_BStatable *instPointer, time_t atime) {
		return ((BStatableBridge *)instPointer)->SetAccessTime(atime);
	}

	status_t be_BStatable_GetVolume(be_BStatable *instPointer, be_BVolume *vol) {
		return ((BStatableBridge *)instPointer)->GetVolume((BVolume *)vol);
	}
} 
