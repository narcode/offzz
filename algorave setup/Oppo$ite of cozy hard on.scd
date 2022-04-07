//// The oppo$ite of cozy

///
///
//
// Pandas dont fuck? -> play them bitches this song
///
//
//

// #includez:
~path = thisProcess.nowExecutingPath.dirname++"/";
(~path++"oppo$ite_tdefs.scd").load;
(~path++"panda_synths.scd").load;

/// Fuck -> 1 ---> 5 + cut + snare on 4
///////

// <LC this>
a = ProxySpace(s);
t = TempoClock.default.tempo_(125/60);
// <\LC this>

(
{
g = Group.head(s);
a.group_(g);
s.sync;
	"ProxySpace in head group...".postln;
Ndef(\limbd, {Limiter.ar(LPF.ar(HPF.ar(In.ar(40,2), 70), 4500), 1)!2}).play;
Ndef(\lims, {Limiter.ar(In.ar(30,2), 0.1)!2}).play;
Ndef(\limbd1, {Limiter.ar(LPF.ar(HPF.ar(In.ar(80,1), 70), 3500), 0.1)!2}).play();
}.fork;
);

/*/*Tdef(\hi).quant_(1);
Tdef(\hi0).quant_(1);*/
( //quantz
Tdef(\snare).quant_(1);
Tdef(\bdrum).quant_(1);
Tdef(\bdrumf).quant_(1);
);*/

// a[\fx10] = {CombN.ar(In.ar(10,2), t.tempo/4, t.tempo/16, 0.6)*LFPulse.kr(t.tempo/16)};
// a[\fx10].play;
//Tdef(\brum10).clear

//// pre-play
(
a[\snare0].play(0,2);
a[\snare].play(0,2);
a[\snareE].play(30,2);

//a[\snare1].play(0);

a[\bdrum10].play(0,2);

// a[\bubbledrum1] = {GVerb.ar(LPF.ar(SinOsc.kr(Line.kr(4146, 5, 0.3), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1/8, 0, 0.000001)), 1300)*EnvGen.kr(Env.perc(0.1, 1)), 0.8,8)*0.01*EnvGen.kr(Env.perc(0.1, 1))};

a[\bubbledrum1].play(0);
a[\bubbledrumL].play(0);

a[\hi2].play;
a[\bubble10].play(60);   //// USE FOR 3RD VERSE	!!!
);

/// evaluate after .play
a[\bubbledrum1] = {GVerb.ar(LPF.ar(SinOsc.kr(Line.kr(4146, 5, 0.3), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1/8, 0, 0.000001)), 1300)*EnvGen.kr(Env.perc(0.1, 1)), 0.8,8)*0.01*EnvGen.kr(Env.perc(0.1, 1))};

//////////////
// START
//////////////

(
Ndef(\bubble10,{SinOsc.ar(Phasor.ar(LFPulse.kr(t.tempo*1/4), 1/80, 60, ["eb4".namecps, "d5".namecps]*4)) * 0.2 * EnvGen.kr(Env.linen(0.01, 0.0, 0.1).circle(t.tempo*1/100))*LFPulse.kr(t.tempo*16)}).play(60, group:g, addAction: \addToHead); // 1/4
//or: 3
t.beats_(0);
(
t.playNextBar({
	// Tdef(\hi).stop;	Tdef(\hi2).stop; Tdef(\bdrumf).stop;
	Tdef(\hi0).play;
	a[\fx10] = {CombN.ar(In.ar(60,2), t.tempo/4, t.tempo/10, 2)*LFPulse.kr(t.tempo/1).range(0.01,1).lag(0.2)*0.3};
	Tdef(\snare, {
		// a[\bubble10].play(60);
	y = Pseq([0,1], inf).asStream;
	w = Pbrown(0.1, 0.5).asStream; // hi=2
		4.do({|i|
			i.postln;
		a[\snare1].play(y.next,1);
		1.wait;
	    a[\fx10].play;
			a[\snare] = {Limiter.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, 1000], 0.9), 0.3, 0.4)*0.7*EnvGen.kr(Env.perc(0.01, 0.4)), 0.3)};
		1.wait;
			a[\snare1] = {Limiter.ar(Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 1700], 0.1),0.4, 0.4)*0.1*EnvGen.kr(Env.perc(0.1, 0.2))]), 0.9)};
