

// └ ツ ┘
// code and piano anyway 2017
//

// to influence the performance go here:
// http://shazz.eu-west-1.elasticbeanstalk.com/timer


// ok good luck thanks.

// first a simple sound...

anyway

// wait 4 sec...

// try 2
// super simple
Ndef(\si, {SinOsc.ar("c1".namecps) *≥ 0.3*LFPulse.kr(LFTri.kr(1/4).range(1, 10))}).play(0,2);

Ndef(\si).stop(5);

// yeeeessssss!!!!


// cmon:(



Ndef(\si, {SinOsc.ar("c1".namecps) * 0.2 * LFTri.kr(1/4).range(1, 2)}).play(0,2);

// beep comin up...

Ndef(\beep, {SinOsc.ar("g3".namecps*LFPulse.kr(3).range(1, 3/2)) * EnvGen.kr(Env.perc(0.1, 1)) * 0.1}).play(0,2);
// do u like it???

i do.... i will put it in a loop:


// revisit the sounds....

Tdef(\l, {
	loop{
		Ndef(\beep, {SinOsc.ar("g3".namecps*LFPulse.kr(3).range(1, 3/2)) * EnvGen.kr(Env.perc(0.1, 1)) * 0.1}).play(0,2);
1.wait;
	}
}).stop;

// someone requested delay... ok here we go

// delay for anne

Ndef(\del, {CombN.ar(PitchShift.ar(SoundIn.ar(4), 0.2, LFPulse.kr(2).range(1/2, 1.5)), 0.2, 0.2, 3)*1}).play(0,2)

/// ok its a weird delay. but ANYWAY...

lets make it better.

/// wow anne plays loud!!!
Ndef(\del, {CombN.ar(PitchShift.ar(SoundIn.ar(4), 0.2, LFPulse.kr([2]).range(1/2, 1.5)), 0.2, 0.2, 3)*0.6 * LFPulse.kr(4)}).play(0,2);

/// yes spooky...  spooky morning.

// beep is boring. lets make it spooky:

Ndef(\spooky, {SinOsc.ar(["g2".namecps, "c2".namecps]*LFPulse.kr(8).range(1, 6/2)) * EnvGen.kr(Env.perc(20, 20).circle) * 0.4 * LFPulse.kr(3)}).play(0,2);

//// louder!!!1
Ndef(\spooky).stop;

/// and how did the javascript alert?????

/// some one refresh that









































































