///// Carilloffz \\\\\\

// im in a good mood.


t = TempoClock.default;
t.tempo = 80/60;

(
~freq = 440;
{
        var pch= Pitch.kr(SoundIn.ar, minFreq: 260, maxFreq: 1000, median: 7,ampThreshold:0.005);
        var src= pch[0].round;
        SendTrig.kr(Trig.kr(HPZ1.kr(src).abs>0*pch[1], 0.1), 0, src);
        DC.ar(0);	//silence
}.play;

)

(
OSCdef(\osc, { arg msg, time;
	var out;
	~freq = msg[3];
	out = [0,1,4,5];
~amp = 1;
	("detected " + ~freq).postln;

	Ndef(\kramp, {0});

	if (~freq.asInt < 274) {
		("detected " + ~freq).postln;
		Ndef(\kramp, {Amplitude.kr(SoundIn.ar(0))});
		Ndef(\a, {~amp*SinOsc.ar([~freq, ~freq/2, ~freq*0.4], mul: 0.01).sum * LFTri.kr(6).range(0,3) * EnvGen.kr(Env.perc(0.1, 5), doneAction: 12)}).play([0,1,4,5].choose, 1).fadeTime_(0.2);
	};

/// ok lets do more fx for anne...
		if (~freq.asInt % 4 == 0) {
		("detected " + ~freq).postln;
		Ndef(\a, {0.1*CombN.ar(FreqShift.ar(SoundIn.ar, LFPulse.kr(4).range(100, 7878)), 0.2, 0.2, 5) * EnvGen.kr(Env.perc(0.1, 5), doneAction: 12)}).play([0,1,4,5].choose, 1).fadeTime_(0.2);
	};

	// another fx!
			if (~freq.asInt % 2 == 0) {
		("detected " + ~freq).postln;
		Ndef(\a, {0.8*CombN.ar(PitchShift.ar(SoundIn.ar, 0.2, [1, 1/2, 3/2, 5/6]), 0.2, 0.2, 5) * EnvGen.kr(Env.perc(0.1, 5), doneAction: 12)}).play([0,1,4,5].choose, 1).fadeTime_(0.2);
	};



},'/tr', s.addr);

)

Ndef(\w, {SinOsc.ar([~freq, ~freq/2, ~freq*0.4], mul: 0.01).sum * LFTri.kr(6).range(0,3) * EnvGen.kr(Env.linen(0.1, 10, 5), doneAction: 12)}).play([0,1,4,5].choose, 1);

/// i cheated. beacuse i prepared that code! ...

/// mmm... i want louder...
(
Tdef(\n, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([4], inf).asStream;
	loop{
		(rit.next).wait;
		Ndef(\w, {BPF.ar(PinkNoise.ar(0.8), 856, 0.1)*EnvGen.kr(Env.linen(0.01, 0.1, 0.1), doneAction: 2)}).play(out.next, 1);
	}
}).play;
);

/// this rhythm is boring. i need more!
(
Tdef(\n2, {
	var out = Pseq([0,1,4,5], inf).asStream;
	/// this is my rhythm...
	var rit = Pseq([1/2, 1.5, 1/4, 1/4, 1/4, 1/4], inf).asStream;
	loop{
		(rit.next).wait;
		Ndef(\w2, {HPF.ar(PinkNoise.ar(0.1), 7456)*EnvGen.kr(Env.linen(0.01, 0.05.rrand(0.01), 0.01), doneAction: 2)}).play(out.next, 1);
	}
}).play;
);

( // i need a bass/.... yeeees my bass is coming
Tdef(\nb, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([1/2], inf).asStream;
	loop{
		(rit.next).wait;
		Ndef(\wb, {7*BPF.ar(HPF.ar(PinkNoise.ar(1)+SinOsc.ar(Line.kr(120, 50, 0.2)), 40), 356, 0.1)*EnvGen.kr(Env.linen(0.01, 0.1, 0.01), doneAction: 2)}).play(out.next, 1);
	}
}).play;
);

t.tempo = 100/60;



(
Tdef(\na, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([1], inf).asStream;
	loop{
				(rit.next).wait;
		Ndef(\hi, {HPF.ar(PinkNoise.ar(0.2), 9897)*EnvGen.kr(Env.perc(0.001, 0.01), doneAction: 2)}).play(out.next, 1);
	}
}).play;
);

Tdef.all.do{|t| t.stop;};

(
Tdef(\nar, {
	var out = Pseq([0,1,4,5].stutter(1), inf).asStream;
	var rit = Pseq([1/2], inf).asStream;
	var names = Pseq([\b2, \b1, \b], inf).asStream;
	loop{
		Ndef(names.next, {HPF.ar(LPF.ar(PinkNoise.ar(1*Line.kr(1, 0, 0.003)), 2789)+SinOsc.ar(Line.kr(120, 20, 0.2), mul: 0.7).tanh, 50)*0.2*EnvGen.kr(Env.perc(0.01, 0.05), doneAction: 2)}).play(out.next, 1);
						(rit.next).wait;
	}
}).play;
)

// PART B... chating again because i prepared this. (ha ha ha)

// mosquitos
/// this will buy me time:

/// lets put this in a routine:
Tdef(\r, {
	loop{
Ndef(\ns, {(Saw.ar([540, 320]*LFNoise1.kr(3).range(0.95, 1.12))*PinkNoise.ar(0.3))*EnvGen.kr(Env.perc(0.2, 1))}).play(8, 6);
		4.wait;
	}
}).play;

/// aha. anne is going rhythmical again
Tdef(\r2, {
	loop{
		Ndef(\ns2, {(Saw.ar([540.rrand(3456), 320]*LFNoise1.kr(8).range(0.95, 1.12))*PinkNoise.ar(0.3))*EnvGen.kr(Env.perc(0.2, 0.1))}).play(8, 6);
		2.wait;
	}
}).play;

Tdef(\r2, {
	loop{
		Ndef(\ns2, {(Saw.ar([540.rrand(3456), 320]*LFNoise1.kr(8).range(0.95, 1.12))*PinkNoise.ar(1))*EnvGen.kr(Env.perc(0.02, 0.1))}).play(8, 6);
		2.wait;
	}
}).play;

// reverb
Ndef(\v).fadeTime_(4);
Ndef(\v, {GVerb.ar(In.ar(8,6), 120, 9)*0.1}).play(0,6);

/// anne needs an fx
Ndef(\anne, {1*CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [1, 3/2, 6/5]), 0.2, 7)}).play(0,2);

Ndef(\anne).stop(4);

TdefAllGui();




