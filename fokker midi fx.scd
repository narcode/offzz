/// FX
~mem = ();
~mem['a'] = Array.series(6, 0, 0);
~mem['b'] = Array.series(10, 0, 0);
~count = 0;~countb = 0;

(
// Pdef.all.do{|p| p.stop};
MIDIdef.noteOn(\t, {arg ...args;
	if (~count > 4) {~count=0};
	args[1].postln;
	~mem['a'].put(~count, args[1]);
	~count = ~count+1;
	a = Pseq(~mem['a'].stutter(1), inf);
	Pdef(\n, {Pbind(\type, \midi, \midiout, m, \dur, 1/8, \midinote, a, \chan, Pseq([0], inf), \legato, 0.9)}).stop;

{
		// m.noteOn(1, args[1], args[0]);
		m.noteOn(0, args[1], args[0]);
}.fork;

	if (~countb > 9) {~countb=0};
	~mem['b'].put(~count, args[1]);
	b = Pseq(~mem['b'].stutter(1), inf);
	Pdef(\na, {Pbind(\type, \midi, \midiout, m, \dur, 1/8, \midinote, b, \chan, Pseq([4,3], inf), \legato, 0.9)}).stop;

		c = Pseq(~mem['a'].stutter(2), inf);
Pdef(\nar, {Pbind(\type, \midi, \midiout, m, \dur, 1/8, \ctranspose, 1/2, \midinote, c, \chan, Pseq([0,7], inf), \legato, 0.8)}).stop;

	// Ndef(\audio, {CombN.ar(Saw.ar(args[1].midicps*[1,5/3]*LFPulse.ar(4))*EnvGen.kr(Env.perc(0, 1)), 0.2, 0.2, 10)}).play(0,2).fadeTime_(9);

});
);


(
MIDIdef.noteOff(\off, {arg ...args;
	{
		0.wait;
		// m.noteOff(1, args[1], args[0]);
		m.noteOff(0, args[1], args[0]);
	}.fork;
});
)


Pdef.all.do{|p| p.stop;};
m.allNotesOff(0);




Ndef(\audio).stop(5);