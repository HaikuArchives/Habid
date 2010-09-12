module Storage.Volume;

import tango.stdc.stdlib;
import tango.stdc.posix.sys.types;

import Support.BObject;
import Support.SupportDefs;
import Storage.StorageDefs;

import Support.types;

class BVolume
{
public:
	mixin(BObject!("be_BVolume", true, null));

}
