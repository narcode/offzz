///// Carilloffz

t = TempoClock.default;
t.tempo = 90/60;

(
~freq = 440;  //'global' variable holding the last detected midinote
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
	// ("detected " + ~freq).postln;

	Ndef(\kramp, {0});

	if (~freq.asInt < 274) {
		("detected " + ~freq).postln;
		Ndef(\kramp, {Amplitude.kr(SoundIn.ar(0))});
		Ndef(\a, {~amp*SinOsc.ar([~freq, ~freq/2, ~freq*0.4], mul: 0.01).sum * LFTri.kr(6).range(0,3) * EnvGen.kr(Env.perc(0.1, 5), doneAction: 12)}).play([0,1,4,5].choose, 1).fadeTime_(0.2);
	};

		if (~freq.asInt % 4 == 0) {
		("detected " + ~freq).postln;
		Ndef(\a, {~amp*SinOsc.ar([~freq, ~freq/2, ~freq*0.4], mul: 0.01).sum * LFTri.kr(6).range(0,3) * EnvGen.kr(Env.perc(0.1, 5), doneAction: 12)}).play([0,1,4,5].choose, 1).fadeTime_(0.2);
	};

			if (~freq.asInt % 3 == 0) {
		("detected " + ~freq).postln;
		Ndef(\a, {~amp* CombC.ar(FreqShift.ar(SoundIn.ar, LFPulse.kr(1).range(123, 6787)), 0.2, 0.2, 4) * EnvGen.kr(Env.perc(0.1, 5), doneAction: 12)}).play([0,1,4,5].choose, 1).fadeTime_(0.2);
	};

},'/tr', s.addr);


)

Ndef(\w, {SinOsc.ar([~freq, ~freq/2, ~freq*0.4], mul: 0.01).sum * LFTri.kr(6).range(0,3) * EnvGen.kr(Env.linen(0.1, 10, 5), doneAction: 12)}).play([0,1,4,5].choose, 1);

// wow
// Ndef(\s, {CombN.ar(Saw.ar(~freq*LFSaw.kr(1/2, 2), 0.1), 0.2, 0.1, 3)*0.2*EnvGen.kr(Env.perc(0.01, 10), doneAction: 2)}).play(0,2);

/// start with beat....
(
Tdef(\n, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([1], inf).asStream;
	loop{
				(rit.next).wait;
		Ndef(\w, {BPF.ar(PinkNoise.ar(0.4), LFNoise1.kr(1/2).range(420, 1456), 0.1)*EnvGen.kr(Env.linen(0.1, 0.1.rrand(0.01), 0.1.rrand(0.001)), doneAction: 2)}).play(out.next, 1);
	}
}).play;
);

(
Tdef(\na, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([Pseq([1/2], 6), Pseq([1/8], 4)], inf).asStream;
	loop{
				(rit.next).wait;
		Ndef(\hi, {HPF.ar(PinkNoise.ar(0.2), 9897)*EnvGen.kr(Env.perc(0.001, 0.01), doneAction: 2)}).play(out.next, 1);
	}
}).play;
);

/// start with beat....
(
Tdef(\nar, {
	var out = Pseq([0,1,4,5].stutter(2), inf).asStream;
	var rit = Pseq([1, 1/2, 1/2], inf).asStream;
	var names = Pseq([\b2, \b1, \b], inf).asStream;
	loop{
		Ndef(names.next, {LPF.ar(HPF.ar(PinkNoise.ar(0.8)+SinOsc.ar(Line.kr(120, 60, 0.2), mul: 0.4), 30), 540)*EnvGen.kr(Env.perc(0.01, 0.05), doneAction: 2)}).play(out.next, 1);
						(rit.next).wait;
	}
}).play;
);


Tdef(\n).stop;Tdef(\na).stop;Tdef(\nar).stop;Tdef(\nar2).stop;

TdefAllGui()

t = TempoClock.default;
t.tempo = 80/60;

~vol = Volume(s, 0, 6);
~vol.volume_(0.ampdb);

Ndef(\ns, {(Saw.ar([340, 320]*LFNoise1.kr(3).range(0.95, 1.12))*PinkNoise.ar(0.1))*EnvGen.kr(Env.perc(4, 28))}).play(8, 6);

Ndef(\ns2, {(Saw.ar([380, 320]*LFNoise1.kr(3).range(0.95, 1.12))*PinkNoise.ar(0.1))*EnvGen.kr(Env.perc(4, 28))}).play(8, 6);

Ndef(\v, {GVerb.ar(In.ar(8,6), 120, 9)*0.1}).play(0,6);

(
Tdef(\nar2, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([1/4], inf).asStream;
	loop{
Ndef(\ns, {(Saw.ar([2340, 320]*LFNoise1.kr(3).range(0.95, 1.12))*PinkNoise.ar(0.8))*EnvGen.kr(Env.perc(0.01, 0.1))}).play(8, 6);
						(rit.next).wait;
	}
}).play;
);

(
Tdef(\nar, {
	var out = Pseq([0,1,4,5].stutter(1), inf).asStream;
	var rit = Pseq([1], inf).asStream;
	var names = Pseq([\b2, \b1, \b], inf).asStream;
	loop{
		Ndef(names.next, {HPF.ar(LPF.ar(PinkNoise.ar(1*Line.kr(1, 0, 0.003)), 2789)+SinOsc.ar(Line.kr(120, 20, 0.2), mul: 0.7).tanh, 50)*0.2*EnvGen.kr(Env.perc(0.01, 0.05), doneAction: 2)}).play(out.next, 1);
						(rit.next).wait;
	}
}).play;
);


