/////// Off<>zz 1 maart 2016!

//// experiment with forced direct eye contact
////
//// every: 120 / 90 / 60 seconds


/////////////// #1
// routine:
Tdef(\a, {
	x = Pseq([0.25, 0.25, 2]*2, inf).asStream;
	loop{
		Ndef(\n, {SinOsc.ar(([845, 130]*LFTri.kr(1).range(1, 1/4)).cpsmidi.round(2).midicps)*EnvGen.kr(Env.perc(0.1, 0.2))*Line.kr(0.1, 0.5, 0.3)}).play(4,2);
		(x.next.postln).wait;
	}
}).play;

/// fx
Ndef(\echo, {RHPF.ar(CombN.ar(In.ar(4,2), 0.5, [0.4, 0.2], 7), Line.kr(440, 4567, 10), Line.kr(1, 0.1, 25))}).play(0,2);

////anne:
Ndef(\an, {GVerb.ar(HPF.ar(SoundIn.ar(0), 1789), 111, 4)*1}).play(0,2)

// wait for signal:
Ndef(\ann, {CombN.ar(SoundIn.ar(0), 0.2, 0.3, 4)*1}).play(0,2);

/////
"say -v vicki light on screen!".unixCmd;


//////////// NEW SESSION! #2
Ndef(\n).fadeTime_(0.1);

t = TempoClock.default;
t.tempo = 90/60;

Ndef(\n, {|freq=165|GVerb.ar(SinOsc.ar([freq, freq*5/4, freq*3/2]), 6, 9)*0.01}).play(0,2);

/// reserve for light...
Tdef(\a,{
	f = Pseq([165, 145, 125]*(3/2), inf).asStream;
	loop{
		var freq = f.next;
Ndef(\n, {GVerb.ar(SinOsc.ar([freq, freq*5/4, freq*3/2].lag(0.2))*LFPulse.kr(t.tempo*2).range(1, 0.3), 6, 9)*0.03}).play(0,2);
1.wait
	}
}).play;

// bass
Ndef(\a, {|freq=95|GVerb.ar(SinOsc.ar([freq]), 6, 9)*0.04}).play(0,2);

Ndef(\r, {ReplaceOut.ar([0,2], In.ar(0,2)*0)}).play;

/////// #3
Ndef(\an).clear;

Ndef(\an, {PitchShift.ar(SoundIn.ar(0), 0.2, LFTri.kr(1/4).range(0.8, 1.1))*1.5}).play(0,2);


Ndef(\ann, {Amplitude.kr(SoundIn.ar(0))*LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo/2).range(2000, 456))*5}).play(1,1);

Ndef(\anne, {Amplitude.kr(SoundIn.ar(0))*LPF.ar(SinOsc.ar("c4".namecps*LFSaw.kr(1/6).range(1, 1/4)), LFNoise0.kr(t.tempo/2).range(2000, 456))*5}).play(0,1);

Ndef(\an, {FreeVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFTri.kr(1/4).range(0.8, 1.1))*1.5, 0.8, 0.7)}).play(0,2);


Ndef(\all, {ReplaceOut.ar([0,2], GVerb.ar(In.ar(0,2), 123, 9)*0.1)}).play(0,2);

////////// #4 -> 60sec

//// routine:
Tdef(\a, {
	f = Prand(["d4".namecps, "f#4".namecps, "a5".namecps], inf).asStream;
	loop{
		Ndef(\n, {(SinOsc.ar(f.next, mul: EnvGen.kr(Env.perc(0.1, 0.1)))*2) + Saw.ar(LFNoise0.kr(2).range(f.next, f.next/2).lag(0.3) * EnvGen.kr(Env.perc(0.1, 1)))*0.1}).play(0,2);
		(1/2).wait;
}
}).play;

Ndef(\a, {CombC.ar((SoundIn.ar(0)*In.ar(0,2)), 0.5, 0.22, 4)*LFPulse.kr(t.tempo*3)*2}).play(0,2);


Tdef(\a).stop;

///////// #5 -> 90sec


//// harmonic
Ndef(\n, {|freq=540|FreeVerb.ar(SinOsc.ar([freq.lag(1), (freq/2).lag(2), (freq*5/4).lag(3)]), 1, 0.9)*LFTri.kr(4)*LFNoise1.kr(3).range(0.5, 1)*0.1}).play(0,2);

Ndef(\n).set(\freq, Ndef(\kr, {LFPulse.kr(2).range(100, 450)}));


/// layer 2 ... waiting .... waiting ...
// ..... spannend.....

Ndef(\a, {|freq=540|FreeVerb.ar(SinOsc.ar([freq.lag(1), (freq/2).lag(2), (freq*5/4).lag(3)]), 1, 0.9)*LFTri.kr(4)*LFNoise1.kr(3).range(0.5, 1)*0.1}).play(0,2);

Ndef(\a).set(\freq, Ndef(\kr, {LFPulse.kr(3).range(50, 100*10/4)}));

Ndef(\n).stop(5);

/// anne
Ndef(\anne, {PitchShift.ar(SoundIn.ar(0), 0.2, [2/1, 3/4, 1/2, 3/2, 6/5] ) * LFPulse.kr(5.5)}).play(0,2)

Ndef(\anne, {PitchShift.ar(SoundIn.ar(0), 0.2, [2/1, 3/4, 1/2, 3/2, 6/5] ) * LFPulse.kr(5.5)}).play(0,2)


//// beat

Ndef(\r, {LFPulse.kr(0.2, width: 0.5) * LPF.ar(WhiteNoise.ar(3), 234)*Line.kr(0, 0.5, 2)}).play(0,2)



Ndef(\c, {LFPulse.kr([11, 20], width: 0.001) * HPF.ar(WhiteNoise.ar(0.4), Line.kr(20, 2756, 5))*Line.kr(0, 0.5, 5)}).play(0,2)

Ndef(\c).quant_(1);

Ndef(\r).stop(0.5);


















