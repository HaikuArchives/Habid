import tango.io.Stdout;

import Support.String;
import Support.List;
import tango.stdc.stringz;
import Support.DataIO;

import Support.SupportDefs;
// import tango.stdc.posix.sys.types;
import Support.BlockCache;
import tango.stdc.stdlib;

int main() {
	BBlockCache cache = new BBlockCache(10, 256, B_OBJECT_CACHE);

	void *data2 = cast(void *)malloc(256);


	void [] data = cache.Get(128);

	Stdout.formatln("data length: {}", data.length);

	cache.Save(data.ptr, 128);
	cache.Save(data2, 256);

	return 0;
}