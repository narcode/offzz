

Ndef(\start, {SinGrain.ar(Impulse.kr(100), LFPulse.kr(70).range(0.02, 0.0001), 84*LFPulse.kr(LFNoise0.kr(1).range(1, 18)).range(1, 10*LFPulse.kr(1/2, 8))) * 0.3}).play(1,1);

(
Ndef(\anne, {CombC.ar(SoundIn.ar(0), 0.2, 0.2, 10)*0.1}).play(0,2);
Ndef(\start).stop;
);

s