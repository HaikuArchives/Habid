/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


import Be.Storage.Path;
import Be.Storage.Volume;
import Be.Storage.VolumeRoster;

import Be.Storage.StorageDefs;
import Be.Support.SupportDefs;
import Be.Support.Errors;
import Be.Storage.FindDirectory;

import tango.io.Stdout;

int main()
{
	BVolumeRoster roster = new BVolumeRoster;
	
	BVolume volume = new BVolume;
	
	while(roster.GetNextVolume(volume) == B_OK) {
		char [] name;
		
		volume.GetName(name);
		
		if(volume.IsPersistent()) {
			Stdout.formatln("Persistent Volume: {}", name);
			Stdout.formatln("\tCapacity: {}MB", (volume.Capacity() / 1024) / 1024);
			Stdout.formatln("\tFree: {}MB", (volume.FreeBytes() / 1024) / 1024);
		} else if(volume.IsRemovable()) {
			Stdout.formatln("Removable Volume: {}", name);
			Stdout.formatln("\tCapacity: {}MB", (volume.Capacity() / 1024) / 1024);
			Stdout.formatln("\tFree: {}MB", (volume.FreeBytes() / 1024) / 1024);			
		}
	}
	
	return B_OK;
}
