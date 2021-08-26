///// extended techniques

//// play anne!


Ndef(\anne, {CombN.ar(FreqShift.ar(SoundIn.ar(2), 0.01, LFPulse.kr(2).range(100, 280)), 1, 0.1*EnvGen.kr(Env.linen(0.2, 0.1, 0.3)).range(0.1, 0.33), 6)*1}).stop;

/// a bass:
(
Tdef(\melody, {
	var mel = Pseq(["c#1".namecps, "a#1".namecps, "d#1".namecps], inf).asStream;
	var rit = Pseq([1/3, 3], inf).asStream;
	loop{
		Ndef(\note, {BPF.ar(Saw.ar(mel.next*LFPulse.kr(8).range(1, 6))*LFTri.ar(rit.next), LFTri.kr(1/8).range(5555, 123))*1.2}).stop(0,2);
Ndef(\impulse, {Impulse.ar(10)}).stop(1,1);
		(18).wait;
	}
}).stop;
)

(
Tdef(\a, {
	var rit = Pseq([1/4, 1/4, 1/8, 1/4, 1/6, 1/2, 1/4, 1/4]*8, inf).asStream;
	loop{
Ndef(\impulse2, {EnvGen.kr(Env.perc(0.01, 0.1))*SinOsc.ar(123)*1}).stop(0,2);
		(rit.next).wait;
	}
}).stop;
);

(
Tdef(\h, {
	var rit = Pseq([Pseq([1/2], 5), Pseq([1/12], 6)]/1, inf).asStream;
	loop{
Ndef(\impulse3, {EnvGen.kr(Env.perc(0.001, 0.001))*WhiteNoise.ar(1)*8}).play(0,2);
		(rit.next).wait;
	}
}).play;
);


///// offzzong with R0bert
Ndef(\a).fadeTime_(3);
(
Tdef(\n, {
	var rit = Pseq([1/2, 1/2, 1/2, 1/8, 1]/2, inf).asStream;
	loop{
Ndef(\n,  {SinOsc.ar(80*LFSaw.kr(1/4).range(1.5, 0.8))*EnvGen.kr(Env.perc(0.01, 0.1))*1}).play(0,2);
		(rit.next).wait;
}}).stop;
);

Pdef(\n, {Pbind(\type, \set, \args, [\rit], \rit, Pseq([2], inf), \dur, 1)}).stop;

(
Tdef(\a, {
	var freq = Pseq(["a2".namecps, "c3".namecps], inf).asStream;
	loop{
Ndef(\a,  {|freq=123|Saw.ar(freq)*EnvGen.kr(Env.perc(0.1, 0.2))*1*LFTri.kr(1/4).range(0.8, 1.5)}).play(0,2);
		(1/2).wait;
}}).play;
);

Pdef(\a, {Pbind(\type, \set, \args, [\freq], \rit, Pseq(["a2".namecps, "c3".namecps], inf), \dur, 1/2)}).stop;


// For democracy ?
Ndef(\person3).quant = 1;

Ndef(\person1, {|v=100|LFPulse.kr(1/8)*Pulse.ar(v*LFPulse.kr(1).range(10, 1).lag(2))*0.1}).play(0,2);
Ndef(\person2, {|v1=100|LFPulse.kr(1/4)*Pulse.ar(v1*LFPulse.kr(1/4).range(1, 11).lag(1))*0.01}).play(0,2);
Ndef(\person3, {|v2=100|LFPulse.kr(1/4)*Pulse.ar(v2*LFPulse.kr(4).range(1, 1.4).lag(1))*0.2}).play(0,2);

(
Pdef(\d, {Pbind(\type, \set,\args, [\v, \v1, \v2], \v, Pseq(["c2".namecps, "g2".namecps, "c2".namecps]*1/8, inf), Pseq(["f2".namecps, "f#2".namecps, "c3".namecps]*1/9, inf),
	Pseq(["g2".namecps, "ab2".namecps, "d5".namecps]*1/12, inf), \dur, 8
)}).stop;
);


// keep on!!!!

Ndef(\fxr).fadeTime_(0.1).quant_(1);
Ndef(\fxr, {LFNoise0.kr(2)*CombN.ar(PitchShift.ar(PinkNoise.ar(LFPulse.kr(5))*SoundIn.ar(2)+SinOsc.ar("f1".namecps, mul: 0.5), 0.2,[1, 3/2, 6/5]), 0.2, 0.1, 2)*1}).stop(4);

Ndef(\fx, {CombN.ar(PitchShift.ar(FreqShift.ar(SoundIn.ar(3), LFSaw.kr(1/3).range(100, 11244)), 0.2, [1, 3/2, 5/4]), 0.2, 0.1, 2)*2}).stop(9)

















