/// off<>z3

t = TempoClock.default;
t.tempo=120/60;

Ndef(\b).fadeTime_(8);

Ndef(\a, {|freq=98, rate=0.5| LPF.ar(PinkNoise.ar(3) * SinOsc.ar([freq, freq/2],0, LFTri.kr(7).range(0.1, 0.3)), LFNoise1.ar(1).range(80, 400))*2*EnvGen.kr(Env.perc(0.1, 0.1).circle(t.tempo.reciprocal), doneAction: 2)}).play(0,1).quant_(1);

Ndef(\b, {|freq0=98, freq=98| LPF.ar(Saw.ar([freq0, freq*4/3].lag(0.1), LFTri.kr(1).range(0.1, 0.3)), LFNoise1.ar(0).range(80, 120))*LFPulse.kr(t.tempo*8).range(0.5, 2)}).play(0).quant_(1);

Ndef(\b2, {|freq0=98, freq=98| LPF.ar(Saw.ar([freq0, freq*4/3].lag(0.1), LFTri.kr(1).range(0.1, 0.3)), LFNoise1.ar(0).range(80, 120))*LFPulse.kr(t.tempo*2).range(0.5, 2)}).play(0).quant_(1);


Ndef(\a, {|freq2=301| Pan2.ar(Mix([LPF.ar(Saw.ar([freq2*3/2, freq2], LFTri.kr(t.tempo*1/3).range(0.1, 0.6)), LFNoise1.ar(0).range(80, 120))*LFPulse.kr(t.tempo*4).range(0.1, 2)]), LFPulse.kr(t.tempo).range(-1, 1))*Line.kr(0, 6, 18, doneAction:2)}).play().quant_(1);


Ndef(\a, {|freq=198| Pan2.ar(Mix([LPF.ar(Saw.ar([freq*3/2, freq], LFTri.kr(t.tempo*1/3).range(0.1, 0.6)), LFNoise1.ar(0).range(80, 120))*LFPulse.kr(t.tempo*1/6).range(0.1, 2)]), LFPulse.kr(t.tempo).range(-1, 1))*Line.kr(0, 4, 10)}).play().quant_(1);


Pdef(\a, {Pbind(\type, \set, \args, [\freq0, \freq], \freq0, Pseq(["c1".namecps, \a3.namecps]*1, inf), \delta, 1/2)}).play;

Pdef(\b, {Pbind(\type, \set, \args, [\freq2], \freq2, Pseq(["c3".namecps, "g3".namecps, "g2".namecps]*6/3, inf), \delta, 1/4)}).play.quant_(4);

Ndef(\c, {BPF.ar(PinkNoise.ar(1), LFNoise1.ar(8).range(480, 6100), 0.2, 0.3)*EnvGen.kr(Env.perc(0.01, 0.1).circle(4), doneAction: 2)}).play(4,2).quant_(1);

Ndef(\fx, {Pan2.ar(CombN.ar(In.ar(4,1), 0.2, 1/2, 4), LFNoise0.kr(1).range(-1, 1)) * 4}).play.quant_(1);


Ndef(\c, {BPF.ar(SinOsc.ar(["c1".namecps, "g1".namecps], 0, LFTri.ar(8).range(0.01, 1)).tanh, 440, 0.3)*Line.kr(0, 1, 2)}).play(0,2).quant_(1);

Ndef(\c).stop(4)

Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["g#2".namecps,"e2".namecps, "e1".namecps]*4, inf), \delta, Pseq([1/2, 1/8], inf))}).play;


Ndef(\b).stop(4);
////

Ndef(\an).fadeTime_(4);

Ndef(\an, {|rate=4|
	var in, fx, fx2;
	//in = PitchShift.ar(SoundIn.ar(0, 1), 0.2, [1/2, 4/3])*0.5;
	in = SoundIn.ar(0);
	fx2 = CombC.ar(in, 0.2, 0.5, 6, 0.05)*0.2;
	fx = GVerb.ar(in, 10, 4, 0.5).distort;
	fx = HPF.ar(fx, 4500) * LFPulse.kr(t.tempo*2).range(0.5, 1);
	fx2 = HPF.ar(fx2, 80);
	fx = LPF.ar([fx,fx2], LFTri.kr(1/4).range(100, 600));
	Out.ar(2, fx*20);
}).play(2,2).quant_(1);

/// END
f = TempoClock.tempo_(1);

f.tempo;

f.sched(1, {Ndef(\end, {ReplaceOut.ar([0,2], GVerb.ar(HPF.ar(In.ar(0,4), Line.kr(20, 8500, 20))+Impulse.ar(Line.kr([4, 16], [8,4], 9), mul: 0.7), 10, 12, 0.5).distort*LFTri.kr(Line.kr(6, 1/4, 7)).range(0, 0.1))}).play(0,2).quant_(1);});

///