/*		0.5.wait;
		a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 700], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, w.next))])};*/
		1.wait;
			a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), 600, 0.9), 0.3, 0.4)*0.7*EnvGen.kr(Env.perc(0.01, 0.4))};
		1.wait;
			if((i.odd) && (i<3)) {a[\fx10].stop(0); } {a[\fx10].stop(0.69); };
			"stoping bubbles".postln;
a[\hi].stop;
		});
		Tdef(\hi0).stop;
		4.wait;

		// LAST BREAK $$$
a[\bubbledrumL] = {|time=0.3|Limiter.ar(GVerb.ar(LPF.ar(SinOsc.kr(Line.kr(4146, 5, time), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1/8, 0, 0.000001)), 100)*EnvGen.kr(Env.perc(0.01, 1)), 0.8,8)*0.5*EnvGen.kr(Env.perc(0.1, 1, 1)), 0.1)};
a[\snare] = {Limiter.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, 1000], 0.9), 0.3, 0.4)*2*EnvGen.kr(Env.perc(0.01, 0.4)), 0.4)};
		// a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(["d3".namecps, "e3".namecps(40)]/3,0, EnvGen.kr(Env.perc(0.01, 0.2))), [1000, 900], 0.9), 0.1, 0.6)*18*EnvGen.kr(Env.perc(0.01, 0.2))};
	}).play;

	//bdrum
	Tdef(\bdrum0, {
	z = Pseq([40], inf).asStream;
	4.do{
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*1.15*EnvGen.kr(Env.perc(0.01, 0.3))!2};
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
			2.wait;
			 a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*1.15*EnvGen.kr(Env.perc(0.01, 0.3))!2};
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
0.5.wait;
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*1.15*EnvGen.kr(Env.perc(0.01, 0.3))!2};
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
			(1.5).wait;
	}
}).play;
});
);

// VERSE 1
(
t.sched(20, { // 5*4
(
	(
a[\hi].play;
Tdef(\hi).play;

Tdef(\snare, {
	y = Pseq([-1,1], inf).asStream;
	w = Pbrown(0.1, 0.5).asStream; // hi=2
	2.do({|i|
		7.do({
			a[\fx10].play;
			1.wait;
		a[\snare1].play(y.next,1);
		a[\snare].play;	a[\snare0].play;
		a[\snare0] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(140, EnvGen.kr(Env.perc(0.01, 0.4))), [360, 480], 0.9), 1, 1)*8*EnvGen.kr(Env.perc(0.001, 0.1))};
					a[\snare] = {Limiter.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 1800].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3)), 0.2)}; a[\fx10].stop;
		1.wait;
	// a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [900, 1100], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, 0.2))])};
		//0.5.wait;
					a[\snare1] = {Limiter.ar(Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 700], 0.1),0.4, 0.4)*1*EnvGen.kr(Env.perc(0.01, w.next))]), 0.1)};
		1.wait;
					a[\snare] = {Limiter.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1000, 1000, 900].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3)), 0.1)};
		1.wait;
		});
		///////-------->//////// variation
				if(i==0) {
		1.5.wait;
		a[\snare0] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(140, EnvGen.kr(Env.perc(0.01, 0.4))), [360, 480], 0.9), 1, 1)*8*EnvGen.kr(Env.perc(0.001, 0.1))};
					a[\snare] = {Limiter.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 800].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3)), 0.2)};
			1.wait;
					a[\snare] = {Limiter.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1000, 1000, 900].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3)), 0)};
		0.5.wait;
					a[\snareE] = {Limiter.ar(CombN.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(1110, EnvGen.kr(Env.perc(0.01, 0.4))), [1600, [900, 230].choose], 0.1), 0.6, 0.7)*5*LFNoise0.kr(t.tempo*25).range(0,1)*EnvGen.kr(Env.perc(0.01, 0.001).circle(t.tempo/9))*EnvGen.kr(Env.linen(0.2, 0.9, 0.5)), t.tempo/2, t.tempo/Line.kr(2, 82, 4), 5), 0.05)};
					(1).wait; } {4.wait;
					a[\snare0] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(140, EnvGen.kr(Env.perc(0.01, 0.4))), [360, 480], 0.9), 1, 1)*8*EnvGen.kr(Env.perc(0.001, 0.1))};
					a[\snare] = {Limiter.ar(FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 800].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3)), 0.2)};

				};
		});
	}).play;
	);
