/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include "Storage/Node.h"

BNodeProxy::BNodeProxy(void *bindInstPtr)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNode() { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const entry_ref * ref)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNode(ref) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const BEntry * entry)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNode(entry) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const char * path)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNode(path) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const BDirectory * dir, const char * path)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNode(dir, path) { }

BNodeProxy::BNodeProxy(void *bindInstPtr, const BNode & node)
: fBindInstPtr(bindInstPtr), BStatableProxy(bindInstPtr), BNode(node) { }

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
	BNode * be_BNode_ctor(void *bindInstPtr)
	{
		return (BNode *)new BNodeProxy(bindInstPtr);
	}

	BNode * be_BNode_ctor_1(void *bindInstPtr, const entry_ref * ref)
	{
		return (BNode *)new BNodeProxy(bindInstPtr, ref);
	}

	BNode * be_BNode_ctor_2(void *bindInstPtr, const BEntry * entry)
	{
		return (BNode *)new BNodeProxy(bindInstPtr, entry);
	}

	BNode * be_BNode_ctor_3(void *bindInstPtr, const char * path)
	{
		return (BNode *)new BNodeProxy(bindInstPtr, path);
	}

	BNode * be_BNode_ctor_4(void *bindInstPtr, const BDirectory * dir, const char * path)
	{
		return (BNode *)new BNodeProxy(bindInstPtr, dir, path);
	}

	BNode * be_BNode_ctor_5(void *bindInstPtr, const BNode * node)
	{
		return (BNode *)new BNodeProxy(bindInstPtr, *node);
	}

	void be_BNode_dtor(BNode* self)
	{
		delete self;
	}

	status_t be_BNode_InitCheck(BNode *self)
	{
		return self->InitCheck();
	}

	status_t be_BNode_GetStat(BNode *self, struct stat * st)
	{
		BNodeProxy *proxy = dynamic_cast<BNodeProxy *>(self);
		if(proxy)
			return proxy->GetStat_super(st);
		else
			return self->GetStat(st);
	}

	status_t be_BNode_SetTo(BNode *self, const entry_ref * ref)
	{
		return self->SetTo(ref);
	}

	status_t be_BNode_SetTo_1(BNode *self, const BEntry * entry)
	{
		return self->SetTo(entry);
	}

	status_t be_BNode_SetTo_2(BNode *self, const char * path)
	{
		return self->SetTo(path);
	}

	status_t be_BNode_SetTo_3(BNode *self, const BDirectory * dir, const char * path)
	{
		return self->SetTo(dir, path);
	}

	void be_BNode_Unset(BNode *self)
	{
		self->Unset();
	}

	status_t be_BNode_Lock(BNode *self)
	{
		return self->Lock();
	}

	status_t be_BNode_Unlock(BNode *self)
	{
		return self->Unlock();
	}

	status_t be_BNode_Sync(BNode *self)
	{
		return self->Sync();
	}

	ssize_t be_BNode_WriteAttr(BNode *self, const char * name, type_code type, off_t offset, const void * buffer, size_t len)
	{
		return self->WriteAttr(name, type, offset, buffer, len);
	}

	ssize_t be_BNode_ReadAttr(BNode *self, const char * name, type_code type, off_t offset, void * buffer, size_t len)
	{
		return self->ReadAttr(name, type, offset, buffer, len);
	}

	status_t be_BNode_RemoveAttr(BNode *self, const char * name)
	{
		return self->RemoveAttr(name);
	}

	status_t be_BNode_RenameAttr(BNode *self, const char * oldname, const char * newname)
	{
		return self->RenameAttr(oldname, newname);
	}

	status_t be_BNode_GetAttrInfo(BNode *self, const char * name, struct attr_info * info)
	{
		return self->GetAttrInfo(name, info);
	}

	status_t be_BNode_GetNextAttrName(BNode *self, char * buffer)
	{
		return self->GetNextAttrName(buffer);
	}

	status_t be_BNode_RewindAttrs(BNode *self)
	{
		return self->RewindAttrs();
	}

	status_t be_BNode_WriteAttrString(BNode *self, const char * name, const BString * data)
	{
		return self->WriteAttrString(name, data);
	}

	status_t be_BNode_ReadAttrString(BNode *self, const char * name, BString * result)
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

	int be_BNode_Dup(BNode *self)
	{
		return self->Dup();
	}

}


