/// red monkey (groovy)
t = TempoClock.default.tempo_(122/60);
~rit = 1;
~sout = 12;
Tdef(\s, {
	loop{
		~rit.wait;
		Ndef(\snare, {BPF.ar(BrownNoise.ar(0.8), [423, 589, 100])*EnvGen.kr(Env.perc(0.01, 0.1))*0.6}).play(~sout,2);
				~rit.wait;
	}
}).play;
Ndef(\rev, {Splay.ar((In.ar(12,2)*6)+(GVerb.ar(In.ar(12,2),87, 1/2))*0.3)*0.9}).play(0,2);

Tdef(\b, {
	var rit = Pseq([2, 1/2,3/2], inf).asStream;
	loop{
		Ndef(\drum, {LPF.ar(WhiteNoise.ar(0.4)+SinOsc.ar(Line.kr(100, 37, 1/2))*0.5, [423, 589, 100])*EnvGen.kr(Env.perc(0.01, 1))*0.9}).play(0,2);
		(rit.next).wait;
	}
}).play;

t.playNextBar{Tdef(\b).play; Tdef(\s).play;};

Ndef(\bass, {SinOsc.ar(123)*0.5*EnvGen.kr(Env.perc(0.1, 3))}).play(6,1)

f = CKpianoFX.new(1);

f.delayCK(0.3, 0.7).stop;
f.noisy(0.8, 0.7, 0.9, 167).stop;
f.typicalCK(0.1, [1/2, 3/2, 4/2], 78, 1).stop;


Tdef(\a, {
	p = Pwhite(145, 1).asStream;
		r = Pwhite(100, 1527).asStream;
	loop{
		("say -v ce [["++r.next.asString++"]] [[volm 0.9]] Tri [[rate "++r.next.asString++"]] " ++
			"hispter [[pbas "++p.next.asString++"]] [[rate "++r.next.asString++"]] " ++
			"trying [[pbas "++p.next.asString++"]] Javascript").unixCmd;
2.wait;
	}
}).play;