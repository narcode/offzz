//// The oppo$ite of cozy

///
///
//
// Pandas dont fuck? -> play them bitches this song
///
//
//

/// Fuck -> 1 ---> 5 + cut + snare on 4


////////////////////////////////
// LIVE CODING - F$CK THI$ UP //
////////////////////////////////

/// check charcoal snare

//// Live coding:
a[\hi3].play(0);

a[\hi3]={Limiter.ar(LPF.ar(HPF.ar(RLPF.ar(FreeVerb.ar(WhiteNoise.ar(Saw.ar("d4".namecps)).dup+SinOsc.ar("c#5".namecps), 1, 0.1).distort, LFSaw.kr(t.tempo/4).range(LFPulse.kr(2).range(1,3 /2)*"c#8".namecps, "d4".namecps), 0.01), 50)*0.2*LFPulse.kr(t.tempo*Line.kr(2, 16, t.tempo/3), 0, LFPulse.kr(t.tempo*4).range(0.1, 0.2))*EnvGen.kr(Env.linen(0.01, [1, 0.3].choose, 0.01)), 1500), 0.3)};

//
a[\hi3] = {Limiter.ar(LPF.ar(HPF.ar(RLPF.ar(FreeVerb.ar(WhiteNoise.ar(Saw.ar("d4".namecps)).dup+SinOsc.ar("c#5".namecps), 1, 0.1).distort, LFSaw.kr(t.tempo/4).range(LFPulse.kr(1).range(1,1/2)*"c#8".namecps, "d4".namecps), 0.01), 50)*0.3*LFPulse.kr(t.tempo*Line.kr(22, 6, t.tempo/3), 0, LFPulse.kr(t.tempo*1/6).range(0.03, 0.01)), 2500), 0.3)};

Tdef(\me, {
		var rit = Pseq([4,1,4,3],inf).asStream;
	loop{
a[\hi3] = {Limiter.ar(LPF.ar(HPF.ar(RLPF.ar(FreeVerb.ar(WhiteNoise.ar(Saw.ar("d4".namecps)).dup+SinOsc.ar("c#5".namecps), 1, 0.1).distort, LFSaw.kr(t.tempo/4).range(LFPulse.kr(1).range(1,1/2)*"c#8".namecps, "d4".namecps), 0.01), 50)*0.3*LFPulse.kr(t.tempo*Line.kr(22, 6, t.tempo/3), 0, LFPulse.kr(t.tempo*1/9).range(15, 0.01)), 2500), 0.3)};
	(rit.next).wait;
	}
}).play;

Tdef(\me).stop;

// manual
a[\bubbledrum1] = {|time=0.3|Limiter.ar(GVerb.ar(LPF.ar(SinOsc.kr(Line.kr(4146, 5, time), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1/8, 0, 0.000001)), 100)*EnvGen.kr(Env.perc(0.01, 1)), 0.8,8)*0.3*EnvGen.kr(Env.perc(0.1, 1, 1)), 0.1)};

a[\bubbledrum1].play;

/// LC

////////////
//// finish:
a[\snare] = {GVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [[100, 600], [100, 1000, 900]], 0.9)*EnvGen.kr(Env.perc(0.01, 0.3)), 69, 2)*0.1};


a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [[100, 500, 1800]], 0.9), 0.3, 0.4)*0.2*LFNoise0.kr(t.tempo*2).range(0,2)*EnvGen.kr(Env.perc(0.001, 0.1).circle(t.tempo/48))};


///
// rit  /// first jump 90

/// diarrea, diarrea -->espermatozoid
t.tempo_(90/60);

t.tempo_(85/60);





