/*
 * Copyright 2010 Your Name <your@email.address>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Be.App.Messenger;
import Be.App.Message;
import Be.App.Handler;
import Be.App.Looper;

import tango.io.Stdout;
import tango.stdc.string;
import tango.stdc.stringz;

import Be.Support.Errors;
import Be.Support.SupportDefs;

const uint32 kMessage = 99;

class Looper : BLooper
{
public:
	this() {
		super("looper");
	}
	
	void MessageReceived(BMessage msg) {
		switch(msg.what) {
			case kMessage: {
				Stdout.formatln("Looper Received Message: {}", msg.what);
			} break;
			default: {
				super.MessageReceived(msg);	
			} break;
		}
	}
}

class Handler : BHandler
{
public:
	this() {
		super("handler");
	}
	
	void MessageReceived(BMessage msg) {
		switch(msg.what) {
			default: {
				super.MessageReceived(msg);	
			} break;
		}
	}
}

int main() {
	Looper looper = new Looper();
	Handler handler = new Handler();
	
	looper.AddHandler(new Handler());
	looper.AddHandler(new Handler());
	looper.AddHandler(handler);
	looper.AddHandler(new Handler());
	looper.AddHandler(new Handler());
	
	Stdout.formatln("Number of handlers: {}", looper.CountHandlers());

	looper.Run();
	
	looper.PostMessage(new BMessage(kMessage));
	
	looper.Lock();
	looper.Quit();

	return 0;	
}
