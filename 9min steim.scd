//////////
['felipe', 'casper', 'narcode', 'marije', 'monique'].scramble;

/// order
[ narcode, monique, casper, marije, felipe ];

/////
/// first a sound... any sound... uff

// ok first try is there. nostress.

// lets pump it up
Ndef(\a).fadeTime_(4);
// lets develope the sounds. otherwise boring right?
Ndef(\n, {SinOsc.ar("c2".namecps*LFPulse.kr(3).range(1, 1.5))*LFNoise1.kr(4).range(0.01, 0.1)*0.8}).play(1,1);

// a second sound (based on the 1st one of course):
// thjis is too high...

// develop this:
Ndef(\a, {Saw.ar("eb2".namecps*LFSaw.kr(8).range(1/4, 4*LFPulse.kr(1/4).range(1/4,4 )))*LFPulse.kr(4).range(0.01, 0.1)*0.5}).play(0,2);

// oh the sweep is weird. maybe not. the lows are cool though

/// ok this is ok. Lets do some words.

n = "steim connector series";
"narcode".setenv(n);

// in a routine:
/// develop the words of course...
(
i = 0;
Tdef(\thanksMarije, {
	loop{
		i = i+1;
		n = n.rotate(i);
		n.postln;
		"narcode".setenv(n); // why have to reset the var!
"say -v tri -r 123 $narcode".unixCmd;
		4.wait;
	}
}).play;
);

/// ok the voice is not moving. duh!

/// YES! now the werid electronics are too dizzy.









/// n is not nul!
/// ok why is my var not workin???










