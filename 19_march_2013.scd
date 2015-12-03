Ndef(\me, {LPF.ar(SoundIn.ar(0), 300) * Dust.kr(10) * 1}).play.fadeTime_(3);

Ndef(\me2, {LPF.ar(WhiteNoise.ar(0.8), SinOsc.kr(1/4).range(300, 800)) * LFTri.kr(2) * 0.5}).play.fadeTime_(3);

Ndef(\me2).stop(4);


// inside piano

Ndef(\me, {FreeVerb.ar(LPF.ar(PitchShift.ar(SoundIn.ar(1), 0.2, LFNoise1.kr(3).range(0.7, 0.5)), 500),0.5, 0.8, 0.1  ) * 8}).play.fadeTime_(6);

Ndef(\me, {FreeVerb.ar(LPF.ar(PitchShift.ar(SoundIn.ar(1), 0.2, LFNoise1.kr(0.1).range(2.7, 0.5)), 900),0.5, 0.8, 0.1) * 14}).play.fadeTime_(6);

Ndef(\me, {CombN.ar(LPF.ar(PitchShift.ar(SoundIn.ar(1), 0.2, LFPulse.kr(0.3).range(3/2, 2/1)), 800), 3, 0.1, 10) * LFTri.kr(1/2).range(0.1, 2)}).play.fadeTime_(6);

Ndef(\me2, {CombN.ar(LPF.ar(PitchShift.ar(SoundIn.ar(1), 0.2, LFPulse.kr(0.3).range(5/4, 0.5)), 800), 3, 0.1, 10) * Saw.kr(5).range(0.1, 2)}).play.fadeTime_(6);

Ndef(\lap, {FreeVerb.ar(SinOsc.ar("e3".namecps).distort, 0.8, 10).distort * SinOsc.kr(0.25).range(0, 1.2)}).play(1, 1).fadeTime_(8);

Ndef(\lap2, {FreeVerb.ar(SinOsc.ar("e6".namecps).distort, 0.8, 10).distort * SinOsc.kr(0.122).range(0, 0.3)}).play(1, 1).fadeTime_(4);


Ndef(\me2).stop(2);
