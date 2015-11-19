//////////
///// Undusting Off<>zz ---> June 17
//
///////
//////
//////


/////
///
//
//
/////


a = ProxySpace(s);

a.quant_(1);

a[\a] = {WhiteNoise.ar(0.1)};

a[\a] = {Dust.ar([2, 3.6])*1*SinOsc.ar("ab1".namecps)*1};
a[\a]
a[\a].fadeTime_(2);
a[\a].stop(4);

a[\b] = {FreeVerb.ar(In.ar(0,2), 0.7, 0.7) * LFPulse.kr(1/3).lag(0.2)*0.3};
a[\b].play;

a[\c] = {|freq=110| LPF.ar(CombN.ar(SinOsc.ar(freq)*LFPulse.kr(1/1, width:0.3).lag(0.1), 0.2, 0.15, 2), LFTri.kr(1/3).range(200, 1700))*0.1};
a[\c].play(0,2);


a[\anne] = {PitchShift.ar(SoundIn.ar(0),0.05, [3/2, 5/4]).distort*CombN.ar(LFPulse.kr(1), 0.5, 0.2, 4)*7.5};
a[\anne].play(0);


Pdef(\a, {Pbind(\type, \set, \freq, Pseq(["ab2".namecps, "cb3".namecps, "db4".namecps], inf), \delta, 1/8)}).play;

a[\a] = {|freq=110| LPF.ar(CombN.ar(SinOsc.ar(freq)*LFPulse.kr(1/1, width:0.3).lag(0.1), 0.2, 0.15, 2), LFTri.kr(1/3).range(200, 1700))*0.1};

Pdef(\b, {Pbind(\type, \set, \freq, Pseq(["ab2".namecps, "cb3".namecps, "db4".namecps]*2*4/3, inf), \delta, 1/2)}).play;

a[\a].play(0,2)


Ndef(\a, );

/////////////////////////////////////////////////////
/////////////
//////////////////////////


///// MicroCosmos in F ----> Offzzmos


//////
//
//
//
////

a.clear;
a = ProxySpace(s);

a.fadeTime_(3);

a[\a] = {FreeVerb.ar(SinGrain.ar(Impulse.kr(8), 0.2, "f1".namecps(0)*Line.kr(4, 1, 50))*LFTri.kr(1/5).range(2*3/2, 1/7), 0.5, 0.5)*0.05};

a[\a].play;


a[\b] = {FreeVerb.ar(SinGrain.ar(Impulse.kr(LFPulse.kr(1/1).range(1/8, 8)), 0.2, "f1".namecps*LFTri.kr(1/7).range(2, 1/2)), 1,1)*0.1};
a[\b].play(1);


a[\anne] = {Limiter.ar(GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFTri.kr(3).range(1, 3.2)), 150, 5)*5, 0.99)}

a[\anne].play(0);


a[\c].fadeTime_(2);
a[\c] = {BrownNoise.ar(1)*EnvGen.kr(Env.perc(3, 8))};
a[\c].play;

Tdef(\a, {
	loop{
		a[\c] = {WhiteNoise.ar(28)*EnvGen.kr(Env.perc(0.01, 0.01))};
		a[\c].play(0);
		1.wait;
	}
}).stop;


Tdef(\b, {
	loop{
		a[\d] = {WhiteNoise.ar(28)*EnvGen.kr(Env.perc(0.011, 0.01))};
		a[\d].play(1);
		(1/4).wait;
	}
}).stop;

Tdef(\c, {
	1.do{
		a[\e] = {BrownNoise.ar(Saw.ar("f1".namecps))*1*EnvGen.kr(Env.perc(5, 50))};
		a[\e].play(0);
		//[8].choose.wait;
	}
}).play;


t = TempoClock.default.tempo_(90/60);

t.tempo_(120/60);



a[\anne] = {Limiter.ar(GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFTri.kr(3).range(1, 3.2)), 150, 5)*8, 0.99)*LFPulse.kr(t.tempo/2)}


a[\anne1] = {Limiter.ar(GVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFTri.kr(1).range(1/2, 0.25)), 150, 5)*8, 0.99)*LFPulse.kr(t.tempo/4)}

a[\anne1].play(0,2)

a[\anne].stop;





a.clear(3)









