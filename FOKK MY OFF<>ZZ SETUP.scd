//// FOKK MY OFF<>ZZ SETUP

MIDIClient.init;

m = MIDIOut.newByName("MIDIMATE II", "Port 1");
//f = MIDIOut.newByName("MIDIMATE II", "Port 1");   /// test midi outs
MIDIIn.connectAll;
// The IAC Bus will now also appear to other applications.

MIDIdef.noteOn(\test1, {arg ...args; args.postln});


//start
// mini test
m.noteOn(0, 39, 127);
m.noteOff(0, 39, 64);

// lang zal ze leven
m.noteOn(0, 24, 64);
m.noteOn(0, 25, 64);

m.allNotesOff(0);

// program change

// MIDI program change messages on Channel 0 >>>> MAKE GUI TO MAKE IMPRO EASIER

//REGSITER       ON  | OFF
//Subbas16’       0  | 1
m.program(0, 0);
//Gedekt8’        2  | 3
m.program(0, 2);
//P+I             4  | 5
m.program(0, 4);
//P+II            6  | 7
m.program(0, 6);
//Quintadena 8’   8  | 9
m.program(0, 8);
//Prestant 4’     10 | 11
m.program(0, 10);
//I+II            12 | 13
m.program(0, 12);
//Salicionaal 8’  14 | 15
m.program(0, 14);
//Roerfluit 4’    16 | 17
m.program(0, 16);


// RANGES \\
// -> Pedal
36-53
"c1".namemidi;
"f2".namemidi;

// -> Man I * II
36-91
"c1".namemidi;
"g5".namemidi;


// channels:
0-2: manual I
3-5: pedal
6-9: manual II





