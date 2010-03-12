module Storage.Statable;

import tango.stdc.stdlib;

import Support.BObject;
import Support.SupportDefs;


struct stat
{
	int dummy;
}

extern (C) {
	status_t bind_BStatable_GetStat_pure(void *, stat *) {
		return 0;
	}
	
	status_t bind_BStatable_set_stat_pure(void *, stat *, uint32) {
		return 0;
	}
}


class BStatable
{
	mixin BObject;

	this() {

	}

	~this() {

	}
}
