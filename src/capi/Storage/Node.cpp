/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/Node.h"

BNodeBridge::BNodeBridge()
: BNode()
{
}
BNodeBridge::BNodeBridge(const entry_ref * ref)
: BNode(ref)
{
}
BNodeBridge::BNodeBridge(const BEntry * entry)
: BNode(entry)
{
}
BNodeBridge::BNodeBridge(const char * path)
: BNode(path)
{
}
BNodeBridge::BNodeBridge(const BDirectory * dir, const char * path)
: BNode(dir, path)
{
}
BNodeBridge::BNodeBridge(const BNode & node)
: BNode(node)
{
}
BNodeBridge::~BNodeBridge() { }

BNodeProxy::BNodeProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNodeBridge() { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const entry_ref * ref)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNodeBridge(ref) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const BEntry * entry)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNodeBridge(entry) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const char * path)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNodeBridge(path) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const BDirectory * dir, const char * path)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNodeBridge(dir, path) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const BNode & node)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNodeBridge(node) { }

BNodeProxy::~BNodeProxy() { }

status_t BNodeProxy::GetStat(struct stat * st) const
{
	return bind_BNode_GetStat(fBindInstPtr, st);
}

status_t BNodeProxy::GetStat_super(struct stat * st) const
{
	return BNode::GetStat(st);
}


extern "C" {
	BNodeProxy * be_BNode_ctor(void *bindInstPtr)
	{
		return new BNodeProxy(bindInstPtr);
	}

	BNodeProxy * be_BNode_ctor_1(void *bindInstPtr, const entry_ref * ref)
	{
		return new BNodeProxy(bindInstPtr, ref);
	}

	BNodeProxy * be_BNode_ctor_2(void *bindInstPtr, const BEntry * entry)
	{
		return new BNodeProxy(bindInstPtr, entry);
	}

	BNodeProxy * be_BNode_ctor_3(void *bindInstPtr, const char * path)
	{
		return new BNodeProxy(bindInstPtr, path);
	}

	BNodeProxy * be_BNode_ctor_4(void *bindInstPtr, const BDirectory * dir, const char * path)
	{
		return new BNodeProxy(bindInstPtr, dir, path);
	}

	BNodeProxy * be_BNode_ctor_5(void *bindInstPtr, const BNode * node)
	{
		return new BNodeProxy(bindInstPtr, *node);
	}

	void be_BNode_dtor(BNode* self)
	{
		delete self;
	}

	status_t be_BNode_InitCheck(BNodeProxy *self)
	{
		return self->InitCheck();
	}

	status_t be_BNode_GetStat(BNodeProxy *self, struct stat * st)
	{
		return self->GetStat_super(st);
	}

	status_t be_BNode_SetTo(BNodeProxy *self, const entry_ref * ref)
	{
		return self->SetTo(ref);
	}

	status_t be_BNode_SetTo_1(BNodeProxy *self, const BEntry * entry)
	{
		return self->SetTo(entry);
	}

	status_t be_BNode_SetTo_2(BNodeProxy *self, const char * path)
	{
		return self->SetTo(path);
	}

	status_t be_BNode_SetTo_3(BNodeProxy *self, const BDirectory * dir, const char * path)
	{
		return self->SetTo(dir, path);
	}

	void be_BNode_Unset(BNodeProxy *self)
	{
		self->Unset();
	}

	status_t be_BNode_Lock(BNodeProxy *self)
	{
		return self->Lock();
	}

	status_t be_BNode_Unlock(BNodeProxy *self)
	{
		return self->Unlock();
	}

	status_t be_BNode_Sync(BNodeProxy *self)
	{
		return self->Sync();
	}

	ssize_t be_BNode_WriteAttr(BNodeProxy *self, const char * name, type_code type, off_t offset, const void * buffer, size_t len)
	{
		return self->WriteAttr(name, type, offset, buffer, len);
	}

	ssize_t be_BNode_ReadAttr(BNodeProxy *self, const char * name, type_code type, off_t offset, void * buffer, size_t len)
	{
		return self->ReadAttr(name, type, offset, buffer, len);
	}

	status_t be_BNode_RemoveAttr(BNodeProxy *self, const char * name)
	{
		return self->RemoveAttr(name);
	}

	status_t be_BNode_RenameAttr(BNodeProxy *self, const char * oldname, const char * newname)
	{
		return self->RenameAttr(oldname, newname);
	}

	status_t be_BNode_GetAttrInfo(BNodeProxy *self, const char * name, struct attr_info * info)
	{
		return self->GetAttrInfo(name, info);
	}

	status_t be_BNode_GetNextAttrName(BNodeProxy *self, char * buffer)
	{
		return self->GetNextAttrName(buffer);
	}

	status_t be_BNode_RewindAttrs(BNodeProxy *self)
	{
		return self->RewindAttrs();
	}

	status_t be_BNode_WriteAttrString(BNodeProxy *self, const char * name, const BString * data)
	{
		return self->WriteAttrString(name, data);
	}

	status_t be_BNode_ReadAttrString(BNodeProxy *self, const char * name, BString * result)
	{
		return self->ReadAttrString(name, result);
	}

	BNode * be_BNode_opAssign(BNode *self, const BNode * node)
	{
		return &self->operator=(*node);
	}

	bool be_BNode_opEquals(BNode *self, const BNode * node)
	{
		return self->operator==(*node);
	}

	bool be_BNode_opNotEquals(BNode *self, const BNode * node)
	{
		return self->operator!=(*node);
	}

	int be_BNode_Dup(BNodeProxy *self)
	{
		return self->Dup();
	}

}


