/////////////////\\\\/\ PANDA Zooicide \\/\/\/\/\/\/\/\/\/\//
//////\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//\/
/////
///

("/Users/fina/Desktop/Panda Zooicide/panda_synths.scd").load;

//
t=TempoClock.default;
t.tempo = 87/60;
t.beats_(0);
(
t.beats_(0);
Ndef(\basslim, {Limiter.ar(In.ar(6, 2), 1, 0.01) * 1}).play(0, 2).fadeTime_(5);

Pdef(\pbass, {Pbind(\instrument, \panda_love, \degree, [0, 1, 2 , 3]*Pseq([3, 2.5,1/2,1], 1), \amp, Pseq([0.05, 0.1,0.2,0.3], 1))}).play;

t.schedAbs(4, {
	t.beats.postln;
	Pdef(\pk, {Pbind(\instrument, \panda_kick, \delta, Pseq([
	Pseq([
		Pseq([2, 1/2, 3/2], 1), Pseq([1.75, 1/4, 1/2, 1, 1/2], 1)], 7),
	    Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([4], 1)], 1), // break
    	Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([1,1,1.75,1/4], 1)], 1),
    	Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([1.75, 1/4, 1/2, 1, 1/2], 1)], 5),
	    Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([1.75, 1/4, 1/2, 1, 1/2], 1)], 3)], 1),
		\tempo, 87/60, \amp, 1,\freqk, 1, \fmod, 12, \release, 0.01, \comp, 0.9 )}).play; //17

Pdef(\ps, {Pbind(\instrument, \panda_snare, \delta, Pseq([Pseq([1], 4)], 34), \tempo, 87/60, \amp, Pseq([
	Pseq([0, 3, 0, 3], 15),
	Pseq([0, 0, 0, 3], 1), // break!
	Pseq([0, 3, 0, 3], 2),
	Pseq([Prand([3,0], 1), Prand([3,0], 1), Prand([3,3], 1), Prand([3,0], 1)], 2),
	], inf),
		\rl, Prand([0.1], inf), \rldrill, Prand([1/3, 1/2], inf), \mod, Pwhite(350, 348), \comp,7, \out, 3)}).play;
});

// break1 **** -> 144
t.schedAbs(144, {
	    t.beats.postln;
	    Pdef(\pbassriff).stop;

		Pdef(\phi, {Pbind(\instrument, \panda_snare, \delta, Pseq([Pseq([Pseq([1], 4)], 7),
		Pseq([Pseq([2, 1, 1/3, 1/3, 1/3], 1)], 1)],1), // to verse \\\
		\tempo, 87/60, \amp, Pseq([4, 2, 2, 2], inf), \rl, Pseq([0.1, 0.01, 0.4], inf), \rldrill, 1, \mod, Pwhite(8999, 9800), \eqf, 900)}).play;

	Pdef(\pbassPedal, {Pbind(\instrument, \panda_bass1, \freq, Pseq([Pseq([Pseq(["B0".namecps], 8), Pseq(["B0".namecps], 8), Pseq(["a0".namecps], 16)], 2), Pseq([Pseq(["B0".namecps], 8), Pseq(["c#1".namecps], 8), Pseq(["d1".namecps], 16)], 2)], 1), \delta, 1/4, \below, Pwhite(1, 0.2), \mod, Pseq([0, 1, 4], inf), \amp,10, \comp, 2, \rl, Prand([0.4, 0.1, 1]+0, inf), \cut, Prand([3320,4400, 3320, 1000]/7, inf), \out, 6)}).play;
});

t.schedAbs(144+16, {Pdef(\pbass, {Pbind(\instrument, \panda_bassAR, \root, 11, \scale, Scale.minor, \degree, Pseq([Pseq([Pseq([0, 3, 9, 7]*1, 2), Pseq([3, 7, 9, 15]*1, 2), Pseq([0, 3, 0, 0]*1, 2)]*1/2, 2), Pseq([Pseq([0, 3, 9, 7]*1, 2), Pseq([3, 7, 9, 15]*1, 2), Pseq([0, 3, 0, 0]*1, 2)]*1, 2), Pseq([Pseq([0, 3, 9, 7]*1, 2), Pseq([3, 7, 9, 15]*1, 2), Pseq([0, 3, 0, 0]*1, 2)]*1/4, 8)], inf), \amp, 0.4, \delta, Pseq([Pseq([1/4], 36), Pseq([1/8], 36/2), Pseq([1/8], 38)], 1), \rl, 2, \rate, 9512)}).play;}); // amp to Pfunc and midi control :)


