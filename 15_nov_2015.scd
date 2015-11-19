//// Off<>zz 13 November 2015!

///// Anne directs the session :(



// tempo:
t = TempoClock.default.tempo_(88/60);

/// excercis 1: Phasing

//// pitches from chatbox -> Bb-G-D-B-F

//// my sound 1:

Ndef(\a).fadeTime_(1);
Ndef(\a).quant_(1);

// clean sound so Anne doesnt smash the laptop on my face:
Ndef(\a, {|freq=116, freq2=116| FreeVerb.ar(BPF.ar(SinOsc.ar([freq, freq2]),600, 0.8)*0.9, 0.7, 0.3)}).play(0,2);

"say -v vicki -r 50 there is a troll in the room".unixCmd;


//// the pattern of pitches:
t.sched(4, {
	Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["Bb1".namecps, "G2".namecps, "D2".namecps, "B2".namecps, "F1".namecps]*2, inf), \delta, Pxrand([0.6, 0.4, 1, 0.2, 0.4, 0.4]*0.9, inf))}).play; });


//// sound 2:
Ndef(\b).quant_(1);
Ndef(\b, {|freq2=116| GVerb.ar(BPF.ar(Saw.ar([freq2, freq2*2]),LFTri.kr(t.tempo).range(100, 1000), 0.4)*0.2, 45, 1)}).play(1);

Ndef(\b).fadeTime_(4);

/// patter 2 to shift:
t.sched(4, {
	Pdef(\b, {Pbind(\type, \set, \args, [\freq2], \freq2, Pseq(["Bb2".namecps, "G1".namecps, "D1".namecps, "B1".namecps, "F2".namecps]*2, inf), \delta, Pseq([1/2, 0.75, 0.25, 1/2, 2], inf))}).play;
});

/// fx for Anne???
Ndef(\anne).fadeTime_(4);
Ndef(\anne, {CombN.ar(SoundIn.ar(0)+HPF.ar(WhiteNoise.ar(Amplitude.kr(SoundIn.ar(0)>0.3)), LFTri.kr(t.tempo).range(1234, 5678)*LFTri.kr(t.tempo*1).range(0, 1)), 0.2, 1, 4)*0.1}).play(0,2);

Ndef(\a).stop;