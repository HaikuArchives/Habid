/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

#include <Input.h>

extern "C" {
/*
	BInputDevice* be_BInputDevice_ctor(void *bindInstPtr)
	{
		return new BInputDevice();
	}

	void be_BInputDevice_dtor(BInputDevice* self)
	{
		delete self;
	}
*/
	const char* be_BInputDevice_Name(BInputDevice *self)
	{
		return self->Name();
	}

	input_device_type be_BInputDevice_Type(BInputDevice *self)
	{
		return self->Type();
	}

	bool be_BInputDevice_IsRunning(BInputDevice *self)
	{
		return self->IsRunning();
	}

	status_t be_BInputDevice_Start(BInputDevice *self)
	{
		return self->Start();
	}

	status_t be_BInputDevice_Stop(BInputDevice *self)
	{
		return self->Stop();
	}

	status_t be_BInputDevice_Control(BInputDevice *self, uint32 code, BMessage* message)
	{
		return self->Control(code, message);
	}

	status_t be_BInputDevice_Start_1_static(input_device_type type)
	{
		return BInputDevice::Start(type);
	}

	status_t be_BInputDevice_Stop_1_static(input_device_type type)
	{
		return BInputDevice::Stop(type);
	}

	status_t be_BInputDevice_Control_1_static(input_device_type type, uint32 code, BMessage* message)
	{
		return BInputDevice::Control(type, code, message);
	}

	BInputDevice* be_find_input_device(const char* name) {
		return find_input_device(name);	
	}
	
	status_t be_get_input_devices(BList* list) {
		return get_input_devices(list);
	}
	
	status_t be_watch_input_devices(BMessenger *target, bool start) {
		return watch_input_devices(*target, start);
	}


}


