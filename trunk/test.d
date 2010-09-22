import tango.io.Stdout;

import Support.String;

int main() {
	BString string = new BString;

	string.SetTo("Hello");
	string << " " << cast(float)64.0f;
	string += " hooora";

	string += new BString("jag är en ny string");

	Stdout.formatln(string.String());

	BString str2 = new BString();

	string.CopyInto(str2, 0, 4);

	Stdout.formatln(str2.String());

	delete str2;
	Stdout.formatln(string.String());

	char [] buffer = new char[256];

	string = "hejsan";

	string.CopyInto(buffer, 0, 5);

	Stdout.formatln("buffer: {}", buffer);

	return 0;
}