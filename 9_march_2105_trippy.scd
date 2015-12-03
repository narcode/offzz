//// March 9th 2015 Off<>zz

///
//
//
//
//

/// off<>zztrip


a = ProxySpace.push(s);
a.quant_(1).fadeTime_(10);
a[0].play;

a[0] = {|amp=1, freq=500| SinOsc.ar([freq, freq*3/2, freq.lag(0.1)/2]).distort * [0.3, 0.1, 0.3] *amp};

a[0].set(\freq, "d4".namecps);

a[1] = {|amp2=1, freq2=300| SinOsc.ar([freq2, freq2.lag(0)/2]).distort * LFNoise0.kr(80).range(0, 0.7)*amp2};
a[1].play;

a[1].set(\freq2, Ndef(\a, {LFPulse.kr(6).range("c1".namecps, "c1".namecps)}).stop;);
a[1].set(\freq2, 60);

Pdef(\a, {Pbind(\type, \set, \amp, Pseq([1,0,1],inf), \freq, Pseq(["c1".namecps, "c1".namecps, "c1".namecps],inf), \delta, 1/190, \tempo, 90/60)}).stop.quant_(1);

a[1] = {|amp2=1, freq2=500| SinOsc.ar([freq2, freq2*3/2, freq2.lag(0.1)/2]).distort * [0.3, 0.1, 0.3]+0.5 *amp2};

Pdef(\b, {Pbind(\type, \set, \args, [\amp2, \freq2], \amp2, Pseq([1,1,0,1,0] ,inf), \freq2, Pseq(["c1".namecps,"c1".namecps,"c1".namecps,"c1".namecps,"c1".namecps, "c1".namecps, "c1".namecps],inf), \delta, 1/158)}).play.quant_(1);

a[0] = {FreeVerb.ar(CombC.ar(SinOsc.ar(["d3".namecps, "f2".namecps, "c4".namecps], 0, LFPulse.kr(2).range(0, 0.2)), 0.2, 1/4, 2), 1, 0.6) * 0.5};

a[1] = {FreeVerb.ar(CombC.ar(SinOsc.ar(["d3".namecps, "f2".namecps, "c4".namecps]/2, 0, LFPulse.kr(2).range(0, 0.2)), 0.2, 1/4, 2), 1, 0.6) * 0.5};

a[0].play;

Ndef(\b, {ReplaceOut.ar([0,1], RLPF.ar(WhiteNoise.ar(0.4)*LFPulse.kr(Line.kr(1, 50, 10)), Line.kr(4000, 20, 15)))}).play;