///// Off<>zz
///
//   PACH-MAN
///
//
///////// d-a-b-f#-g-d-g

Ndef(\pach).fadeTime_(20);

Ndef(\pach, { LFNoise1.kr(1/2).range(0,1) * Saw.ar(Demand.kr(Impulse.kr(17), 0, Dseq(["d3".namecps, "a3".namecps, "B2".namecps, "f#2".namecps, "g2".namecps, "d2".namecps, "g3".namecps]*4, inf))).distort * EnvGen.kr(Env.circle([0, 0.6], [1])) }).play(1,1);


Ndef(\pach1, {|amp = 1| amp * Saw.ar(Demand.kr(Impulse.kr(Line.kr(2, 1/9, 4)), 0, Dseq([["d1".namecps, "a1".namecps], ["B1".namecps, "f#1".namecps] ]*8, inf))*EnvGen.kr(Env.circle([1, 1], [0.1]))).distort * EnvGen.kr(Env.circle([0, 1, 1, 0.2], [1, 3, 2])) }).play(1,1);

Ndef(\an, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFPulse.kr(2).range(12/4, 3/2)), 0.2, 0.2, 3) * 1.3}).play(0,2);

Ndef(\an2, {GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFPulse.kr(2).range(1, 14/15)), 20, 2) * 1.4}).play(0,2);

Ndef(\an2).stop(4);

Ndef(\pach).stop(5);