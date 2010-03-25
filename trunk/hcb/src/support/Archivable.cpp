#include <support/DataIO.h>
#include <hcb-types.h>
#include <stdio.h>

#include <support/HCB_Archivable.h>

/* begin import functions */

extern "C" {
	status_t bind_BArchivable_Archive_virtual(void *, be_BMessage *, bool);
	status_t bind_BArchivable_Perform_virtual(void *, perform_code, void *);
}

/* end import functions */

/* begin class BArchivableBridge */

BArchivableBridge::BArchivableBridge()
: BArchivable()
{ }

BArchivableBridge::BArchivableBridge(BMessage *from)
: BArchivable(from)
{ }

BArchivableBridge::~BArchivableBridge()
{ }


/* end class BArchivableBridge */

/* begin class BArchivableProxy */

BArchivableProxy::BArchivableProxy(void *bindInstPointer)
: fBindInstPointer(bindInstPointer), BArchivableBridge()
{ }

BArchivableProxy::BArchivableProxy(void *bindInstPointer, BMessage *from)
: fBindInstPointer(bindInstPointer), BArchivableBridge(from)
{ }

BArchivableProxy::~BArchivableProxy()
{ }
	
status_t BArchivableProxy::Archive(BMessage* into, bool deep) const {
	return bind_BArchivable_Archive_virtual(fBindInstPointer, (be_BMessage *)into, deep);
}

status_t BArchivableProxy::super_Archive(BMessage* into, bool deep) const {
	return BArchivableBridge::Archive(into, deep);
}

	// Private or reserved
status_t BArchivableProxy::Perform(perform_code d, void* arg) {
	return bind_BArchivable_Perform_virtual(fBindInstPointer, d, arg);
}

status_t BArchivableProxy::super_Perform(perform_code d, void* arg) {
	return BArchivableProxy::Perform(d, arg);
}

/* end class BArchivableProxy */

/* begin export functions */

extern "C" {
	be_BArchivable * be_BArchivable_ctor_1(void *bindInstPointer) {
		return (be_BArchivable *)new BArchivableProxy(bindInstPointer);
	}
	
	be_BArchivable * be_BArchivable_ctor_2(void *bindInstPointer, be_BMessage *from) {
		return (be_BArchivable *)new BArchivableProxy(bindInstPointer, (BMessage *)from);
	}
	
	void be_BArchivable_dtor(void *instPointer) {
		delete (BArchivableProxy *)instPointer;
	}
	
	status_t be_BArchivable_Archive(void *instPointer, be_BMessage* into, bool deep) {
		return ((BArchivableProxy *)instPointer)->Archive((BMessage *)into, deep);
	}

	status_t be_BArchivable_Archive_super(void *instPointer, be_BMessage* into, bool deep) {
		return ((BArchivableProxy *)instPointer)->super_Archive((BMessage *)into, deep);
	}

	// Private or reserved
	status_t be_BArchivable_Perform(void *instPointer, perform_code d, void* arg) {
		return ((BArchivableProxy *)instPointer)->Perform(d, arg);
	}

	status_t be_BArchivable_Perform_super(void *instPointer, perform_code d, void* arg) {
		return ((BArchivableProxy *)instPointer)->super_Perform(d, arg);
	}

/*
	be_BArchivable * be_BArchivable_Instantiate_static(void *bindInstPointer, be_BMessage* archive) {
		BArchivableProxy *proxy = BArchivableProxy::Instantiate((BMessage *)archive);
		proxy.fBindInstPointer = bindInstPointer;
		return (be_BArchivable *)proxy;
	}
*/
}

/* end export functions */

