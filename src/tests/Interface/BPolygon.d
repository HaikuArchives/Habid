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

	BPoint [] points;
	
	for(int i = 0; i < 10; i++) {
		points ~= new BPoint(i, cast(float)i);
		Stdout.formatln("Adding Point ({}, {})", points[i].x, points[i].y);
	}
	
	BPolygon poly = new BPolygon(points, points.length);
	
	Stdout.formatln("Resulting BPolygon");
	
	poly.PrintToStream();

	return 0;
}
