#include <hcb-types.h>

#include <storage/HCB_Node.h>

extern "C" {
	status_t bind_BNode_GetStat_virtual(void *, struct stat *st);
}

BNodeBridge::BNodeBridge()
: BNode()
{ }

BNodeBridge::BNodeBridge(const entry_ref *ref)
: BNode(ref)
{ }

BNodeBridge::BNodeBridge(const BEntry *entry)
: BNode(entry)
{ }

BNodeBridge::BNodeBridge(const char *path)
: BNode(path)
{ }

BNodeBridge::BNodeBridge(const BDirectory *dir, const char *path)
: BNode(dir, path)
{ }

BNodeBridge::BNodeBridge(const BNode &node)
: BNode(node)
{ }

BNodeBridge::~BNodeBridge()
{ }



BNodeProxy::BNodeProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BNodeBridge(), BStatableProxy(bindInstPointer)
{ }

BNodeProxy::BNodeProxy(void *bindInstPointer, const entry_ref *ref)
: fBindInstPointer(bindInstPointer), BNodeBridge(ref), BStatableProxy(bindInstPointer)
{ }

BNodeProxy::BNodeProxy(void *bindInstPointer, const BEntry *entry)
: fBindInstPointer(bindInstPointer), BNodeBridge(entry), BStatableProxy(bindInstPointer)
{ }

BNodeProxy::BNodeProxy(void *bindInstPointer, const char *path)
: fBindInstPointer(bindInstPointer), BNodeBridge(path), BStatableProxy(bindInstPointer)
{ }

BNodeProxy::BNodeProxy(void *bindInstPointer, const BDirectory *dir, const char *path)
: fBindInstPointer(bindInstPointer), BNodeBridge(dir, path), BStatableProxy(bindInstPointer)
{ }

BNodeProxy::BNodeProxy(void *bindInstPointer, const BNode &node)
: fBindInstPointer(bindInstPointer), BNodeBridge(node), BStatableProxy(bindInstPointer)
{ }

BNodeProxy::~BNodeProxy() {
	
}

	
status_t BNodeProxy::GetStat(struct stat *st) const {
	return bind_BNode_GetStat_virtual(fBindInstPointer, st);
}

status_t BNodeProxy::super_GetStat(struct stat *st) const {
	return BNodeBridge::GetStat(st);
}


