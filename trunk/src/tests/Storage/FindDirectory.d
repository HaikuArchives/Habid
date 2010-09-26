/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


import Be.Storage.Path;
import Be.Storage.Volume;

import Be.Storage.StorageDefs;
import Be.Support.SupportDefs;
import Be.Support.Errors;
import Be.Storage.FindDirectory;

import tango.io.Stdout;

int main()
{
	BPath path = new BPath;

	/* Desktop dir */	
	find_directory(FindDir.B_DESKTOP_DIRECTORY, path);
	
	assert(path.Path() == "/boot/home/Desktop", "Assert find_directory failed");

	Stdout.formatln("Desktop Directory: {}", path.Path());

	/* User Settings Dir */
	find_directory(FindDir.B_USER_SETTINGS_DIRECTORY, path);
	
	assert(path.Path() == "/boot/home/config/settings", "Assert find_directory failed");
	
	Stdout.formatln("User Settings Directory: {}", path.Path());
	
	return B_OK;
}
