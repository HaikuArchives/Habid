module Storage.Beep;

import Support.SupportDefs;

import tango.stdc.stringz;

extern (C) extern {
	status_t be_beep();
	status_t be_system_beep(char*);
	status_t be_add_system_beep_event(char*, uint32);
}

status_t beep() {
	return be_beep();
}

status_t system_beep(char [] eventName) {
	return be_system_beep(toStringz(eventName));
}

status_t add_system_beep_event(char [] eventName, uint32 flags = 0) {
	return be_add_system_beep_event(toStringz(eventName), flags);
}
