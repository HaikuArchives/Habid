/*
 * Copyright 2010 Your Name <your@email.address>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Be.Interface.Rect;
import Be.Interface.Point;

import tango.io.Stdout;

int main()
{
	BRect rect = new BRect(100, 100, 200, 200);
	
	
	rect.PrintToStream();
	
	rect.InsetBy(new BPoint(50, 50));

	rect.PrintToStream();
	
	rect.top = 50;
	rect.bottom = 100;
	rect.left = 99;
	rect.right = 742;
	
	rect.PrintToStream();
	
	BRect r2 = rect.InsetByCopy(new BPoint(200, 200));
	
	r2.PrintToStream();
	rect.PrintToStream();
	
	return 0;	
}
