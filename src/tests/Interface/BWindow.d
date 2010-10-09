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
import Be.Interface.View;
import Be.Interface.GraphicsDefs;

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
private:
	BView fView;

public:
	this(BRect frame, char [] title) {
		super(frame, title, window_type.B_TITLED_WINDOW, B_QUIT_ON_WINDOW_CLOSE);

		fView = new BView(Bounds(), "MainView", B_FOLLOW_ALL_SIDES, B_WILL_DRAW);
		fView.SetViewColor(255, 255, 0, 255);
		
		rgb_color color = fView.ViewColor();
		
		Stdout.formatln("{} {} {}", color.red, color.green, color.blue);
		
		fView.AddChild(new BView(new BRect(100, 100, 200, 200), "DohView", B_FOLLOW_ALL_SIDES, B_WILL_DRAW));
		
		AddChild(fView);
	}

	bool QuitRequested() {
		Stdout.formatln("BWindow::QuitRequested");
		/* Do not need to call this if we have B_QUIT_ON_WINDOW_CLOSE */
//		be_app_messenger.SendMessage(B_QUIT_REQUESTED);
		return super.QuitRequested();
	}
	
	void FrameResized(float width, float height) {
		Stdout.formatln("FrameResized: {} {}", width, height);
		return super.FrameResized(width, height);	
	}
}
	
int main() {
	App app = new App;

	app.Run();
	
	return 0;	
}
