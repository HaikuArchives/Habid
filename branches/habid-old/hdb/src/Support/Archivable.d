module Support.Archivable;

import Support.BObject;
import Support.SupportDefs;

import App.Message;

import tango.stdc.posix.sys.types;

import Support.types;

extern (C) {
	status_t bind_BArchivable_Archive_virtual(be_BArchivable * bindInstPointer, be_BMessage *into, bool deep) {
		BMessage msg = new BMessage(into, false);

		return (cast(BArchivable)bindInstPointer).Archive(msg, deep);
	}
	
	status_t bind_BArchivable_Perform_virtual(be_BArchivable * bindInstPointer, perform_code d, void *arg) {
		return (cast(BArchivable)bindInstPointer).Perform(d, arg);
	}

}

extern (C) extern {
	be_BArchivable *	be_BArchivable_ctor_1(be_BArchivable *);
	be_BArchivable *	be_BArchivable_ctor_2(be_BArchivable *, be_BMessage *);
	void 				be_BArchivable_dtor(be_BArchivable *);
	
	status_t 			be_BArchivable_Archive_super(be_BArchivable *, be_BMessage *, bool);

	// Private or reserved
	status_t 			be_BArchivable_Perform_super(be_BArchivable *, perform_code, void* arg);
}

extern (C) {

}

class BArchivable
{
public:
	mixin(BObject!("be_BArchivable", true, null));
	
	this() {
		if(fInstancePointer is null)
			fInstancePointer = be_BArchivable_ctor_1(cast(be_BArchivable *)this);
	}
	
	this(BMessage from) {
		if(fInstancePointer is null)
			fInstancePointer = be_BArchivable_ctor_2(cast(be_BArchivable *)this, from.fInstancePointer);
	}
	
	~this() {
		if(fInstancePointer !is null && GetOwnsPointer())
			be_BArchivable_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	status_t Archive(inout BMessage into, bool deep = true) {
		return be_BArchivable_Archive_super(fInstancePointer, into.fInstancePointer, deep);
	}


	// Private or reserved
	status_t Perform(perform_code d, void *arg) {
		return be_BArchivable_Perform_super(fInstancePointer, d, arg);
	}
}
