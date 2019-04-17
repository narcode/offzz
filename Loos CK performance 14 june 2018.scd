////

/// 0 - anne
/// 1 - voices
/// 2 - rhythm
/// 3 - fx
/// 4 - error
/// 5 - develop (bass)

// lets start by saying the nums anne makes.

(
OSCdef(\n, {|msg|
	var val = msg[1].asInt;
	if (val.odd) {
	("say -v tri -r 100 " ++ msg[1] + "").unixCmd;
		Tdef(\n, {
			loop{
			Ndef(\n, {BPF.ar(WhiteNoise.ar(1), 300.rrand(2898)) * EnvGen.kr(Env.perc)}).play(0,1);
				if (!)
			1.wait;
			}
		}).play
	} { // now a diff voice if even..
	("say -v princess -r 100 " ++ msg[1] + "").unixCmd;
				Tdef(\n, {
			loop{
				Ndef(\n, {HPF.ar(WhiteNoise.ar(1), 8989) * EnvGen.kr(Env.perc(0.01, 0.1))}).play(1,1);
				(1/2).wait;
			}
		}).play

	}
}, '/ck');
)

/// anne crashad the calc! wtf


// cool. 2 voices. now some rhyhtm/

/// yes! no crash so far. lets put an fx to anne.

Ndef(\fx, {CombN.ar(FreqShift.ar(SoundIn.ar(8), LFTri.kr(1/23).range(-100, 999)), 0.01, 0.4, 5)}).play(0,2);

/// so fa so good. now comparisons. num comparisons. and for that. i cheat.

~comparisons.on("xa", "vi", "al");

// rhythm is getting boring. So...


// ok in loop:
Tdef(\l, {
	loop{
Ndef(\me, {LPF.ar(WhiteNoise.ar+SinOsc.ar(Line.kr(140, 45, 0.2), 233))*0.7*EnvGen.kr(Env.perc(0.01, 4))}).play(0,2);
		1.wait;
	}
}).play;

//// error!

/// ok then error handling.
// 1 strike... ok back to the first algo
~er =0;
OSCdef(\er, {
	~er = ~er +1;
	// 3 srikes we end...
	("say -v juan -r 90 ztraik " ++ ~er.asString ++ "").unixCmd;
	// shit not yet.
	if (~er == 3) {
		OSCdef.all.do{|i| i.free;};
				Tdef.all.do{|i| i.stop;};
		Ndef.all.do{|i| i.stop(10)};
	}
}, 'ck_error');

// ok now i can develop the ryhtm and let anne ... make errors...












