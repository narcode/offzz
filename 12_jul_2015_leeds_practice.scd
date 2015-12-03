a.clear;
a.fadeTime_(1);
a.quant_(1);

a[\a].quant_(0);
a[\a].play.source = {|freq=110| LFPulse.kr(Line.kr(8, 2, 10))* SinOsc.ar([freq*3, freq*1.5/2, freq*2/3]*Line.kr(1/8, 1/2, 5))*Line.kr(0, 0.5, 20)*1};

a[\an] = {CombN.ar(SoundIn.ar(0)*LPF.ar(BrownNoise.ar(LFPulse.kr(3)), LFTri.kr(1/4).range(100, 3830)), 0.2, 0.3, 8)};

a[\an].play(2,2);

Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["ab2".namecps, "db1".namecps], inf), \delta, 1/2)}).play;

a[\b] = {|amp=1| amp*LFPulse.kr(6, width:0.2) * LPF.ar(WhiteNoise.ar(0.3), [200, 430])*4};

a[\b].play(0,2);

a[\a].play.source = {|freq=110| LFPulse.kr(Line.kr(9, 3, 3))* Saw.ar([freq*3, freq*1.5/2, freq*2/3]*Line.kr(1/8, 1/2, 3))*Line.kr(0, 0.5, 4)*1};

a[\a].fadeTime_(6);
a[\a] = {RLPF.ar(WhiteNoise.ar(1), "f3".namecps, 0.1) * 0.4};

a.clear(6);


///// direct

a.clear;

a[\an].fadeTime_(6);
a[\an] = {CombN.ar(PitchShift.ar(SoundIn.ar(0),0.2, LFPulse.kr(4).range(1.5, [1/2, 0.8])), 0.2, 0.25, 2)};


a[\an].play(2,2);

