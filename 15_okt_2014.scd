/////// oktober 15th

Ndef(\Ana, {var in= SoundIn.ar(0, mul:1);
	var fx, fx2, fx3, out;
	fx = FreeVerb.ar(in.squared, room:0.1, mix: 0.2);
    fx = fx.clip2(0.001)*15;
	fx2 = CombL.ar(fx, 1.0, 0.1, 1).squared;
	fx3 = Splay.ar([fx, fx2]);
	out = fx3+fx;
	out = RLPF.ar(out, LFNoise0.kr(2).range(380, 170), 0.01);
	out = CombC.ar(out, 0.5, 0.01, 6);
	Out.ar(1, out*0.3);
	});


Ndef(\a, {|rate=3, freq2=440| Pulse.ar([freq2, 30])*LFPulse.kr(rate).range(0, 0.3)*0.4*EnvGen.kr(Env.perc(0.01, 3).circle)}).play.quant_(1);

Pdef(\a, {Pbind(\type, \set, \args, [\rate, \freq2], \freq2, Prand(["g1".namecps, "g1".namecps], inf), \rate, Pseq([1, 1, 2], inf), \delta, 1/2)}).play.quant_(4);

Pdef(\b, {Pbind(\type, \set, \args, [\rate2, \freq1], \freq1, Pseq(["g1".namecps, "f#1".namecps, "g1".namecps], inf), \rate2, Pseq([1, 3, 2], inf), \delta, 1/2)}).play.quant_(4);

Ndef(\b).fadeTime_(3);
Ndef(\b, {|rate2, freq1=400| HPF.ar(Pulse.ar(freq1)*LFPulse.kr(rate2).range(0, 0.4)*0.6*EnvGen.kr(Env.perc(0.01, 10).circle), LFTri.kr(1/3).range(440, 1300))}).play(1,0).quant_(3);


Ndef(\Ana, {var in= SoundIn.ar(0, mul:1);
	var fx, fx_d;
	fx = FreeVerb.ar(in, room:0.9, mix: 0.6);
	fx = PitchShifter.ar(fx, [2/1, 3/2, 5/4]); // increase nodes
	fx_d = CombC.ar(fx, 0.3, 0.25, 1, 6);
//	fx = RHPF.ar(fx, 1600);
	Out.ar(2, (fx+fx_d)*1);
}).play(2,2).fadeTime_(6);


Ndef(\Ana, {(HPF.ar(PinkNoise.ar(0.3), 1790) * SoundIn.ar(0).clip2(0.5)) * LFNoise0.ar([0.9, 0.3]).range(0.2, 1) * Line.kr(0.1, 0.4, 0.1) * 4}).play(0,2).fadeTime_(4);

Pdef(\b).stop;

Ndef(\b).stop(1);

Ndef(\me1).stop(3)

o = Server.local.options;
o.numOutputBusChannels_(8);
o.numInputBusChannels_(8);

s.meter;



/// quickie 2min
t = TempoClock.default;
t.sched(120, {Ndef(\last, {ReplaceOut.ar([0,1,2,3], HPF.ar(In.ar(0,4), Line.kr(40, 20000)))}).play });

Ndef(\a, {LPF.ar(WhiteNoise.ar(LFNoise0.kr(3).range(0.1, 0.4)), LFNoise0.kr(3).range(200, 110))}).play;