(
Tdef(\bdrum10, {
	z = Pseq([40], inf).asStream;
	15.do({
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*1*EnvGen.kr(Env.perc(0.01, 0.3))!2};
		1.wait;
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*1*EnvGen.kr(Env.perc(0.01, 0.3))!2};
2.wait;
a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*1*EnvGen.kr(Env.perc(0.01, 0.3))!2};
			0.5.wait;
a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*1*EnvGen.kr(Env.perc(0.01, 0.3))!2};
			0.5.wait;
	})
	}).play; // quant_(1)
	);
// bfart
	(
		Tdef(\bdrumf, {
		//v = Pseq([40, 80, 80, "ab4".namecps, 60], inf).asStream;
		15.do({|i|
				a[\bubbledrum1] = {Limiter.ar(LPF.ar(SinOsc.kr(Line.kr(60, 5, 0.1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.000001)), 8600)*EnvGen.kr(Env.perc(0.01, 0.3)), 0.8)};
		2.5.wait;
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
				a[\bubbledrum1] = {Limiter.ar(LPF.ar(SinOsc.kr(Line.kr(80, 40, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.00001)), 460)*EnvGen.kr(Env.perc(0.1, 0.2)), 0.6)};
			0.5.wait;
a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr("ab4".namecps, 10, 1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*8, 0, 0.0001)), 200)*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
//1.wait;
			if(i==14) {a[\hi2].stop; a[\hi].stop;}
		});
	}).play;
	);
	);
});
);

//Tdef(\bdrumf).clear;   // ----> ¿?


// CHORUS
(
t.sched((16+4)*4, {
	(
	a[\hi].play;  /// ¿¿¿???
	Tdef(\hi).play;
		( // snare
	Tdef(\snare, {
		// a[\bubble10] = {var in = SinOsc.ar(Phasor.ar(LFPulse.kr(t.tempo*1/16), 1/80, 60, ["eb4".namecps, "d5".namecps]*4)) * 0.1; in * EnvGen.kr(Env.linen(0.01, 0.01, 0.1).circle(t.tempo*1/100))*LFPulse.kr(t.tempo*40)}; // 1/4
				// a[\fx10] = {CombN.ar(In.ar(10,2), t.tempo/4, t.tempo/16, 0.6)*LFPulse.kr(t.tempo/1).range(0.01,1).lag(0.2)};
		// a[\bubble10].play;
	a[\fx10].play;
	y = Pseq([0,1]+30, inf).asStream;
	w = Pbrown(0.1, 0.5).asStream; // hi=2
		8.do({
		a[\snare1].play(y.next, 1);
		1.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 900].choose], 0.9), 0.3, 0.4)*2*EnvGen.kr(Env.perc(0.01, 0.4))};
		1.wait;
		a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 1700], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, 0.2))])};
/*		0.5.wait;
		a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 700], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, w.next))])};*/
		1.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 900].choose], 0.9), 0.3, 0.4)*1*EnvGen.kr(Env.perc(0.01, 0.4))};
		1.wait;
