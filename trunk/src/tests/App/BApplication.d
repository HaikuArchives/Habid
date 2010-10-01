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
import Be.App.Application;

class App : BApplication
{
public:
	this() {
		super("application/x-vnd.your-app-sig");
		SetPulseRate(100000);
	}
	
	void MessageReceived(BMessage message) {
		Stdout.formatln("ReceivedMessage: {}", message.what);
		switch(message.what) {
			default: {
				super.MessageReceived(message);	
			}	
		}	
	}
	
	bool QuitRequested() {
		Stdout.formatln("QuitRequested");
		return super.QuitRequested();	
	}
	
	void Pulse() {
		Stdout.formatln("Pulse...");	
	}
}

int main() {
	App app = new App;
	
	app.Run();
	
	return 0;	
}
