// cool fx:
Ndef(\annefx, {CombN.ar(PitchShift.ar(SoundIn.ar(2,2), 0.01, [1, 3/2, 5/4, 6/5]), 0.01, 7, 7)}).play(0,2);


"/Users/narcodeb/Development/Repos/codeklavier-supercollider/CKalculator_env.scd".load;


(
OSCdef(\anne, {|msg|
	var num = msg[1].asInt;
	if (num.odd) {
	("say -v vi " ++ msg[1]).unixCmd;
		Tdef(\o, {
			loop{
				Ndef(\o, {0.5*GVerb.ar(SinOsc.ar("a3".namecps), 123, 2)*EnvGen.kr(Env.perc(0, 1))}).play(0,1);
				(num.linlin(1, 1600, 0.125, 0.1)).wait;
			}
		}).play;
	} {
		("say -v xa " ++ msg[1]).unixCmd;
				Tdef(\e, {
			loop{
				Ndef(\e, {0.5*GVerb.ar(SinOsc.ar("c2".namecps), 123, 2)*EnvGen.kr(Env.perc(0, 1))}).play(1,1);
					(0.9).wait;
	}
		}).play;
	}
}, "ck");
);

//

Ndef(\t, {LPF.ar(WhiteNoise.ar(1), 123)*0.8*LFNoise1.kr(1/4).range(0,1)}).play(0,2);



