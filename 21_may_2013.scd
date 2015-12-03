// Mei 21st 2013 ----

// Angry Anne


Ndef(\me, {GVerb.ar(SinOsc.ar(["c1".namecps, "g2".namecps] * 0.3, 0, LFNoise0.kr(0.7).range(0.1, 0.8)), 3, 5).distort * 0.6}).play.fadeTime_(5);

Ndef(\me2, {GVerb.ar(SinOsc.ar(["g1".namecps, "d1".namecps] * 0.3, 0, LFNoise0.kr(0.7).range(0.1, 0.8)), 3, 5).distort * 0.6}).play.fadeTime_(5);

Ndef(\an, {PitchShift.ar(SoundIn.ar(0) * LFSaw.ar(0.5).range(0.5, 1), 0.2, LFNoise1.kr(1.8).range(3/2, 1/2)).sqrt * 17 * Saw.ar(LFNoise0.kr(1).range(10, 30)).distort}).play(1).fadeTime_(7);

Ndef(\beat, {PinkNoise.ar(0.5) * LFTri.kr(Line.kr(15, 17, 30)).range(0.2, 0.9) * Line.kr(0.8, 1.9, 10)}).play.fadeTime_(1);

Ndef(\beat).stop(2);

Ndef(\beat2, {Impulse.ar(1).range(0.2, 0.9) * 7.7}).play(1).fadeTime_(1);

Ndef(\soloh, {FreeVerb.ar(SinOsc.ar(LFNoise0.kr(4).range("g#5".namecps, "d#6".namecps)), 0.9, 1) * Line.kr(0.1, 0.4, 10)}).play.fadeTime_(7);

Ndef(\solo2, {Saw.ar(Line.kr(4000, 10, 4)) * Line.kr(0.1, 0.4, 10)}).play.fadeTime_(7);


// Grooy

Ndef(\anne, {SoundIn.ar(0).distort * LFNoise0.ar(WhiteNoise.kr(0.7).range(4, 80)) * 1.2}).play.fadeTime_(3);



Ndef(\bass, {Pulse.ar(79) * SinOsc.ar(80) * 0.01}).play.fadeTime_(3);


Ndef(\snare, {LPF.ar(FreeVerb.ar(WhiteNoise.ar(1) * Impulse.kr(1/2), 0.6, 0.6), 140) * 8.9}).play.fadeTime_(3);

Ndef(\snare, {LPF.ar(FreeVerb.ar(WhiteNoise.ar(3) * Impulse.kr(1/2), 0.6, 1), 80) * 513.9}).play.fadeTime_(3);

(
Ndef(\snare).stop;
Ndef(\bass).stop;
)