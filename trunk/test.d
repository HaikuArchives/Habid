import tango.io.Stdout;

import Support.String;
import Support.List;
import tango.stdc.stringz;
import Support.DataIO;

import Support.SupportDefs;
// import tango.stdc.posix.sys.types;
import Support.BlockCache;
import tango.stdc.stdlib;
import Support.Locker;
import Storage.File;
import Storage.StorageDefs;


int main() {
	BFile file = new BFile("/boot/home/test.c", B_READ_WRITE);

	if(!file.InitCheck() < 0) Stdout.formatln("Failed to init file");

	off_t size;
	file.GetSize(size);

	void [] buffer = new void[size + 1];

	file.Read(buffer, size);

//	file.Lock();

	char [] str = "hora";

	ssize_t attrsize = file.WriteAttr("Test:Slan", 1129534546, 0, cast(void [])str, str.length);

	if(attrsize < 0) Stdout.formatln("Failed to write Attr: {}", attrsize);

	char [] attr;
	file.GetNextAttrName(attr);

	Stdout.formatln("Attr: {}", attr);

//	file.Unlock();

	Stdout.formatln("File content:\n{}", cast(char [])buffer);
	return 0;
}