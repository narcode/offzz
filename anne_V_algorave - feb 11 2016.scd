/////////////////////////////////////
/////// Anne Veinberg algorave  /////
/////////////////////////////////////

MIDIIn.connectAll;

~array = ();
~amp = 0.3;

MIDIdef.noteOn(\all, {|vel, note|
//	vel.postln;
	~array[note] = note;
	~array.postln;
	Ndef(\a, {Saw.ar(~array.values.midicps*LFSaw.kr(1/2).range(1, 2))*~amp*LFPulse.kr(4).range(0,1)}).play(1,1);
	Ndef(\b, {Saw.ar(~array.values.midicps*LFPulse.kr(4).range(2, 3))*~amp*LFPulse.kr(10).range(0,1)}).play(0,1);
if (note.odd)	{Ndef(\c, {BPF.ar(WhiteNoise.ar(3)*EnvGen.kr(Env.perc(0, 0.5)), LFNoise0.kr(2).range(1123, 8567), 0.5)}).play(0,2);};
});

MIDIdef.noteOff(\alloff, {|vel, note|
	~array = ();
	note.postln;
	Ndef(\a).stop(0); "off".postln; Ndef(\b).stop(1);
});

Ndef(\a).quant_(0);
s.latency=0;

Ndef(\delay, {CombN.ar(SoundIn.ar(0), 0.4, 0.4, 2)*0.1}).play(0,2)

Ndef(\delay).clear;

Ndef(\o).stop;

s.sendMsg(\n_free, 4110);

////////////////////
////////////////////////
////////////////////////////
/////////////////////////////////

~amp = 1.2;

MIDIdef.noteOn(\all, {|vel, note|
		~array[note] = note;
	~array.postln;
	Ndef(\a, {FreeVerb.ar(SinOsc.ar(~array.values.midicps*[1, 1/2, 1/4, 3/2]*[2, 1])*[~amp, ~amp, ~amp, 0.2], 1, 0.9).distort}).play(0,2);
	Ndef(\b, {Saw.ar((vel).midicps)*(0.1)*LFTri.kr(1).range(1,1)}).play(0,2);
});

Tdef(\a).quant;

/////////////////
/////////
/////////////////