// verse 2  ***** -> 176
t.schedAbs(176, {
		    t.beats.postln;
//Ndef(\gliss).stop.clear;
Pdef(\pbass, {Pbind(\instrument, \panda_bass, \degree, [0, 1, 2 , 3])}).stop;

		Pdef(\pk, {Pbind(\instrument, \panda_kick, \delta, Pseq([
	Pseq([
		Pseq([2, 1/2, 3/2], 1), Pseq([1.75, 1/4, 1/2, 1, 1/2], 1)], 6),
	    Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([3.5,1/2], 1)], 1), // ?pseudo-break?
    	Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([1.75, 1/4, 1/2, 1, 1/2], 1)], 1),
    	Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([4], 1)], 1), // ?break?
	    Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([1.75, 1/4, 1/2, 1, 1/2], 1)], 7)], 1),
		\tempo, 87/60, \amp, 1,\freqk, 1, \fmod, 12, \release, 0.01, \comp, 0.9  )}).play; //16

	Pdef(\ps, {Pbind(\instrument, \panda_snare, \delta, Pseq([Pseq([Pseq([1], 4)], 9),Pseq([Pxrand([1/2], 8)], 1), Pseq([Pseq([1], 4)], 6)],2), \tempo, 87/60, \amp,
		Pseq([
	Pseq([0, 3, 0, 3], 6),
	Pseq([3, 3, 0, 3], 1), // break WORKING HERE!
	Pseq([0, 3, 0, 3], 2),
	Pseq([Prand([3,0], 1), Prand([3,0], 1), Prand([3,0], 1), Prand([3,0], 1)], 2),
	], inf),
		\rl, Prand([0.1], inf), \rldrill, Prand([1/3, 1/8], inf), \mod, 350, \comp, 7, \out, 3)}).play;
});

// break 2 // ----> 308
t.schedAbs(308, {
		    t.beats.postln;
	Pdef(\pbassriff).stop;

	Pdef(\phi, {Pbind(\instrument, \panda_snare, \delta, Pseq([Pseq([Pseq([1], 4)], 7),
		Pseq([Pseq([2, 1, 1/3, 1/3, 1/3], 1)], 1)],1), // to verse \\\
		\tempo, 87/60, \amp, Pseq([4, 2, 2, 2], inf), \rl, Pseq([0.1, 0.01, 0.4], inf), \rldrill, 1, \mod, Pwhite(8999, 9800), \eqf, 900)}).play;

	Pdef(\pbassPedal, {Pbind(\instrument, \panda_bass1, \freq, Pseq([Pseq([Pseq(["B0".namecps], 8), Pseq(["B0".namecps], 8), Pseq(["a0".namecps], 16)], 2), Pseq([Pseq(["B0".namecps], 8), Pseq(["c#1".namecps], 8), Pseq(["d1".namecps], 16)], 2)], 1), \delta, 1/4, \below, Pwhite(1, 0.2), \mod, Pseq([0, 1, 4], inf), \amp,10, \comp, 2, \rl, Prand([0.4, 0.1, 1]+0, inf), \cut, Prand([3320,4400, 3320, 1000]/7, inf), \out, 6)}).play;

});

t.schedAbs(308+16, {Pdef(\pbass, {Pbind(\instrument, \panda_bassAR, \root, 11, \scale, Scale.melodicMinor, \degree, Pseq([Pseq([Pseq([0, 3, 9, 7]*1, 2), Pseq([3, 7, 9, 15]*1, 2), Pseq([0, 3, 0, 0]*1, 2)]*1/2, 2), Pseq([Pseq([0, 3, 9, 7]*1, 2), Pseq([3, 7, 9, 15]*1, 2), Pseq([0, 3, 0, 0]*1, 2)]*1, 2), Pseq([Pseq([0, 3, 9, 7]*1, 2), Pseq([3, 7, 9, 15]*1, 2), Pseq([0, 3, 0, 0]*1, 2)]*1/4, 8)], inf), \amp, 0.4, \delta, Pseq([Pseq([1/4], 36), Pseq([1/8], 36/2), Pseq([1/8], 38)], 1), \rl, 2, \rate, 9512)}).play;});


