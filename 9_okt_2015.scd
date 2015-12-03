/// Off<>zz Okt 9 2015

/// Little soundcheck first//////

Ndef(\n).clear;

Ndef(\n).fadeTime_(5);

Ndef(\n, {SinOsc.ar("B2".namecps) * LFNoise0.kr(5).range(0, 0.1)}).play(0,2);

Ndef(\a, {|freq=440| SinOsc.ar([freq*2, freq]) * LFNoise0.kr(7).range(0, 0.15)*LFTri.kr(2)}).play;


Ndef(\r, {SinOsc.ar("C1".namecps) * LFNoise0.kr(6).range(0.01, 0.05)}).play(0,2);

Pdef(\n, {Pbind(\type, \set, \freq, Prand(["a2".namecps, "b2".namecps, "B2".namecps, "c3".namecps]*0.25, inf), \delta, 0.5)}).play;



/// ok thanks.... piano too???

"say -v vicki -r 99 she is a real player...".unixCmd;

Ndef(\bye, {ReplaceOut.ar(In.ar(0,1), LPF.ar(In.ar(0,2), Line.kr(1700, 50, 5)))}).play;

///////////////  20hrs --> \\\\\\\\\\\\\\\\\\\

/// oops... test later... now play


//// we have concert soon about polyphony... sooooo...

Ndef(\n, {|freq=120|SinOsc.ar(freq)*LFTri.kr(0.01, 0.01)}).play(0,2);

Pdef(\n, {Pbind(\type, \set, \freq, Prand(["b2".namecps,"B2".namecps, "c3".namecps, "B2".namecps, "a3".namecps, "a2".namecps]*1/2, inf), \delta, 1/4)}).stop;

Ndef(\a, {|freqa=110, rate=2|(HPF.ar(WhiteNoise.ar(LFPulse.kr(t.tempo*rate, width:0.1).range(0, 0.15)), 3234)+SinOsc.ar(freqa)+LPF.ar(Saw.ar(freqa*3/2*1/2, mul: LFTri.kr(2).range(1, 1.5)), 880))*LFPulse.kr(t.tempo, width: 0.8).range(0, 0.01)}).play(0,2);

Pdef(\a, {Pbind(\type, \set, \args, [\freqa, \rate], \rate, Pseq([2, 4, 4, 1], inf),\freqa, Prand(["b2".namecps,"B2".namecps, "c4".namecps, "B2".namecps, "a4".namecps(-25), "a2".namecps]*1/2, inf), \delta, 1/3)}).stop;

Ndef(\r, ).play

t.tempo_(105/60)

Ndef(\a).quant_(0);

Ndef(\n).quant_(1);

Ndef(\r).fadeTime_(0.4);

Ndef(\r, {|freq=220|CombN.ar(SinOsc.ar(freq, mul: EnvGen.kr(Env.perc(0.01, 0.1).circle(4)))*0.02, 0.5, [1/3, 1/2], [2, 6])}).play;

/// ah i hear it now...

Ndef(\anne2, {CombN.ar(PitchShift.ar(SoundIn.ar(3), 0.2, 1/1.98), 1, t.tempo, 4)*0.15}).play(0,2);

Ndef(\anne2).stop;

Ndef(\anne, {CombN.ar(PitchShift.ar(SoundIn.ar(3), 0.2, [3/2, 1/2, 6/5]), 1, [t.tempo*2.5, t.tempo*1], 10)*0.35}).play(0,2);


"say -v vicki -r 178 the end".unixCmd;


t = TempoClock.default.tempo_(80/60);


Ndef(\c, {CombN.ar(SoundIn.ar(0), 0.2, 0.2, 6)*0.8}).play(0,2);

Ndef(\o, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [12, 6/2]), 0.2, 0.8, 16)*0.8}).play(0,2);


Ndef(\d, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [1/"b4".namecps]), 0.2, 1.5, 16)*2}).play(6,2); // <--- i cant hear this one

Ndef(\d).stop(5);

///// but it was fun. will try more stuff at some point.

/// streaming?

//////
/////   LULLABY FOR ALICE
////
////
///


"say -v vicki -r 67 good night alice".unixCmd;

/// lullaby reverb for piano:
Ndef(\a, {GVerb.ar(CombN.ar(SoundIn.ar(0,2), 0.2, 0.5, 4), 56, 5, 0.1)*0.6}).play(0,2);

// my sound:
Ndef(\n).fadeTime_(5);
Ndef(\n).quant_(0);  // <--- quantization

// routine for my sound:
Tdef(\n, {
	loop{
		Ndef(\n, {FreeVerb.ar(SinOsc.ar([("a2".namecps*LFTri.kr(1).range(2,1)).cpsmidi.round(3).midicps, "c3".namecps*(LFNoise0.kr(1).range(1, 2)).cpsmidi.round(2).midicps], mul: EnvGen.kr(Env.perc(0.1, 20)))*0.06, 1, 0.5)}).play(0,2);
		"this".postln;
		5.wait;
	}
}).play;










