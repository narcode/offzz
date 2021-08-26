a = ProxySpace(s);

a.quant_(1);

t=TempoClock.default;

a[\an] = {LPF.ar(WhiteNoise.ar(0.7), 789)*Amplitude.kr(SoundIn.ar(0)*LFPulse.kr(LFNoise0.kr(t.tempo*2).range(8, 1)))};

a[\an].play(0);

Tdef(\a, {
	loop{
		a[\a] = {|freq=280| LFPulse.kr(LFPulse.kr(t.tempo).range(7, 7)).range(0, 1)*SinOsc.ar([freq*LFPulse.kr(t.tempo/2).range([4, 1/4].choose, [1/2, 8].choose),freq*9/8*LFPulse.kr(t.tempo*LFPulse.kr(1).range(5, 8)).range(1, 1/2)])*[0.1, 0.03]/4};
1.wait;
	}
}).play;

a[\an].play(2);


a[\an] = {CombN.ar(PitchShift.ar(Limiter.ar(HPF.ar(LPF.ar(SoundIn.ar(0), 1234), 120), 0.99), 0.2, LFSaw.kr(t.tempo*4).range([1, 1/2], 3/2)),t.tempo, t.tempo/LFSaw.kr(1/2).range(1, 8), 4)};


a[\a].quant_(0);


Tdef(\b, {
	loop{
a[\b] = {|freq2=6364| SinOsc.ar("ab1".namecps, add: RLPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.1, 4), doneAction:2)), freq2, 0.2) )*0.03};
4.wait;
} }).play;

Pdef(\a, {Pbind(\type, \set, \args, [\freq2, \freq3, \freq], \freq, "f5".namecps(-20), \freq2, Pseq([123, 90, 234, 60,456, 60, 6577, 60, 890]*3, inf), \freq3, Pseq([123, 90, 234, 60,456, 60, 6577, 60, 890].reverse*10, inf), \delta, 1/2)}).play;

Tdef(\c, {
	loop{
a[\c] = {|freq3=6364| SinOsc.ar("db2".namecps, add: RLPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.1, 6), doneAction:2)), freq3, 0.2) )*0.03};
2.wait;
} }).play;

a[\c].play(1);

Tdef(\t, { 	loop{ t.tempo_(30/60); ([1, 1/4, 2].choose).wait; t.tempo_(330/60); ([4, 1].choose).wait} }).play;


Ndef(\end, {ReplaceOut.ar(0, LPF.ar((In.ar(0,2)*BrownNoise.ar(1))+LPF.ar(BrownNoise.ar(0.1), Line.kr(4567, 60, 4)), Line.kr(15000, 60, 30), EnvGen.kr(Env.perc(0.01, 10))) )}).play;
a.clear(10);

///// 2nd practice

a = ProxySpace(s);

a[\a] = {HPF.ar(Saw.ar([("b1".namecps*LFNoise1.kr(18).range(8, 1)).cpsmidi.round(5).midicps, "c1".namecps, ("ab1".namecps*LFNoise1.kr(38).range(2, 1)).cpsmidi.round(4).midicps, "g1".namecps]*1), LFPulse.kr(1/8).range(389, 97).lag(0.3))*0.01};

a.quant_(1);
a[\a].play(0,2);


a[\an] = {CombN.ar(SoundIn.ar(0), 2, 0.5, 4)*0.1};

a[\an2] = {Pan2.ar(GVerb.ar(a[\an].ar, 76, 3 ), LFPulse.kr(1).range(-1, 1))};

a[\an2].clear;


Ndef(\end, {ReplaceOut.ar(0, (In.ar(0,2)*Line.kr(1, 0, 12)*LFPulse.kr(Line.kr(40, 1, 4)))+LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 4, 0.1))), Line.kr(3456, 40, 6))) }).play;




