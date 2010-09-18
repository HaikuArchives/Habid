import Parser.InterfaceParser;

// import CWriter = Writers.CWriter;

import Writers.HeaderWriter;
import Writers.CWriter;

import tango.io.Stdout;

int main(char[][] args)
{
    if(args[1] == "-generate-header") {
        InterfaceParser.parse(args[2]);

        for(int i = 3; i < args.length; i++)
            InterfaceParser.parse(args[i], true);

        buildHeader();
    } else if(args[1] == "-generate-c") {
        InterfaceParser.parse(args[2]);

        for(int i = 3; i < args.length; i++)
            InterfaceParser.parse(args[i], true);

        buildC();
    } else {
        Stdout.formatln("Usage:");
        Stdout.formatln("classflattener -generate-c <input file> > <output file.cpp>");
        Stdout.formatln("classflattener -generate-header <input file> > <output file.h>");
//        Stdout.formatln("Invalid usage");
        return 0;
    }


    return 0;
}

