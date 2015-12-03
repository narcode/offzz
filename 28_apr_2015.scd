a = ProxySpace(s);
t = TempoClock.default;

t.sched(60*7, {a[\end] = {Ndef(\end, {ReplaceOut.ar([0,1], CombC.ar(RLPF.ar(WhiteNoise.ar(Line.kr(0.5,0,10))*In.ar(0,2)+CombC.ar(SoundIn.ar(0), 0.2, 0.2, 10), Line.kr(5400, 80, 20)), 0.5, 0.5, 4) )})}; });


a[0] = {LFNoise0.kr.range(0, 0.2) * SinOsc.ar("f5".namecps, 0, EnvGen.kr(Env.perc(0.01, 1).circle(2)))*Line.kr(0,1,7)}
a[0].play;

a[0] = {LFNoise0.kr.range(0, 0.2) * SinOsc.ar("f5".namecps*LFTri.kr(2).range(1/2, 3/2), 0, EnvGen.kr(Env.perc.circle(0)))*1}
a[0].play;
a.quant_(1);

a[0].fadeTime_(4);
a[1] = {LFNoise0.kr.range(0, 0.2) * SinOsc.ar("gb5".namecps*Line.kr(1, 1, 10), 0, EnvGen.kr(Env.perc.circle(3)))*Line.kr(0,1,7)}

a[1] = {LFNoise0.kr.range(0, 0.2) * SinOsc.ar("gb5".namecps*Line.kr(1, 1/8, 10), 0, EnvGen.kr(Env.perc.circle(0)))*1}
a[1].play(1);
a[1].stop(5);

// anne
a[\a] = {FreeVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [3/2, 1/2]*LFTri.kr(1).range(2, 3))*LFPulse.kr(8).range(0, 4), 0.6, 1)*2}
a[\a].play(0,1);
a[\an] = {FreeVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [4/3, 1/2]*LFTri.kr(1).range(3, 4))*LFPulse.kr(8).range(0, 4), 0.6, 1)*2}
a[\an].play(1,1);
a[\an].clear;



~seq = Pseq(["f3".namecps, "e4".namecps, "db3".namecps]*2, inf).asStream;
~seq.next;

Tdef(\a, {
	loop{
		a[2] = {LFNoise0.kr.range(0.1, 0.2) * SinOsc.ar(~seq.next*LFTri.kr(8).range(1/4, 1), 0, EnvGen.kr(Env.perc(0.5, 0.2))).distort*1};
		a[0] = {LFNoise0.kr.range(0.1, 0.2) * SinOsc.ar((~seq.next/2)*LFTri.kr(8).range(1/4, 1), 0, EnvGen.kr(Env.perc(0.5, 0.2))).distort*1};

		(1/2).wait;};
}).play.quant_(1);


a[2].play(1);
a[3].fadetime_(0);

Tdef(\b, {
	loop{
		a[3] = {LFNoise0.kr.range(0.1, 0.2) * SinOsc.ar("gb3".namecps*LFTri.kr(8).range(1/4, 1), 0, EnvGen.kr(Env.perc(0.1, 0.2))).distort*1};
		(1/2).wait;};
}).play.quant_(1);

a[3].play(1);


a.clear(10)
































