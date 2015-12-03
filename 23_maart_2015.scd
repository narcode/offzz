 ////
////
/////
/////
//////
////Off<>zz
//////
/////
///
///
///

a = ProxySpace.push(s);

a[1].play(0,1);

Tdef(\a, {
	loop{
		a[0]= {FreeVerb.ar(Saw.ar(["a2".namecps, "d2".namecps, "e2".namecps]*LFPulse.kr(t.tempo/2).range(1, 4/3)), 0.8, 0.7)*Line.kr(0.1, 0.5, 10)*EnvGen.kr(Env.perc(0.1, 8))};
		1.wait}
}).play.quant_(2);


t = TempoClock.default.tempo_(45/60);


Tdef(\a, {
	loop{
		a[0]= {FreeVerb.ar(Saw.ar(["a2".namecps*LFTri.kr(t.tempo/80).range(1/2, 2), "d2".namecps*LFPulse.kr(t.tempo/3).range(1, 3/2), "e2".namecps*Line.kr(4, 1, 0.5)]*LFPulse.kr(t.tempo/2).range(1, 4/3)), 0.8, 0.7)*Line.kr(0.5, 1, 10)*EnvGen.kr(Env.perc(0.1, 8))};
		1.wait}
}).play.quant_(2);


Tdef(\a, {
	loop{
		a[0]= {FreeVerb.ar(Saw.ar(["b2".namecps*LFTri.kr(t.tempo/80).range(1/2, 2), "f3".namecps*LFPulse.kr(t.tempo/3).range(1, 3/2), "eb2".namecps*Line.kr(4, 1/2, 1)]*LFPulse.kr(t.tempo*8).range(1, 2/1)), 0.8, 0.7)*Line.kr(1, 1.3, 10)*EnvGen.kr(Env.perc(0.1, 8))};
		2.wait}
}).play.quant_(2);



Tdef(\b, {
	loop{
		a[1]= {FreeVerb.ar(Saw.ar(["ab1".namecps*LFTri.kr(t.tempo/80).range(1/2, 2), "c1".namecps*LFPulse.kr(t.tempo/3).range(1, 3/2), "eb1".namecps*Line.kr(4, 1, 0.5)]*LFPulse.kr(t.tempo/2).range(1, 4/3)), 0.8, 0.7)*Line.kr(1, 1.5, 10)*EnvGen.kr(Env.perc(0.1, 8))};
		(1/2).wait}
}).play.quant_(2);


Ndef(\end, {ReplaceOut.ar([0], Impulse.ar(Line.kr(30,1, 8))+RLPF.ar(In.ar(0,2), Line.kr(1890, 30, 10), Line.kr(1, 0.1, 7)))}).play;

Ndef(\end).clear;

Tdef(\b).stop;

a[0] = {Impulse.ar(10, add: Saw.ar("c3".namecps, Impulse.kr(10).range(0,3 0.8)))*SinOsc.ar("a3".namecps, mul: 4)};

a[1] = {Impulse.ar(9, add: WhiteNoise.ar(Impulse.kr(8).range(0,0.1)))*SinOsc.ar("a9".namecps, mul: 7)};

a.quant_(1);

(a[0].stop; a[1].stop;);
(a[0].play; a[1].stop;);


Ndef(\end, )

