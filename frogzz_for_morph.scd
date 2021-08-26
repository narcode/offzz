/// Offzz intro

// anne

Ndef(\Ana, {var in = CombN.ar(FreeVerb.ar(SoundIn.ar(1, mul:1), 0.4, 1).distort, 0.2, 1, 1, 6); Out.ar([0,1], in* 0.3); }).play.fadeTime_(3);

Ndef(\Ana0, {var in = CombN.ar(FreeVerb.ar(SoundIn.ar(0, mul:1), 0.4, 0.8).distort, 0.2, 1, 2, 6); Out.ar([0,1], in* 0.3); }).play.fadeTime_(3);

Ndef(\Ana_0, {var in = CombN.ar(FreeVerb.ar(PitchShift.ar(SoundIn.ar(1, mul:1), 0.2, Demand.kr(Impulse.kr(1), 0, Drand([1, 2/2, 3/2, 5/4, 5/6], inf))), 0.4, 1).distort, 0.2, 1, 1, 6); Out.ar([0,1], in* 1.3); }).play.fadeTime_(7);


Ndef(\Ana, {var in = CombN.ar(FreeVerb.ar(PitchShift.ar(SoundIn.ar(1, mul:1), 0.2, Demand.kr(Impulse.kr(4), 0, Dseq([1, 2/2, 5/6], inf))), 0.4, 1).distort, 0.2, 1, 1, 6); Out.ar([0,1], in* 1.3); }).play.fadeTime_(7);

Ndef(\Ana2, {var in = CombN.ar(FreeVerb.ar(Resonz.ar(PitchShift.ar(SoundIn.ar(1, mul:1), 0.2, Demand.kr(Impulse.kr(1), 0, Drand([1, 1/2], inf))), Demand.kr(Impulse.kr(1), 0, Dseq(["b3".namecps, "b3".namecps, "a3".namecps, "b3".namecps], inf)), 0.01, 18), 0.4, 1).distort, 0.2, 1, 1, 6); Out.ar([0,1], in* 3); }).play.fadeTime_(3);

Ndef(\Ana1, {var in = CombN.ar(PitchShift.ar(SoundIn.ar(1, mul:1)), 0.3, 0.2, 2); Out.ar([0,1], in* 1.3); }).play.fadeTime_(7);

Ndef(\me_n, { var num=4; LPF.ar(Pulse.ar(num, 0.3, BrownNoise.ar(1.2)), Line.kr(380, 680, 10)) * LFPulse.kr(num) * 4}).play(1).fadeTime_(4);

Ndef(\me_n2, { var num=6; LPF.ar(Pulse.ar(num, 0.8, PinkNoise.ar(1.3)), Line.kr(380, 880, 10)) * LFPulse.kr(num) * 2}).play(0).fadeTime_(4);

Ndef(\me_n2).stop(1);


Ndef(\me_n2, {LPF.ar(Pulse.ar(1/2), SinOsc.kr(1).range(180, 980)) * LFPulse.kr(4) * 1}).play(1).fadeTime_(4);

Ndef(\me_n, {LPF.ar(Pulse.ar(1/4), SinOsc.kr(1).range(580, 1880)) * LFPulse.kr(8) * 8}).play(1).fadeTime_(4);

Ndef(\me_n3, {var val = 1; FreeVerb.ar(Resonz.ar(Pulse.ar(val), LFPulse.kr(4).range(680, 980), LFNoise0.kr(4).range(0.3, 0.01)), 0.3, LFNoise0.kr(val).range(0.8, 1)) * LFPulse.kr(0.8) * 2}).play(1).fadeTime_(4);

Ndef(\me2, {var val=20; CombN.ar(SinOsc.ar([Line.kr("eb2".namecps, "g2".namecps, val), Line.kr("b5".namecps, "b2".namecps, 3)], 0, 0.5).distort * LFTri.kr(LFNoise0.kr(4).range(1, 20)), 1, 0.4, val) }).play.fadeTime_(5);

Ndef(\me_n3).stop(5);

Ndef(\me, {SinOsc.ar([Demand.kr(Impulse.kr(Line.kr(2, 14, 0.1)), 0, Dseq(["eb2".namecps, "g2".namecps, "b2".namecps, "g3".namecps] * 1, inf)), "d3".namecps], 0, 0.5) * LFTri.kr(LFNoise0.kr(4).range(1, 1))}).play.fadeTime_(5);

Ndef(\me2, {SinOsc.ar([Demand.kr(Impulse.kr(Line.kr(1, 3, 1)), 0, Dseq(["b2".namecps, "b2".namecps, "a2".namecps, "b3".namecps] * 4, inf)), "bb3".namecps], 0, 0.5) * LFTri.kr(LFNoise0.kr(4).range(1, 1))}).play(0,1).fadeTime_(5);

Ndef(\me).stop(6);

// BS Kas

Ndef(\me, {SinOsc.ar("g#3".namecps).distort * LFPulse.ar(4) * 1.2}).stop.fadeTime_(13);
Ndef(\me2, {SinOsc.ar("c#4".namecps).distort * LFPulse.ar(8.5) * 1}).stop.fadeTime_(16);
Ndef(\me3, {SinOsc.ar("d2".namecps).distort * LFPulse.ar(7.2) * 1}).fadeTime_(10);

Ndef(\me3).stop(6);

Ndef(\me_imp, {Pulse.ar([Line.kr("eb2".namecps, "g3".namecps, 2), "d5".namecps], 0, 0.3) * Impulse.kr(2).range(0, 2)}).play.fadeTime_(5);

Ndef.gui;