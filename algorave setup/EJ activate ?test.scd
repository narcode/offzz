//// Panda Zooicide
//
//    panda zooicide //// PANDA ZOOICIDE
//

s.reboot;

// RESONATION PART


/// its part of the genre.... really
("/Users/fina/Desktop/Panda Zooicide/panda_synths.scd").load;

t.tempo_(160/60);

(
Pdef(\kick1, {Pbind(\instrument, \k, \amp, Prand([3, 50, 30], inf), \freqk, 90, \freqh, 120, \rt, 0.01, \at, 0.4, \delta, Pseq([1/2], inf), \tempo, 160/60, \out, 4)}).play(quant: Quant(8));

Pdef(\kick0, {Pbind(\instrument, \k, \amp, Prand([3, 50, 30]/8, inf), \freqk, 90, \freqh, 120, \rt, 0.01, \at, 0.4, \delta, Pseq([1/2], inf), \tempo, 160/60, \out, 0)}).play(quant: Quant(8));

// original
Ndef(\filres, {var in=In.ar(4,2); FreeVerb.ar(Resonz.ar(in, Demand.kr(Impulse.kr((160*1)/60), 0, Drand(["cb3".namecps, "eb3".namecps, "ab2".namecps], inf)), 0.001, 200), 0.3, 1, 0.1)*0.9}).play.fadeTime_(4); //

// LC
Ndef(\filres, {var in=In.ar(4,2); Limiter.ar(FreeVerb.ar(Resonz.ar(in, Demand.kr(Impulse.kr((160*1)/60), 0, Drand(["cb3".namecps, "eb2".namecps, "ab2".namecps],inf)), 0.001, 200), 0.3, 1, 0.1), 0.05)*0.9}).play.fadeTime_(4);


// 2
Pdef(\kick2, {Pbind(\instrument, \k, \amp, Prand([3, 50, 30], inf), \freqk, 90, \freqh, 120, \rt, 0.01, \at, 0.4, \delta, Pseq([4], inf), \out, 6)}).play(quant: Quant(8)); //2

// original
Ndef(\filres2, {|hcut = 2400, lcut = 64| var in=In.ar(6,2); HPF.ar(LPF.ar(FreeVerb.ar(Resonz.ar(in, Demand.kr(Impulse.kr((160*1/3)/60), 0, Drand(["eb2".namecps, "eb3".namecps, "cb2".namecps],inf)), 0.001, 200), 0.3, 1, 0.1), hcut), lcut)*0.7}).play.fadeTime_(4);

// LC
Ndef(\filres2, {|hcut = 2400, lcut = 64| var in=In.ar(6,2); HPF.ar(LPF.ar(FreeVerb.ar(Resonz.ar(in, Demand.kr(Impulse.kr((160*1/3)/60), 0, Drand(["eb2".namecps, "ab3".namecps, "cb2".namecps],inf)), 0.001, 200), 0.3, 1, 0.1), hcut), lcut)*0.4}).play.fadeTime_(4);




// // old
// Ndef(\filres2, {var in=In.ar(11,2); FreeVerb.ar(Resonz.ar(in, Demand.kr(Impulse.kr((160/3)/60), 0, Drand(["eb2".namecps, "b2".namecps, "eb2".namecps],inf)), 0.001, 200), 0.3, 1, 0.1)*8}).play.fadeTime_(4);

);

PdefAllGui(18);

Ndef(\line, {Pan2.ar(RLPF.ar(WhiteNoise.ar(0.1), Line.kr(340, 4900, 25), 0.1),LFTri.kr(1/15).range(-1, 1).lag(3))*0.1}).play;
// Ndef(\lfx, {Pan2.ar(In.ar(90,1), LFTri.kr(1/15).range(-1, 1).lag(3))}).play();
Ndef(\line).stop(1);
Ndef(\line).stop.clear;