extern "C" {
	be_BNode *be_BNode_ctor_1(be_BNode *bindInstPointer) {
		return (be_BNode *)new BNodeProxy(bindInstPointer);
	}
	
	be_BNode *be_BNode_ctor_2(be_BNode *bindInstPointer, const entry_ref *ref) {
		return (be_BNode *)new BNodeProxy(bindInstPointer, ref);
	}

	be_BNode *be_BNode_ctor_3(be_BNode *bindInstPointer, const be_BEntry *entry) {
		return (be_BNode *)new BNodeProxy(bindInstPointer, (BEntry *)entry);
	}

	be_BNode *be_BNode_ctor_4(be_BNode *bindInstPointer, const char *path) {
		return (be_BNode *)new BNodeProxy(bindInstPointer, path);
	}

	be_BNode *be_BNode_ctor_5(be_BNode *bindInstPointer, const be_BDirectory *dir, const char *path) {
		return (be_BNode *)new BNodeProxy(bindInstPointer, (BDirectory *)dir, path);
	}

	be_BNode *be_BNode_ctor_6(be_BNode *bindInstPointer, const be_BNode *node) {
		return (be_BNode *)new BNodeProxy(bindInstPointer, *(BNode *)node);
	}

	void be_BNode_dtor(be_BNode *instPointer) {
		delete (BNodeProxy *)instPointer;
	}

	
	status_t be_BNode_InitCheck(be_BNode *instPointer) {
		return ((BNodeProxy *)instPointer)->InitCheck();
	}


	status_t be_BNode_GetStat(be_BNode *instPointer, struct stat *st) {
		return ((BNodeProxy *)instPointer)->GetStat(st);
	}

	status_t be_BNode_GetStat_super(be_BNode *instPointer, struct stat *st) {
		return ((BNodeProxy *)instPointer)->super_GetStat(st);
	}

	
	status_t be_BNode_SetTo_1(be_BNode *instPointer, const entry_ref *ref) {
		return ((BNodeProxy *)instPointer)->SetTo(ref);
	}

	status_t be_BNode_SetTo_2(be_BNode *instPointer, const be_BEntry *entry) {
		return ((BNodeProxy *)instPointer)->SetTo((BEntry *)entry);
	}

	status_t be_BNode_SetTo_3(be_BNode *instPointer, const char *path) {
		return ((BNodeProxy *)instPointer)->SetTo(path);
	}

	status_t be_BNode_SetTo_4(be_BNode *instPointer, const be_BDirectory *dir, const char *path) {
		return ((BNodeProxy *)instPointer)->SetTo((BDirectory *)dir, path);
	}

	void be_BNode_Unset(be_BNode *instPointer) {
		return ((BNodeProxy *)instPointer)->Unset();
	}


	status_t be_BNode_Lock(be_BNode *instPointer) {
		return ((BNodeProxy *)instPointer)->Lock();
	}

	status_t be_BNode_Unlock(be_BNode *instPointer) {
		return ((BNodeProxy *)instPointer)->Unlock();
	}


	status_t be_BNode_Sync(be_BNode *instPointer) {
		return ((BNodeProxy *)instPointer)->Sync();
	}


	ssize_t be_BNode_WriteAttr(be_BNode *instPointer, const char *name, type_code type, off_t offset, const void *buffer, size_t len) {
		return ((BNodeProxy *)instPointer)->WriteAttr(name, type, offset, buffer, len);
	}

	ssize_t be_BNode_ReadAttr(be_BNode *instPointer, const char *name, type_code type, off_t offset, void *buffer, size_t len) {
		return ((BNodeProxy *)instPointer)->WriteAttr(name, type, offset, buffer, len);
	}

	status_t be_BNode_RemoveAttr(be_BNode *instPointer, const char *name) {
		return ((BNodeProxy *)instPointer)->RemoveAttr(name);
	}

	status_t be_BNode_RenameAttr(be_BNode *instPointer, const char *oldname, const char *newname) {
		return ((BNodeProxy *)instPointer)->RenameAttr(oldname, newname);
	}

	status_t be_BNode_GetAttrInfo(be_BNode *instPointer, const char *name, struct attr_info *info) {
		return ((BNodeProxy *)instPointer)->GetAttrInfo(name, info);
	}

	status_t be_BNode_GetNextAttrName(be_BNode *instPointer, char *buffer) {
		return ((BNodeProxy *)instPointer)->GetNextAttrName(buffer);
	}

	status_t be_BNode_RewindAttrs(be_BNode *instPointer) {
		return ((BNodeProxy *)instPointer)->RewindAttrs();
	}

	status_t be_BNode_WriteAttrString(be_BNode *instPointer, const char *name, const be_BString *data) {
		return ((BNodeProxy *)instPointer)->WriteAttrString(name, (BString *)data);
	}

	status_t be_BNode_ReadAttrString(be_BNode *instPointer, const char *name, be_BString *result) {
		return ((BNodeProxy *)instPointer)->ReadAttrString(name, (BString *)result);
	}

	bool be_BNode_operator_equals(be_BNode *instPointer, be_BNode *node) {
		return ((BNodeProxy *)instPointer)->operator==(*(BNode *)node);
	}
	
	bool be_BNode_operator_notequals(be_BNode *instPointer, be_BNode *node) {
		return ((BNodeProxy *)instPointer)->operator!=(*(BNode *)node);
	}
	
/*
	BNode& operator=(const BNode &node);
*/
	int be_BNode_Dup(be_BNode *instPointer) {
		return ((BNodeProxy *)instPointer)->Dup();
	}

}
