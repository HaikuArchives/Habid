/*
 * Copyright 2010 Your Name <your@email.address>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Be.Interface.Point;
import Be.Interface.Rect;

import tango.io.Stdout;

int main()
{
	BPoint point = new BPoint(200, 200);
	
	point.PrintToStream();

	point += new BPoint(100, 100);
		
	point.PrintToStream();
	
	Stdout.formatln("Equals: {}", point == (new BPoint(300, 300)));
	return 0;
}
