//// #SHA2017 rehearsal...


/// NEW
Ndef(\puuum).fadeTime_(3).stop;

Ndef(\puuum, {SinOscFB.ar(["eb2".namecps(LFTri.kr(1/4).range(-30, 10)), "c2".namecps], LFSaw.kr(1/4).range(0, 0.3))*0.2}).play(0,2);

Ndef(\puuum).clear;

Tdef(\beat, {
	loop{
		Ndef(\tiriri, {SinOsc.ar("g#4".namecps*LFPulse.kr(2).range(1, 9/8))*0.9*EnvGen.kr(Env.perc(0.01, 0.5))}).play(3,1);
		4.wait;
	}
}).play;

Tdef(\beat2, {
	loop{
		Ndef(\tiriri2, {SinOsc.ar("c#5".namecps*LFPulse.kr(4).range(1, 6/5))*0.8*EnvGen.kr(Env.perc(0.01, 1))}).play(0,1);
		10.wait;
	}
}).play;


// wait... i wait...
Ndef(\b, {SinOsc.ar(60)*EnvGen.kr(Env.perc(2, 10))}).play(0,2)
Tdef(\beat3, {
	loop{
		Ndef(\tiriri3, {SinOsc.ar("a2".namecps*LFPulse.kr(1).range(1, 3/2))*1*EnvGen.kr(Env.perc(0.01, 2))}).play(3,1);
		10.wait;
	}
}).play;


Ndef(\del, {CombN.ar(In.ar(3), 0.2, 0.3, 3)}).play(0,1);


// fx for Anne:
// wait....
Ndef(\anne, {CombN.ar(PitchShift.ar(SoundIn.ar(4), [6/5, 2]*LFPulse.kr(2).range(1, 3/2)), 0.2, 0.2, 3)*4}).play(0,2);



////// idea 2. fx then timer then dev

Ndef(\anne).fadeTime_(4).stop;
Ndef(\anne, {CombN.ar(PitchShift.ar(SoundIn.ar(4)*4, 0.2, [2, 3/2, 6/5]*LFSaw.kr(1/2).range(1, 3/2)), 0.5, 0.25, 6)*2}).play(0,2);

// time bomb

Tdef(\explode, {
	(60*1).wait;
	Ndef(\out, {ReplaceOut.ar([0,2], LPF.ar(In.ar(0,2), Line.kr(7878, 20, 10)) + CombN.ar(PitchShift.ar(PinkNoise.ar(1), 0.2, LFNoise0.kr(3).range(1/2, 4)), delayTime: 8)*EnvGen.kr(Env.perc(0.2, 8)))*EnvGen.kr(Env.perc(0.01, 20))}).play;
}).play


// bomb is on !!! aaaah

// i wait for the timer...
Ndef(\bass, {SinOsc.ar(["c2".namecps, "ab3".namecps(10), "b2".namecps(30)]) * EnvGen.kr(Env.perc(4, 8).circle(4))*0.3}).play(0,2);

Tdef(\a, {
	loop{
		Ndef(\sh, {LPF.ar(WhiteNoise.ar(2), 1943*LFSaw.kr(1/2).range(1/2, 2)) * EnvGen.kr(Env.perc(0.01, 3))}).play(0,2);
		4.wait;
	}
}).play;

Tdef(\b, {
	var rit = Pseq([1/2, 1/4, 1/4, 2, 1, 1, 1/2, 1/2, 1/4, 1/4, 1/4, 1/4], inf).asStream;
	var name = Pseq([\1, \2, \3, \4], inf).asStream;
	loop{
Ndef(name.next, {LPF.ar(WhiteNoise.ar(2), 3943) * EnvGen.kr(Env.perc(0.01, 0.1))}).play(0,2);
		(rit.next).wait;
	}
}).play;

Tdef(\c, {
	var rit = Pseq([1/2, 1/4, 1/4, 2, 1, 1, 1/2, 1/2, 1/4, 1/4, 1/4, 1/4]/4, inf).asStream;
	var name = Pseq([\6,\7,\8, \9], inf).asStream;
	var freq = Pwhite("a2".namecps, "d7".namecps).asStream;
	loop{
		if (rit.next != 0.25) {
		Ndef(name.next, {(LPF.ar(SinOsc.ar(freq.cpsmidi.round(3).midicps)*LFTri.kr(2).range(1/2, 5/4) + WhiteNoise.ar(2), 9943)) * EnvGen.kr(Env.perc(0.01, 0.3))}).play(0,2);
		(rit.next).wait;
		} {
			Ndef(\w, {WhiteNoise.ar(0.4)}).play;
			1.wait;
		};
	}
}).play;

Ndef(\e, {WhiteNoise.ar(1)*EnvGen.kr(Env.perc(0.1, 2))}).play(2);




