a[\fx10].stop;
a[\hi].stop;
		});
		3.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 1300].choose], 0.9), 0.3, 0.4)*2*EnvGen.kr(Env.perc(0.01, 0.4))};
		// a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(["d3".namecps, "e3".namecps(40)]/3,0, EnvGen.kr(Env.perc(0.01, 0.2))), [1000, 900], 0.9), 0.1, 0.6)*18*EnvGen.kr(Env.perc(0.01, 0.2))};
	}).play;
		);
	//bdrum
	Tdef(\bdrum10, {
	z = Pseq([40], inf).asStream;
	8.do{
				a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*[5,5]*EnvGen.kr(Env.perc(0.01, 0.3))};
			2.wait;
			 a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*[5,5]*EnvGen.kr(Env.perc(0.01, 0.3))};
0.5.wait;
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*[5,5]*EnvGen.kr(Env.perc(0.01, 0.3))};
			(1.5).wait;
	}
}).play;
	// faartdrum
	Tdef(\bdrumf, {
		8.do({
			a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(60, 5, 0.1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.000001)), 8600)*EnvGen.kr(Env.perc(0.01, 0.3))};
		1.wait;
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(40, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
		1.wait;
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr("ab4".namecps, 10, 1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*8, 0, 0.0001)), 200)*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 40, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.00001)), 460)*EnvGen.kr(Env.perc(0.1, 0.2))};
		(1.5).wait;
	});
	}).play;
	);
});
);

// verse 2
t.sched(29*4 ,{ //30*4
		//{
a[\fx10].play;
a[\hi].play;
Tdef(\hi).play;
	(
Tdef(\snare, {
	y = Pseq([-1,1], inf).asStream;
	w = Pbrown(0.1, 0.5).asStream; // hi=2
	2.do({
		7.do({
			a[\fx10].play;
			1.wait;
		a[\snare1].play(y.next,1);
		a[\snare].play;	a[\snare0].play;
		a[\snare0] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(140, EnvGen.kr(Env.perc(0.01, 0.4))), [360, 480], 0.9), 1, 1)*8*EnvGen.kr(Env.perc(0.001, 0.1))};
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 1800].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))}; a[\fx10].stop;
		1.wait;
	// a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [900, 1100], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, 0.2))])};
		//0.5.wait;
		a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 700], 0.1),0.4, 0.4)*1*EnvGen.kr(Env.perc(0.01, w.next))])};
		1.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1000, 1000, 900].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
		1.wait;
		});
		///////-------->//////// bar 4
		1.5.wait;
		a[\snare0] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(140, EnvGen.kr(Env.perc(0.01, 0.4))), [360, 480], 0.9), 1, 1)*8*EnvGen.kr(Env.perc(0.001, 0.1))};
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 1800].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
			1.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1000, 1000, 900].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
				a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), XLine.kr(3800, [500, 2800], 0.4), 0.6), 0.3, 0.4)*1*LFNoise0.kr(t.tempo*40).range(0,2)*EnvGen.kr(Env.perc(0.001, 0.1).circle(t.tempo/48))*EnvGen.kr(Env.perc(0.1, t.tempo))};
	   (1).wait;
			// a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [5600, 1700], 0.9), 0.3, 0.4)*2*LFNoise0.kr(t.tempo*3).range(0,2)*EnvGen.kr(Env.perc(0.001, 0.01).circle(t.tempo/18))};
			});
	}).play;
	);

Tdef(\bdrum10, {
	z = Pseq([40], inf).asStream;
	15.do({
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*0.5*EnvGen.kr(Env.perc(0.01, 0.3))};
		1.wait;
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
2.wait;
a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
			0.5.wait;
a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
			0.5.wait;
		})
	}).play; // quant_(1)
