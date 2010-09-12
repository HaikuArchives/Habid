module Storage.File;

import tango.stdc.stdlib;
import tango.stdc.posix.sys.types;

import Support.BObject;
import Support.SupportDefs;
import Storage.StorageDefs;

import Support.types;

class BFile
{
public:
	mixin(BObject!("be_BFile", true, null));

}
