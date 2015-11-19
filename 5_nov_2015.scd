//////// Off<>zz
/////
///

"Anne".... ok

////

//// narcode:

//////// Noise hat music?

Tdef(\evilcum, {
	loop{|i|

"say -v vicki -r 180 EVIL zion.... come now".unixCmd;
"say -v cello -r 1 EVIL zion.... come now".unixCmd;


		10.wait;
	}
}).play;

Tdef(\evilcum).stop;


Ndef(\n).fadeTime_(14);
Ndef(\n, {SinOsc.ar(["b1".namecps, "b1".namecps])*LFPulse.kr(4)*0.5}).play(0,2);


"say -v cello -r 10 EVIL zion.... come now".unixCmd;

//// evil sound:

Ndef(\n, {SinOsc.ar(["b1".namecps, "g2".namecps])*LFPulse.kr(4)*0.5}).play(0,2);

// reverb for robbor:
Ndef(\anne, {GVerb.ar(PitchShift.ar(SoundIn.ar(3), 0.2, [1/3, 3/2]), 12, 5)*0.1}).play(0,2)

Ndef(\anne).clear;

 // getting stupi memory alloc probs  ----------->

Ndef(\anne).fadeTime_(10);

Ndef(\anne, {FreeVerb.ar(PitchShift.ar(SoundIn.ar(3), 0.2, [1/3, 3/2]), 0.7, 1)*0.5}).play(0,2)


Ndef(\n, {SinOsc.ar(["b1".namecps, "g2".namecps]*[1, 6/5])*LFPulse.kr(4, width: 0.2)*0.1}).play(0,2);

Ndef(\n).stop(20);


// sorry for the clipping....

Ndef(\anne).stop;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////
////// SCARY EVIL v2
////////


// i start with ATMO:

Ndef(\n, {GVerb.ar(SinOsc.ar(["ab2".namecps, "b2".namecps]), 34, 6)*0.1*LFNoise1.kr(5).range(0.01, 1)}).play(0,2);




: ( ---------------------------------------------------> crashed! --------->





////////
////// SCARY EVIL v3
////////


// i start with ATMO:

Ndef(\n, {GVerb.ar(SinOsc.ar(["ab2".namecps, "b2".namecps]), 34, 6)*0.1*LFNoise1.kr(5).range(0.01, 1)}).play(0,2);





------------------------------------------> sample rate so high! ---------->



Zi0n is not bossy.... ------------> Anne is BOSSY ------------------->


	We are on again: :)



////////
////// SCARY EVIL v4 (good sample rate)
////////

////////////////// SCARY DRUGGY PSYCHO BATS

// i start with ATMO:

Ndef(\n, {|rate=(1/4)| GVerb.ar(SinOsc.ar(["ab2".namecps, "c3".namecps]*LFSaw.kr(LFNoise0.kr(1).range(rate, 3)).range(1, 1/2)), 34, 6)*0.08*LFNoise1.kr(8).range(0.01, 1)}).play(0,2);

/// scary reverb for anne (thanks rob)

Ndef(\anne, {GVerb.ar(PitchShift.ar(SoundIn.ar(3), 0.2, LFSaw.kr(1/4).range(6/5, 1)), 66, 6) * 1}).play(0,2); //<---- evil

/// atmo becomes bats:
Ndef(\n).fadeTime_(10);
Ndef(\n, {|rate=(1/4)| GVerb.ar(SinOsc.ar(["ab2".namecps, "c3".namecps, "c4".namecps(-30)]*LFPulse.kr(LFNoise0.kr(1).range(1, 4).round(1)).range(1, 1/2)), 34, 6)*0.005*LFPulse.kr(8).range(0.01, 1)}).play(0,2);


Ndef(\a, {LPF.ar(HPF.ar(WhiteNoise.ar(0.1), 80), 200)+SinOsc.ar("c#1".namecps, mul: 0.4)*LFPulse.kr(1)}).play(0,2); //  <--- zi0n loves c, so c# hhahahaha EVIL!

Ndef(\n).quant_(1);

// kick:

Tdef(\kick, {
	loop{
Ndef(\r, {SinOsc.ar(Line.kr(80, 50, 0.1), add: LPF.ar(WhiteNoise.ar(0.9), 550))*2*EnvGen.kr(Env.perc(0.001, 0.1))}).play(0,2);
		4.wait;
	}
}).play;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


Tdef(\kick, {
	loop{
Ndef(\r, {SinOsc.ar(Line.kr(580, 50, 0.1), add: LPF.ar(WhiteNoise.ar(0.9), 550))*1*EnvGen.kr(Env.perc(0.001, 0.1))}).play(0,2);
		(1/4).wait;
	}
}).play;