// bfart
		Tdef(\bdrumf, {
		//v = Pseq([40, 80, 80, "ab4".namecps, 60], inf).asStream;
		15.do({|i|
			a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(60, 5, 0.1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.000001)), 8600)*EnvGen.kr(Env.perc(0.01, 0.3))};
		2.5.wait;
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
					a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 40, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.00001)), 460)*EnvGen.kr(Env.perc(0.1, 0.2))};
			0.5.wait;
a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr("ab4".namecps, 10, 1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*8, 0, 0.0001)), 200)*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
			// a[\bubbledrum] = {SinOsc.kr(Line.kr(80, 10, 0.1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.01))*EnvGen.kr(Env.perc(0.01, 0.3))};
//1.wait;
			if(i==14){a[\hi].stop; a[\hi2].stop; a[\snare].stop;}
		});
	}).play; // //???quant = 1
});

 //chrous 2
(
t.sched(44*4,{
	a[\hi].play;
	Tdef(\hi).play;
	a[\snare].play;

	Tdef(\snare, {
		// a[\bubble10] = {var in = SinOsc.ar(Phasor.ar(LFPulse.kr(t.tempo*1/16), 1/80, 60, ["eb4".namecps, "d5".namecps]*4)) * 0.1; in * EnvGen.kr(Env.linen(0.01, 0.01, 0.1).circle(t.tempo*1/100))*LFPulse.kr(t.tempo*40)}; // 1/4
		// a[\fx10] = {CombN.ar(In.ar(10,2), t.tempo/4, t.tempo/16, 0.6)*LFPulse.kr(t.tempo/1).range(0.01,1).lag(0.2)};
		// a[\bubble10].play;
		a[\fx10].play;
		y = Pseq([0,1]+30, inf).asStream;
		w = Pbrown(0.1, 0.5).asStream; // hi=2
		8.do({
			a[\snare1].play(y.next,1);
			1.wait;
			a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [1100, [1200, 1000, 600].choose], 0.9), 0.3, 0.4)*2*EnvGen.kr(Env.perc(0.01, 0.4))};
			1.wait;
			a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 1700], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, 0.2))])};
			/*		0.5.wait;
			a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 700], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, w.next))])};*/
			1.wait;
			a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 1300].choose], 0.9), 0.3, 0.4)*1*EnvGen.kr(Env.perc(0.01, 0.4))};
			1.wait;
			a[\fx10].stop;
			a[\hi].stop;
		});
		3.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 900].choose], 0.9), 0.3, 0.4)*2*EnvGen.kr(Env.perc(0.01, 0.4))};
		// a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(["d3".namecps, "e3".namecps(40)]/3,0, EnvGen.kr(Env.perc(0.01, 0.2))), [1000, 900], 0.9), 0.1, 0.6)*18*EnvGen.kr(Env.perc(0.01, 0.2))};
	}).play;
	//bdrum
	Tdef(\bdrum10, {
		z = Pseq([40], inf).asStream;
		8.do{
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*[5,5]*EnvGen.kr(Env.perc(0.01, 0.3))};
			2.wait;
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*[5,5]*EnvGen.kr(Env.perc(0.01, 0.3))};
			0.5.wait;
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*[5,5]*EnvGen.kr(Env.perc(0.01, 0.3))};
			(1.5).wait;
		}
	}).play;
	// faartdrum
	Tdef(\bdrumf, {
		8.do({
			a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(60, 5, 0.1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.000001)), 8600)*EnvGen.kr(Env.perc(0.01, 0.3))};
			1.wait;
			a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(40, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
			1.wait;
			a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr("ab4".namecps, 10, 1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*8, 0, 0.0001)), 200)*EnvGen.kr(Env.perc(0.01, 0.3))};
			0.5.wait;
			a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 40, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.00001)), 460)*EnvGen.kr(Env.perc(0.1, 0.2))};
			(1.5).wait;
		});
	}).play;
});
);

