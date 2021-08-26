//////////////////////////////// OFF<>ZZ \\\\\\\\\\\\\\\\\\\\
//////////////////////////////               \\\\\\\\\\\\\\\
///////////// LIVE CODING CONCERT in SuperCollider \\\\\\\\\\
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
///////piano//////and//////code///////////////////////////////////////
////////////////////////////////////////////// STEIM, Amsterdam |||||
////////////////////////////////// 6 Nov 2015 ///////////////////
//////////////////////////////////////////////////////////////


/// whistle
Ndef(\a, {SinOsc.ar(1234)*LFPulse.kr(1)*0.01}).play(0,2);


/// whistle v2 : add 'air'
Ndef(\a).fadeTime_(4);

/// developing the sound:
Ndef(\a, {|freq=467|SinOsc.ar(freq, add: LPF.ar(WhiteNoise.ar(0.3), 579)*EnvGen.kr(Env.perc(0.01, 1).circle(3)))*LFPulse.kr(LFTri.kr(1/4).range(1, 4))*0.07}).play(0,2);


//// ANNE PLAY!!!

//// air noise didnt work. :(

/// try again,m with a sub-sound

Ndef(\b, {LPF.ar(WhiteNoise.ar(0.1), LFTri.kr(100, 345))*LFTri.kr(1/4).range(0.01, 0.02)}).play(0,2)

Ndef(\b).stop;

/// hardcore

// again?????


///mmmmmm weird.

Ndef(\b, {});

/// focus on music for a bit. Then back to air sound:

/// developing the sound:
Ndef(\a, {|freq=467|SinOsc.ar(freq, add: LPF.ar(WhiteNoise.ar(0.3), 579)*EnvGen.kr(Env.perc(0.01, 1).circle(1)))*LFPulse.kr(LFPulse.kr(2).range(1, 4))*0.07}).play(0,2);

// routine for freq:

Ndef(\a, {|freq=100| SinOsc.ar(freq)*LFPulse.kr(4, width: 0.1)*0.3}).play(0,2)

Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["c2".namecps, "f2".namecps, "g2".namecps], inf), \delta, 1/4)}).play;

//// another layer cause i like thisthaks

Ndef(\c, {|freq2=467|SinOsc.ar(freq2)*LFPulse.kr(1, width: 0.1)*0.1}).play(0,2);

Pdef(\b, {Pbind(\type, \set, \args, [\freq2], \freq2, Pseq(["c1".namecps, "f2".namecps], inf), \delta, 1)}).play;


Ndef(\c).stop;



/// fx for anne:

/// ideas for effect????

// delay it is: feed back for sure

Ndef(\anne, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [1, 3/2, 5/4]), 0.2, 0.2, 2)*0.8}).play(0,2);

//// ok

/// back to... air?. yes


// now back to air



/// PLEASE WORK!  :D

/// yes. now i can make a routine:

Tdef(\air, {
	loop{
		Ndef(\o, {LPF.ar(WhiteNoise.ar(0.1), Line.kr(30, 6789, 1))*EnvGen.kr(Env.perc(0.2, 10))*0.4}).play(0,2);
	10.wait;
	}
}).play;

Tdef(\air).stop;

Ndef(\o).quant_(0);

//// this sound is boring now:
Ndef(\a, {|freq=100| FreeVerb.ar((SinOsc.ar(freq*LFSaw.kr(1/4).range(1, 8))+WhiteNoise.ar(0.1)*LFPulse.kr(2).range(1, 6))*LFPulse.kr(4, width: 0.1).range(0, 0.2)*0.3, 0.7, 0.7)*0.1}).play(0,2)



Ndef(\o, {LPF.ar(WhiteNoise.ar(0.1), Line.kr(30, 6789, 1))*EnvGen.kr(Env.perc(0.2, 30))*0.4}).play(0,2);


///// thanks
















