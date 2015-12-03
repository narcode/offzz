// me march 10th

Ndef(\me, {FreeVerb.ar(SinOsc.ar("a0".namecps), 0.5, 1).clip2(0.001) * LFTri.kr(0.8) * 10}).play(0, 2).fadeTime_(6);

Ndef(\me, {LPF.ar(FreeVerb.ar(SinOsc.ar("d1".namecps), 0.5, 1), Line.kr(1900, 90, 3)).clip2(0.1) * Impulse.kr(1) * 4}).play(0, 2).fadeTime_(6);

Ndef(\me2, {LPF.ar(FreeVerb.ar(SinOsc.ar("d1".namecps), 0.5, 1), LFNoise0.kr(400, 90, 3)).clip2(0.1) * Impulse.kr(0.2) * 4}).play(0, 2).fadeTime_(6);

Ndef(\Ana, {var in = CombC.ar(Resonz.ar(FreeVerb.ar(PitchShift.ar(SoundIn.ar(0, mul:1), 0.1, [5/4/4, 3/2/2]), 0.3, 1), "f2".namecps, 0.3), 2, 0.5, 20).distort; Out.ar([0,1], in* 2); }).play.fadeTime_(5);

Ndef(\mel, {Pulse.ar(EnvGen.kr(Env(["f1".namecps, "a2".namecps, "f2".namecps, "f#1".namecps], [10, 10, 10, 10], \lin, 3, 0))) * 0.5})

Ndef(\me).stop(5);
Ndef(\me2).stop(10);
Ndef(\Ana).stop(1);
Ndef(\mel).stop(1);


// \fx

Ndef(\Ana, {var in = CombC.ar(FreeVerb.ar(PitchShift.ar(SoundIn.ar(0, mul:1), 0.1, LFNoise1.kr(1).range(1.1, 0.8)), 0.4, 10), 0.2, 1/LFNoise0.kr(0.3).range("f2".namecps, "a1".namecps), 4).distort; Out.ar([0,1], in* 0.2); }).play.fadeTime_(3);