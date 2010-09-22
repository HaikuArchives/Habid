import tango.io.Stdout;

import Support.String;
import Support.List;
import tango.stdc.stringz;
import Support.DataIO;

import Support.SupportDefs;
import tango.stdc.posix.sys.types;

class MyMemoryIO : BMemoryIO
{
public:
	this(void [] buffer) { super(buffer); }
	off_t Seek(off_t position, uint32 seekMode) {
		Stdout.formatln("Seek Performed: {} SeekMode: {}", position, seekMode);
		return super.Seek(position, seekMode);
	}
}

int main() {
	void [] buffer = new void[256];

	MyMemoryIO io = new MyMemoryIO(buffer);

	char [] str = fromStringz("Hello, MemoryIO");

	io.Write(str, str.length + 1);

	char [] buffer2 = new char[256];

	io.Seek(0, 0);

	auto x = cast(void [])buffer2;
	io.Read(x, str.length + 1);

	Stdout.formatln("Buffer2: {}", cast(char [])buffer2);

	return 0;
}