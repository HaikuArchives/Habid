module Storage.Node;

import tango.stdc.stdlib;
import tango.stdc.posix.sys.types;

import Support.BObject;
import Support.SupportDefs;
import Storage.StorageDefs;

struct node_ref
{
	dev_t device;
	ino_t node;	
}
