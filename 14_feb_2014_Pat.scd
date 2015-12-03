// January 22nd 2013 -> Dont use random frequencies! use harmionies (with changing arrays or patterns)
/// Feb 10th 2014

(
// channels 0-9 (num-> knob=12, fader=13)
~faders = MIDIFunc.cc({|val, num, chan, src|
	/*	[val, num, chan, src].postln;*/
	if (num==13){
		switch(chan,
			1, {~fade=val.linlin(0, 127, 0.1, 6.0);
				("fadeTime  "++~fade.value).postln;},
			3, {~num3=val.linlin(0, 127, 80, 2000.0);
				("num3  "++~num3.value).postln;},
			2, {~num2=val.linlin(0, 127, 0.1, 2.0);
				("num2  "++~num2.value).postln;},
			0, {~amp=val.linlin(0, 127, 0.001, 20.0);
				("amp  "++~amp.value).postln;
				if (x.isRunning) {x.set(\amp, ~amp.value)}}
		);
	};
	if (num==12) {
		switch(chan,
			2, {~ratio=val.linlin(0, 127, 1/2, 4/1);
				("ratio  "++~ratio.value).postln;
~mel = [70, 62, 89, 65, 65/2, 62]*~ratio*[1/3, 3/2];
~streamIt = Pseq(~mel, inf).asStream;
			}
			)
	};
});
);

// make a drumset

Ndef(\me_hi, {HPF.ar(FreeVerb.ar(Saw.ar([LFNoise1.kr([1, 1]).range("c1".namecps, "e1".namecps), LFNoise2.kr(1).range("c3".namecps, "b4".namecps)])*Impulse.ar([2.3, 1.9]), 0.9, 10) * LFNoise0.kr(0.5).range(10, 19), Line.kr(60, 7900, 14)) * Line.kr(0.01, 2, 10)}).play(0).fadeTime_(4);

Ndef(\me_hi, {FreeVerb.ar(Saw.ar([LFNoise1.kr([1, 1]).range("c1".namecps, "e1".namecps), LFNoise2.kr(1).range("c3".namecps, "b4".namecps)])*Impulse.ar([0.5, 0.5]), 0.9, 10) * LFNoise0.kr(0.5).range(5, 3)}).play(0).fadeTime_(4);

Ndef(\me_hi).stop(5);

Ndef(\me_noise, {Resonz.ar(BrownNoise.ar(Line.ar(0.3, 0.5, 4)) * LFPulse.kr(Line.kr([1, 3])), XLine.kr(120, 1600, 10), 0.01) * 4}).play.fadeTime_(10);

Tdef(\2, {
	100.do({
		Ndef(\me_noise, {BPF.ar(WhiteNoise.ar(0.9), LFNoise2.kr(0.2).range(700, 6700), 0.2)*EnvGen.kr(Env.perc(0.01, 0.1), doneAction: 2)}).play;
		([1, 0.5].choose).wait;})
}).play;

Tdef(\1, {
	100.do({
		Ndef(\me_noise1, {LPF.ar(BrownNoise.ar(0.9), 120)*EnvGen.kr(Env.perc(0.01, 0.1), doneAction: 2)}).play(1,1);
		([0.5, 0.25].choose).wait;})
}).play;


// anne
Ndef(\Ana, {var in = CombN.ar(FreeVerb.ar(SoundIn.ar(1, mul:1), 0.4, 1).distort, 0.2, 1, 1, 6); Out.ar([0,1], HPF.ar(PitchShift.ar(in, 0.2, [2/1, 7/9]), LFNoise1.ar(0.5).range(3800, 5900))* 2); }).play.fadeTime_(3);



Ndef(\me_noise).stop(2);

Ndef(\me_hi).stop(6);

Ndef(\me, {SinOsc.ar([Line.kr("eb2".namecps, "g3".namecps, 2), "d5".namecps], 0, 0.1) * Impulse.kr(LFNoise0.kr(0.8).range(1, 10)) * 2}).play.fadeTime_(5);

Tdef(\sines, {
	loop({Ndef(\me_sines, {FreeVerb.ar(SinOsc.ar([Line.kr("bb2".namecps, "g2".namecps, [1,2,3, 0.5].choose), "c3".namecps], 0, 0.1), 0.2, 0.3) * 7}).play.fadeTime_(0.4); 0.1.wait;})
}).stop;

Ndef(\me_sines).stop(6)

Ndef(\me).stop(4);

// bass drum
Tdef(\bass, {

	loop{Ndef(\me_bass, {RLPF.ar(Saw.ar([LFSaw.kr(5).range(100, 180), 60]*BrownNoise.ar(2))*Impulse.ar(LFNoise1.kr(10).range(1120.25, 2121)), 1612, 1)* 6}).play(0).fadeTime_(1);
1.wait;	}
}).stop;

Ndef(\me_bass).stop(4);

// bass drum
Tdef(\snare, {

	loop{
		Ndef(\me_snare, {FreeVerb.ar(Impulse.ar(LFTri.kr(20).range(0.1, 0.6)) * LFPulse.kr(2)) * 2}).play(0);
2.wait;	}
}).play;

~mel = [65, 62]; ~streamIt = Pseq(~mel, inf).asStream;

~mel2 = [110, 162]; ~streamIt2 = Pseq(~mel2, inf).asStream;

Ndef(\me).stop(8);
Ndef(\me_snare).stop(4);
Ndef(\me_bass).stop(4);


Ndef(\Ana, {var in= SoundIn.ar(1);
	var rev = FreeVerb.ar(in, room: 0.9);
	//rev = rev + WhiteNoise.ar(mul: SinOsc.kr(0.1, 0, 0.01, 0.1));
	Out.ar(rev, 0);
}).play;

s.sendMsg(\n_before, 1668, 163);