/*
 * Copyright 2010 Your Name <your@email.address>
 * All rights reserved. Distributed under the terms of the MIT license.
 */

import Be.Interface.Region;
import Be.Interface.Point;
import Be.Interface.Rect;

import tango.io.Stdout;

int main()
{
	BRegion region = new BRegion();
	
	region.Set(new BRect(0, 0, 200, 200));

	BRegion region2 = new BRegion(region);
	
	region.PrintToStream();
	
	Stdout.formatln("Region Has: {} Rect(s)", region.CountRects());
	Stdout.formatln("Equals: {}", region == region2);
	return 0;	
}
