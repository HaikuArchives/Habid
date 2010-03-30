#ifndef __LOOPER_H__
#define __LOOPER_H__

#include <app/Looper.h>

#include <app/HCB_Handler.h>

/* begin class BLooperProxy */

class BLooperProxy : public BLooper, public BHandlerProxy
{
private:
	void *fBindInstPointer;
public:
	BLooperProxy(void *bindInstPointer, const char* name = NULL,
			int32 priority = B_NORMAL_PRIORITY,
			int32 port_capacity
			= B_LOOPER_PORT_DEFAULT_CAPACITY);
	virtual	~BLooperProxy();
	
	virtual	status_t		Archive(BMessage* data, bool deep = true) const;
	virtual	status_t		Archive_super(BMessage* data, bool deep = true) const;
	virtual	void			DispatchMessage(BMessage* message, BHandler* handler);
	virtual	void			DispatchMessage_super(BMessage* message, BHandler* handler);
	virtual	void			MessageReceived(BMessage* message);
	virtual	void			MessageReceived_super(BMessage* message);

	virtual	thread_id		Run();
	virtual	thread_id		Run_super();
	virtual	void			Quit();
	virtual	void			Quit_super();
	virtual	bool			QuitRequested();
	virtual	bool			QuitRequested_super();

	virtual BHandler*		ResolveSpecifier(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
	virtual BHandler*		ResolveSpecifier_super(BMessage* msg, int32 index,
								BMessage* specifier, int32 form,
								const char* property);
	virtual status_t		GetSupportedSuites(BMessage* data);
	virtual status_t		GetSupportedSuites_super(BMessage* data);

	// Message filters (also see BHandler).
	virtual	void			AddCommonFilter(BMessageFilter* filter);
	virtual	void			AddCommonFilter_super(BMessageFilter* filter);
	virtual	bool			RemoveCommonFilter(BMessageFilter* filter);
	virtual	bool			RemoveCommonFilter_super(BMessageFilter* filter);
	virtual	void			SetCommonFilterList(BList* filters);
	virtual	void			SetCommonFilterList_super(BList* filters);

	// Private or reserved
	virtual status_t		Perform(perform_code d, void* arg);
	virtual status_t		Perform_super(perform_code d, void* arg);

};

/* end class BLooperProxy */

#endif
