Ndef(\a, {|rate=3| Saw.ar(["B2".namecps, "e1".namecps], LPF.ar(BrownNoise.ar(0.3), LFTi.ar(1/2).range(120, 960))) * LFPulse.kr(rate).range(0, 0.5) * 0.4 }).play.quant_(1);

Ndef(\b).fadeTime_(3);

Ndef(\b, {|freq=80| SinOsc.ar([freq, freq/2]) * LFPulse.kr(4).range(0, 0.3) * 0.05}).play(4,2).quant_(1);

Pdef(\a, {Pbind(\type, \set, \freq, Pxrand(["g2".namecps(0), "d2".namecps, "g0".namecps, "g1".namecps, "g4".namecps]*4, inf), \delta, 1/12)}).play;

Ndef(\ane, {var in, fx, fx2;
	in = SoundIn.ar(0);
	fx = FreeVerb.ar(in, 0.6, 0.9);
	fx = PitchShifter.ar(in, [2, 3/2, 5/4]);
	fx2  = CombC.ar(fx, 0.3, 0.5, 6);
	Out.ar(2, Splay.ar(fx+fx2));
}).play(2,2);


Pdef(\b, {Pbind(\type, \set, \args, [\rate], \rate, Pseq([1/4, 1/2], inf), \delta, 1/2)}).stop;

Ndef(\a, {Crackle.ar(0.85) + SinOsc.ar(["g0".namecps, "g0".namecps]) * LFNoise0.kr([2.5, 2.8]).range(0, 0.6) * 0.2}).play.quant_(4);


Ndef(\c, {Crackle.ar(0.85) + SinOsc.ar(["g0".namecps, "g0".namecps]) * LFPulse.kr([2, 4]).range(0, 0.6) * 0.2}).play.quant_(4);


Ndef(\fx, {CombC.ar(In.ar(4,2), 0.3, 0.3, 2)}).play(0,2);


t = TempoClock.default;


t.sched(10, {Ndef(\k, {ReplaceOut.ar([0,2], HPF.ar(In.ar(0,2)*Impulse.ar(Line.kr(10, 670, 10)), Line.kr(30, 22000, 10)))}).play;});

