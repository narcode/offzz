///////////////////////
/////// Off<>zz
////////
///// Winter special: LEGO kicked our ass with a 'spectral acousmatic' challenge
/////////
//////////



can u hear the Piano?

"say -v vicki -r 218 bob rob are u sleeping?".unixCmd


///// nothingness ---> MEXICAN FIGHTING MUSIC!

/// this sound = sunset arriving slowly....
Ndef(\n).fadeTime_(4);

Ndef(\n, {|freq=100| SinOsc.ar(["f2".namecps, freq*LFTri.kr(3).range(1, 2)]) * LFNoise1.kr(7).range(0, 0.2)}).play(0,2);


//// pistoleros arriving....

Ndef(\a, {LPF.ar(WhiteNoise.ar(Line.kr(0.2, 0.8, 4)), LFNoise1.kr(3).range(100, 2500))*LFPulse.kr(2)}).play(0,2);

Ndef(\a).stop(1);

Ndef(\n).quant_(1);
//// gunshot #1

// routine:

/// make this a cooler rhythm:
Tdef(\a, {
	x = Pseq([1,2,0.75, 0.25], inf).asStream;
	loop{
		Ndef(\r, {GVerb.ar((SinOsc.ar(123*Line.kr(1, 2, 1))+WhiteNoise.ar)*EnvGen.kr(Env.perc(0.01, 0.3)), [123, 11, 78].choose, 2)}).play(0,2);
		(x.next).wait;
	}
}).play;

/// circling vultures.... actually diving in:

Ndef(\vultures, {|rit=9| BPF.ar(Saw.ar(["b3".namecps, "c2".namecps]*LFPulse.kr(t.tempo*6).range(1/2, 1/8)*LFSaw.kr(t.tempo).range(2,1), 0.6), 1988)*LFPulse.kr(t.tempo*rit).range(0.1, 1)}).play(0,2);

//// vulture frenzy:

Pdef(\a, {Pbind(\type, \set, \args, [\rit], \rit, Pseq([9, 4, 2]/2, inf), \delta, 1/2)}).play;

Ndef(\n).stop(5);
Ndef(\vultures).quant_(1);

Tdef(\a).stop;

Ndef(\vultures).fadeTime_(1);

///// mexican effect for anne:

Ndef(\anne, {CombN.ar(PitchShift.ar(SoundIn.ar(0)*2, 0.2, [1, 3/2, 5/4]), 0.5, 0.25, 3)*2}).play(0,2);



t = TempoClock.default.tempo_(74/60);


///// last section:
Ndef(\c).fadeTime_(0);
Ndef(\c).play;
Ndef(\c, {LPF.ar(WhiteNoise.ar(1)*Saw.ar(80), 1966)+SinOsc.ar([80, 100, 120]*LFSaw.kr(t.tempo, 0.8, 0.7))*LFPulse.kr(t.tempo*3)}).play(0,2);

////////////////////////////////////////////
//////////////////////
///////////////////
////////////
///////////////////////////// SPECTRAL ACOUSMATIC
////////////////////////
//////////////////////////


"say -v alex -r 98 ready anne?".unixCmd


//// spectral this:
Ndef(\a).play.fadeTime_(7);
Ndef(\a).stop(4);

// spectralizing anne:

Ndef(\a, {GVerb.ar(PitchShift.ar(SoundIn.ar(0)*2*LFPulse.kr(4, width:0.1), 0.2, LFNoise1.kr(1/2).range(1, 1.3)), [13, 11], 9)*0.01}).play(0,2);


/// spectralists love bells:
Ndef(\n).fadeTime_(0);

Tdef(\a, {
	var ratio = Prand([1, 3/2, 2, 9/8, 6/5, 5/4], inf).asStream;
	loop{
		Ndef(\n, {CombN.ar(LFSaw.kr(1/4).range(4, 1/4)*SinOsc.ar(ratio*["eb3".namecps, "a1".namecps], mul: LFSaw.kr(8))*0.8, 0.2, 0.2, 8)}).play(2,2);
		(1/20).wait;
	}
}).play;

/// layer 2
Tdef(\b, {
	var ratio = Prand([1, 3/2, 2, 9/8, 6/5, 5/4]*3/2, inf).asStream;
	loop{
		Ndef(\a, {CombN.ar(SinOsc.ar(ratio*["d2".namecps, "e1".namecps], mul: LFSaw.kr(3))*0.8, 0.2, 0.2, 8)}).play(2,2);
		(1/10).wait;
	}
}).play;

/// layer 3
Tdef(\c, {
	var ratio = Prand([1, 3/2, 2, 9/8, 6/5, 5/4]*2, inf).asStream;
	loop{
		Ndef(\r, {CombN.ar(SinOsc.ar(ratio*["g2".namecps, "b1".namecps]*2, mul: LFSaw.kr(3))*0.8, 0.2, 0.2, 8)}).play(2,2);
		(1/1).wait;
	}
}).play;




Ndef(\del, {CombN.ar(In.ar(2,2)*LFNoise0.kr(1).range(1,0), 1, 0.4, 5)*0.7}).play(0);

Ndef(\n).clear;

/// checkout:  iancu dumitrescu | ana maria avram | horatiu radulescu?

t = TempoClock.default.tempo_(10/60);



????? --------------------------------------------------------------------->>>


