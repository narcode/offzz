/// Jan 27th 2014
////// Off<>zz

(
Tdef(\1, {inf.do({Ndef(\me, {|freq1=140| SinOsc.ar([freq1, 60], 0, 1)* EnvGen.kr(Env.perc(0.1, 4), doneAction: 2)}).play(0, 2);
	//Ndef(\cue, {Pulse.ar(3, 0.5, 0.8) * LFPulse.kr(1)});
	3.wait});}).play;
);


Ndef(\me2, {Resonz.ar(SinOsc.ar(Demand.kr(Impulse.kr(1), 0, Dseq(["ab4".namecps, "c4".namecps, "g4".namecps])), 0, 0.4).distort, "b3".namecps, 0.1) * EnvGen.kr(Env.circle([0.2, 1, 0], [1, 4]), doneAction: 2)}).play(0, 1);


//// phase 2

Ndef(\fx, {CombN.ar(In.ar(4,2), 0.5, LFNoise0.kr(0.5).range(0.05, 0.5), 4) * EnvGen.kr(Env.circle([0.2, 1, 0], [1, 4]), doneAction: 2)}).play;

Ndef(\fx2, {LPF.ar(FreeVerb.ar(In.ar(6,2), 1, 1, 1) * 2 * LFTri.kr(1).range(0.1, 6), 7000)}).play;

(
Tdef(\2, {inf.do({Ndef(\me, {|freq1=140| SinOsc.ar([freq1, 60], 0, HPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.09, 0.3))), LFNoise2.kr(0.3).exprange(880, 17900)))* EnvGen.kr(Env.perc(0.1, 0.2), doneAction: 2) * 0.6}).play(4, 2);
	0.5.wait});}).play;
)


(
Tdef(\4, {inf.do({Ndef(\me, {|freq1=140| SinOsc.ar([freq1, 60], 0, HPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.09, 0.3))), LFNoise2.kr(0.3).exprange(880, 17900)))* EnvGen.kr(Env.perc(0.1, 0.1), doneAction: 2) * 0.6}).play(6, 2);
	0.3.wait});}).play;
)


Ndef(\fxL, {ReplaceOut.ar(0, LPF.ar(In.ar(0, 2), Line.kr(19000, 10, 20)))}).play;

Ndef(\fxL).stop(0.1);
