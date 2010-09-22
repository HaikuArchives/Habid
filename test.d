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

int main() {
	BLocker lock = new BLocker("Test locker");

	if(lock.InitCheck() != 0)
		Stdout.formatln("Failed to lock");

	lock.Lock();
	lock.Unlock();

	delete lock;
	return 0;
}