* intro / slow
// dog -- fade out
// versace (4th)
* techno
// song --> drone -> fade out
// little pause
* creepy
// short presentation ---
/// video
* exit - dog walking out!
* dj

/////
Pdef(\a, {Pbind(\type, \midi, \midiout, m, \midinote, [36, 43], \chan, 0, \delta, Pwhite(2, 0.2))}).play;


Pdef(\a, {Pbind(\type, \midi, \midiout, m, \midinote, [36, 43], \chan, Pseq([0, 1, 2], inf), \delta, Pseq([1/4, 1/4, 1/2, 1], inf), \legato, 0.3)}).play;

Pdef(\a, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((56..91), inf), \chan, Pwhite(0,2).round(1), \delta, 1/34, \legato, 1)}).play;


8.do({|i|
m.allNotesOff(i);
});


// dog pee

Pdef(\p, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq([78], inf), \chan, Pwhite(8,9).round(1), \delta, 1/3, \legato, 2)}).play;


Tdef(\pee, {
	loop{
				Pdef(\pwalk).stop;
		Pdef(\pee, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((91..56), 1), \chan, Prand([0,1,2,6,7,8], inf), \delta, 1/33, \legato, 1.3)}).play;
		4.wait;
		Pdef(\pwalk).play;
		2.wait;
	}
}).play;

Tdef(\pee).stop;


// dog walking:
Pdef(\pwalk, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq([38, 38], inf), \chan, 4, \delta, 1/2, \legato, 0.2)}).play;


///// video

Tdef(\a, {
	x = Prand([1/4, 1/8, 1/3, 1/9], inf).asStream;
	loop{
Pdef(\anne2, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq([58, 65, 41, 51, 11], inf), \chan, Pwhite(0,2), \legato, 0.1, \delta, 1/36)}).play;
		(1/2).wait;
		Pdef(\anne2).stop;
		(x.next).wait;
	}
}).play

Pdef(\anne, {Pbind(\type, \midi, \midiout, m, \midinote, [36, 60, 45]*Pseq([1, 1.5, 1.2], inf), \chan, [4, 0, 1], \legato, 2, \delta, 4)}).play;


Pdef(\anneB, {Pbind(\type, \midi, \midiout, m, \midinote, 36, \chan, [4, 3, 5], \legato, 0.8, \delta, Pseq(1/(1..2), inf))}).play;

Pdef(\anne).stop;


/// Fokk my off<>zz 2 || Electro recital

Pdef(\n, {Pbind(\type, \midi, \midiout, m, \midinote, Prand((36..67), inf), \chan, [0,1,2,7,8,9], \delta, Pseq([1,1, 1/2, 1/2, 1], inf))}).play;

Tdef(\a, {
	loop{
Pdef(\a, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((36..91), inf), \chan, Pxrand([0,1,2], inf), \delta, 1/7)}).play;
		4.wait;
	}
}).play;


Pdef(\r, {Pbind(\type, \midi, \midiout, m, \midinote, Prand((36..40), inf), \chan, [2,3,4], \legato, 0.01, \delta, 1/4)}).play;

Pdef(\r).stop;


////// walk through:

Pdef(\dog, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq([36, 37, 56], inf), \chan, 5, \delta, 1, \legato, 4)}).play;

Pdef(\dogH, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq([66, 87, 86], inf), \chan, Pseq([0,2,3], inf), \delta, 1/4, \legato, 0.01)}).play;


Pdef(\dogH2, {Pbind(\type, \midi, \midiout, m, \midinote, Prand((36..91), inf), \chan, Pseq([0,2,3], inf), \delta, 1/81, \legato, 0.01)}).play;


Pdef(\dogSing).stop;
/////
// not happening:
Pdef(\dogSing, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((76..82).scramble, inf), \delta, Pwhite(0.1, 1))}).play;



//// varsace

Pdef(\techno, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((36..52), inf), \chan, Pwhite(2,5), \legato, 0.8, \delta, Pseq([1/4,1/4,1/4,1/4, 1, 1/2, 1/2]*2, inf))}).play;

Pdef(\techno1, {Pbind(\type, \midi, \midiout, m, \midinote, Pwhite(26, 91), \chan, [0,1,2], \legato, 0.4, \delta, Pseq([1/4,1/4,1/4,1/4, 1, 1/2, 1/2]*1/2, inf))}).play;


Pdef(\techno).stop;

Pdef(\techno0, {Pbind(\type, \midi, \midiout, m, \midinote, [36, 38, 41]+31, \chan, [0,1,2], \legato, 0.4, \delta, Pseq([1/4, 1/2, 1/4, 1/2]*1, inf))}).play;

Pdef(\techno1, {Pbind(\type, \midi, \midiout, m, \midinote, [36], \chan, [3], \legato, 0.2, \delta, Pseq([1/2, 1/2, 1]*1, inf))}).play;

Tdef(\b, {
	loop{
Pdef(\technoB, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((36..91), inf), \chan, [3,4,5], \legato, 0.2, \delta, Pseq([1/4,1/4,1/4,1/4, 1, 1/2, 1/2]*1/40, 50))}).play;
		20.wait;
	}
}).play;

Tdef(\b).stop;


Pdef(\techno0, {Pbind(\type, \midi, \midiout, m, \midinote, [36, 38, 41]+31, \chan, [0,1,2], \legato, 0.4, \delta, Pseq([1/4, 1/2, 1/4, 1/2]*1, inf))}).play;


Tdef(\a, {
	loop{
		Pdef(\technoA, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((36..91), inf), \chan, Pseq([6,7,8], inf), \legato, 0.1, \delta, Pseq([1/4,1/4,1/4,1/4, 1, 1/2, 1/2]*1/70, 9))}).play;
		1.wait;
	}
}).play;


Tdef(\b, {
	loop{
		Pdef(\technoA, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((36..91).scramble, inf), \chan, Pseq([6,7,8], inf), \legato, 0.1, \delta, Pseq([1/4,1/4,1/4,1/4, 1, 1/2, 1/2]*1/70, 10))}).play;
		(1/4).wait;
	}
}).play;

Tdef(\b).stop;

t = TempoClock.default;
t.tempo_(100/60)


Pdef(\song, {Pbind(\type, \midi, \midiout, m, \midinote, [47, 56, 36], \chan, 2, \delta, 10, \legato, 4)}).play;

Pdef(\song).stop;


////////

Pdef(\creepy, {Pbind(\type, \midi, \midiout, m, \midinote, Pseq((36..91), inf), \chan, Pseq([0,1,2], inf), \delta, Pwhite(1/91, 1/48), \legato, 0.01)}).play;






