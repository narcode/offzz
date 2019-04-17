/// Ckalculator. July 27 2018

/// nums out loud and rhtyhms:
(
OSCdef(\ck ,{|msg|
	// msg.postln;
	var num = msg[1].asInt;
	if (msg[1].asInt.odd) {
	("say -v tri -r 89 " ++ msg[1]).unixCmd;
		Tdef(\e, {
			var rit = Pseq([2, 2, 2, 2, 2, 2, 1.5, 0.5, 2]/2, inf).asStream;
			(inf).do {
				Ndef(\even, {BPF.ar(WhiteNoise.ar, 453)*EnvGen.kr(Env.perc(0.01,1))}).play(6);
				(rit.next).wait;
			}
		}).play;
	} {
	("say -v an -r 89 " ++ msg[1]).unixCmd;
		Tdef(\e, {
			var rit = Prand([0.125, 0.25, 0.5, 0.125, 0.125, 0.125], inf).asStream;
			(inf*4).do {
				Ndef(\even, {HPF.ar(WhiteNoise.ar, 7898+LFPulse.kr(num.linlin(1, 50, 1, 10)))*EnvGen.kr(Env.perc(0.01,0.01))}).play(0);
				(rit.next).wait;
			}
		}).play;
	}
}, "ck");
);

// reverb on even rit
Ndef(\rev, {GVerb.ar(In.ar(6), 111, 2)}).play(0,2);
Ndef(\rev2, {GVerb.ar(PitchShift.ar(In.ar(8), 0.1, 1.5), 71, 2)*0.1}).play(0,2);

// fx for piano:
Ndef(\fx, {LFTri.kr(8)*CombN.ar(FreqShift.ar(SoundIn.ar(2,2), LFPulse.kr(FSinOsc.kr(1/2).range(1, 8)).range(-90, 1234)), 0.1, FSinOsc.kr(1/33).range(0.1, 1), 4)}).play(0,2);

// need harmonies:
(
OSCdef(\hm, {|msg|
	var num = msg[1].asInt;
	var note = num.linlin(1, 2000, 30, 99).midicps;
	if (msg[1].asInt.odd) {
		Ndef(\h1, {Saw.ar([note, (note)*LFPulse.kr(2).range(1, 1.5).lag(0.3)])*LFSaw.kr(2).range(1,2)*0.3}).play(8);
	} { // layering. nah i like it
		Ndef(\h2, {Saw.ar([note, note*LFPulse.kr(2).range(1, 1.5).lag(0.3)])*LFSaw.kr(2).range(1,2)*0.2*0.3}).play(8);
	}
}, "ck"); // what will happen? it kind of works but beed modulation.
);

// comparisons:
~comparisons.on("xa", "zo", "ce");

// this sounds good. dont need to do much.
/// maybe... yeah the harmony

/// lets help the rit with a bass
(
Tdef(\b, {
	var rit = Pseq([1, 1.5, 1, 0.5]/2, inf).asStream;
	loop{
		Ndef(\basss, {0.8*((WhiteNoise.ar*EnvGen.kr(Env.perc(0.01, 0.1)))+SinOsc.ar(Line.kr(120.rrand(250), 60, 0.3)))*EnvGen.kr(Env.perc(0.1, 4))}).play(0,2);

		(rit.next).wait;
}}).play;
);

t = TempoClock.default.tempo_(79/60);

// errors:
~counte = 0;
OSCdef(\er, {|msg|
	~counte = ~counte + 1;
	("say -v juan -r 34 EZTREIK " ++ ~counte).unixCmd;

	if (~counte == 3) {
		Tdef(\end, {
			1.wait;
			("say -v juan -r 34 aaaaaaaaaaah").unixCmd;
			Ndef.all.do{|n| n.stop(1)};
			Tdef.all.do{|n| n.stop};
			Ndef(\end, {CombN.ar(SinOsc.ar(LFPulse.kr(4).range(230, 5678)*LFSaw.ar(1/2).range(89, 8123)) + WhiteNoise.ar(1)*EnvGen.kr(Env.perc(0.01, 2)), 0.2, 9)}).play;
		}).play;
}}, "ck_error");


Ndef(\me, {LFPulse.kr(Line.kr(1,8,4))*Saw.ar(Line.kr([30, 200, 345], 8989, 10))*Line.kr(0,1, 10)}).play(0,2);




