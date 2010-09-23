/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


import Storage.Path;

import Storage.StorageDefs;
import Support.SupportDefs;
import Support.Errors;
import Storage.FindDirectory;

import tango.io.Stdout;

int main()
{
	BPath path = new BPath;
	
	find_directory(FindDir.B_DESKTOP_DIRECTORY, path);
	
	assert(path.Path() == "/boot/home/Desktop", "Assert find_directory failed");
	
	Stdout.formatln("Directory: {}", path.Path());
	return B_OK;
}
