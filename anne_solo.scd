// start
g = Group.head(s);

Ndef(\Ana).play.fadeTime_(6);
Ndef(\in).play(addAction: \addToHead).fadeTime_(6);
~ampA=1;

// End

Ndef(\Ana).clear;
Ndef(\in).clear;


Ndef(\Ana).stop(6);

Ndef(\in).stop(10);

// Effect chain

// Differents fx snippets
Ndef(\Ana, {var in = CombN.ar(FreeVerb.ar(SoundIn.ar(1, mul:1), 0.4, 1).distort, 0.2, 1, 1, 6); Out.ar([0,1]+2, in* 0.5); }).play.fadeTime_(3);

Ndef(\Ana, {var in = Resonz.ar(FreeVerb.ar(SoundIn.ar(1, mul:1), 0.3, 1), ["a4".namecps, "g4".namecps], 1); Out.ar([0,1]+2, in* 0.8); }).play;


Ndef(\Ana0, {var in = CombC.ar(Resonz.ar(FreeVerb.ar(PitchShift.ar(SoundIn.ar(0, mul:1), 0.1, [5/4/4, 3/2/2]), 0.3, 1), "g5".namecps, 1), 2, 0.5, 2); Out.ar([0,1], in* 0.5); }).play;

Ndef(\in, { ~in = FreeVerb.ar(SoundIn.ar(0, mul:1), 0.7, 2); Out.ar([0,1], ~in* ~ampA);}).play;


// Distortion
Ndef(\Ana, {var in= SoundIn.ar(1);
	var fx = FreeVerb.ar(in.squared, room:0.1, mix: 0.9);
    fx = fx.clip2(0.001)*55;
	fx = CombC.ar(fx, 1, LFNoise2.kr(0.1).range(0.1, 0.5), 2);
	Out.ar(2, fx*2);
	});

// impro distor
Ndef(\Ana, {var in= SoundIn.ar(1, mul:1);
	var fx, fx2, fx3, out;
	fx = FreeVerb.ar(in.squared, room:0.1, mix: 0.4);
    fx = fx.clip2(0.001)*15;
	fx2 = CombL.ar(fx, 1.0, 0.1, 1).squared;
	fx3 = Pan2.ar(Mix([fx, fx2]), LFSaw.kr(3));
//	out = RLPF.ar(out, LFNoise0.kr(5).range(80, 170), 0.01);
//	out = CombC.ar(out, 0.5, 0.01, 6);
	Out.ar(2, fx3*12);
	});


// bassy ------> cool for intro
Ndef(\Ana, {var in= SoundIn.ar(1, mul:1);
	var fx, fx2, fx3, out;
	fx = FreeVerb.ar(in.squared, room:0.1, mix: 0.2);
    fx = fx.clip2(0.001)*15;
	fx2 = CombL.ar(fx, 1.0, 0.1, 1).squared;
	fx3 = Splay.ar([fx, fx2]);
	out = fx3+fx;
	out = RLPF.ar(out, LFNoise0.kr(2).range(380, 170), 0.01);
	out = CombC.ar(out, 0.5, 0.01, 6);
	Out.ar(2, out*0.3);
	});


// reverb 2 & keystrokes
Ndef(\fel, {var in= SoundIn.ar(0);
	in = GVerb.ar(in, 10, 3) ring1: (SinOsc.ar(Demand.kr(Impulse.kr(1), 0, Dseq(["c4".namecps,"eb5".namecps], inf))) * LFPulse.kr(1));
	Out.ar([0, 1]+2, in*4);
	});


// panning
Ndef(\Ana, {var in= SoundIn.ar(1);
	//rev = rev + WhiteNoise.ar(mul: SinOsc.kr(0.1, 0, 0.01, 0.1));
	Pan2.ar(in, LFNoise1.kr(1).range(-1, 1), LFNoise2.kr(5).range(0.1, 1.5))*0.3;
}).play(2,2);

Ndef(\Ana, {var in= SoundIn.ar(0);
	var rev = FreeVerb.ar(in, 0.9, room: 0.8);
	Pan4.ar(rev, LFNoise1.kr(1).range(-1, 1), LFNoise1.kr(5).range(-1, 1)) * 1;
}).play(2,2);


// beautiful face
Ndef(\Ana, {var in= SoundIn.ar(0, mul:1);
	var fx, fx_d;
	fx = FreeVerb.ar(in, room:0.9, mix: 0.6);
	fx = PitchShifter.ar(fx, [2/1, 3/2, 5/4]); // increase nodes
	fx_d = CombC.ar(fx, 0.3, 0.25, 1, 6);
//	fx = RHPF.ar(fx, 1600);
	Out.ar(2, (fx+fx_d)*1);
}).play(2,2).fadeTime_(6);

Ndef(\Aneb).stop(2);
Ndef(\ane).stop(3);