module App.Messenger;

import Support.BObject;
import Support.SupportDefs;

import App.Message;

import Support.Archivable;

import tango.stdc.posix.sys.types;

import Support.types;

extern (C) extern {
}

extern (C) {
}

class BMessenger
{
public:
	mixin(BObject!("be_BMessenger", true, null));
}
