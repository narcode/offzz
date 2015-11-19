///////////////////////////////////////////////////
/////////// Doorkruising #2 Amsterdam Zaal100  ////
///////////////////////////////////////////////////

o = Server.default.options;
o.memSize_(8192 * 100);


///////////////////////////////////////////////////

Ndef(\n).fadeTime_(5);


// my sound:
Ndef(\n, {SinOsc.ar("B0".namecps)*LFPulse.kr(5).range(0.1, 0.6)*0.7}).play(0,2);


/// fx for anne:
Ndef(\anne, {GVerb.ar(SoundIn.ar(2), 123, 7) * 0.4}).play(0);

Ndef(\anne).stop(2);

// sound 2:

Ndef(\a).fadeTime_(5);

// routine:
Tdef(\a, {
	x = ["b2".namecps,"B2".namecps,"a2".namecps,"c2".namecps]*[3/2, 5/4];
	loop{
		Ndef(\a, {SinOsc.ar([x[0]*LFPulse.kr(2).range(1, 2), x[1], x[0]*LFSaw.kr(1).range(1, 2), x[0]*LFPulse.kr(4).range(2, 6)])*LFPulse.kr([1, 1]).range(0.1, 0.6)*0.4}).play(0,2);
		2.wait;
	}
}).play;

//// more for anne:

Ndef(\anne2).fadeTime_(2);
Ndef(\anne2, {CombN.ar(PitchShift.ar(SoundIn.ar(2), 0.2, [1/2, 3/2, 5/4]), 0.5, 0.25, 8) * 0.4}).play(0,2);


/// make my 1st sound more interesting:
Ndef(\n, {SinOsc.ar("B0".namecps)*LFPulse.kr(5).range(0.1, 0.6)+WhiteNoise.ar(LFPulse.kr(LFTri.kr(1).range(0.2, 1/8)))*0.1}).play(0,2);

Ndef(\n).stop(1);

Ndef(\a).stop(7);

Tdef(\a).stop;

Ndef(\anne2, {CombN.ar(PitchShift.ar(SoundIn.ar(2), 0.2, [1/2, 3/2, 5/4]), 0.5, 0.25, 8) * 2}).play(0,2);

Ndef(\anne).stop;

and
Ndef(\c, {SinOsc.ar("a0".namecps)*LFPulse.kr(2)*Line.kr(0.1, 1, 2)}).play(0,2);

Ndef(\a).stop(4);

Ndef(\c).stop(0.1);

"say -v vicki -r 80 thank you".unixCmd;
