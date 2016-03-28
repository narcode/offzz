///// offzz 25 maart 2016\

///////
~count = 0;
~change = 0;

Tdef(\timer, {
	inf.do{
		~count = ~count + 1;
		("seconds -----> "++~count).postln;
		if (~count==59) {if (~change.even) {20.do{"LOOK AT ANNE! LOOK AT ANNE!".postln;}; ~count=0; ~change = ~change+1;} {20.do{"LOOK AT ANNE! LOOK AT ANNE! NARCODE CHANGE!!!!!!!!!!".postln;}; ~count=0; ~change = ~change+1;}; };
		1.wait;
	}
}).play;


//////

///// try #3

Ndef(\a, {FreqShift.ar(SoundIn.ar(0), LFSaw.kr(1/4).range(1/2, 4))*4}).play(0,2);

Ndef(\n, {|ratio=1|BPF.ar(Saw.ar(([ratio, 1]*"f#3".namecps).cpsmidi.round(1).midicps*LFPulse.kr([4, 2]).range(3/2, 1)), 300, 0.2)*Line.kr(1, 2, 10)}).play(0,2);

Pdef(\n, Pbind(\type, \set, \args, [\ratio], \ratio, Pseq([1, 2, 3/2, 5/4, 4/3, 6/5], inf), \delta, 1/4)).play;


Ndef(\ann, {GVerb.ar(In.ar(2,2)+SoundIn.ar(0), 120, 5)*0.1}).play(0,2);
Ndef(\n).stop;

Ndef(\a, {CombN.ar(FreqShift.ar(SoundIn.ar(0), LFSaw.kr(1/4).range(1/2, 4))*4, 0.2, 0.2, 4)}).play(0,2);
NdeF(\n).stop;

Ndef(\a).stop

/////////// #4 - structural changes every 90sec
Ndef(\n).fadeTime_(0.1);

Tdef(\a, {
	x = Pseq([2, 4, 1], inf).asStream;
	loop{
Ndef(\n, {|rit=2|PitchShift.ar(Impulse.ar(LFPulse.kr(rit).range(2, 12))*14, 0.2, [1/2, 1/4, 2])*2}).play(0,2); // waiting...
		1.wait;
	}
}).play;

Ndef(\ann, {FreeVerb.ar(SoundIn.ar(0), 0.6, [0.5, 1])*2}).play(0,2);
Ndef(\ann).clear;


Tdef(\a).stop;

Ndef(\n, {BPF.ar(WhiteNoise.ar(Line.kr(0.7, 0.01, 5)), LFNoise1.kr(3).range(1000, 1234), 0.1)}).play(0,2);

/////////// #5 - every 60sec toggled changes
Ndef(\ann).fadeTime_(5);
Ndef(\ann, {GVerb.ar(CombN.ar(In.ar(2)*Amplitude.kr(SoundIn.ar(0)), 0.2, 0.4, 2), 34, 45)*7}).play(0,2);

Ndef(\an, {GVerb.ar(CombN.ar(SoundIn.ar(0), 0.2, 0.4, 2), 34, 5)*0.2}).play(0,2);

//// my change

Tdef(\n, {
	x = Prand(["g2".namecps, "a2".namecps]*3, inf).asStream;

	loop{
Ndef(\n, {SinOsc.ar(x.next)*LFPulse.kr(2).lag(0.5)*0.3}).play(2,2);
		1.wait;
	}
}).play;

Tdef(\na, {
	y = Prand(["b2".namecps, "d2".namecps, "c2".namecps]*2, inf).asStream;

	loop{
Ndef(\na, {SinOsc.ar(y.next)*LFPulse.kr(2).lag(0.5)*0.4}).play(2,2);
		(1/4).wait;
	}
}).play;

Ndef(\ann).stop(20);


////////////// #6


Ndef(\an, {Saw.ar(["f#4".namecps, "g#4".namecps, "d4".namecps]*LFSaw.kr(2).range(1, 3/2), 1)*Amplitude.kr(SoundIn.ar(0))*4}).play(0,2);

Ndef(\a).fadeTime_(1);
Ndef(\a, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [4/2, 1.3/2, 3.2]*2), 0.5, 0.2, 0.2)*4}).play(0,2);
Ndef(\a).stop(0.5);
Ndef(\nar).fadeTime_(1);

Ndef(\nar, {SinOsc.ar("d#1".namecps)*0.3}).play(0,2);

Ndef(\nar).stop(10);












