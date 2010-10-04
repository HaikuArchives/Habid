/*
 * Copyright 2010 Your Name <your@email.address>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Be.Interface.Point;
import Be.Interface.Rect;
import Be.Interface.Input;

import tango.io.Stdout;

char [] getTypeString(input_device_type type) {
	switch(type) {
		case input_device_type.B_POINTING_DEVICE: {
			return "Pointing Device";
		} break;
		case input_device_type.B_KEYBOARD_DEVICE: {
			return "Keyboard Device";
		} break;
		default: {
			return "Undefined Device";	
		}
	}
}

int main()
{
	BInputDevice [] devices = get_input_devices();
	
	foreach(device; devices) {
		Stdout.formatln("Found Device: {}", device.Name());
		Stdout.formatln("\tType: {}", getTypeString(device.Type()));
	}
	
	return 0;
}
