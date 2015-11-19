/////////
/////////    Off<>zz july 2015
/////////
/////////


/////////////


a = ProxySpace(s);

t = TempoClock.default;

t.tempo_(70/60);

a.quant_(0);
a[\a].quant_(0);

a.fadeTime_(1);

a[\a].play.source = {CombN.ar(SinOsc.ar("db2".namecps*LFSaw.kr(t.tempo*[1/8, 2]).range(1, 2))*EnvGen.kr(Env.perc(3, 1).circle(t.tempo*1/4))*0.1, t.tempo/2, t.tempo/[4, 2, 6, 8, 3], [4, 0.2, 1])};

a[\b].play(2).source = {SinOsc.ar("f1".namecps*LFPulse.kr(t.tempo*[2]).range(1, 3/2))*EnvGen.kr(Env.perc(0.4, 0.1).circle(t.tempo*1))*0.5};

a[\b].clear(3);


a[\an] = {CombFormlet.ar(HPF.ar(PitchShift.ar(In.ar(2), 0.2, [1/3, 9/2]), 80), "f5".namecps, 0.1, 1)*4};
a[\an].play(0,2);


f =  Pbrown("db1".namecps, "db3".namecps,inf).asStream;
Tdef(\r, {	loop{f.value.linlin(69,277,200, "db4".namecps).cpsmidi.round(4).midicps.postln; (1).wait}; }).play;

Tdef(\a, {
	loop{
	a[\c] = {SinOsc.ar(f, mul:1, add: LPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1))), 1940))*0.5*EnvGen.kr(Env.perc(0.01, 2), doneAction:2)};
		(1/8).wait;	}
}).play;

// or Tdef or Pdef for args change!!!!

Tdef(\b, {
	r = Pxrand([1/2, 1/2]/2, inf).asStream;
	loop{
	a[\d] = {|amp=1| amp*SinOsc.ar("db0".namecps, mul:1, add: LPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.01))), 12940))*0.5*EnvGen.kr(Env.perc(0.01, 0.5), doneAction:2)};
		(r.next).wait;	}
}).stop;


a[\c].play(0);

Pdef(\a, {Pbind(\type, \set, \args, [\amp, \freq], \freq, Pseq(["db1".namecps, "db3".namecps],inf), \amp, 0, \delta, 2)}).play;


a[\c] = {|freq| SinOsc.ar(freq, mul:1, add: LPF.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1))), 1940))*0.5*EnvGen.kr(Env.perc(0.01, 0.2).circle(t.tempo/4), doneAction:0)};

a[\c].play;