Ndef(\n, {|freq=100| Pulse.ar(freq, 0.3)*LFSaw.kr(1).range(0.1, 0.3) * 0.4}).play(3);
Ndef(\a, {|freq2=400| Pulse.ar(freq2, 0.3)*LFSaw.kr(2).range(0.1, 0.3) * 0.4}).play(4);
Ndef(\r, {|freq3=600| Pulse.ar(freq3, 0.3)*LFSaw.kr(1).range(0.1, 0.3) * 0.6}).play(3,2);


Ndef(\r).quant_(0);

Ndef(\an, {CombN.ar(PitchShift.ar(SoundIn.ar(3), 0.2, LFSaw.kr(1/3).range(4, 3/2)), 0.2, 0.2, 4)*1.3}).play(0,2);
// almost feed back...


Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["c2".namecps, "g4".namecps, "f4".namecps, "f#4".namecps]++["c2".namecps, "c2".namecps, "d2".namecps, "c2".namecps], inf), \delta, 1/4)}).stop;

Pdef(\b, {Pbind(\type, \set, \args, [\freq2, \freq3], \freq2, Pseq(["eb3".namecps, "g4".namecps, "g4".namecps], inf), \freq3, Pseq(["c1".namecps, "c2".namecps, "c3".namecps, "c4".namecps], inf), \delta, 1/2)}).stop;

Ndef(\a, {CombN.ar(LPF.ar(In.ar(3,2), 689), 0.2, 0.125, 3)}).play(0,2);
Ndef(\n).stop.clear;

Tdef(\kick, {
	loop{
Ndef(\r, {SinOsc.ar(Line.kr(80, 50, 0.5), add: LPF.ar(WhiteNoise.ar(0.9), 550))*0.4*EnvGen.kr(Env.perc(0.001, 0.5))}).play(0,2);
		(2).wait;
	}
}).play;

/// i like this one


t = TempoClock.default.tempo_(66/60);

Ndef(\o).fadeTime_(3);
Ndef(\o, {SinOsc.ar(LFTri.kr(t.tempo/2).range("c5".namecps, "c2".namecps)*0.02*LFPulse.kr(4))}).play(0,2);

Ndef(\o).stop(4);

/// special for zion cause he loves this:
Tdef(\d, {
	var rit = Pseq([1, 1, 1, 0.75, 0.25], inf).asStream;
	loop{
		Ndef(\d, {GVerb.ar(HPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1))), 66), 66, 66)}).play(0,2);
		(rit.next).wait;
	}
}).play;


Ndef(\anne, {CombN.ar(PitchShift.ar(SoundIn.ar(3), 0.2, LFPulse.kr(t.tempo).range(3/2, 1)), 1, t.tempo/4, 3)}).play(2);

Ndef(\an).stop(7);


Ndef(\o).quant_(4);

t.tempo_(10/60);

Tdef(\kick).stop;

//// i think Anne hates me now :(


//////////////////////// LITTLE PAUSE \\\\\\\\\\\\\\\\\\\\\\\

/// i start ....

t = TempoClock.default.tempo_(70/60);


Ndef(\n, {CombN.ar(SinOsc.ar("f3".namecps, mul: 0.3)*EnvGen.kr(Env.perc(0.1, 1).circle(t.tempo*2)), 0.5, 0.5, 4)}).play(0,2);


Tdef(\a, {
	loop{
Ndef(\a, {LPF.ar(Saw.ar("c1".namecps*Line.kr(1, 8, 4)), 2832)*LFPulse.kr(4).range(0, 0.1)*1*EnvGen.kr(Env.perc(0.3, 5))}).play(0,2);
		5.wait;
	}
}).play;

// inverse direction:
Tdef(\ai, {
	loop{
Ndef(\ai, {LPF.ar(Saw.ar("c1".namecps*Line.kr(8, 1, 14)), 2832)*LFPulse.kr(8).range(0, 0.1)*1*EnvGen.kr(Env.perc(0.3, 5))}).play(0,2);
		15.wait;
	}
}).play;


// more harmony:

Ndef(\n, {CombN.ar(SinOsc.ar(["f3".namecps, "c3".namecps, "ab3".namecps], mul: 0.3)*EnvGen.kr(Env.perc(0.1, 1).circle(t.tempo*8)), 0.5, 0.5, 8)}).play(0,2);


//// fx for piano:

Ndef(\an, {CombN.ar(PitchShift.ar(SoundIn.ar(3)*0.25, 0.2, LFPulse.kr(1/2, width: 0.1).range(1/2, 4))+FreeVerb.ar(SoundIn.ar(3), 0.4, 0.7), 0.25, 4)}).play(0.2);



All.stop;















