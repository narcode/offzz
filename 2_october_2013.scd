/// 2 oct 2013

/// 1

Ndef(\me, {HPF.ar(Blip.ar(Demand.kr(Impulse.kr(1/8), 0, Dseq([["f#1".namecps, "a1".namecps],["g#1".namecps, "b1".namecps], ["c#2".namecps, "b1".namecps]], inf)), LFTri.kr(1/8).range(1, 12), 0.1), 800) * 8}).play(0, 1);

Ndef(\me, {RLPF.ar(WhiteNoise.ar(0.2), 5880, 0.1) * LFTri.kr(0.1).range(0.01, 1)}).play.fadeTime_(2);
Ndef(\me2, {RLPF.ar(WhiteNoise.ar(0.2), 3880, 0.1) * LFTri.kr(2).range(0.01, 1)}).play.fadeTime_(2);
Ndef(\me3, {RLPF.ar(WhiteNoise.ar(0.2), 7880, 0.1) * LFTri.kr(4).range(0.01, 1)}).play.fadeTime_(2);




Ndef(\me2, {RHPF.ar(Blip.ar(["a#1".namecps, "d#1".namecps]*4, LFTri.kr(1/8).range(1, 12), 0.1), LFNoise1.kr(1/4).range(100, 1800), 0.7) * 1.5 * Pulse.ar(5, mul: BrownNoise.ar(0.7))}).play(1, 1);

Ndef(\me3, {RHPF.ar(Blip.ar(["f#1".namecps, "a1".namecps]*7, LFTri.kr(1/8).range(1, 12), 0.1), LFNoise1.kr(1/4).range(100, 1800), 0.7) * 1.5 * Pulse.ar(5, mul: BrownNoise.ar(0.7))}).play(0, 1);


Ndef(\me2).stop(2);
Ndef(\me3).stop(2);
Ndef(\me).stop(2);


///// 2 going for half an hour

Ndef(\me, {|freq = 1046.5022612024, ri = 3| BPF.ar(WhiteNoise.ar(0.9), freq, 0.0001) * Pulse.kr(ri).range(0.1, 1) * 17 }).play.fadeTime_(4);

Ndef(\a, {var in = PitchShift.ar(SoundIn.ar(0), 0.2, LFNoise0.kr(2).range(0.5, 2.02)); FreeVerb.ar(BPF.ar(in, LFNoise0.kr(0.2).range(100, 800), 0.01), 0.8, 1, 0.2) * 2}).play(0, 2).fadeTime_(2);

Ndef(\a, {var in = PitchShift.ar(SoundIn.ar(0), 0.2, LFNoise0.kr(2).range(0.5, 0.22)) ring1: SinOsc.ar("c2".namecps, 0, 0.1); FreeVerb.ar(BPF.ar(in, LFNoise0.kr(0.2).range(100, 800), 0.2), 0.3, 1, 0.2) * 7}).play(0, 2).fadeTime_(2);

Ndef(\me).stop(10);


Pdef(\fr, {Pbind(\type, \set, \args, [\freq, \ri], \freq, Pseq(["c5".namecps, "g4".namecps, "f4".namecps, "c4".namecps, "f#3".namecps]*3/2, inf).round(10), \ri, Pseq([2, 2, 2], inf), \delta, 1/2, \tempo, 920/60)}).play;


Ndef(\lim, {Limiter.ar(In.ar(0, 2), 0.9)}).play;