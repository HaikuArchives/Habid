#include <hcb-types.h>
#include <stdio.h>

#include <support/Beep.h>

/* begin export functions */
 
extern "C" {
	status_t be_beep() {
		return beep();
	}
	
	status_t be_system_beep(char* eventName) {
		return system_beep(eventName);
	}
	
	status_t be_add_system_beep_event(char* eventName, uint32 flags) {
		return add_system_beep_event(eventName, flags);
	}
}

/* end export functions */

