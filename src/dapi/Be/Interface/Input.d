/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */
module Be.Interface.Input;

import Be.Support.SupportDefs;
import Be.Support.types;
import Be.Support.BObject;
import Be.Support.List;
import Be.Support.Errors;

import Be.App.Message;
import Be.App.Messenger;

import tango.stdc.stringz;


enum input_method_op {
	B_INPUT_METHOD_STARTED			= 0,
	B_INPUT_METHOD_STOPPED			= 1,
	B_INPUT_METHOD_CHANGED			= 2,
	B_INPUT_METHOD_LOCATION_REQUEST	= 3
}


enum input_device_type {
	B_POINTING_DEVICE	= 0,
	B_KEYBOARD_DEVICE	= 1,
	B_UNDEFINED_DEVICE	= 2
}


enum input_device_notification {
	B_INPUT_DEVICE_ADDED	= 0x0001,
	B_INPUT_DEVICE_STARTED	= 0x0002,
	B_INPUT_DEVICE_STOPPED	= 0x0004,
	B_INPUT_DEVICE_REMOVED	= 0x0008
}


extern (C) extern {
	// const char* be_BInputDevice_Name(BInputDevice *self);
	char* be_BInputDevice_Name(void *self);

	// input_device_type be_BInputDevice_Type(BInputDevice *self);
	input_device_type be_BInputDevice_Type(void *self);

	// bool be_BInputDevice_IsRunning(BInputDevice *self);
	bool be_BInputDevice_IsRunning(void *self);

	// status_t be_BInputDevice_Start(BInputDevice *self);
	status_t be_BInputDevice_Start(void *self);

	// status_t be_BInputDevice_Stop(BInputDevice *self);
	status_t be_BInputDevice_Stop(void *self);

	// status_t be_BInputDevice_Control(BInputDevice *self, uint32 code, BMessage* message);
	status_t be_BInputDevice_Control(void *self, uint32 code, void* message);

	//status_t be_BInputDevice_Start_1_static(input_device_type type)
	status_t be_BInputDevice_Start_1_static(input_device_type type);

	//status_t be_BInputDevice_Stop_1_static(input_device_type type)
	status_t be_BInputDevice_Stop_1_static(input_device_type type);

	//status_t be_BInputDevice_Control_1_static(input_device_type type, uint32 code, BMessage* message)
	status_t be_BInputDevice_Control_1_static(input_device_type type, uint32 code, void* message);


	void* be_find_input_device(char* name);
	
	status_t be_get_input_devices(void* list);
	
	status_t be_watch_input_devices(void *target, bool start);
}


BInputDevice find_input_device(char [] name) {
	return new BInputDevice(be_find_input_device(toStringz(name)), false);	
}

BInputDevice [] get_input_devices() {
	BList list = new BList;
	BInputDevice [] devices;
	
	if(be_get_input_devices(list._InstPtr) != B_OK)
		return null;
	
	for(int i = 0; i < list.CountItems(); i++)
		devices ~= new BInputDevice(list.ItemAt(i), false);
	
	return devices;	
}

status_t watch_input_devices(BMessenger target, bool start) {
	return be_watch_input_devices(target._InstPtr, start);
}

interface IBInputDevice
{
	// const char* be_BInputDevice_Name(BInputDevice *self);
	char [] Name();

	// input_device_type be_BInputDevice_Type(BInputDevice *self);
	input_device_type Type();

	// bool be_BInputDevice_IsRunning(BInputDevice *self);
	bool IsRunning();

	// status_t be_BInputDevice_Start(BInputDevice *self);
	status_t Start();

	// status_t be_BInputDevice_Stop(BInputDevice *self);
	status_t Stop();

	// status_t be_BInputDevice_Control(BInputDevice *self, uint32 code, BMessage* message);
	status_t Control(uint32, BMessage);
/*
	// status_t be_BInputDevice_Start_1(BInputDevice *self, input_device_type type);
	status_t Start(input_device_type);

	// status_t be_BInputDevice_Stop_1(BInputDevice *self, input_device_type type);
	status_t Stop(input_device_type);

	// status_t be_BInputDevice_Control_1(BInputDevice *self, input_device_type type, uint32 code, BMessage* message);
	status_t Control(input_device_type, uint32, BMessage);
*/
	void * _InstPtr();
	void _InstPtr(void *ptr);
	bool _OwnsPtr();
	void _OwnsPtr(bool value);
}

final class BInputDevice : IBInputDevice
{
private:
	void *fInstancePointer = null;
	bool fOwnsPointer = false;
	mixin(BObject!());
public:
	// const char* be_BInputDevice_Name(BInputDevice *self);
	char [] Name() {
		return fromStringz(be_BInputDevice_Name(_InstPtr())).dup;
	}

	// input_device_type be_BInputDevice_Type(BInputDevice *self);
	input_device_type Type() {
		return be_BInputDevice_Type(_InstPtr());
	}

	// bool be_BInputDevice_IsRunning(BInputDevice *self);
	bool IsRunning() {
		return be_BInputDevice_IsRunning(_InstPtr());
	}

	// status_t be_BInputDevice_Start(BInputDevice *self);
	status_t Start() {
		return be_BInputDevice_Start(_InstPtr());
	}

	// status_t be_BInputDevice_Stop(BInputDevice *self);
	status_t Stop() {
		return be_BInputDevice_Stop(_InstPtr());
	}

	// status_t be_BInputDevice_Control(BInputDevice *self, uint32 code, BMessage* message);
	status_t Control(uint32 code, BMessage message) {
		return be_BInputDevice_Control(_InstPtr(), code, message._InstPtr);
	}

	//status_t be_BInputDevice_Start_1_static(input_device_type type)
	static status_t Start(input_device_type type)
	{
		return be_BInputDevice_Start_1_static(type);
	}

	//status_t be_BInputDevice_Stop_1_static(input_device_type type)
	static status_t Stop(input_device_type type)
	{
		return be_BInputDevice_Stop_1_static(type);
	}

	//status_t be_BInputDevice_Control_1_static(input_device_type type, uint32 code, BMessage* message)
	static status_t Control(input_device_type type, uint32 code, BMessage message)
	{
		return be_BInputDevice_Control_1_static(type, code, message._InstPtr);
	}

	void * _InstPtr() { return fInstancePointer; }
	void _InstPtr(void *ptr) { fInstancePointer = ptr; }
	bool _OwnsPtr() { return fOwnsPointer; }
	void _OwnsPtr(bool value) { fOwnsPointer = value; }
}


