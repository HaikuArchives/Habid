module Support.Archivable;

import Support.BObject;
import Support.SupportDefs;

import App.Message;

import tango.stdc.posix.sys.types;

extern (C) {
	status_t bind_BArchivable_Archive_virtual(void *bindInstPointer, void *into, bool deep) {
		BMessage msg = new BMessage(into);
		return (cast(BArchivable)bindInstPointer).Archive(msg, deep);
	}
	
	status_t bind_BArchivable_Perform_virtual(void *bindInstPointer, perform_code d, void *arg) {
		return (cast(BArchivable)bindInstPointer).Perform(d, arg);
	}

}

extern (C) extern {
	void * be_BArchivable_ctor_1(void *bindInstPointer);
	
	void * be_BArchivable_ctor_2(void *bindInstPointer, void *from);
	
	void be_BArchivable_dtor(void *instPointer);
	
	status_t be_BArchivable_Archive(void *instPointer, void* into, bool deep);

	status_t be_BArchivable_Archive_super(void *instPointer, void* into, bool deep);

	// Private or reserved
	status_t be_BArchivable_Perform(void *instPointer, perform_code d, void* arg);

	status_t be_BArchivable_Perform_super(void *instPointer, perform_code d, void* arg);
}

extern (C) {

}

class BArchivable
{
public:
	mixin BObject;
	
	this(void *instancePointer = null) {
		if(fInstancePointer is null && instancePointer is null)
			fInstancePointer = be_BArchivable_ctor_1(cast(void *)this);
		else
			fInstancePointer = instancePointer;
	}
	
	this(BMessage from) {
		if(fInstancePointer is null)
			fInstancePointer = be_BArchivable_ctor_2(cast(void *)this, from.fInstancePointer);
	}
	
	~this() {
		if(fInstancePointer !is null)	
			be_BArchivable_dtor(fInstancePointer);
		fInstancePointer = null;
	}
	
	status_t Archive(BMessage into, bool deep = true) {
		return be_BArchivable_Archive_super(fInstancePointer, into.fInstancePointer, deep);
	}


	// Private or reserved
	status_t Perform(perform_code d, void *arg) {
		return be_BArchivable_Perform_super(fInstancePointer, d, arg);
	}
}
