import Support.Autolock;
import Support.Locker;
import Support.StopWatch;
import Support.List;
import Support.DataIO;

import tango.io.Stdout;

import Support.SupportDefs;
import Storage.StorageDefs;

import tango.stdc.posix.sys.types;

class MyMallocIO : public BMallocIO
{
public:
	this() {
		super();
	}

	~this() { }
}

int main() {
	BStopWatch watch = new BStopWatch("test", false);
	char [] buffer = new char[256];

	MyMallocIO io = new MyMallocIO();

	Stdout.formatln("Write: {}", io.Write("test"));
	io.Seek(0, 0);

	void [] read = new char[4];

	Stdout.formatln("Read: {} bytes", io.Read(read));

	Stdout.formatln("here? {}", cast(char [])read);

	delete io;
	delete watch;
	return 0;
}