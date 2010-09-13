import Parser.InterfaceParser;

// import CWriter = Writers.CWriter;

import Writers.HeaderWriter;
import Writers.CWriter;

import tango.io.Stdout;

int main(char[][] args)
{
/*
    for(int i = 1; i < args.length; i++) {
        switch(args[i]) {
            case "-include-output-dir": {
                parser.setIncludeOutputDir(args[i + 1]);
                i++;
            } break;
            default: {
                parser.parse(args[i]);
            }
        }
    }
*/
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
        Stdout.formatln("Invalid usage");
        return 0;
    }


//    foreach(inputFile; parser.getInputFiles())
//        inputFile.print();


//    parser.parse();
//    parser.print();

//    CWriter.buildOutput(parser);
//    CWriter.print();

    return 0;
}