// verse 3 ---> 340
t.schedAbs(340, {
		    t.beats.postln;
	Ndef(\gliss).stop.clear;
	Pdef(\pk, {Pbind(\instrument, \panda_kick, \delta, Pseq([Pseq([2, 1/2, 3/2], 1), Pseq([1.75, 1/4, 1/2, 1, 1/2], 1)], 20/2), \tempo, 87/60, \amp, 1,\freqk, 1, \fmod, 12, \release, 0.01, \comp, 0.9  )}).play;


Pdef(\ps, {Pbind(\instrument, \panda_snare, \delta, Pseq([Pseq([1], 4)], 20), \tempo, 87/60, \amp, Pseq([
	Pseq([0, 3, 0, 3], 1),
	Pseq([3, 0, 0, 3], 1), // break WORKING HERE!
	Pseq([0, 3, 0, 3], 2),
	Pseq([Prand([3,0], 1), Prand([3,0], 1), Prand([3,0], 1), Prand([3,0], 1)], 2),
	], inf), \rl, Prand([0.1], inf), \rldrill, Prand([1/3, 1/2], inf), \mod, Pwhite(350, 348), \comp,7, \out, 3)}).play;});

// outro   ----  ?????
t.schedAbs(420, {
		    t.beats.postln;
	Pdef(\phi, {Pbind(\instrument, \panda_snare, \delta, Pseq([Pseq([Pseq([1], 4)], 7),
		Pseq([Pseq([2, 1, 1/3, 1/3, 1/3], 1)], 1)],inf),
		\tempo, 87/60, \amp, Pseq([4, 2, 2, 2], inf), \rl, Pseq([0.1, 0.01, 0.4], inf), \rldrill, 1, \mod, Pwhite(8999, 9800), \eqf, 900)}).play;

	Pdef(\pbassPedal, {Pbind(\instrument, \panda_bass, \freq, Pseq([Pseq([Pseq(["B0".namecps], 8), Pseq(["B0".namecps], 8), Pseq(["a0".namecps], 16)], 2), Pseq([Pseq(["B0".namecps], 8), Pseq(["c#1".namecps], 8), Pseq(["d1".namecps], 16)], 2)], inf), \delta, 1/4, \dec, Pwhite(0.1, 0.5), \mod, Pseq([0, 1, 4], inf), \amp, 7, \comp, 2.3, \rl, Prand([0.4, 0.1, 1], inf), \cut, Prand([3320,4400, 3320, 1000], inf))}).play;
});
); ///

////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING
////////////////////////////////////////////////////////////////////////// LIVE CODING

Ndef(\fxs2, {Limiter.ar(GVerb.ar(In.ar(3), 9, 0.1),1) * Line.kr(0, 0.7, 15)}).play(0, 2).fadeTime_(5); // Line

Ndef(\fxs, {|outfx=0|var in = RHPF.ar(CombC.ar(In.ar(3, 2), 1, [(87/4)/60, (87/2)/60], 2), [Line.kr(1, 1/2, 4).range("B6".namecps, "g4".namecps), Line.kr(1).range("B3".namecps, "g4".namecps)], 0.01) + In.ar(3); Out.ar(outfx, Limiter.ar(in, 0.191)*0.7)}).play(0, 2).fadeTime_(5); ///.reverse on Line Array

/// LIVE COding on this one (change line1 end & time mainly)
(
Ndef(\fxs, {|outfx=0|var in = RHPF.ar(CombC.ar(In.ar(3, 2), 1, [(87/4)/60, (87/2)/60], 2),
	[Line.kr(1, 1/8, 8).range("B6".namecps, "g4".namecps),
		Line.kr(1).range("B3".namecps, "g4".namecps)], 0.01) + In.ar(3);
	Out.ar(outfx, Limiter.ar(in, 0.191)*1)}).play(0, 2).fadeTime_(5); ///.reverse on Line Array
);

/// BASS & more...
Pdef(\pbassriff, {Pbind(\instrument, \panda_bassX, \freq, Pseq([Pseq([Pseq([["c0".namecps, "d#0".namecps]*2, "a0".namecps], 8), Pseq([["B0".namecps, "d#0".namecps]*2, "B0".namecps], 16)]*1, 2), Pseq([Pseq([["f0".namecps, "d0".namecps]*2, "f#0".namecps], 8), Pseq(["c#1".namecps, "e1".namecps], 8)]*1, 2)], 1), \delta, Pseq([1.5, 1/2, 1, 1/2, 1/4, 1/4]/1, inf), \amp, Pseq([1.5, 0], inf), \rl, Pseq([2, 0.5, 0.1, 0.5, 0.5, 0.1, 0.3, 0.1]/1, inf), \dec, 0.1, \mod, Pwhite(-1, 1), \out, 0)}).play;

