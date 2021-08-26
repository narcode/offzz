Tdef(\pat, {
	1.do({|i|
		i.postln;
		Ndef(\met, {|freq=739| LPF.ar(Saw.ar([freq, "d4".namecps]), 180) * Line.kr(0.1, 1.2, 2, doneAction: 0)}).play(0, 2);
	1.wait;
	});
}).play;

Tdef(\pat).stop;

Ndef(\met, {|freq0=739| FreeVerb.ar(LPF.ar(Saw.ar([freq, "d4".namecps]), 180), 0.7, 0.6) * Line.kr(3.8, 0.3, 2, doneAction: 0)}).play(0, 2).fadeTime_(2);

Pdef(\f, {Pbind(\type, \set, \args, [\freq0], \freq, Prand(["g2".namecps, "g3".namecps, "g4".namecps, "g5".namecps], inf), \dur, 1/2)}).play



Ndef(\meAnne, {(HPF.ar(PinkNoise.ar(0.3), 1790) * SoundIn.ar(1).clip2(0.5)) * LFNoise0.ar([0.9, 0.3]).range(0.2, 1) * Line.kr(0.1, 0.4, 0.1) * 95}).play(0,2).fadeTime_(4);

// basic:
Ndef(\me, {(Crackle.ar(0.85) + SinOsc.ar(["g2".namecps, "g1".namecps]*(1/2)).distort) * LFNoise0.ar([2.9, 2.8]).range(0, 0.6) * Line.kr(0.0, 0.3, 20)}).play.fadeTime_(6);

Ndef(\me1, {(Crackle.ar(0.85) + SinOsc.ar(["g2".namecps, "g3".namecps]*(1)).distort) * LFNoise0.ar([2.9, 2.8]).range(0, 0.6) * 0.4}).play.fadeTime_(6);

Ndef(\me2, {(Crackle.ar(0.85) + SinOsc.ar(["g2".namecps, "g3".namecps]*(4/1)).distort) * LFPulse.ar([8, 8]).range(0, 0.6) * 0.4}).play.fadeTime_(6);


//
Ndef(\me, {(Crackle.ar(0.85) + SinOsc.ar(["g2".namecps, "g1".namecps]*(1/2)).distort) * LFPulse.ar([8, 8]).range(0, 0.6) * 0.4}).play.fadeTime_(6);

Ndef(\me).fadeTime_(10);

Ndef(\me, {Crackle.ar(0.5) * LFNoise0.ar([2.9, 2.8]).range(0, 0.6) * Line.kr(0, 0.3, 5)}).play.fadeTime_(6);

Ndef(\me, {(Crackle.ar(0.85) + SinOsc.ar(["d2".namecps, "f#2".namecps*0.5]/2).distort) * LFNoise0.ar([1.9, 3.8]).range(0, 0.6) * Line.kr(0.3, 0.9, 5) * 0.2}).play.fadeTime_(6);

Ndef(\me2, {(Crackle.ar(0.85) + SinOsc.ar(["g4".namecps, "g3".namecps*0.5]*1/1).distort) * LFNoise0.ar([10, 12]).range(0, 0.6) * Line.kr(0.3, 0.9, 5) * 0.2}).play.fadeTime_(6);

Ndef(\me).stop(1);
Ndef(\Anap).stop(3);
Ndef(\meAnne).stop(2);

Ndef(\Anap, {CombC.ar(PitchShift.ar(SoundIn.ar(1), 0.4, LFPulse.kr(1).range(3/2, 7/8).lag(1)), 0.4, 1/"c2".namecps, 4) * 3 * LFTri.kr(4).range(0.1, 0.4) }).play(1).fadeTime_(2);

Ndef(\anne2).stop;

Ndef(\Ana, {CombC.ar(SoundIn.ar(1), 0.4, 0.18, 8) * 0.8 }).play(0).fadeTime_(8);

Ndef(\micdyn, FreqShift.ar(SoundIn.ar(1), LFNoise1.ar(0.4).range(100, 500))).play.fadeTime_(4);

Ndef(\me1).stop(10);
Ndef(\me).stop(10);
Ndef(\me2).stop(10);
Ndef(\meN, {LPF.ar(WhiteNoise.ar(Line.kr(0.0, 5.0, 12, doneAction: 2)), Line.kr(80, 1220, 12))}).play;
