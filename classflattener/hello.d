import Parser.InterfaceParser;

import CWriter = Writers.CWriter;

import tango.io.Stdout;

int main(char[][] args)
{
    InterfaceParser parser = new InterfaceParser;

    parser.parse(args[1]);
//    parser.parse();
//    parser.print();

    CWriter.buildOutput(parser);
    CWriter.print();

    return 0;
}

