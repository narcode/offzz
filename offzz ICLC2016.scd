-----> www.anneveinberg.com/webtimer

//// ok here we go.

///// ok then a simple noise beat

/// no time to code it now

// where is my sound? big font doesnt help

// again

/// super slow reactions. oops. not good.
// lets try to move on, potherwise i kill my routines


Ndef(\a, {WhiteNoise.ar(0.1)*0.2*LFPulse.kr(LFPulse.kr(1, width:0.2).range(4, 2))}).play(1,1).quant(1);

/// sure comment...
// i wasnt ready there


//// fx for anne:
/// drone soon give me a sec... overwhelming comments

Ndef(\an).fadeTime_(3);
Ndef(\an, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [1/2, 3/2, 5/6]*LFPulse.kr(2).range(3, 1/2)), 0.2, 0.2, 4)*0.4}).play(0,2);

// lets make a 2nd fx for anne in the meantime...

Ndef(\ane, {CombN.ar(SinOsc.ar("g1".namecps*LFTri.kr(1/2).range(1, 4))*LFPulse.kr(LFTri.kr(1/2).range(1, 8), width: 0.1)*SoundIn.ar(0), 0.2, 0.1, 3)*0.2}).play(0,2)

Ndef(\a).stop;
/// DRONE! --> i couldnt hear my drone... so its not really a drone
Tdef(\a, {
	var rit = Pseq([1, 1, 1/2, 1/2, 1.5, 1/2], inf).asStream;
	loop{
Ndef(\foxy_juan, {SinOsc.ar("g1".namecps*Line.kr(2, 1/2, 1))*EnvGen.kr(Env.perc(0.1, 2))*0.4}).play(0,2);
		(rit.next).wait;
	}
}).stop;

// i hate that one

// i think anne doesnt want to stop/... so we move on

Ndef(\foxy_juan, {SinOsc.ar(["g1".namecps, "g1".namecps(30), "b1".namecps]*LFPulse.kr(4)*Line.kr(1, 1, 1))*EnvGen.kr(Env.perc(4, 40))*0.05}).play(0,2).quant_(1);

/// lets see if we can do something better here... althiugh i like it already...

/// mmmm

Ndef(\an, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [1/2, 3/2, 5/6]*LFTri.kr(1/8).range(4, 1/2)), 0.2, 0.2, 4)*Line.kr(0.4, 0, 40)}).play(0,2);




//
/// ok now i can check comments...
/// max 120?































