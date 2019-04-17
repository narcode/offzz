gasx  /v jhkhhhhjhj

     jsac/lasmc:LSAkf w


















// get anne nums:
(
OSCdef(\anne, {|msg|
	var num = msg[1].asInt;
	if (num.even) {
	("say -v vi -r 99 " ++ msg[1]).unixCmd;
		Ndef(\even, {SinOsc.ar(num.clip(520, 1567)*EnvGen.kr(Env.perc(releaseTime:3))*0.5)}).play(4,1);
	} {
	("say -v fre -r 99 " ++ msg[1]).unixCmd;
		Ndef(\odd, {SinOsc.ar(num.clip(420, 267)*EnvGen.kr(Env.perc(releaseTime:3))*0.5)}).play(5,1);
	}
}, "ck");
);

// good now we now her numbers... let's start making music.

// now an fx for anne:
// let's let anne change the fx...
OSCdef(\fx, {|msg|
	var num = msg[1].asInt;
	Ndef(\annefx, {CombN.ar(PitchShift.ar(SoundIn.ar(2,2), 0.01, [1, 3/2, 5/4, 6/5]*num.linlin(1, 1200, 1/2, 8)).sum, 0.01, 7)}).play(0,2);
})



Tdef(\b, {
	var rit = Pseq([1/8], inf).asStream;
	loop{
		Ndef(\beat, {(SinOsc.ar(123*Line.kr(1, 0.7, 0.3))+WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.01))))*EnvGen.kr(Env.perc)}).play(0,2);
		(rit.next).wait;
	}
}).play;

Tdef(\b2, {
	var rit = Pseq([2], inf).asStream;
	loop{
		Ndef(\beat2, {(SinOsc.ar(73*Line.kr(1, 0.2, 1))+BPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 1))), 342))*EnvGen.kr(Env.perc)}).play(0,2);
		(rit.next).wait;
	}
}).play;

t = TempoClock.default.tempo = 70/60;

Ndef(\fx, {CombN.ar(PitchShift.ar(In.ar(4,2), 0.22, [1/2, 1, 3/2, 5/4, 6/5]).sum, 0.2, 17)}).play(0,2);


// ill make it more difficult now. ok not yet

~comparisons.on("xa", "pa", "ju");

// but comparisons are on!
~str = 0;
OSCdef(\error, {|msg|
	("say -v ju eztreik " ++ ~str).unixCmd;

	if (~str > 2) {
		("say -v ju eztreik " ++ ~str).unixCmd;
		"say -v ju AaahahahahahaaAAAAAAAAAA the end!".unixCmd;
				Tdef.all.do{|n| n.stop(1)}};
	~str = ~str + 1;
}, "ck_error");

// its a bit more difficult now.


// now i can just play my own sound
Tdef(\na, {
	loop{
		Ndef(\na, {P)
		1/8.wait
	}
})


////// Rehersal 5th sept

(
OSCdef(\anne_nums, {|msg|
	var num = msg[1].asInt;
	// dive even and odds:
	if (num.odd) {
	("say -v vi -r 99 " ++ msg[1]).unixCmd;
		Tdef(\odd, {
			(num.clip(1,8)).do{
Ndef(\odd, {HPF.ar(WhiteNoise.ar, 7898)*EnvGen.kr(Env.perc(0.01, 0.01))}).play(1);
				([0.3, 0.2, 0.25, 0.1].choose).wait;
	}
}).play;
	} {
	("say -v fred -r 99 " ++ msg[1]).unixCmd;
		Tdef(\even, {
	(num.clip(1,8)).do{
				Ndef(\even, {BPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)))+SinOsc.ar("a1".namecps), 598)*EnvGen.kr(Env.perc(0.01, 2))*2}).play(0);
		1/2.wait;
	}
}).play;
	}
}, "ck");
);

// maybe time for an fx on the piano:
// now anne can control the fx
OSCdef(\fx, {|msg|
	var num = msg[1].asInt;
	Ndef(\annefx, {CombN.ar(PitchShift.ar(SoundIn.ar(2,2), 0.01, [1/2, 3/2, 5/4, 6/5]*num.linlin(1, 1600, 1/8, 1/2)), 0.2, 0.1, 8)}).play(0,2);
},"ck");


