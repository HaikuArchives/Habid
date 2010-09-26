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
	region.Include(new BRect(-100, -100, 0, 0));
	
	region.PrintToStream();
	
	Stdout.formatln("Region Has: {} Rect(s)", region.CountRects());
	return 0;	
}
