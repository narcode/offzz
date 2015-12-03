/////// fx rehearsal for Biblao


x = LiveBuffer(4);

x.record(1);

x.buffer.play;

Ndef(\a, {PitchShifter.ar(PlayBuf.ar(1, x.buffer.bufnum, 1/2, loop:1), LFNoise0.kr(1/4).range(1, 1.05), 0.1, 2) * 4 * LFTri.kr(3).range(0,1)}).stop;


Ndef(\ane, {DynKlank.ar(`[[100, 60, 123], nil, [1, 3]], Amplitude.kr(SoundIn.ar(1))*BrownNoise.ar(0.1), 1) * 0.005}).play(2,2);


/////// whole set try-out

/////// talk | 2 songs | 1st song: staccato ///// 2nd song: full on -> gizzard

Ndef(\a, {FreeVerb.ar(WhiteNoise.ar(LFNoise0.kr(1).range(0, 0.1))* LFPulse.kr(LFNoise0.kr(1).range(0.5, 1), 0.8, 1))}).play.fadeTime_(4);


Ndef(\a, {HPF.ar(FreeVerb.ar(WhiteNoise.ar(LFNoise0.kr(1).range(0, 0.5))* Impulse.ar(LFPulse.kr(2).range(8, 12)).range(0, 0.5), 0.8, 1), LFNoise2.kr(1/6).range(720, 4789))*40}).play.fadeTime_(4).quant_(2);

Ndef(\b, {HPF.ar(FreeVerb.ar(WhiteNoise.ar(LFNoise0.kr(2).range(0, 0.8))* Impulse.ar(LFNoise0.kr(4).range(8, 12)).range(0, 0.1), 1, 1), LFPulse.kr(1/6).range(120, 1789))*40}).play(1).fadeTime_(4).quant_(2);

Ndef(\c, {|freq=120| Blip.ar(freq, EnvGen.kr(Env.linen([6, 0.5], 1, [5,1]).circle).exprange(1, 10), LFNoise1.kr(2).range(0, 0.6)*Saw.ar(freq/2, 0.3)) * LFPulse.kr(8)}).play.fadeTime_(4);

Ndef(\c, {|freq=320| Saw.ar(freq, EnvGen.kr(Env.linen(6, 1, 5).circle).exprange(1, 10)) + LFNoise0.kr(4).range(0.2, 0.6)*Saw.ar(freq, 0.3) * LFPulse.kr(10)}).play.fadeTime_(4);


Ndef(\a).stop;


/// hjskdnfjnbdjd jdhdjd  /////// 14th okt 2014

Ndef(\a).fadeTime_(5);

Ndef(\a, {Impulse.ar([8, 4]) * 2 * EnvGen.kr(Env.perc(0.01, 2).circle)}).play(0,2).quant_(1);

Ndef(\b, {|freq=300| SinOsc.ar([freq, freq*4/3], 0, EnvGen.kr(Env.perc(1, 0.01).circle)) * 0.4 * EnvGen.kr(Env.perc(1, 0.2).circle)}).play.quant_(1);

Ndef(\c, {|freq2=400| Saw.ar([freq2, freq2*4/3], EnvGen.kr(Env.perc(1, 0.05).circle)) * 0.1 * EnvGen.kr(Env.perc(1, 0.2).circle)}).play.quant_(1);

Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["g1".namecps(), "g0".namecps()], inf), \delta, 1/2)}).play

Pdef(\c, {Pbind(\type, \set, \freq2, Pseq(["g1".namecps(), "f#2".namecps()], inf), \delta, 1/8)}).play

Ndef(\c).stop(10);

Ndef(\fel).stop(0.1);

Ndef(\fx, CombN.ar(In.ar(5,2), 0.5, 0.2, 0.1)).stop(0,2);

Ndef(\me1).stop;


/// quickie

t = TempoClock.default;

t.sched(1, {Ndef(\last, {ReplaceOut.ar([0,1,2,3], FreeVerb.ar(In.ar(0,4), Line.kr(0, 1, 20), 1, mul: EnvGen.kr(Env.linen(14,6,0.1)))*PinkNoise.ar(Line.kr(0.001, 1, 10)) )}).play });

Ndef(\a).clear.fadeTime_(1);

Ndef(\a, {FreeVerb.ar(SinOsc.ar(LFSaw.kr(1/2).range("a1".namecps, "b1".namecps)), 0.1, 0.1) * 0.9}).play;

Ndef(\b, {FreeVerb.ar(SinOsc.ar(LFSaw.kr(8).range("a2".namecps, "c#1".namecps)), 0.1, 0.6) * 0.9}).play(1,1);


/// quickie #2

t = TempoClock.default;

t.sched(1, {Ndef(\last, {ReplaceOut.ar([0,1], BPF.ar(In.ar(0,2), Line.kr(40, 17000, 10), 0.01, EnvGen.kr(Env.linen(14, 0 ,0.1), doneAction: 0)) )}).play; "ending...".postln; });

Ndef(\a).clear.fadeTime_(9);

Ndef(\a, {|freq=82| EnvGen.kr(Env.perc(6, 8).circle) * Blip.ar(freq, LFSaw.kr(4).range(1, 8)) * 1}).play;

Ndef(\Ana, {var in= SoundIn.ar(0);
	var rev = FreeVerb.ar(in, 0.9, room: 0.8);
	CombC.ar(rev, 0.6, LFNoise1.kr(1/5).range(0.01, 0.6), 3) * 1;
}).play(2,2);



