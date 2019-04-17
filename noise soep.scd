/////// Noise soup:

/// ititeder270@gmail.com
/// guizzardi.giulia@gmail.com (Berlin)


Ndef(\noise).fadeTime_(5);

////// i am just waiting for these guys...

// left chan
Ndef(\noise, {LPF.ar(WhiteNoise.ar(1), 123)*0.4}).stop(0,1);
// right chan

// lets do something more rhythmic like marijes melody

Ndef(\noise2, {LPF.ar(WhiteNoise.ar(1), LFTri.kr(LFPulse.kr(4).range(4, 8)).range(123, 567))*0.7}).stop(8);

/// i will make a bass:

// lets also make some hi noises...
(
Tdef(\h, {
	var rit = Pseq([1/2, 1/2, Pseq( [1/6], 4 ), 1/2, 1/2, Pseq([1/6], 4)], inf).asStream;
	loop{
		Ndef(\hi, {BPF.ar(WhiteNoise.ar(1), Rand( 8900, 9100) * [1,1.05])*EnvGen.kr(Env.perc(0.01,0.25))*0.1}).play(0,1);
		(rit.next * 2).wait;
	}

}).stop;
);

t = TempoClock.default;
t.tempo_(150/60);

(
Tdef(\m, {
	var rit = Pseq([1/2, 1/2, Pseq( [1/6], 4 ), 1/2, 1/2, Pseq([1/6], 4)], inf).asStream;
	loop{
		Ndef(\hi, {BPF.ar(WhiteNoise.ar(1), Rand( 890, 910) * [1,1.05], 0.1)*EnvGen.kr(Env.perc(0.01,0.25))*0.1}).play(0,1);
		(rit.next * 2).wait;
	}

}).stop;
)

(
Tdef(\b, {
	loop{
		Ndef(\bass, {Saw.ar([100*LFTri.kr(1/5
		).range(1, 1/2), 102*LFTri.kr(1/7).range(1, 1)]*Line.kr(1, 0.7, 1))*EnvGen.kr(Env.perc(0.01, 40))*0.2
		}).play(0,1);
		1.wait;
}
}).stop;
);

(
Tdef(\b2, {
	1.do{
		Ndef(\bass2, {Saw.ar([80*LFTri.kr(1/5
		).range(1, 1/2), 132*LFTri.kr(1/7).range(1, 1)]*Line.kr(1, 0.7, 1))*EnvGen.kr(Env.perc(0.01, 20))*0.2
		}).play(1,1);
		20.wait;
}
}).stop;
);



"say -v vi -r 123 maybe u want to finish too?".unixCmd;

// and i am bored of my noise so lets change it.



