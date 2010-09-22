import tango.io.Stdout;

import Support.String;
import Support.List;
import tango.stdc.stringz;

int main() {
	BList list = new BList;

	char [] buffer = "testing";

	list.AddItem(buffer.ptr);

	Stdout.formatln("List count: {}", list.CountItems());

	char *test = cast(char *)list.FirstItem;

	Stdout.formatln("Content: {}", fromStringz(test));

	delete list;

	return 0;
}