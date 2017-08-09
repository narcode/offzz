/// SHA rehreasal AUG 4th

(
Tdef(\s, {
	loop{
		Ndef(\s, {SinOsc.ar(["c2".namecps, "c2".namecps(LFTri.kr(2).range(-50, 50))]*Line.kr([8/2, 6/5, 3].choose, 1/2, 0.4))*EnvGen.kr(Env.perc(0, 1))*0.4}).play(0,1);
		(1/2).wait;
	}
}).play;
);

//// ooomph
(
Tdef(\o, {
	var rit = Pseq([1/2, 1/4, 1/4, 1/2, 1/2, 1/4, 1/4, 1/4, 1/4]/2, inf).asStream;
	loop{
		Ndef(\oomph, {LPF.ar(SinOsc.ar("d1".namecps) + WhiteNoise.ar(1), LFTri.kr(2).range(200, 1230)) * EnvGen.kr(Env.perc(0.1, 0.2))}).play(0,2);
		(rit.next).wait;
	}
}).play;
)

/// i wait for the timer for oomp


(
Tdef(\o, {
	loop{
Ndef(\oomph, {HPF.ar(WhiteNoise.ar(0.4), LFPulse.kr(8).range(14200, 11230)) * EnvGen.kr(Env.perc(0.01, 0.1))}).play(0,2);
		(1/8).wait;
	}
}).play;
)

// fx for anne;

Ndef(\an, {CombC.ar(PitchShift.ar(SoundIn.ar(4)*2, 0.2, [1/2, 3/2, 5/4, 5/6]*LFSaw.kr(1/2).range(1, 2)), 0.2, 0.2, 4)*1}).play(0,2);


Ndef(\out, {ReplaceOut.ar([0,2], (CombN.ar(PinkNoise.ar(1), 0.5, 0.15, 10) + LPF.ar(In.ar(0,2), Line.kr(10000, 40, 5)))) * EnvGen.kr(Env.perc(0.01, 10))}).play;
