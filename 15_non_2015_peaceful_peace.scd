//////// a peaceful piece

//////
//
///
/////
///
///////
//
/////  -------> Bb-Ab-D-G-G

t.tempo_(50/60);

/////// my sound:


Ndef(\a).quant_(1);
Ndef(\n, {SinOsc.ar("Bb1".namecps)*0.2*LFPulse.kr(t.tempo*2)}).play(0,2);

///// sound 2

Ndef(\a, {SinOsc.ar("G1".namecps)*0.2*LFPulse.kr(t.tempo*2)}).play(0,2);

// sound 3

Ndef(\r, {SinOsc.ar("D1".namecps)*0.2*LFPulse.kr(t.tempo)}).play(0,2);

// sound 4
Ndef(\o).quant_(0);
// routine:
Tdef(\r, {
	loop{
		Ndef(\r, {SinOsc.ar("Ab2".namecps)*0.2*LFPulse.kr(t.tempo, width: LFNoise1.kr(1).range(0.1, 0.6))}).play(0,2);
		0.5.wait;
Ndef(\a, {SinOsc.ar("D2".namecps)*0.2*LFPulse.kr(t.tempo, width:0.2)}).play(0,2);
		0.75.wait;
Ndef(\r, {SinOsc.ar("G2".namecps)*0.2*LFPulse.kr(t.tempo, width:0.6)}).play(0,2);
		0.25.wait;
Ndef(\c, {SinOsc.ar("G1".namecps)*0.2*LFPulse.kr(t.tempo, width:0.2)}).play(0,2);
		0.5.wait;
Ndef(\o, {SinOsc.ar("Bb2".namecps)*0.2*LFPulse.kr(t.tempo,width:0.2)}).play(0,2);
	}
}).play;

t.tempo_(165/60);

// later: routine to make the tempo slower:
Tdef(\slower,

t.tempo_(180/60);

Ndef(\n).stop(6);


/// fx for anne ->
/// RIPPLES for concierge:
Ndef(\anne, {GVerb.ar(SoundIn.ar(0, 0.5)+PitchShift.ar(SoundIn.ar(0, 0.2), 0.1, LFPulse.kr(t.tempo*1).range(2, LFPulse.kr(t.tempo*4).range(1.5, 3))), 99, 6)*0.54}).play(0,2);

/// some percussion:

Tdef(\d, {
		loop{
			0.5.wait;
	Ndef(\d, {|rate=2|LPF.ar(WhiteNoise.ar(0.6)*LFPulse.kr(t.tempo*rate), LFTri.kr(t.tempo).range(120, 1234))}).play(0,2);
			0.5.wait;
	Ndef(\d, {|rate=8|LPF.ar(WhiteNoise.ar(0.6)*LFPulse.kr(t.tempo*rate), LFTri.kr(t.tempo).range(120, 1234))}).play(0,2);
//			0.5.wait;
//			2.5.wait;
		}
	}).play;

	Ndef(\d).quant_(0);


	//// to end: /// buuuu! this didnt work :(
	(
		t.tempo_(10/60);
		Ndef(\d).stop;

	);


//// this is my harmony:
	Tdef(\r, {
	loop{
			Ndef(\r, {SinOsc.ar("Ab2".namecps)*0.2*LFPulse.kr(t.tempo, width: LFNoise1.kr(1).range(0.1, 0.6))*EnvGen.kr(Env.perc(0.1, 2))}).play(6,2);
		0.5.wait;
			Ndef(\a, {SinOsc.ar("D2".namecps)*0.2*LFPulse.kr(t.tempo, width:0.2)*EnvGen.kr(Env.perc(0.1, 2))}).play(6,2);
		0.75.wait;
			Ndef(\r, {SinOsc.ar("G2".namecps)*0.2*LFPulse.kr(t.tempo, width:0.6)*EnvGen.kr(Env.perc(0.1, 2))}).play(6,2);
		0.25.wait;
			Ndef(\c, {SinOsc.ar("G1".namecps)*0.2*LFPulse.kr(t.tempo, width:0.2)*EnvGen.kr(Env.perc(0.1, 2))}).play(6,2);
		0.5.wait;
Ndef(\o, {SinOsc.ar("Bb2".namecps)*0.2*LFPulse.kr(t.tempo,width:0.2)*EnvGen.kr(Env.perc(0.1, 2))}).play(6,2);
	}
}).play;
	///////////// error ----------------------------->

	Ndef(\reverb, {GVerb.ar(In.ar(6,2), 123, Line.kr(10, 99, 10))*0.1}).play(0,2);

			Tdef(\r).stop;


	Ndef(\d).stop(10);

	Ndef(\anne).stop(1);

	