Pdef(\pbassriff).stop;

(// 8 repetiton of array
Pdef(\riff, {Pbind(\instrument, \panda_bassX, \freq, Pseq([Pseq([Pseq([["f0".namecps, "d0".namecps]*4, "e0".namecps], 2), Pseq(["c1".namecps, "e1".namecps], 2)]*3, 1)], 3), \delta, Pxrand([1/2, 1/2, 1, 1/2, 1/2, 1/4, 1/4, 1/4, 1/4]/8, inf), \amp, Pxrand([0.6, 0, 0, 0.6], inf), \rl, Pwhite(0.2, 1.5), \dec, 1, \mod, Pwhite(-9, 1), \out, 16)}).play;

Ndef(\fxriff, {BPF.ar(In.ar(16,2), LFPulse.kr(87/(60/2), 0, 0.2).range("g4".namecps, "b7".namecps), 0.4) * 0.6}).play(0,2);
);

Ndef(\fxriff).stop;

//nice harmonies, original
Pdef(\pbass, {Pbind(\instrument, \panda_bassOR, \degree, [0, 1, 2 , 3]*3, \amp, 0.2, \delta, 1/2, \rl, 6)}).play;
Pdef(\pbass).stop(5);

// impro
Pdef(\pbass, {Pbind(\instrument, \panda_bassOR, \degree, [0, 1, 2 , 3]*4, \amp, 0.2, \delta, 1/2, \rl, 6)}).play;


// GLISS

Ndef(\g, {Latch.ar(Saw.ar(Line.kr(40, 1900, [21,26,33,10])).tanh, Impulse.ar(4500)) * Line.kr(0, 0.4, 18)}).play;

Ndef(\g, {Latch.ar(Saw.ar(Line.kr(40, 1700, [12,23,34,33])).tanh, Impulse.ar(2200)) * Line.kr(0,0.4, 12)}).play;

Ndef(\gliss, {Splay.ar(Latch.ar(Saw.ar(Line.kr(40, 1900, [21, 26, 33, 15], doneAction: 0), LFNoise0.kr(87*8/60)).tanh, Impulse.ar(4500)), 1) * Line.kr(0, 0.8, 18)}).play;

// interrupted line
Ndef(\gliss2, {Splay.ar(Latch.ar(Saw.ar(Line.kr(40, 1900, [21, 26, 33, 16], doneAction: 0),LFNoise0.kr(87*6/60)).tanh, Impulse.ar(4500)), 1) * Line.kr(0, 0.8, 12)}).play;

Ndef(\g).stop.clear;

//nice harmonies,
Pdef(\pbass1, {Pbind(\instrument, \panda_bassOR, \degree, [0, 1, 2 , 3]*1, \amp, 0.4, \rl, 0.5)}).play;
Pdef(\pbass).stop(5);

// bass 2
Ndef(\gliss10, {Splay.ar(Latch.ar(Saw.ar(Line.kr(40, 1900, [21, 26, 33, 16], doneAction: 0),LFPulse.kr(87*8/60)).tanh, Impulse.ar(4500)), 1) * Line.kr(0, 0.6, 12)}).play;

Ndef(\gliss).stop;

// record stop!
Ndef(\gliss2).stop;


// DROPS (1 bar)

// Panda suit highschool --> bar 16

Ndef(\gliss3, {Splay.ar(Latch.ar(Saw.ar(Line.kr(40, 1900, [21, 26, 33, 15]/4, doneAction: 0)).tanh, Impulse.ar(4500)), 1) * Line.kr(0, 0.2, 12)}).play;

// f!@#$% you dave...
Ndef(\endspin, {ReplaceOut.ar(0, PitchShift.ar(In.ar(0,2), 0.01, LFNoise1.kr(LFNoise0.kr(6).range(8, 1)).range(4, -1/16))*Line.kr(4, 0, 1))}).play(0,2);


/// TODO: end spin

Ndef(\endspin).free;

