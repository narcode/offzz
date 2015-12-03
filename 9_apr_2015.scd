//// Off<>zz 9 April 2015
////
///
/////
//
//
///
//

a = ProxySpace.push(s);

a[1] = {SinOsc.ar(LFSaw.kr(20).range(60, "c5".namecps))*LFPulse.kr(1).range(0, 0.3)}
a[0] = {SinOsc.ar(LFSaw.kr(60).range(60, "c#4".namecps))*LFPulse.kr(1).range(0,0.3)}

a.fadeTime_(4).quant_(0);
a[1].play;

t = TempoClock.default;

s.meter;
a[\an] = {CombC.ar(SoundIn.ar(0)*SinOsc.ar(LFPulse.kr(4).range("c3".namecps, "e4".namecps)), 1/2, 1/12, LFPulse.kr(1/2).range(0.5, 2))*1.5}
a[\an].play(0);

a[].clear;

t.sched(10, {ReplaceOut.ar([0,1], (In.ar(0,2) * SinOsc.ar(Line.kr(5000, 60, 10), 0, 0.3))*LFNoise0.kr(6).range(0, 0.1))});


a[1] = {SinOsc.ar("c1".namecps, mul: 0.5)*LFNoise1.kr(1/2).range(0.1, 0.2) * LFPulse.kr(4)}
a[0] = {|amp=1, freq=110| amp * SinOsc.ar(freq, mul:0.5)*LFNoise1.kr(1/2).range(0.1, 0.2)}

Pdef(\a, {Pbind(\type, \set, \args, [\freq, \amp], \amp, Prand([0,1], inf), \freq, Pseq(["c2".namecps, "g2".namecps, "e1".namecps, "g0".namecps, "c1".namecps], inf), \delta, 1/4)}).play;

Tdef(\a, {
	loop {
a[2] = {WhiteNoise.ar(0.1)*0.7*EnvGen.kr(Env.perc(0.2, 0.1), doneAction:2)};
		//"hi".postln;
	1.wait;}
}).play;

Tdef(\b, {
	loop {
		a[3] = {LPF.ar(WhiteNoise.ar(Saw.ar(80)*0.1), 200)*0.2*EnvGen.kr(Env.perc(0.2, 0.1), doneAction:2)};
		//"hi".postln;
		(0.2).wait;}
}).play;

Tdef(\a).clear;
a[3].play;

//// quickie

a[0] = {|freq=100|Blip.ar(freq, LFSaw.kr(3).range(10, 100))*0.003}
a[0].play.quant_(1);

Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["g1".namecps, "a1".namecps, "b1".namecps]*2, inf), \delta, 1/5)}).play;

a[]