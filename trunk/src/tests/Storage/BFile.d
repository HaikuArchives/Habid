/*
 * Copyright 2010 Tomas Wilhelmsson <tomas.wilhelmsson@gmail.com>
 * All rights reserved. Distributed under the terms of the MIT license.
 */


import Storage.File;

import Storage.StorageDefs;
import Support.SupportDefs;
import Support.Errors;

import tango.io.Stdout;

int main()
{
	BFile file = new BFile("src/tests/Storage/BFile.d", B_READ_ONLY);
	
	if(file.InitCheck() != B_OK) {
		Stdout.formatln("File does not exist!");
		return B_ERROR;
	}
	
	off_t size;
	file.GetSize(size);
	
	void [] buffer = new void[size + 1];
	
	file.Read(buffer, size);
	
	Stdout.formatln("IsReadable: {}", file.IsReadable());
	Stdout.formatln("IsWritable: {}", file.IsWritable());
	Stdout.formatln("File Size: {} bytes", size);
	
	Stdout.formatln("File content:\n{}", cast(char [])buffer);
	
	delete file;
	
	return B_OK;
}
