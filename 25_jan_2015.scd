a = ProxySpace.push(s);
~a = {SinOsc.ar(100,0,0.1)}.play(0);

///////////// Off<>zz ++++++ 2015

~a.source = {Saw.ar("c0".namecps) * LFSaw.kr(2).range(0.1, 0.3)}.play;

a.fadeTime_(4);

~b = {Saw.ar("c0".namecps, Line.kr(0, 0.4, 10)) * LFSaw.kr(2).range(0.1, 0.3)};

~a.stop;
~b.stop;
a.pop;

Ndef(\all).fadeTime_(9);
Ndef(\all, {ReplaceOut.ar([0,2], RHPF.ar(In.ar(0,2), Line.kr(60, 13240, 6), Line.kr(1, 0.2, 10))+FreeVerb.ar(Impulse.ar(LFNoise0.kr(1/3).range(8, 21)), 0.9, 0.6) )}).play;

Ndef(\all).clear;

Ndef(\a, {Latch.ar(Impulse.ar(1), Impulse.ar(512))*0.6}).play(0,2).quant_(1);

Ndef(\a, {|amp=1|amp*Latch.ar(CombN.ar(Impulse.ar(4), 0.2, 1/4, 3)+SinOsc.ar(80, 0, LFPulse.kr(3).range(0,0.1)), Impulse.ar(512))*0.6}).play(0,2).quant_(1);
Ndef(\all).clear;

Ndef(\a).set(\amp, 0);

t = TempoClock.default;
t.tempo_(60/60);

Ndef(\a).fadeTime_(4);

s.sendMsg(\n_free, 1006);

////////// quickie

a = ProxySpace.push(a);
a.fadeTime_(2);
a.quant_(1);

a[\a] = {FreeVerb.ar(Pulse.ar("a1".namecps, 0.1), 1) * 1 * EnvGen.kr(Env.perc(0.1, 0.1).circle(5)))}.play;
a[\b] = {FreeVerb.ar(Pulse.ar("a#1".namecps, 0.2), 0.7) * 1 * EnvGen.kr(Env.perc(0.1, 0.1).circle(4.7)))}.play;
a[\c] = {FreeVerb.ar(Pulse.ar("d2".namecps, 0.2), 1) * 2 * EnvGen.kr(Env.perc(0.1, 0.1).circle(4.7)))}.play;

a[\c].stop;

//////// noise

Ndef(\b).fadeTime_(14);

Ndef(\a, {|amp=1|amp*LPF.ar(WhiteNoise.ar([0.1, 0.05]), [LFSaw.kr(1/3).range(60, 120), LFPulse.kr(1/3).range(1260, 1920)])*Saw.ar("c#5".namecps, 0.1)+Saw.ar("c#1".namecps, 0.01*amp) *3}).play(0,2).quant_(1);

Ndef(\b, {|amp2=1|amp2*SinOsc.ar(40,0, LFPulse.kr(1/1))*RLPF.ar(WhiteNoise.ar([0.1, 0.05]), [LFPulse.kr(5).range(260, 60), LFPulse.kr(1).range(160, 40)], 0.1) *6}).play(0,2).quant_(1);


Pdef(\a, {Pbind(\type, \set, \amp, Pseq([0,1,0,1,1], inf), \delta, 1/8)}).play.quant_(1);

Pdef(\b, {Pbind(\type, \set, \args, [\amp2], \amp2, Pseq([0,1,0,0,1], inf), \delta, 1/10)}).play.quant_(1);

Ndef(\end, {ReplaceOut.ar([0,1], RLPF.ar(In.ar(0,2),(XLine.kr(700, 50, 3)).lag(0.1), Line.kr(1, 0.01, 6)))}).play;


Ndef(\a, {|amp=1|amp*BrownNoise.ar(0.1)*LFPulse.kr(1)}).play;