/// july 31
(
OSCdef(\ck, {|msg|
	var num = msg[1].asInt;
		msg.postln;

	if (num.odd) {
		("say -v fred " ++ msg[1]).unixCmd;
		// anne controls the rhythm and pitch
		if (~lt == 'false') {
			Ndef(num.asSymbol, {SinOsc.ar(num+["c#2".namecps, "ab3".namecps, "c3".namecps(34)]*1/3)*LFTri.kr(1/2).range(0,1)*0.2}).play(0,2);
		Ndef(\odd++num.asSymbol, {LFPulse.kr(num.linlin(1, 100, 0.1, 8)) * BPF.ar(Saw.ar(num.midicps.linlin(1, 1000, 54, 78).postln), LFTri.kr(1/2).range(340, 678), LFNoise1.kr(1).range(0.1, 0.5))}).play;
		} {
			Ndef(num.asSymbol, {LFPulse.kr(num.linlin(1, 140, 0.1, 8)) * BPF.ar(Saw.ar("B3".namecps(num.linlin(1, 1000, -50, 50))), LFTri.kr(1/2).range(340, 678), LFNoise1.kr(1).range(0.1, 0.5))}).play;
		}
	} {
		("say -v karen " ++ msg[1]).unixCmd;
				// anne controls the rhythm and pitch
		if (~equal == 'false') {
		Ndef(\even++num.asSymbol, {LFPulse.kr(num.linlin(1, 100, 0.1, 16)) * BPF.ar(Saw.ar(num.midicps.linlin(1, 1000, 56, 78).postln), LFTri.kr(1/2).range(340, 678), LFNoise1.kr(1).range(0.1, 0.5))}).play;
		} {
						Ndef(num.asSymbol, {LFPulse.kr(num.linlin(1, 80, 0.1, 8)) * BPF.ar(Saw.ar("C3".namecps(num.linlin(1, 1000, -50, 50))), LFTri.kr(1/2).range(340, 678), LFNoise1.kr(1).range(0.1, 0.5))}).play;

		}
	};
	if (msg[1] == 'zero') {
		("say -v junior " ++ msg).unixCmd;
		Ndef(\even, {LPF.ar(WhiteNoise.ar, Line.kr(1000, 234, 1)) * EnvGen.kr(Env.perc(0.1, 3))}).play;
		Ndef.all.do{|n| is (n != 'fx') {Ndef(n).stop(1)} };
	}
}, "ck");
);

// fx for piano:
/// now anne can modify the fx:
(
OSCdef(\fx, {|msg|
	var num = msg[1].asInt;
		var shift = num.linlin(1, 1000, 1/2, 9/8);
			var room = num.linlin(1, 1000, 1, 111);
	num = num.linlin(1, 1000, 0.5, 4);
Ndef(\fx, {GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.01, LFPulse.kr(num).range(1, shift)), room, 3)}).play(0,2);
});
)

/// minimal rhtyhms.

// start comparisons:
~comparisons.on("alex", "prin", "oli");

// error handling:
~err = 0;
OSCdef(\error, {|msg|
	~err = ~err +1;
	("say -v juan " ++ msg ++ " eztreik " ++ ~err.asString + "").unixCmd;
	if (~err > 2) {
	("say -v juan " ++ msg ++ " final eztreik " ++ ~err.asString + "").unixCmd;
		Tdef.all.do{|f| f.clear};
		Ndef.all.do{|n| n.clear};
		OSCdef.all.do{|o| o.stop;};
		Ndef(\end, {CombN.ar(Blip.ar(Line.kr(1, 788, 4), LFTri.kr(1).range(20, 200)) + LPF.ar(WhiteNoise.ar(LFNoise0.kr(5).range(0, 1)))*EnvGen.kr(Env.perc(0.01, 6)), 0.1, 0.24, 8)}).play(0,2);
	}
}, "ck_error");

// erorrs are ready., no develop till end.

Ndef(\fx2, {GVerb.ar(PitchShift.ar(SoundIn.ar(0)*Resonz.ar(WhiteNoise.ar, LFNoise0.kr(1).range(200, 533), LFTri.kr(2).range(1, 0.1)), 0.01, [1/2, 4/3, 5/6]), 100, 8)*0.5}).play(0,2);

Ndef(\lim).play(0,2);
Ndef(\lim, {ReplaceOut.ar([0,1], Limiter.ar(In.ar(0,2), 0.5).sum)}).play(0);

"say -v xa -r 87 OR MAKE A ZERO!".unixCmd;

t = TempoClock.default.tempo = 88/60;

Tdef(\hh, {
	var rit = Pwhite(0.5, 0.125).stutter(4).asStream;
	loop{
Ndef(\hh, {HPF.ar(WhiteNoise.ar, 8980) * EnvGen.kr(Env.perc(0.01, 0.01))}).play([0,1].choose, 1);
		(rit.next.round(0.125)).wait;
	}
}).play;

Tdef(\hh2, {
	var rit = Pwhite(0.25, 0.0125).stutter(9).asStream;
	loop{
Ndef(\hh2, {BPF.ar(WhiteNoise.ar, 980, 0.1) *2 * EnvGen.kr(Env.perc(0.01, 0.01))}).play([0,1].choose, 1);
		(rit.next.round(0.125)).wait;
	}
}).play;


