// i think she needs a beat:
// i'll help her out too:
Tdef(\me, {
	loop{
		Ndef(\me, {1*LFPulse.kr(8).lag(0.1)*SinOsc.ar("a3".namecps*LFTri.kr(1/2).range(2, 1/4))*EnvGen.kr(Env.perc(0.1, 2))}).play([4,5].choose, 1);
2.wait;	}
}).play;

Ndef(\mefx, {0.01*In.ar(4,2)+CombN.ar(PitchShift.ar(In.ar(4,2), 0.01, [1/2, 3/2, 5/4, 6/5]*LFPulse.kr(4).range(1/2, 1/8)), 0.2, 0.25, 2)}).play(0,2);

// comparisons:
~comparisons.on("xa", "pau", "tri");

// anne can compare numbers:

~straik = 1;
OSCdef(\err, {|msg|
	("say -v juan " ++ ~straik).unixCmd;
	~straik = ~straik +1;
	if (~straik > 1) {
		"say -v juan AAAAAAAAAAAAAAAAAAAA".unixCmd;
				"say -v juan THE END!".unixCmd;
				"say -v xan HET EIND!".unixCmd;
		Ndef.all.do{|n| n.stop}; Tdef.all.do{|n| n.stop};
	}
}, "ck_error")


// time to make it difficult for Anne!
"say -v alex -r 78 SHIFT IS ON! SHIIIT".unixCmd;


///



// fx anne
Ndef(\annefx, {1*CombN.ar(PitchShift.ar(SoundIn.ar(2,2), 0.01, [1, 3/2, 5/4, 6/5]*12.linlin(1, 1200, 1/2, 8)).sum, 0.01, 7)}).play(0,2);



//// Ckalculator


// first lets get anne's numbers:

(
OSCdef(\anne, {|msg|
	var num = msg[1].asInt;
	// now more voices if odd:
	if (num.even) {
	("say -v vi " ++ msg[1]).unixCmd;
		// lets add a sound is anne plays an even num:
		Tdef(\ev, {
	loop{
		Ndef(\beate, {HPF.ar(WhiteNoise.ar(1), 8435)*EnvGen.kr(Env.perc(0.01, 0.01))}).play(1);
		0.125.wait;
}}).play;
	} {
	("say -v tri " ++ msg[1]).unixCmd;
		// and also if odd
				Tdef(\ev, {
	loop{
				Ndef(\beatodd, {(LPF.ar(WhiteNoise.ar(1), 8435)+SinOsc.ar("a1".namecps))*EnvGen.kr(Env.perc(0.01, 0.3))}).play(0);
		0.6.wait;
}}).play;
	};
}, "ck");
);

// ok that is working.
// now let's add an fx to anne'spiano

// let's change the sound if she gets a num:
OSCdef(\fx, {|msg|
	var num = msg[1].asInt;
	Ndef(\annefx, {CombN.ar(PitchShift.ar(SoundIn.ar(2,2), 0.01, [1, 3/2, 5/4, 6/5]*num.linlin(1, 1600, 1, 8)).sum, 0.01, 7, 7)}).play(0,2);
}, "ck")

Tdef(\b, {
	loop{
		Ndef(\beat, {BPF.ar(WhiteNoise.ar(1), 435)*EnvGen.kr(Env.perc(0.01, 3))}).play([0,1].choose);
		if (~equal == 'true') {
			4.wait; } {
			0.5.wait;
		};
}}).play;


Tdef(\b2, {
	loop{
		Ndef(\beat2, {BPF.ar(Saw.ar("a5".namecps*LFTri.kr(2).range(1/2, 2))+WhiteNoise.ar(1), 835)*EnvGen.kr(Env.perc(0.01, 2))}).play([0,1].choose);
		if (~gt == 'true') {
		1.wait;
		} {0.2.wait};
}}).play;

~comparisons.on("xa", "pau", "ju");

~s = 1;
OSCdef(\error, {|msg|
	("say -v ju " ++ ~s).unixCmd;
	~s = ~s+1;
	if (~s > 2) {
			("say -v ju eztreik" ++ ~s).unixCmd;
		"say -v ju AAAAAAHAHANANANAHAAHAHAAAAAAA.     , . . THE END!".unixCmd;
		Tdef.all.do{|t| t.stop};
	}
}, "ck_error")














































































