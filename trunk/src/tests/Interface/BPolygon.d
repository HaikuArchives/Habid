/*
 * Copyright 2010 Your Name <your@email.address>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Be.Interface.Polygon;
import Be.Interface.Point;
import Be.Interface.Rect;

import tango.io.Stdout;

int main()
{
	BPolygon poly = new BPolygon();
	
	poly.MapTo(new BRect(0, 0, 0, 0), new BRect(100, 100, 100, 100));
	poly.PrintToStream();
		
	return 0;	
}
