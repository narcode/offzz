OSCdef(\ck_voice, {|msg|
	var num = msg[1].asInt;
	if (num.odd) {
		("say -v tri -r " ++ num ++ " " ++ num ++ "").unixCmd;
	}{
		("say -v karen -r " ++ num ++ " " ++ num ++ "").unixCmd;
	}
}, '/ck');

// wait! lets balance the voices! ha ha bad joke


/// ok lets go... give me numbers...

/// and now maybe an fx for the piano:
// a crazy fx for anne? or stop... ?
OSCdef(\ck_piano, {|msg|
	var num = msg[1].asInt;
	Ndef(\piano, {CombN.ar(PitchShift.ar(FreqShift.ar(SoundIn.ar(0,2), num*2), 0.2, [1,3/2, 5/6]), 0.2, 16)}).play(0,2);
}, '/ck');

/// yes delay... and the numbers move the freqshift.

~comparisons.on("bad", "prin", "good");

/// i cheated. i prepared code.

/// ANNE do some humber comparisons.
OSCdef(\na).free;
OSCdef(\ck2, {|msg|
	var num = msg[1].asInt;
	if (~lt == 'true') {
		Ndef(\na, {(SinOsc.ar(Line.kr(99, 50, 0.2))+WhiteNoise.ar(0.8))*EnvGen.kr(Env.perc)*0.2}).play(0,1)
	} {
		Ndef(\na, {(HPF.ar(WhiteNoise.ar(0.8), 7878))*EnvGen.kr(Env.perc(0.1, 0.1))*0.2}).play(0,1)
	}
}, '/ck');

OSCdef(\ck3, {|msg|
	var num = msg[1].asInt;
	if (~gt == 'true') {
		Ndef(\na2, {(SinOsc.ar(Line.kr(99, 50, 0.2))+WhiteNoise.ar(0.8))*EnvGen.kr(Env.perc)*0.2}).play(0,1)
	} {
		Ndef(\na2, {(HPF.ar(Saw.ar("B1".namecps), 7878))*EnvGen.kr(Env.perc(0.1, 0.1))*0.2}).play(0,1)
	}
}, '/ck');

OSCdef(\ck4, {|msg|
	var num = msg[1].asInt;
	if (~equal == 'true') {
		Ndef(\na3, {(SinOsc.ar(Line.kr(99, 50, 0.2))+WhiteNoise.ar(0.8))*EnvGen.kr(Env.perc)*0.2}).play(0,1)
	} {
		Ndef(\na3, {(HPF.ar(Saw.ar("B1".namecps), 7878))*EnvGen.kr(Env.perc(0.1, 0.1))*0.2}).play(0,1)
	}
}, '/ck');

/// and some numbers too?

/// we crashed it. but we are back up!!! yeah!

/// maybe i make my own sound...
Ndef(\felipe, {(SinOsc.ar("B1".namecps*Line.kr(1, 1, 10))*LFTri.kr(6).range(0, 0.1))*EnvGen.kr(Env.perc(0.1, 178))*0.8}).play(0,2)
Ndef(\felipe2, {(SinOsc.ar("E1".namecps)*LFTri.kr(2).range(0, 0.1))*0.7*LFPulse.kr(8, width: 0.1)}).play(0,2)

Ndef(\felipe).stop(4)
