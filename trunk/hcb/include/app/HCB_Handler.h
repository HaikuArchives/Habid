#ifndef __HANDLER_H__
#define __HANDLER_H__

#include <app/Handler.h>

#include <support/HCB_Archivable.h>

/* begin class BHandlerProxy */

class BHandlerProxy : public BHandler, public BArchivableProxy
{
private:
	void *fBindInstPointer;
public:
							BHandlerProxy(void *bindInstPointer, const char* name = NULL);
							BHandlerProxy(void *bindInstPointer, BMessage* data);
	virtual					~BHandlerProxy();

	// Archiving
//	static	BArchivable*	Instantiate(BMessage* data);
	virtual	status_t		Archive(BMessage* data, bool deep = true) const;
	virtual	status_t		Archive_super(BMessage* data, bool deep = true) const;

	// BHandler guts.
	virtual	void			MessageReceived(BMessage* message);
	virtual	void			MessageReceived_super(BMessage* message);
	virtual	void			SetNextHandler(BHandler* handler);
	virtual	void			SetNextHandler_super(BHandler* handler);

	// Message filtering
	virtual	void			AddFilter(BMessageFilter* filter);
	virtual	void			AddFilter_super(BMessageFilter* filter);
	virtual	bool			RemoveFilter(BMessageFilter* filter);
	virtual	bool			RemoveFilter_super(BMessageFilter* filter);
	virtual	void			SetFilterList(BList* filters);
	virtual	void			SetFilterList_super(BList* filters);

	// Scripting
	virtual BHandler*		ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
	virtual BHandler*		ResolveSpecifier_super(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
	virtual status_t		GetSupportedSuites(BMessage* data);
	virtual status_t		GetSupportedSuites_super(BMessage* data);

	// Reserved
	virtual status_t		Perform(perform_code d, void* arg);
	virtual status_t		Perform_super(perform_code d, void* arg);

	// Notifier calls
	virtual	void 			SendNotices(uint32 what, const BMessage* notice = NULL);
	virtual	void 			SendNotices_super(uint32 what, const BMessage* notice = NULL);
};

/* end class BHandlerProxy */

#endif
