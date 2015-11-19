a = ProxySpace(s);

a[\a] = {SinOsc.ar(110)*0.1};
a[\a].play(0,2);

a.fadeTime_(5);
a[\a] = {SinOsc.ar([110, 115])*0.1};

a[\a] = {FreeVerb.ar(SinOsc.ar([110, 112])*0.1, 0.8, 1)};

a[\b] = {SinOsc.ar([113, 117])*0.1};
a[\b].play(1,1);
a[\b].stop(5);
a[\anne] = {GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFTri.kr(1/3).range(0.5, 1.5)), 20, 3)*0.8*LFPulse.kr(4)};

a[\anne].fadeTime_(4);

a[\anne].play(2,2);

a[\a] = {SinOsc.ar("f0".namecps)*0.3*LFPulse.kr(2)};

a.quant_(1);

a[\c] = {SinOsc.ar("f0".namecps*Line.kr(1, 3, 10)).distort*0.6*LFPulse.kr(2)};

a[\c].play(0);


a[\anne] = {GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFPulse.kr(1).range(0.5, 4/3)), 20, 8)*1*LFPulse.kr(2)};


a[\c] = {|freq=43|SinOsc.ar(freq*LFSaw.kr([1/4,1/2]).range(1/2,4)).distort*0.6*LFPulse.kr(1, width:0.1)};

a[\c].fadeTime_(0.1);

Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["f0".namecps, "a1".namecps], inf), \delta, 1/8)}).play;

a[\d] = {|amp=43|SinOsc.ar(amp*LFSaw.kr([1,2]).range(1,1)).distort*0.1*LFPulse.kr(8, width:0.2)};
a[\d].play(1,1);

Pdef(\b, {Pbind(\type, \set, \amp, Prand(["c2".namecps, "eb1".namecps], inf), \delta, 1/8)}).play;

a[\c].fadeTime_(5);
a[\d] = {LPF.ar(WhiteNoise.ar(0.9), LFTri.kr(1/6).range(100, 300))*0.3}

a[\c] = {LPF.ar(WhiteNoise.ar(1), LFTri.kr(1/19).range(100, 1400))*0.3}

a[\b].stop(5);


a.clear(9);


