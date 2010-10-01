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

uint32 kMessage = 99;

class Looper : BLooper
{
public:
	this() {
		super("looper");
	}
	
	void MessageReceived(BMessage msg) {
		Stdout.formatln("Looper message received: {}", msg.what);
		super.MessageReceived(msg);	
	}
}

class Handler : BHandler
{
public:
	this() {
		super("handler");
	}
	
	void MessageReceived(BMessage msg) {
		Stdout.formatln("Handler message received: {}", msg.what);
		super.MessageReceived(msg);	
	}
}

int main() {
	Looper looper = new Looper();
	Handler handler = new Handler();
	
	looper.AddHandler(handler);
	
	Stdout.formatln("Number of handlers: {}", looper.CountHandlers());

	looper.Run();
	
	looper.PostMessage(new BMessage(kMessage));
	
	looper.Lock();
	looper.Quit();

	return 0;	
}
