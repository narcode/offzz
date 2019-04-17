///// Carilloffz


/// exploring....
~freq = 0;
Ndef(\a, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFSaw.kr(1).range(0.5, 1.5))*1,0.2, 2)}).play(1,1);

// only low:
Ndef(\an, {CombN.ar(PitchShift.ar(LPF.ar(SoundIn.ar(0), 300), 0.2, LFSaw.kr(1).range(0.5, 1.5))*1,0.2, 4)}).play(5,1);

(
~freq = 440;  //'global' variable holding the last detected midinote
{
        var pch= Pitch.kr(SoundIn.ar, minFreq: 260, maxFreq: 1000, median: 7,ampThreshold:0.005);
        var src= pch[0];
        SendTrig.kr(Trig.kr(HPZ1.kr(src).abs>0*pch[1], 0.1), 0, src);
        DC.ar(0);	//silence
}.play;
)

// register to receive this message

(
OSCdef(\osc, { arg msg, time;
	var out;
	    ~freq = msg[3];
	~freq.postln;
	out = [0,1,4,5];
~amp = 1.5;
},'/tr', s.addr)
);

(
OSCdef(\osc, { arg msg, time;
	var out;
	    ~freq = msg[3];
	// ~freq.postln;
	out = [0,1,4,5];
~amp = 1.5;

	if (~freq.asInt < 300) {
		"one".postln;
		Ndef(\a, {~amp*Amplitude.kr(SoundIn.ar(0))*CombN.ar(SinOsc.ar((~freq/2), mul: 1)*LFTri.kr(5).range(0, 1), 0.2, 5) * EnvGen.kr(Env.perc(0.01, 10), doneAction: 12)}).play([0,1,4,5].choose, 1);
	};

	if (~freq.asInt < 500) {
				"fx".postln;
		if (~freq.asInt > 400) {
			// Ndef(\an, {~amp*Amplitude.kr(SoundIn.ar(0))*CombN.ar(SinOsc.ar(~freq/2, mul: 1)*LFTri.kr(8).range(0, 1), 0.2, 5) * EnvGen.kr(Env.perc(0.01, 10), doneAction: 12)}).play([0,1,4,5].choose, 1);
			Ndef(\an, {CombN.ar(PitchShift.ar(SoundIn.ar, 0.2, [1/2, 1/4, 5/4]), 0.1, 0.4, 23) * EnvGen.kr(Env.perc(0.01, 10), doneAction: 12)}).play(0,2);
	}
	};

	if (~freq.asInt%4 == 0) {
				"three".postln;
		Ndef(\s, {~amp*Amplitude.kr(SoundIn.ar(0))*CombN.ar(SinOsc.ar(~freq*LFSaw.kr(2).range(1/2, 2), 1), 0.2, 0.1, 3)*1*EnvGen.kr(Env.perc(0.01, 10), doneAction: 12)}).play(0,2);
	};


		if (~freq.asInt%6 == 0) {
				"four".postln;
		Ndef(\four, {~amp*Amplitude.kr(SoundIn.ar(0))*CombN.ar(SoundIn.ar(0)*LFPulse.kr(4), 0.2, 0.1, 7)*1*EnvGen.kr(Env.perc(0.01, 10), doneAction: 12)}).play(0,2);
	}



},'/tr', s.addr);
)

// wow
// Ndef(\s, {CombN.ar(Saw.ar(~freq*LFSaw.kr(1/2, 2), 0.1), 0.2, 0.1, 3)*0.2*EnvGen.kr(Env.perc(0.01, 10), doneAction: 2)}).play(0,2);

/// start with beat....
(
Tdef(\n, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([1/2, 1/2, 1/4, 1/4], inf).asStream;
	loop{
				(rit.next).wait;
		Ndef(\w, {PinkNoise.ar(0.1)*EnvGen.kr(Env.perc(0.01, 0.05), doneAction: 2)}).play(out.next, 1);
	}
}).play;
);

(
Tdef(\ni, {
	var out = Pseq([0,1,4,5].reverse, inf).asStream;
	var rit = Pseq([Pseq([1/2, 1/4, 1/4, 1/4], 3), Pseq([1/2, 1/12], 6)], inf).asStream;
	loop{
				(rit.next).wait;
		Ndef(\wi, {HPF.ar(PinkNoise.ar(1)*Saw.ar(1234*LFSaw.kr(1/8).range(1, 2)), 14898)*EnvGen.kr(Env.perc(0.01, 0.05), doneAction: 2)}).play(out.next, 1);
	}
}).play;
)

(
Tdef(\na, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([Pseq([1/4], 2), 1/2], inf).asStream;
	loop{
		Ndef(\b, {LPF.ar((SinOsc.ar(Line.kr(120, 60, 0.3, 0.4))+PinkNoise.ar(1)), 120)*EnvGen.kr(Env.perc(0.01, 0.1))}).play(out.next, 1);
		(rit.next).wait;
	}
}).play;
);

(
Tdef(\ns, {
	var out = Pseq([0,1,4,5], inf).asStream;
	var rit = Pseq([1/2], 1).asStream;
	var pitch = Pseq([1, 0.8, 0.75, 0.7, 0.6, 0.65, 0.5, 0.4, Pseq([0.2], inf)], inf).asStream;
	loop{
				(rit.next).wait;
		// Ndef(\ns, {(Saw.ar(554*pitch.next)*PinkNoise.ar(1))*EnvGen.kr(Env.perc(0.2, 0.1))}).play(out.next, 1);
		Ndef(\ns, {(Saw.ar([670, 320]*LFNoise1.kr(3).range(0.95, 1.12))*PinkNoise.ar(0.4))*EnvGen.kr(Env.perc(0.01, 1))}).play(8, 6);
	}
}).play;
);

Tdef(\n).stop;Tdef(\ns).stop;

TdefAllGui()

t = TempoClock.default;
t.tempo = 80/60;

~vol = Volume(s,

Ndef(\ns, {(Saw.ar([3270, 320]*LFNoise1.kr(3).range(0.95, 1.12))*PinkNoise.ar(0.1))*EnvGen.kr(Env.perc(1, 8))}).play(8, 6);

Ndef(\v, {GVerb.ar(In.ar(8,6), 120, 9)*0.1}).play(0,6);



