import Parser.InterfaceParser;

import CWriter = Writers.CWriter;

int main(char[][] args)
{
    InterfaceParser.parse("InterfaceFile.xml");
//    parser.parse();
//    parser.print();

    CWriter.buildOutput(InterfaceParser.getInterfaceClassInfo());
    CWriter.print();

    return 0;
}
