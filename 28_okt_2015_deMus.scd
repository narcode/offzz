//////




Ndef(\n, {LPF.ar(WhiteNoise.ar(0.7), 400) * EnvGen.kr(Env.perc(0.01, 1).circle(2))}).play(0,2);

/// i will modify the sound:

// changed the Low pass filter


// reverb always nice:
Ndef(\n, {GVerb.ar(LPF.ar(WhiteNoise.ar(0.7), LFSaw.kr(2).range(400, 1200)) * EnvGen.kr(Env.perc(0.01, 1).circle(2)), 70, 2)}).play(0,2);


/// some sound for aNne???

// yeah, anne has reverb:
Ndef(\anne, {GVerb.ar(SoundIn.ar(2), 134, 2) * 0.2}).play(0,2);


/// or a bass?

/// make a chord now:
Ndef(\r).fadeTime_(3);
Ndef(\r, {SinOsc.ar(["f1".namecps, "ab1".namecps, "c1".namecps]*[2, 1]*LFPulse.kr(1/2).range(1, 3/2).lag(1)) * LFPulse.kr(2) * 0.2}).play(0,2);


// something more with the explosion:

// routine:

Tdef(\a, {
	loop{
Ndef(\n, {GVerb.ar(LPF.ar(WhiteNoise.ar(0.7), LFSaw.kr(2).range(400, 1200)) * EnvGen.kr(Env.perc(0.01, 1)), 70, 8)}).play(0,2);
		4.wait
	}
}).play;


// explosion 2


// maybe add panning:
Tdef(\b, {
	var pan = [0,1].asStream;
	loop{
Ndef(\c, {GVerb.ar(HPF.ar(WhiteNoise.ar(0.1), LFSaw.kr(8).range(3400, 8200)) * EnvGen.kr(Env.perc(0.01, 1)), 170, 0.3)}).play(pan.next.postln,1);
		(1).wait
	}
}).play;


/// delay for anne:
Ndef(\anne).fadeTime_(4);
Ndef(\anne, {CombN.ar(GVerb.ar(PitchShift.ar(SoundIn.ar(2), 0.2, LFPulse.kr(3).range(1, 3/2)), 134, 2) * 0.2, 0.5, 0.25, 4) * 1}).play(0,2);


Tdef(\b).stop;

Ndef(\c).stop(4);

Ndef(\r, {SinOsc.ar(["f1".namecps, "ab1".namecps, "c1".namecps]*[2, 1]*LFPulse.kr(1/2).range(1, 3/2).lag(1)) * LFPulse.kr(Line.kr(4, 18, 5)) * 0.2}).play(0,2);


Ndef(\r).stop(0.1);


