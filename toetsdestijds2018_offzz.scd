//// WELCOME!
Toets Des Tijds 2018

// hello... readable?

// yes... :) thanks

// ok... mmm i need to make a sound...

wow.
// what sound??? ideas?
the sea. Thats easy
(i hope)

/// maybe... lets make a seagull!
/// th sea need to be more stormy...
Ndef(\sea2).fadeTime_(3);

Ndef(\sea, {LPF.ar((SinOsc.ar("e1".namecps(-45)*LFSaw.kr(4).range(1, 4), mul:0.3)+WhiteNoise.ar(1)), LFPulse.kr(1/6).range(100, 300))*0.4}).play(0,1).quant_(1);
Ndef(\sea2, {LPF.ar((SinOsc.ar("a1".namecps(-45)*LFPulse.kr(4).range(1, 1), mul:0.4)+WhiteNoise.ar(1)), LFPulse.kr(1/18).range(100, 600))*0.4}).play(1,1).quant_(1);
/// thats like ... not ghosts

// anne will you play with me?
/// or what??

// there i made a nice bed for u to play...
// its like bubbles!
// no? :(

/// the end...

















Ndef(\sea2, {LPF.ar(WhiteNoise.ar(1), LFPulse.kr(LFNoise0.kr(4).range(1/2, 1/4)).range(100, 1600))*0.4}).play(1,1);
Tdef(\r, { // more notes
	var notes = Pseq(["a3".namecps, "g#3".namecps, "e3".namecps, "a4".namecps], inf).asStream;
	loop{
Ndef(\sg, {SinOsc.ar(notes.next*Line.kr(1, 2.5, 0.2))*0.05*EnvGen.kr(Env.perc(0.1, 2))}).play(0,1);
		[1, 2, 0.4, 5].choose.wait;
	}
}).play; // yeah...

/// yes i like this one. lets make it a routine
// thats a robot seagull.
// at least i have a duo with anne

/// ok...now the computer can play on its own a bit..

// lets make an fx for Anne!
Ndef(\anne).fadeTime_(5);
Ndef(\anne, {CombC.ar(PitchShift.ar(SoundIn.ar(3)*0.55, 0.2, [1*LFSaw.kr(1/6).range(1, 4), 3/2, 5/4]*LFPulse.kr(2).range(1/2, 2.5).lag(1)), 0.2,0.1, 8)*0.4}).play(0,2);

Ndef(\sea2).stop(10);
 // develop the seagulls... a swarm of seagulls/... thats what i will try
thats like big seagulls
(
Tdef(\r, { // more notes. modulate
	var notes = Prand([31.midicps, 36.midicps,28.midicps,"ab2".namecps, "db2".namecps, "eb2".namecps, "ab2".namecps], inf).asStream;
	var rit = Pseq([1, 1/2, 1/2, 1, 1/3, 1/3, 1/3, 1/2, 1/2], inf).asStream;
	var seagulls = Pseq([\sg, \sg1, \sg2], inf).asStream;
	loop{
Ndef(seagulls.next, {SinOsc.ar(notes.next*Line.kr(1, 2.5, 0.2))*0.1*EnvGen.kr(Env.perc(0.1, 0.6))}).play(0,1);
		(rit.next/2).wait;
	}
}).stop;
);
/// ah this font is huge.its difficult


/// should we bring the sea back??
/// but with rhythm. Harmonic rhythmic waves. yeah
Ndef(\sea2).play;







aaaaahhhhh ok. that worked/

more waves..



















a


