// Oct 2 2018

Ndef(\1).fadeTime_(9);

Tdef(\1, {
			var deg = Pseq([1, 3/2, 2, 1/2], inf).asStream;
	loop{
Ndef(\1, {GVerb.ar(SinOsc.ar(deg.next*["a1".namecps, "a2".namecps*LFTri.kr(4).range(1.05, 0.995), "d3".namecps]*LFTri.kr(2).range(1.1, 0.99)), 87, 2).sum*0.05}).play(0,2);
		(4).wait;
	}
}).play;


// feedback

Ndef(\in, {CombN.ar(LFPulse.kr(8)*SoundIn.ar(2,1)*2, 0.5, 0.25, 8)}).play(0,1);
Ndef(\in2, {CombN.ar(LFPulse.kr(8)*SoundIn.ar(3,1)*2, 1, 0.5, 8)}).play(1,1);

Tdef(\1).stop;

Ndef(\1).play;
Ndef(\1).stop(9);

Ndef.all.do{|n| n.stop(5)};

Ndef(\in1).fadeTime_(4);

Ndef(\in1, {CombN.ar(PitchShift.ar(SoundIn.ar(2,1), 0.1, [1/8, 1, 8/2]*LFPulse.kr(LFTri.kr(1/4).range(1, 8)).range(1, 1/2))*2, 0.5, 0.01, 2).sum}).play(0,2);

Ndef(\in22, {CombN.ar(PitchShift.ar(SoundIn.ar(3,1), 0.01, [4, LFTri.kr(1/2).range(6, 8)])*2, 1, 0.5, 8).sum}).stop(1,1);


// a bass:
Tdef(\b, {
	var rit = Pseq([1/2, 1/2, 1/2, 1/2, 1.5, 1/4, 1/4], inf).asStream;
	loop{
Ndef(\bass, {LPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 1)))+SinOsc.ar(Line.kr(89, 54, 1), 123))*EnvGen.kr(Env.perc(0.01, 1))}).play(0,2);
		(rit.next).wait;
	}
}).play;

Tdef(\h, {
	var rit = Pseq([1/2, 1/2, 3, 3, 1, 4, 2, 1, 1]/4, inf).asStream;
	var name = Pseq([\h, \h2, \h3], inf).asStream;
	loop{
		Ndef(name.next, {LPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 1)))+SinOsc.ar(Line.kr(89, 4864.rrand(1234), 1), 123))*EnvGen.kr(Env.perc(0.01, 8.rrand(1)))}).play(1,1);
		(rit.next).wait;
	}
}).play;




////// 2

b = LiveBuffer(5);
b.record(3);

Tdef(\l, {
	loop{
b.buffer.play;
		2.wait;
}}).stop;


Ndef(\buf, {PlayBuf.ar(1, b.buffer, BufRateScale.kr(b.buffer)*1, loop:1, trigger: LFPulse.kr(2), startPos: 1.rrand(1892312))*9}).stop(0);

Ndef(\bufL, {PlayBuf.ar(1, b.buffer, BufRateScale.kr(b.buffer)*1, loop:1)*8}).stop(1);


Ndef(\fx).fadeTime_(5);
Ndef(\fx, {GVerb.ar(FreqShift.ar(LPF.ar(WhiteNoise.ar(LFPulse.kr(2).range(0.2, 1)), 767)+SoundIn.ar(2,2), LFPulse.kr(2).range(-699, 8789)), 823, 1)}).play(0,2)


Tdef(\snap, {
	var woord = Pseq(["snap", "jim", "doorheen", "mooie melodie", "zee"], inf).asStream;
	var voice = Pseq(["whi", "whi", "whi"], inf).asStream;
	4.do{
		("say -r 124 -v " ++ voice.next ++ " " ++ woord.next).unixCmd;
		(8).wait;
}}).play;

Ndef(\fx).stop(1);
// blade
Tdef(\rit, {
	var name = Pseq([\pip, \pip2, \pip3], inf).asStream;
	var rit = Pseq([1, 1/3, 1/3, 1/3], inf).asStream;
			var mel2 = Pseq(["f#4".namecps, "c#1".namecps, "B2".namecps], inf).asStream;

		var mel = Pseq(["g#1".namecps, "a#2".namecps, "c#4".namecps], inf).asStream;
	100.do{|i|
		var n = i+1;
		Ndef(name.next, {Saw.ar(["a0".namecps, Line.kr(144.rrand(87), 104.rrand(87), 1), mel2.next, mel.next], 1).distort.sum*EnvGen.kr(Env.perc(0.3, 1.rrand(4)))}).play([0,1].choose,1);
		((1/n)+0.1).wait;
}}).play;

Tdef(\rit).stop;
// im making the sound thicker


// LC

Ndef(\r).fadeTime_(2);
Ndef(\r, {LFPulse.kr(4)*SinOsc.ar("a-2".namecps) * LFNoise0.kr(8).range(0.01, 0.15)}).play(0,1);
Ndef(\l, {LFPulse.kr(4)*SinOsc.ar("c-2".namecps(-34)) * LFNoise0.kr(8).range(0.01, 0.25)}).play(1,1);
Ndef(\o, {LFPulse.kr(4)*SinOsc.ar("c-2".namecps(34)) * LFNoise0.kr(8).range(0.01, 0.25)}).play(1,1);
Ndef(\ol, {LFPulse.kr(1/8)*SinOsc.ar("g-2".namecps(-34)) * LFNoise0.kr(8).range(0.01, 0.25)}).play(0,1);

Ndef(\r).stop;

Ndef(\fx1, {LFPulse.kr(13)*Limiter.ar(CombN.ar(FreqShift.ar(SoundIn.ar(3), [678, 0])*LFNoise0.kr(9).range(0.8,1), 1, [0.2, 0.12], 7)*0.2, 0.8)}).play(0,2);

{
50.do{|i|
		i.postln;
		Ndef(i.asSymbol, {PinkNoise.ar(0.01.rrand(1))*EnvGen.kr(Env.perc(0.01, 0.1).circle(0.01.rrand(1)))}).play([0,1].choose, 1);
		(1/2).wait;
};
	}.fork;


Ndef(\noise2, {LPF.ar(BrownNoise.ar, 323)*Line.kr(0, 2, 25)}).play(0,2);

Ndef(\noise2).stop;

Ndef.all.do{|n| n.stop(1)};

Tdef(\n, {
	var rot = Pwhite(1.5, 0.125).asStream;
	loop{
		Ndef(\n, {BPF.ar(WhiteNoise.ar(1), LFSaw.kr(1).range(100, 8989), 0.1)*1*EnvGen.kr(Env.perc(4, 45))}).play([0,1].choose,1);
		(rot.next.round(0.125)).wait;
	}
}).stop;


Ndef(\n, {BPF.ar(WhiteNoise.ar(1), LFSaw.kr(9).range(100, 8989), 0.1)*1*EnvGen.kr(Env.perc(4, 15))}).play([0,1].choose,1);
Ndef(\n).stop;




Tdef(\end, {
	11.do{|i|
		var num = 10-i;
		("say -v vi -r 178 end in " ++ num.asString).unixCmd;
		3.wait;
	}
}).play;

Ndef(\fx1).stop;







































