////
//// Off<>zz 5 July 2015
////



a = ProxySpace(s);
a.quant_(0);

t = TempoClock.default;

Tdef(\a, {
	loop{
		a[\a] = {SinOsc.ar(["f1".namecps(0)*LFPulse.kr(t.tempo).range(1, 3/2), "g1".namecps(0)*LFSaw.kr(1/2).range(2, 1)], mul:EnvGen.kr(Env.perc(0.1, 0.1, 0.1)))+LPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1, 0.9).circle(t.tempo/4))), 100)};
	1.wait}
}).play;


a[\anne] = {CombN.ar(LPF.ar(LFPulse.kr(t.tempo*2) * HPF.ar(SoundIn.ar(0), 60), LFTri.kr(1/4).range(100, 2000)), t.tempo/2, t.tempo/4, 2)*8}
a[\anne1].play(1);


a[\anne1] = {CombN.ar(LPF.ar(LFPulse.kr(t.tempo*8) * HPF.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [3/2, 5/4]), 60), LFTri.kr(1/4).range(100, 2000)), 0.5, 0.5, 1)}

a[\anne1].clear;

////////////////
///////////////
/////
////////////
////////////
/////
/////
/////
/////

a.quant_(1);

a[\a].fadeTime_(4);
a[\a] = {SinOsc.ar((["a0".namecps, "d0".namecps]*Line.kr(12, 1, 10)*LFPulse.kr(1).range(1, 1.5)).cpsmidi.round(12).midicps)*0.2*Line.kr(1, 0.1, 20)};

a[\a].play;

a[\anne].fadeTime_(4);
a[\anne] = {FreeVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFPulse.kr(4).range(1, 4).lag(0.3)), 0.9, 0.7)*LFPulse.kr(4)*1};
a[\anne].play(0,2);
a[\anne].stop(1);


a[\b] = {LPF.ar(WhiteNoise.ar(8), 40)+SinOsc.ar("a2".namecps, mul: EnvGen.kr(Env.perc(0.1, 0.8, 0.2).circle(t.tempo*1/2)))*LFPulse.kr([2, 1], width:0.1)};
a[\b].play(0);

a[\b].fadeTime_(0.1);
a[\b].quant_(0);
a[\b] = {LPF.ar(WhiteNoise.ar(0.7), Line.kr(400, 10, 3))*EnvGen.kr(Env.perc(0.01, 3))};

/////// next one

a.clear;

/////////
////////
/////

t.tempo = 135/60;

a.quant_(1);

a[\a] = {|freq=100, freq2=50, amp=1| amp.lag(0.1)*Pulse.ar(LFPulse.kr(t.tempo*3).range([freq, freq2]*2, [freq/2, freq2/8]), 0.2)*0.1};
a[\a].play;

Pdef(\a, {Pbind(\type, \set, \args, [\freq, \freq2], \freq, Prand(["f0".namecps, "a0".namecps], inf), \freq2, Prand(["f0".namecps, "d0".namecps], inf), \delta, 2)}).play;

Pdef(\b, {Pbind(\type, \set, \amp, Pseq([Pseq([0, 1], 8*3.5), Pseq([0, 0], 4)], inf), \delta, 1/8)}).play.quant_(1);

// trompets
a[\b] = {|rl = 0.2, freq2=55|LPF.ar(Saw.ar((freq2*LFPulse.kr(t.tempo*1).range(1, 2.5)).cpsmidi.round(4).midicps), 880)*EnvGen.kr(Env.perc(0.01, rl).circle(t.tempo*1/8))*1};
a[\c] = {|rl=0.2, freq=55|LPF.ar(Saw.ar((freq/6*LFPulse.kr(t.tempo*1).range(1, 2.5)).cpsmidi.round(4).midicps), 880)*EnvGen.kr(Env.perc(0.01, rl).circle(t.tempo*1/8))*1};
a[\d] = {|rl=0.2, freq=55|LPF.ar(Saw.ar((freq*0.9*LFPulse.kr(t.tempo*1).range(1, 2.5)).cpsmidi.round(4).midicps), 880)*EnvGen.kr(Env.perc(0.01, rl).circle(t.tempo*1/8))*1};


// cool mistake --> evaluate this just like this wihtout evaluating a new Pdef(\c)
Pdef(\b, {Pbind(\type, \set, \args, [\rl], \rl, Pseq([0.1, 0.1, 0.1, 1], inf), \delta, 4)});

// without cool mistake :(
Pdef(\c, {Pbind(\type, \set, \args, [\rl], \rl, Pseq([Pseq([0.1], 7),Pseq([1], 1) ], inf), \delta, 1)}).play;


a[\c].quant_(1).play;
a[\b].quant_(1);

a[\b].play(0,2);
a[\b].stop;

//////
////
/////

a = ProxySpace(s);

a.quant_(1);

a[\an].fadeTime_(0);
a[\an] = {GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [3/2, 4/3, 1]*LFPulse.kr(t.tempo*4).range(1/2, 1)), 50, 4)*0.3};

a[\an].play(0,2);

a[\an].clear;

t = TempoClock.default;

t.tempo_(70/60);

Tdef(\a, {
	r = Pseq([\a, \b, \c], inf).asStream;
	loop{
		a[r.next].play([0,1].choose);
a[r.next] = {LPF.ar(SinOsc.ar("db1".namecps).distort, 120) * EnvGen.kr(Env.perc(0.01, 1), doneAction:2)};
		(1/8).wait;
}
}).play;


a[\a].play;


Tdef(\b, {
	loop{
		a[\d] = {FreeVerb.ar(SinOsc.ar([["f3".namecps, "db3".namecps].choose*LFSaw.kr(t.tempo/8).range([5, 1/2].choose, [1/2, 2].choose), ["ab3".namecps, "gb4".namecps].choose]*LFPulse.kr(t.tempo*8).range(1, 4/3)), 0.7, 0.6).distort * 0.1*EnvGen.kr(Env.perc(2, 10))};
8.wait
	}
}).play;


a[\d].play;

