// end
(
t.sched((45+7)*4, {
		//{
a[\fx10].play;
a[\hi].play;
Tdef(\hi).play;
	(
Tdef(\snare, {
	y = Pseq([-1,1], inf).asStream;
	w = Pbrown(0.1, 0.5).asStream; // hi=2
	loop{
		7.do({
			a[\fx10].play;
			1.wait;
		a[\snare1].play(y.next,1);
		a[\snare].play;	a[\snare0].play;
		a[\snare0] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(140, EnvGen.kr(Env.perc(0.01, 0.4))), [360, 480], 0.9), 1, 1)*8*EnvGen.kr(Env.perc(0.001, 0.1))};
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 1800].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))}; a[\fx10].stop;
		1.wait;
	// a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [900, 1100], 0.1),0.4, 0.4)*EnvGen.kr(Env.perc(0.1, 0.2))])};
		//0.5.wait;
		a[\snare1] = {Mix([FreeVerb.ar(RLPF.ar(WhiteNoise.ar(LFPulse.kr(20, 0, 0.5)), [600, 700], 0.1),0.4, 0.4)*1*EnvGen.kr(Env.perc(0.01, w.next))])};
		1.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1000, 1000, 900].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
		1.wait;
		});
		///////-------->//////// bar 4
		1.5.wait;
		a[\snare0] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(140, EnvGen.kr(Env.perc(0.01, 0.4))), [360, 480], 0.9), 1, 1)*8*EnvGen.kr(Env.perc(0.001, 0.1))};
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1200, 1000, 1800].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
			1.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [1000, 1000, 900].choose], 0.9), 0.6, 1)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
		a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [600, [100, 5000, 1800].choose], 0.9), 0.3, 0.4)*0.01*LFNoise0.kr(t.tempo*2).range(0,2)*EnvGen.kr(Env.perc(0.001, 0.1).circle(t.tempo/1))};
	   (1).wait;
			// a[\snare] = {FreeVerb.ar(BPF.ar(WhiteNoise.ar(1.5)+SinOsc.ar(40, EnvGen.kr(Env.perc(0.01, 0.4))), [5600, 1700], 0.9), 0.3, 0.4)*2*LFNoise0.kr(t.tempo*3).range(0,2)*EnvGen.kr(Env.perc(0.001, 0.01).circle(t.tempo/18))};
	}
	}).play;
	);

Tdef(\bdrum10, {
	z = Pseq([40], inf).asStream;
	loop{
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*0.5*EnvGen.kr(Env.perc(0.01, 0.3))};
		1.wait;
			a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
2.wait;
a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
			0.5.wait;
a[\bdrum10] = {LPF.ar(SinOsc.ar(Line.kr(z.next, 40, 0.1), 0)+ WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.1)) ), 180)*2*EnvGen.kr(Env.perc(0.01, 0.3))};
			0.5.wait;
	}
	}).play; // quant_(1)
// bfart
		Tdef(\bdrumf, {
		//v = Pseq([40, 80, 80, "ab4".namecps, 60], inf).asStream;
		loop{
			a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(60, 5, 0.1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.000001)), 8600)*EnvGen.kr(Env.perc(0.01, 0.3))};
		2.5.wait;
		a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 5, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*1, 0, 0.000001)), 90)*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
					a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr(80, 40, 0.5), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.00001)), 460)*EnvGen.kr(Env.perc(0.1, 0.2))};
			0.5.wait;
a[\bubbledrum1] = {LPF.ar(SinOsc.kr(Line.kr("ab4".namecps, 10, 1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*8, 0, 0.0001)), 200)*EnvGen.kr(Env.perc(0.01, 0.3))};
		0.5.wait;
			// a[\bubbledrum] = {SinOsc.kr(Line.kr(80, 10, 0.1), mul:[0.5, 0.5])+BrownNoise.ar(LFPulse.kr(t.tempo*32, 0, 0.01))*EnvGen.kr(Env.perc(0.01, 0.3))};
//1.wait;
	};
	}).play; // //???quant = 1
});

// amin
);

);











