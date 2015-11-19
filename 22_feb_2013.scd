// January 22nd 2013

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


Ndef(\me, {FreeVerb.ar(SinOsc.ar([LFNoise0.kr(0.01).range(220, 110), ~num3, 410/3], 0, 0.01), 0.5, 1)}).play(0, group: g).fadeTime_(7);

Ndef(\me).stop;


Ndef(\Ana, {var in= SoundIn.ar(0);
	var rev = FreeVerb.ar(in * Dust.ar(7, 0.6), room: 0.6);
	//rev = rev + WhiteNoise.ar(mul: SinOsc.kr(0.1, 0, 0.01, 0.1));
	Out.ar(rev, 0);
}).play(group:g);

s.sendMsg(\n_before, 1668, 163);