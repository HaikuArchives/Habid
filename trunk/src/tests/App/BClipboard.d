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

import Be.App.Clipboard;

class App : BApplication
{
public:
	this() {
		super("application/x-vnd.your-app-sig");
		SetPulseRate(1000000);
	}
	
	void MessageReceived(BMessage message) {
		Stdout.formatln("ReceivedMessage: {}", message.what);
		switch(message.what) {
			case B_CLIPBOARD_CHANGED: {
				Stdout.formatln("Clipboard Changed!");
			} break;
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
	BClipboard clipboard = new BClipboard("Clipboard testing");
	
	App app = new App;

	status_t error = clipboard.StartWatching(be_app_messenger);
	
	clipboard.Lock();

	clipboard.Data().AddString("test", "testing");
	clipboard.Commit();
	
	clipboard.Unlock();
	
	if(error != B_OK)
		Stdout.formatln("Failed to start watching clipboard");
		
	app.Run();
	
	return 0;	
}
