////// April 7th 2015

t = TempoClock.default;
a = ProxySpace.push(s);

a[0] = {SinOsc.ar([110, 220])*0.1};
a[1].play;
a[0].fadeTime_(15);

a.quant_(1);

a[0] = {|rit=1, freq=110| SinGrain.ar(Impulse.kr(rit), 0.5, [freq*3/2, freq/2], Saw.ar(freq, 0.1))*0.6};

a[1] = {SinGrain.ar(Impulse.kr(5), 0.01, ["f3".namecps, "f#4".namecps]*2, WhiteNoise.ar(0.1))*Line.kr(0, 1, 6, doneAction:2)};

Pdef(\a, {Pbind(\type, \set, \args, [\rit, \freq], \rit, Pseq([80], inf), \freq, Pseq(["eb2".namecps, "c0".namecps, "d2".namecps], inf), \delta, Pseq([1/6, 1/3, 1/3, 1/6, 1/6], inf))}).play.quant_(1);


Ndef(\An, {RHPF.ar(CombC.ar(SoundIn.ar(0)+(SoundIn.ar(0)*PinkNoise.ar(LFPulse.kr(t.tempo).range(0, 0.6))), t.tempo/2, t.tempo/2, 5), LFPulse.kr(1).range(200, 780))*1}).play(0,2).quant_(1);

t.sched(10, {Ndef(\end, {ReplaceOut.ar([0,1], RLPF.ar(In.ar(0,4)*PinkNoise.ar(Impulse.kr(LFNoise0.kr(2).range(8, 16))), Line.kr(3200, 60, 10), 0.1)*Line.kr(1, 0, 15)) }).play;});

Ndef(\end).clear;

/// edgy
a[0] = {|freq=110| RHPF.ar(Saw.ar([freq/2, freq]*LFPulse.kr(12).range(1, 6/2)), 3200)*0.4};

a[1] = {|freq=110| RHPF.ar(Saw.ar([freq*4/3, freq*6/2]*LFPulse.kr(12).range(1, 6/2)), 3200)*0.5};
(
a[0].stop(0.1);
a[1].stop(0.1);
);
(
a[0].play(0.1);
a[1].play(0.1);
);

Pdef(\a, {Pbind(\type, \set, \args, [\freq], \freq, Prand(["g#0".namecps, "c0".namecps, "db0".namecps(-30)], inf), \delta, 1/4)}).play;

Ndef(\An, {RLPF.ar(CombC.ar(FreqShift.ar(SoundIn.ar(0), 70, 0.2)+(SoundIn.ar(0)*PinkNoise.ar(LFPulse.kr(8).range(0, 0.6))), t.tempo/2, [t.tempo/8, t.tempo/62], 8), LFPulse.kr(8).range(800, 80))*2}).play(0,2).quant_(1);



Ndef(\end).clear;

