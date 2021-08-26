a = ProxySpace(s);

a.quant_(1);
t = TempoClock.default;

a[\a].quant_(1);
a[\a] = {SinOsc.ar(["ab1".namecps*LFTri.kr(t.tempo*2).range(1, 4), "db1".namecps*LFPulse.kr(t.tempo).range(1, 4)])*LFSaw.kr(1).range(0.02, 0.4)}

a[\a].play;

a[\an].fadeTime_(1);
a[\an] = {CombN.ar(PitchShift.ar(SoundIn.ar(0)*LFPulse.kr(4), 0.2, LFSaw.kr(1/4).range(1/2, 4/3)), 0.5, 0.5, 8)};

a[\an].play(2,2);

Tdef(\a, {
	loop{
a[\b] = {SinOsc.ar("db1".namecps, add: LPF.ar(WhiteNoise.ar(LFPulse.kr(2).range(0, 0.4)), 6840)*EnvGen.kr(Env.perc(0.2, 10)))*0.4};
8.wait;
	}
}).play;

a[\d].play(1,1);

Tdef(\b, {
	loop{
a[\d] = {SinOsc.ar("ab1".namecps, add: LPF.ar(WhiteNoise.ar(LFPulse.kr(8).range(0, 0.4)), 2840)*EnvGen.kr(Env.perc(0.2, 10)))*0.1};
4.wait;
	}
}).play;


a[\a] = {SinOsc.ar(["ab1".namecps*LFPulse.kr(t.tempo*Line.kr(1, 8, 40)).range(1, 4), "c4".namecps*LFPulse.kr(t.tempo).range(1, 4)])*LFPulse.kr(2).range(0.02, 0.4)}


a[\an] = {CombN.ar(PitchShift.ar(SoundIn.ar(0)*LFPulse.kr(4), 0.2, LFPulse.kr(1).range(1/2, 4/3)), 0.5, 0.5, 8)};


Ndef(\end, {ReplaceOut.ar(0, RLPF.ar(BrownNoise.ar(0.1)+In.ar(0,4), Line.kr(3456, 79, 10), Line.kr(0.1, 0.5, 4) )*Line.ar(1, 0, 15) )}).play;

