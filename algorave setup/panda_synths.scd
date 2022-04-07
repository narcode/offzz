/// synths

// Load the synths...
(
// JUAN:
SynthDef(\da_fat_bass1, { |out, freq=100, mod=1, sustain=1, attack=0.1, release=1, amp=0.1, cut=800|
    var fenv = EnvGen.ar(Env.perc(attack, release), 1, mod);
    var env = EnvGen.ar(Env.perc(0.01, sustain), doneAction:2);
    var snd = PMOsc.ar(freq * {Rand(0.999,1.001)}.dup, freq/2, fenv, SinOsc.ar(freq)*0.7); // ye goode olde FM
    snd = snd + SinOscFB.ar(freq/2 * {Rand(0.999,1.001)}.dup, fenv/10); // mega bass
	snd = LPF.ar(HPF.ar(snd, LFSaw.kr(1).range(180, 40)), cut);
    snd = Compander.ar(snd, snd, 0.5, 1, 0.75); // fatness
    Out.ar(out, snd * env * amp);
}).store;


SynthDef(\da_fat_bass2, { |out, freq=100, mod=1, sustain=1, attack=0.1, release=1, amp=0.1|
    var fenv = EnvGen.ar(Env.perc(attack, release), 1, mod, 1);
    var env = EnvGen.ar(Env.perc(0.01, sustain), doneAction:2);
    var snd = Gendy1.ar(minfreq:freq*0.95, maxfreq:freq*1.05); // yeah!
    snd = BLowPass4.ar(snd, freq * fenv, 0.3); // filter the shit
    snd = SinOscFB.ar(freq, 0.3, 0.5)!2 + snd; // mega bass
    snd = Compander.ar(snd, snd, 0.5, 1, 0.75); // fatness
    snd = Pan2.ar(snd, 0);
    Out.ar(out, snd * env * amp);
}).store;


SynthDef(\booty_k, {|out, freqk=60, amp=1, fmod=4, release=0.01|
    var line = Line.ar(freqk * fmod, freqk, release); // modulation
    var snd = SinOsc.ar(line, pi/2); // the bass
    snd = snd * EnvGen.ar(Env.perc(0.01, 2, 1, -8), doneAction:2);
    snd = snd.tanh; // math compression
    snd = Compander.ar(snd, snd, 0.5, 1, 0.7); // real compression for the booty
    snd = Pan2.ar(snd, 0);
    Out.ar(out, snd * amp);
}).store;

SynthDef(\k, {|freqk = 90, out=0, at=0.4, freqh=90, rt=0.01, amp=1|
	var in, fx;
	in = Pulse.ar([freqk.lag(1/8), freqh], 1, 1) * EnvGen.kr(Env.perc(at, rt), doneAction: 2);
    fx = Out.ar(out, in*amp);
}).store;

SynthDef(\act, {|out=0, rt=1, at=0.01, amp=1, rate=1, buf, cut=1600|
var snd, fx;
	snd=PlayBuf.ar(2, buf, rate)*EnvGen.kr(Env.perc(attackTime: at, releaseTime:rt), doneAction: 2);
	fx = LPF.ar(snd, cut);
	Out.ar(out, fx*amp);
}).store;

///// hh

SynthDef(\hhEj, {|freq=0.1, out=0, at=0.1, rt=1, amp=1, ratio=4, dec=0.5, root=1, sust=1, sampler=500|
var in, env, fx;
	env = EnvGen.kr(Env.linen(at, sust, rt), doneAction: 2);
	in = Klank.ar(`[[415, 845, 605, 858], 1/4, [2, 0.5, 0.8, 0.1]], ClipNoise.ar(freq), [root, ratio], 0, dec).distort;
	fx = in * env;
	fx = Latch.ar(fx, Impulse.ar(sampler)); /// nice sample decrese :)!
	Out.ar(out, fx*amp);
}).store;

///////////////////////////////////////////////////////////
///////////////// 1000 yesterday's without sex  //////////////
//////////////////////////////////////////////////


//Bass drum
(
SynthDef(\drum1000,{|freq=50, out=0, amp=2|
	var in = LPF.ar(LFPulse.ar(freq), 60);
	in = in * EnvGen.kr(Env.perc(attackTime: 0.01, releaseTime: 0.01), doneAction:2)!2;
	Out.ar(out, in*amp);
}).store;

SynthDef(\snare1000, {|freq=50, out=0, amp=10, freq2=780|
	var in = FreeVerb.ar(BPF.ar(PinkNoise.ar(1), freq, 0.1), 0.6, 0.5).tanh + Impulse.ar(1) + WhiteNoise.ar(0.4);
	in = LPF.ar(in, freq2);
	in = in * EnvGen.kr(Env.perc(attackTime: 0.01, releaseTime: 0.05), doneAction:2);
	Out.ar(out, (in*amp)!2);
}).store;

SynthDef(\hi1000, {|amp = 14, out=0|
	var in = FreeVerb.ar(Saw.ar([LFNoise1.kr([1, 1]).range("c1".namecps, "e1".namecps), LFNoise2.kr(1).range("c3".namecps, "b4".namecps)])*Impulse.ar([0.7, 0.5]), 0.9, 10) * amp;
	in = in * EnvGen.kr(Env.perc(attackTime: 0.01, releaseTime: 0.1), doneAction:2);
	Out.ar(out, in);
}).store;

SynthDef(\hi2000, {|amp = 14, out=0, rate=2|
	var in = FreeVerb.ar(Saw.ar(["e1".namecps, "c1".namecps]*8)*HPF.ar(Impulse.ar([7, 50]), 3456), 0.9, 10) * amp;
	in = in * EnvGen.kr(Env.perc(attackTime: 0.01, releaseTime: 0.1), doneAction:2);
	Out.ar(out, in);
}).store;

SynthDef(\bs1000,{|freq=50, out=0, amp=1, rt=2|
	var in = LPF.ar(Saw.ar([freq, freq*1.01, freq/2]), 60);
	in = in * EnvGen.kr(Env.perc(attackTime: 0.01, releaseTime: rt), doneAction:2);
	Out.ar(out, (in*amp)!2);
}).store;

SynthDef(\pad1000, {|out=0, freq=180, cf=20, rate=1, amp=0.1, lf=100|
	var in, filter;
	in = SinOsc.ar([freq, freq*3/2, freq*4/3, freq*6/5].lag(1)) * LFSaw.kr(rate).range(0.1, 1).distort;
	in = FreeVerb.ar(in, 0.7, 0.8);
	in = Resonz.ar(in, LFNoise1.kr(1/2).range(300, 400).lag(0.1), 0.1);
	Out.ar(out, Splay.ar(LPF.ar(in, lf))*amp);
}).store;

~vp = 1;

);

//// PANDA SUIT
(
SynthDef(\panda_bass, {|out=0, amp=1, freq=80, rl=6|
	var snd, fx, env;
	env = EnvGen.kr(Env.perc(0.01, rl), doneAction: 2);
	snd = (Saw.ar(freq)ring3:SinOsc.ar(freq)) * LFNoise0.kr(87/60).range(0.1, 1) * env;
	fx = Pan2.ar(snd, LFNoise0.kr(2));
	Out.ar(out, fx*amp);
}).store;


SynthDef(\panda_bass1, {|out=0, amp=1, freq=80, rl=6, cut=3200|
	var snd, fx, env;
	env = EnvGen.kr(Env.perc(0.01, rl), doneAction: 2);
	snd = (Saw.ar(freq)ring3:SinOsc.ar(freq)) * LFNoise0.kr(87/60).range(0.1, 1) * env;
	fx = Pan2.ar(LPF.ar(snd, cut), LFNoise0.kr(2));
	Out.ar(out, fx*amp);
}).store;


SynthDef(\panda_bassX, {|out=0, amp=1, freq=80, rl=1, mod=20, dec=0.2, cut=3320, comp=2|
	var snd, fx, env;
	env = EnvGen.kr(Env.perc(0.05, rl), doneAction: 2);
	snd = (Saw.ar(freq)ring3:Pulse.ar(freq-mod));
	fx = Compander.ar(snd,snd, 0.05, dec, comp) * env;
	fx = LPF.ar(fx, cut);
	fx = Pan2.ar(fx, LFNoise0.kr((87/4)/60));
	Out.ar(out, fx * amp);
}).store;

//b = Synth(\panda_bassX, [\cut, 3320]);

SynthDef(\panda_love, {|out=0, amp=1, freq=80, rl=6, at=0.01|
	var snd, fx, env;
	env = EnvGen.kr(Env.perc(at, rl), doneAction: 2);
	snd = SinOsc.ar(freq) * LFNoise0.kr(87/60).range(0.1, 0.4) * env;
	fx = Pan2.ar(snd, LFNoise0.kr(2));
	Out.ar(out, fx * amp);
}).store;

SynthDef(\panda_bassAR, {|out=0, amp=1, freq=80, rl=6, at=0.01, rate=800|
	var snd, fx, env;
	env = EnvGen.kr(Env.perc(at, rl), doneAction: 2);
	snd = SinOsc.ar(freq) * LFNoise0.kr(87/60).range(0.1, 0.4) * env;
	fx = Pan2.ar(Latch.ar(snd, Impulse.ar(rate)), LFNoise0.kr(2));
	Out.ar(out, fx * amp);
}).store;

SynthDef(\panda_kick, {|out, freqk=60, amp=1, fmod=4, release=0.01, comp=3|
	var line = Line.ar(freqk * [fmod, 1], freqk, release); // modulation
    var snd = SinOsc.ar(line, pi/2); // the bass
    snd = snd * EnvGen.ar(Env.perc(0.01, 0.1, 1, -8), doneAction:2);
    snd = snd.tanh; // math compression
    snd = Compander.ar(snd, snd, 0.05, 0.3, comp); // real compression for the booty
	snd = Mix([snd]);
    snd = Pan2.ar(snd, 0);
    Out.ar(out, snd * amp);
}).store;


SynthDef(\panda_snare, {|out=0, amp=1, mod=1, lvl=0.5, rl =3, rldrill=1, eqf=400, comp=2|
	var snd, fx, att;
	snd = BPF.ar(WhiteNoise.ar(BrownNoise.kr(lvl)) * EnvGen.kr(Env.perc(0.001, 0.4, 1, -7)), eqf, 1);
	snd = FreeVerb.ar(snd, 1, 0.5,1, EnvGen.kr(Env.perc(0.001, rl, 1, -6), doneAction: 2)).distort;
	att = Pulse.ar(mod, 0.1, BrownNoise.ar(0.1)) * EnvGen.kr(Env.perc(0.01, rldrill));
	snd = snd + att;
	snd = Compander.ar(snd, snd, 0.05, 0.3, comp); // real compression for the booty
    snd = Pan2.ar(snd, 0);
	Out.ar(out, snd*amp);
	}
).store; // compander

SynthDef(\panda_hi, {|out=0, amp=1, mod=1, lvl=0.5, rl =3, rldrill=1, eqf=400, comp=2, pos=1|
	var snd, fx, att;
	snd = BPF.ar(WhiteNoise.ar(BrownNoise.kr(lvl)) * EnvGen.kr(Env.perc(0.001, 0.4, 1, -7)), eqf, 1);
	snd = FreeVerb.ar(snd, 1, 0.5,1, EnvGen.kr(Env.perc(0.001, rl, 1, -6), doneAction: 2)).distort;
	att = Pulse.ar(mod, 0.1, BrownNoise.ar(0.1)) * EnvGen.kr(Env.perc(0.01, rldrill));
	snd = snd + att;
	snd = Compander.ar(snd, snd, 0.05, 0.3, comp); // real compression for the booty
    snd = Pan2.ar(snd, pos);
	Out.ar(out, snd*amp);
	}
).store;

);

///////////////////////////////////////////////////////////
///////////////// Animalz //////////////
//////////////////////////////////////////////////

SynthDef(\animals_bdrum, {|amp=1, rl=0.2,out=0, freq=100, freqb = 40, lof=10|
	var sound;
	sound = RLPF.ar(BrownNoise.ar(SinOsc.ar(Line.kr(freqb, lof, 0.2))), Line.kr(freq, 20, 0.1), 0.1)*1*EnvGen.kr(Env.perc(0.01, rl), doneAction: 2);
	Out.ar(out, sound*amp);
}).store;

SynthDef(\animals_snare, {|amp=1, rl=0.2,out=0|
	var sound;
	sound = FreeVerb.ar([WhiteNoise.ar(1), LPF.ar(BrownNoise.ar(1), LFTri.kr(3).range(100, 8900))], 0.6, 0.4, 0.1)*1*EnvGen.kr(Env.perc(0.01, 0.2), doneAction: 2);
	Out.ar(out, sound*amp);
}).store;

SynthDef(\animals_hi, {|at = 0.02, amp=1, rl=0.2, out=0, freq=6520|
	var sound;
	sound = HPF.ar(FreeVerb.ar([WhiteNoise.ar(1), LPF.ar(BrownNoise.ar(1), LFTri.kr(3).range(100, 8900))], 0.4, 1, 0.1), freq)*1*EnvGen.kr(Env.perc(at, rl), doneAction: 2);
	Out.ar(out, sound*amp);
}).store;

SynthDef(\animals_bass, {|amp=1, rl=2,out=0, freq=110, rate=4, dec=1|
	var sound;
	sound = (Saw.ar([freq, Line.kr(freq, freq*1, 1)], LFPulse.kr(rate).lag(0.1)).distort*SinOsc.ar(freq))*1*EnvGen.kr(Env.perc(0.01, rl), doneAction: 2);
	//sound = CombC.ar(sound, 0.2, 0.4, dec);
	Out.ar(out, sound*amp);
}).store;


);


///////////////////////////////////////////////////////////
///////////////// PZa //////////////
//////////////////////////////////////////////////
SynthDef(\ppizza, {|forward = 2.5, reverse=1, amp=0.7, buf=15, out=0, rl=1, st=0.1, ratel=0.5, rateh = 6, cutV=0, ratecut=2, speed=4, nspeed=0.25|
	var env = EnvGen.kr(Env.linen(0.1, st, rl), doneAction: 2);
	var sound = (Gendy2.ar(1, 0.1, mul: LFSaw.kr(t.tempo*nspeed).range(0, 0.1))+PlayBuf.ar(2, buf, LFNoise1.kr(LFNoise0.kr(t.tempo).range(t.tempo*ratel, t.tempo*rateh).round(1)).range(reverse, forward), loop: 1))*LFPulse.kr(LFNoise0.kr(t.tempo*speed).range(8, 1).round(1))*amp*LFNoise0.kr(t.tempo*ratecut).range(cutV, 1).round(1);
	Out.ar(out, sound*env);
}).store;