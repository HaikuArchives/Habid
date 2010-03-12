module Storage.Entry;

import Support.Errors;

import Storage.Statable;

import tango.stdc.posix.sys.types;
import tango.stdc.stringz;
import tango.stdc.string;

struct entry_ref
{
	static entry_ref opCall() {
		entry_ref tmpRef;
		tmpRef.device = cast(dev_t)-1;
		tmpRef.directory = cast(ino_t)-1;
		tmpRef.name = null;
		return tmpRef;
	}

	static entry_ref opCall(dev_t dev, ino_t dir, char [] name) {
		entry_ref tmpRef;
		tmpRef.device = dev;
		tmpRef.directory = dir;
		tmpRef.set_name(name);
		return tmpRef;
	}

	static entry_ref opCall(ref entry_ref _ref) {
		entry_ref tmpRef;
		tmpRef.device = _ref.device;
		tmpRef.directory = _ref.directory;
		tmpRef.set_name(fromStringz(_ref.name));
		return tmpRef;
	}

	int set_name(char [] newName) {
		if(newName.length == 0)
			name = null;
		else 
			name = strdup(toStringz(newName));
		
		return B_OK;	
	}

	bool opEquals(ref entry_ref _ref) {
		return 	device == _ref.device &&
				directory == _ref.directory &&
				(name == _ref.name ||
						 (name !is null && _ref.name !is null &&
						  !strcmp(name, _ref.name)));
	}

	dev_t	device;
	ino_t	directory;
	char *	name;
}

class BEntry : BStatable
{

}
