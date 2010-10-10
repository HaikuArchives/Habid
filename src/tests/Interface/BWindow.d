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
import Be.Interface.Point;
import Be.Interface.Window;
import Be.Interface.View;
import Be.Interface.GraphicsDefs;
import Be.Interface.Picture;
import Be.Interface.Button;

import Be.Support.HelperFunctions;

const int32 kButtonMessage = MakeValue!("BTNP");

class App : BApplication
{
private:
	MyWindow fWindow;

public:
	this() {
		super("application/x-vnd.your-app-sig");
		SetPulseRate(1000000);

	}
	
	override void MessageReceived(BMessage message) {
		Stdout.formatln("ReceivedMessage: {}", message.what);
		switch(message.what) {
			default: {
				super.MessageReceived(message);	
			}	
		}	
	}
	
	override bool QuitRequested() {
		Stdout.formatln("QuitRequested");
		return super.QuitRequested();	
	}
	
	override void Pulse() {
		Stdout.formatln("Pulse...");	
	}
	
	override void ReadyToRun() {
		Stdout.formatln("ReadyToRun");
		fWindow = new MyWindow(new BRect(100, 100, 740, 580), "Window from D (habid)");

		fWindow.Show();
	}
}

class MyView : BView
{
private:
	BPicture fPicture;
public:
	this(BRect frame, char [] name) {
		super(frame, name, B_FOLLOW_ALL_SIDES, B_WILL_DRAW);	

		ForceFontAliasing(true);
		fPicture = new BPicture();
	}
	
	override void Draw(BRect updateRect) {
		DrawPicture(fPicture);
	}
	
	override void AllAttached() {
		PushState();
		BeginPicture(fPicture);
		SetHighColor(255, 0, 0);
		SetLowColor(0, 255, 0);
		FillRect(new BRect(200, 200, 300, 300), B_SOLID_HIGH);
		StrokeRect(new BRect(400, 400, 500, 450), B_SOLID_HIGH);
		SetFontSize(40);
		PushState();
		SetHighColor(255, 0, 0);
		SetLowColor(255, 0, 0);
		DrawString("This is a BPicture test", new BPoint(100, 40));
		PopState();
		FillEllipse(new BRect(0, 300, 400, 500), B_SOLID_HIGH);
		EndPicture();
		PopState();
	}
}

class MyWindow : BWindow
{
private:
	BView fView;
	BButton fButton;

public:
	this(BRect frame, char [] title) {
		super(frame, title, window_type.B_TITLED_WINDOW, B_QUIT_ON_WINDOW_CLOSE);

		fView = new MyView(Bounds(), "MainView");
		fView.SetViewColor(255, 255, 0, 255);
		
		rgb_color color = fView.ViewColor();
		
		Stdout.formatln("{} {} {}", color.red, color.green, color.blue);
		
		fButton = new BButton(new BRect(20, 20, 100, 100), "TestButton", "TestButton", new BMessage(kButtonMessage));
		
		AddChild(fButton, null);
		AddChild(fView);

	}

	override bool QuitRequested() {
		Stdout.formatln("BWindow::QuitRequested");
		/* Do not need to call this if we have B_QUIT_ON_WINDOW_CLOSE */
//		be_app_messenger.SendMessage(B_QUIT_REQUESTED);
		return super.QuitRequested();
	}
	
	override void FrameResized(float width, float height) {
		Stdout.formatln("FrameResized: {} {}", width, height);
		return super.FrameResized(width, height);	
	}
	
	override void MessageReceived(BMessage message) {
		Stdout.formatln("ReceivedMessage: {}", getValueString(message.what));
		switch(message.what) {
			case kButtonMessage: {
				Stdout.formatln("Button Pressed");
			} break;
			default: {
				super.MessageReceived(message);
			}	
		}	
	}
}
	
int main() {
	App app = new App;

	app.Run();
	
	return 0;	
}
