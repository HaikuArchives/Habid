/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/Statable.h"

BStatableBridge::BStatableBridge()
: BStatable()
{
}
BStatableBridge::~BStatableBridge() { }
status_t BStatableBridge::GetStat(struct stat * st)const{ }
status_t BStatableBridge::_GetStat(struct stat_beos * st)const{ }
status_t BStatableBridge::set_stat(struct stat & st, uint32 what){ }

BStatableProxy::BStatableProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BStatableBridge() { }

BStatableProxy::~BStatableProxy() { }

status_t BStatableProxy::GetStat(struct stat * st) const
{
	return bind_BStatable_GetStat(fBindInstPtr, st);
}

status_t BStatableProxy::GetStat_super(struct stat * st) const
{
	return BStatableBridge::GetStat(st);
}

status_t BStatableProxy::_GetStat(struct stat_beos * st) const
{
	return bind_BStatable__GetStat(fBindInstPtr, st);
}

status_t BStatableProxy::_GetStat_super(struct stat_beos * st) const
{
	return BStatableBridge::_GetStat(st);
}

status_t BStatableProxy::set_stat(struct stat & st, uint32 what) 
{
	return bind_BStatable_set_stat(fBindInstPtr, &st, what);
}

status_t BStatableProxy::set_stat_super(struct stat & st, uint32 what) 
{
	return BStatableBridge::set_stat(st, what);
}


extern "C" {
	BStatable * be_BStatable_ctor(void *bindInstPtr)
	{
		return (BStatable *)new BStatableProxy(bindInstPtr);
	}

	void be_BStatable_dtor(BStatable* self)
	{
		delete self;
	}

	status_t be_BStatable_GetStat(BStatable *self, struct stat * st)
	{
		BStatableProxy *proxy = dynamic_cast<BStatableProxy *>(self);
		if(proxy)
			return proxy->GetStat_super(st);
		else
			return self->GetStat(st);
	}

	status_t be_BStatable__GetStat(BStatable *self, struct stat_beos * st)
	{
		BStatableProxy *proxy = dynamic_cast<BStatableProxy *>(self);
		if(proxy)
			return proxy->_GetStat_super(st);
		else
			return B_NOT_ALLOWED;
	}

	bool be_BStatable_IsFile(BStatable *self)
	{
		return self->IsFile();
	}

	bool be_BStatable_IsDirectory(BStatable *self)
	{
		return self->IsDirectory();
	}

	bool be_BStatable_IsSymLink(BStatable *self)
	{
		return self->IsSymLink();
	}

	status_t be_BStatable_GetNodeRef(BStatable *self, node_ref * ref)
	{
		return self->GetNodeRef(ref);
	}

	status_t be_BStatable_GetOwner(BStatable *self, uid_t * owner)
	{
		return self->GetOwner(owner);
	}

	status_t be_BStatable_SetOwner(BStatable *self, uid_t owner)
	{
		return self->SetOwner(owner);
	}

	status_t be_BStatable_GetGroup(BStatable *self, gid_t * group)
	{
		return self->GetGroup(group);
	}

	status_t be_BStatable_SetGroup(BStatable *self, gid_t group)
	{
		return self->SetGroup(group);
	}

	status_t be_BStatable_GetPermissions(BStatable *self, mode_t * perms)
	{
		return self->GetPermissions(perms);
	}

	status_t be_BStatable_SetPermissions(BStatable *self, mode_t perms)
	{
		return self->SetPermissions(perms);
	}

	status_t be_BStatable_GetSize(BStatable *self, off_t * size)
	{
		return self->GetSize(size);
	}

	status_t be_BStatable_GetModificationTime(BStatable *self, time_t * mtime)
	{
		return self->GetModificationTime(mtime);
	}

	status_t be_BStatable_SetModificationTime(BStatable *self, time_t mtime)
	{
		return self->SetModificationTime(mtime);
	}

	status_t be_BStatable_GetCreationTime(BStatable *self, time_t * ctime)
	{
		return self->GetCreationTime(ctime);
	}

	status_t be_BStatable_SetCreationTime(BStatable *self, time_t ctime)
	{
		return self->SetCreationTime(ctime);
	}

	status_t be_BStatable_GetAccessTime(BStatable *self, time_t * atime)
	{
		return self->GetAccessTime(atime);
	}

	status_t be_BStatable_SetAccessTime(BStatable *self, time_t atime)
	{
		return self->SetAccessTime(atime);
	}

	status_t be_BStatable_GetVolume(BStatable *self, BVolume * vol)
	{
		return self->GetVolume(vol);
	}

	status_t be_BStatable_set_stat(BStatable *self, struct stat * st, uint32 what)
	{
		BStatableProxy *proxy = dynamic_cast<BStatableProxy *>(self);
		if(proxy)
			return proxy->set_stat_super(*st, what);
		else
			return B_NOT_ALLOWED;
	}

}


