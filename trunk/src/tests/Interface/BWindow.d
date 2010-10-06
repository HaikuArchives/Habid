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


import Be.Interface.Rect;
import Be.Interface.Window;

class App : BApplication
{
private:
	MyWindow fWindow;

public:
	this() {
		super("application/x-vnd.your-app-sig");
		SetPulseRate(1000000);
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
	
	void ReadyToRun() {
		Stdout.formatln("ReadyToRun");
		fWindow = new MyWindow(new BRect(100, 100, 740, 580), "Window from D (habid)");
		fWindow.Show();
	}
}


class MyWindow : BWindow
{
public:
	this(BRect frame, char [] title) {
		super(frame, title, window_type.B_TITLED_WINDOW, 0);
	}
	
	bool QuitRequested() {
		Stdout.formatln("BWindow::QuitRequested");
		be_app_messenger.SendMessage(B_QUIT_REQUESTED);
		return super.QuitRequested();
	}
}
	
int main() {
	App app = new App;

	app.Run();
	
	return 0;	
}