//// ooops///
// PATTERNS (meant to sound all 3 together at some point*)
(
//1
(
Pdef(\kick, {Pbind(\instrument, \k, \amp, Pseq([80, 80]*1, inf), \freqk,90, \freqh, 120, \rt, 0.01, \at, 0.4, \delta, Pseq([4], inf), \tempo, 160/60, \out, [0,1])}).play(quant: Quant(8)); // freq
//2
Pdef(\hh1, {Pbind(\instrument, \hhEj, \amp, Pseq([0.1, 0.1]*1/3,inf), \sampler, Pseq([Pseq([500], 3), Pseq([1500], 1)], inf), \root, 12, \ratio, 8, \rt, 0.01, \at, 0.1, \sust, Pseq([0.1, 0.01], inf), \delta, 2, \out, 0)}).play(quant: Quant(8)); // out 60?
// 3
Pdef(\snare1, {Pbind(\instrument, \hhEj, \amp, Pseq([0.1, 0.1]*1/2,inf), \sampler, Pwhite(340, 4100), \root, 1/2, \ratio, 1/2, \rt, 0.2, \at, 0.01, \sust, Pseq([0.1, 0.1], inf), \delta, 2, \out, Pseq([Pseq([16], 4), Pseq([0], 2), Pseq([16], 2)], inf))}).play(quant: Quant(8, 1));
);


/// FX at certain channels (stays on all the time)
Ndef(\fil, {var in=In.ar(16,2); Out.ar(0, BPF.ar(in, LFNoise0.kr((160/8)/60).range(400, 1100), 0.6, 2))}).play;
);

// SUPER BASS
Pdef(\booty_kick, {Pbind(\instrument, \booty_kick, \amp, Pseq([0.5, 0.5, 0.5]+0.5, inf), \dur, Pseq([2], inf), \fmod, 4, \release, 0.3, \tempo, 160/60, \out, 0)}).play(quant: Quant(8)); //// melodia con el release


// channel 60 for 8-bittiness
// Ndef(\bit, {Out.ar(0, Limiter.ar(Latch.ar(In.ar(60,2), Impulse.ar([3200, LFNoise0.kr(1).range(300, 3200)]*1/2), 0.2)))}).play(0,2);
// Ndef(\bit).stop;


// cloud...
Pdef(\hh2, {Pbind(\instrument, \hhEj, \amp, Pseq([0.1, 0.1]*1/8,inf), \sampler, Pseq([Pseq(["eb4".namecps], 2), Pseq(["ab4".namecps], 2)], inf), \root, 1, \ratio, 100, \rt, 0.05, \at, 3, \sust, Pseq([0.1, 0.01], inf), \delta, 4, \out, 0)}).play(quant: Quant(8)).fadeTime_(8); /// cresc. here... // e5


/// ACTIVATE!
~buff=();
[\kid, \twins, \totalrecall, \travolta].do({|key| ~buff[key] = Buffer.read(s, "/Volumes/fina_storage/FiNa USB/PZ/activate/"++key.asString++".aif");});


x= Synth(\act, [\buf, ~buff[\twins], \amp, 8]);

// originals
Pdef(\act, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buff[\twins]],inf), \delta, Pseq([4], inf), \rate, 1, \rt, 1.2, \amp, Prand([2, 1, 0.2]+9, inf))).play(quant: Quant(8));

Pdef(\act1, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buff[\totalrecall]],inf), \delta, Pseq([2], inf), \rate, 1/2, \rt, 0.7, \amp, Prand([0, 2]+4, inf))).play(quant: Quant(8));

Pdef(\act2, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buff[\travolta]],inf), \delta, Pseq([4], inf), \rate, [2, 2, 2]-1, \rt, Pseq([Pseq([1], 4), Pseq([0.3], 1)], inf), \amp, 1.1)).play(quant: Quant(4));


PdefAllGui(38);


/// impro
Pdef(\act, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buff[\twins]],inf), \delta, Pseq([1], inf), \rate, 1, \rt, 0.5, \amp, Prand([2, 1, 0.2]+9, inf))).play(quant: Quant(8));

Pdef(\act1, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buff[\totalrecall]],inf), \delta, Pseq([8], inf), \rate, 1/2, \rt, 2, \amp, Prand([0, 2]+4, inf))).play(quant: Quant(8)); // impro: move /rt

Pdef(\act2, Pbind(\instrument, \act, \cut, Pseq([1100,900, 580, 880], inf), \buf, Prand([~buff[\travolta]],inf), \delta, Pseq([4], inf), \rate, [2, 2, 2]-1, \rt, Pseq([Pseq([0.3], 1), Pseq([2], 1)], inf), \amp, 1.1)).play(quant: Quant(4));

Ndef(\line, {Pan2.ar(RLPF.ar(WhiteNoise.ar(0.1), Line.kr(340, 4900, 25), 0.1),LFTri.kr(1/15).range(-1, 1).lag(3))*1}).play;
Ndef(\line).stop(4);




