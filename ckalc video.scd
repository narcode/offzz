/// Ckalculator video (take 2)
// first is first. call out the numbers anne is producing.

(
OSCdef(\ck, {|msg|
	var num = msg[1].asInt;
	if (num.odd) {
	("say -v vi " ++ msg[1]).unixCmd;
		Tdef(\n , {
			var name = Pseq([\n, \na, \nar, \narc], inf).asStream;
			loop{
				if (num%3 == 0) {
					if (~lt == 'false') {
						Ndef(name.next, {LFPulse.kr(num.linlin(1, 100, 1, 8.0)) * SinOsc.ar(num.linlin(1, 500, 84, 99).midicps) * EnvGen.kr(Env.perc(0.1, 8))}).play(1);
					} {
						Ndef(name.next, {SinOsc.ar(num.linlin(1, 500, 34, 106).midicps*LFTri.kr(num).range(1, 3)) * EnvGen.kr(Env.perc(0.1, 8))}).play(1);
					}
				} {
					Ndef(name.next, {(WhiteNoise.ar(0.8)*EnvGen.kr(Env.perc(0.01, 0.01)))+SinOsc.ar(num.linlin(1, 500, 64, 86).midicps) * EnvGen.kr(Env.perc(0.1, 5))}).play([0,7].choose);
				};
				if (~equal == 'true') {1.wait;} {3.wait;}
/*				switch(num%3,
					0, {0.2.wait;},
					1, {0.5.wait;};
					2, {2.wait;};
				);*/
		}}).play;
	} {
	("say -v tri " ++ msg[1]).unixCmd;
		Tdef(\na, {
						var name = Pseq([\nn, \nna, \nnar, \nnarc], inf).asStream;
			loop{
				Ndef(name.next, {2*BPF.ar(Saw.ar(num.linlin(1, 500, 34, 56).midicps), LFSaw.kr(1).range(100, 678), 0.1) * EnvGen.kr(Env.perc)}).play([0,8].choose);
				if (num > 50) {
				0.35.wait;
				} {
				0.75.wait;
				}
		}}).play;
	};
	if (msg[1] == 'zero') {
		Tdef.all.do{|t| t.stop;};
		Ndef.all.do{|n| n.stop(1);};
		Ndef(\zero, {Blip.ar(Line.kr(100, 899, 10), LFNoise1.kr(1/2).range(1, 200)) * LPF.ar(WhiteNoise.ar, 456) * EnvGen.kr(Env.perc(0.01, 8))}).play(0,2);
	};
}, "ck"); // oopos was soo low. but ok.
);

// we will go for a manimal approach

// now an fx. tradition is important
OSCdef(\an, {
	Ndef(\anne, {GVerb.ar(FreqShift.ar(SoundIn.ar(2), LFPulse.kr(0.1.rrand(8)).range(-100, 1677.rrand(100))), 78, 19)*1}).play(0,2)
}, "ck_error");


Ndef(\c, {CombN.ar(In.ar(7,2), 0.1, 0.5, 8)}).play(0,2);

~comparisons.on("ol", "tri", "al");

// erorr handling
~er = 0;
OSCdef(\err, {|msg|
	("say -v juan " ++ msg ++ " eztreik " ++ msg[1].asString).unixCmd;
	~er = ~er + 1;
	if (~er > 2) {
		("say -v juan aaaaaaaaaaaaaaaaaaaaaaaaaaaaAAA").unixCmd;
		Ndef.all.do{|n| n.stop;};
				Tdef.all.do{|n| n.stop;};
		Ndef(\e, {Blip.ar(Line.kr(100, 1899, 10), LFSaw.kr(1/2).range(1, 400), LFNoise0.kr(1).range(1, 120)) * LPF.ar(WhiteNoise.ar, Line.kr(1000, 50, 10)) * EnvGen.kr(Env.perc(0.01, 9))}).play(0,2);
	};
}, "ck_error");


// lets help with the rhyhtm.
Tdef(\narcode, {
	var rit = Pwhite(0.0125, 0.25).stutter(4).asStream;
	loop{
	Ndef(\narcode, {HPF.ar(WhiteNoise.ar, 8989)*EnvGen.kr(Env.perc(0.01, 0.01))}).play(0,2);
		(rit.next).wait;
	}
}).play;

Tdef(\narcodeb, {
	var rit = Pwhite(0.5, 2).stutter(2).asStream;
	loop{
		Ndef(\narcodeb, {(LPF.ar(WhiteNoise.ar, 1289)*EnvGen.kr(Env.perc(0.01, 0.01))) + SinOsc.ar(Line.kr(100, 56, 1))*EnvGen.kr(Env.perc)}).play(0,2);
		(rit.next.round(0.5)).wait;
	}
}).play;

Tdef(\narcodes, {
	var rit = Pwhite(0.125, 3).round(1).stutter(1).asStream;
	var rt = rit.next;
	loop{
		(rt.next.round(0.125)).wait;
	Ndef(\narcodes, {BPF.ar(WhiteNoise.ar, 589)*EnvGen.kr(Env.perc(0.01, 1))}).play(4,2);
		(rit.next).wait;
	}
}).play;

Ndef(\ver, {GVerb.ar(In.ar(4,2), 78, 2)}).play(0,2);
