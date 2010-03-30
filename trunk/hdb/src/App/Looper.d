module App.Looper;

import Support.BObject;
import Support.SupportDefs;

import App.Message;

import Support.Archivable;

import tango.stdc.posix.sys.types;

import Support.types;

import App.Handler;

extern (C) extern {
}

extern (C) {
}

class BLooper : public BHandler
{
public:
	mixin(BObject!("be_BLooper", false, "be_BHandler"));
}
