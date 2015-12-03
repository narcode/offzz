/// Online. POLYPHONY *** because of conncert next week. We will stream it live ******

// ready anne?

Ndef(\n).fadeTime_(4);

// my sound -> N
Ndef(\n, {SinOsc.ar(["a1".namecps, "a1".namecps]*LFSaw.kr(4).range(1, 1/2))*0.07}).play(0,2);

// fx for the piano -> a delay because ... mmm/// polyphony?:
Ndef(\piano, {CombN.ar(SoundIn.ar(2), 10, [1.5], 4)*1.4}).play(0,2);
// delay 2
Ndef(\piano2, {CombN.ar(SoundIn.ar(2), 3, [0.85, 3], 1)*1.4}).play(0,2);

// had to clear because of that ------------------------------>
Ndef(\piano2).clear;

// second sound i play:
Ndef(\a).fadeTime_(2); // <--- cross fade changes in sound '\a'

Ndef(\a, {|ratio=2| SinOsc.ar((["b1".namecps, "b1".namecps*(3*ratio)/2, "b1".namecps*ratio]*LFSaw.kr(1/2).range(1, 2.5) * LFTri.kr(3).range(0, 0.07).lag(0.2)}).play(0,2); // debuggig while anne plays :( ----->

Ndef(\n).quant_(0);

// pattern to change ratio for sound '/a'

Pdef(\a, {Pbind(\type, \set, \args, [\ratio], \ratio, Prand([2, 3, 1], inf), \delta, 2)}).play;




	////// crashed it ----------------------------------------> :(


delays are expensive


	/////


LETS DO METAL!!!!


	//// METAL METAL METAL FOR CEXY AND ROB


	t= TempoClock.default.tempo_(140/60); // <-- as to fast for Anne

	// pan:
	Tdef(\a, {
		var pan = Pseq([0,1], inf).asStream;
		loop{
	Ndef(\a, {|rate=2|WhiteNoise.kr(LFPulse.kr(4).range(0, 0.1))+Saw.ar([110, 100]*LFPulse.kr(4).range(1, 3/2), 0.03)*SinOsc.ar(["f1".namecps], mul: 1.5) * 2 * LFPulse.kr(rate)}).play(pan);
			2.wait;
		}
	}).play;

	Ndef(\a).quant_(0);

	Ndef(\n).fadeTime_(7);
	Ndef(\n, {|ratio=1| SinOsc.ar(["f1".namecps, "c2".namecps]*1.5*[ratio, ratio/2], mul: 1) * 0.1 * LFPulse.kr(t.tempo*4)}).play;

	Ndef(\n).quant_(1);

	Ndef(\piano, {GVerb.ar((SoundIn.ar(2)+LPF.ar(WhiteNoise.ar(Amplitude.kr(SoundIn.ar(2)>0.5))))*LFPulse.kr(1), 123, 6)*1}).play(0,2)

	Ndef(\r, {CombN.ar(PitchShift.ar(SoundIn.ar(2)*LFPulse.kr(LFPulse.kr(1/2).range(1, 4).range(1, 4)), 0.2, [1/2, 3/2]), 1, 0.15, 15)*1}).play(0,2);


	Pdef(\n, {Pbind(\type, \set, \args, [\rate], \rate, Pseq([4, 2, 4, 4], inf), \delta, 1)}).play;



	// rplacing sound n

	Ndef(\n, {WhiteNoise.kr*LFPulse.kr(t.tempo*4)*1}).play(0,2);
	Ndef(\n).quant_(1);


	// making this routine scary:

		Tdef(\a, {
		var pan = Pseq([0,1], inf).asStream;
		loop{
			Ndef(\a, {|rate=2|WhiteNoise.kr(0.5)+Saw.ar([110, 100])+SinOsc.ar(["f2".namecps]*LFSaw.kr(1/2).range(1, 4), mul: 1.5) * 0.2 * LFPulse.kr(rate)}).play(pan);
			(4).wait;
		}
	}).play;


	"say -v vicki -r 323 thanks for tuning in".unixCmd;

<---- :(






		