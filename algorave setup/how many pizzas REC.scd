//// verse:

//// intro 8 bars -> space intro?
//// real chorus 8 -> needs lead and banger
//// 16 bars verse -> needs bass
//// chorus 8 -> needs lead and banger
//// verse 16 ->
//// c section -> DONE (8~16 bars)
//// verse 16 ->

t = TempoClock.default.tempo_(90/60);
~mamp=1;

// TODO: verse breaks (random?)
//       verse CombC G pizza piiing
//       intro


b = ();

(15.do{|i|
	var num = i+1;
	b[num] = Buffer.read(s, "/Users/fina/Desktop/Panda Zooicide/How many Pizzas?/pizza"++num++".aif");
});

(
SynthDef(\ppizza, {|forward = 2.5, reverse=1, amp=0.7, buf=15, out=0, rl=1, at=0.1, gate=1, ratel=0.5, rateh = 6, cutV=0, ratecut=2, speed=4, nspeed=0.25|
	var env = EnvGen.kr(Env.asr(at, 1, rl), gate, doneAction: 2);
	var sound = (Gendy2.ar(1, 0.1, mul: LFSaw.kr(t.tempo*nspeed).range(0, 0.1))+PlayBuf.ar(2, buf, LFNoise1.kr(LFNoise0.kr(t.tempo).range(t.tempo*ratel, t.tempo*rateh).round(1)).range(reverse, forward), loop: 1))*LFPulse.kr(LFNoise0.kr(t.tempo*speed).range(8, 1).round(1))*amp*LFNoise0.kr(t.tempo*ratecut).range(cutV, 1).round(1);
	Out.ar(out, sound*env);
}).store;


SynthDef(\pingInM, {|amp=0.6, out=50, pos=1|
	var sound = LPF.ar(Resonz.ar(SinOsc.ar("gb7".namecps)*Gendy1.ar(0.1, 0.1, 0.7, mul: EnvGen.kr(Env.perc(0.01, 0.1), doneAction:2)), ["gb5".namecps, "db5".namecps]*LFSaw.kr(1/2).range(1, 4), 0.001)*171, 1978);
	sound = Mix.ar(sound);
	Out.ar(out, sound*amp);
}).store;

SynthDef(\pingRev, {|hi=8456, out=50, in=30, amp=1, rl=4|
	var sound = HPF.ar(CombC.ar(In.ar(in,1), t.tempo/2, t.tempo/2, t.tempo*rl), hi);
	Out.ar(out, sound*amp);
}).store;

/// postFX bass:
SynthDef(\postBass, {|in=10, out=0, gain=9, amp=1|
var sound =	Limiter.ar(LPF.ar(HPF.ar(Compander.ar(In.ar(in,1), WhiteNoise.ar(1), 0.5, 1, 9), 40), 200), 0.99);
	Out.ar(out, sound*amp);
}).store;

//lead
SynthDef(\leadp, {|out=40, amp=1, gate=1, rl=0.5, at=0.1, rate=0.25|
	var env = EnvGen.kr(Env.asr(at, 1, rl), gate, doneAction:2);
	var sound = HPF.ar(Splay.ar(SinOsc.ar(["g4".namecps*LFSaw.kr(8).range(1/2, 6/5),"b3".namecps]) + FSinOsc.ar("f3".namecps, mul: 0.2)).tanh * LFSaw.kr(t.tempo*rate).range(0,1).lag(0.1)*LFNoise1.kr(t.tempo*6).range(0.5,1), 690) * 1.5*amp;
	Out.ar(out, sound*env);
}).store;

SynthDef(\verblead, {|out=0, in=40, amp=0.6, gate=1, rl=0.5|
		var env = EnvGen.kr(Env.asr(0.1, 1, rl), gate, doneAction:2);
	var sound = GVerb.ar(In.ar(in,2), 13, 4).distort*amp;
	Out.ar(out, sound!2*env);
}).store;

SynthDef(\bassV0, {|amp=0.6, length=2, freq1=61, freq2=30, out=22|
	var sound = Splay.ar(SinOsc.ar([freq1, freq2]), 0)*amp;
	var env = EnvGen.kr(Env.perc(0.01, t.tempo*length), doneAction: 2);
	Out.ar(out, sound*env);
}).store;

SynthDef(\bassV, {|amp=0.6, length=2, freq1=61, freq2=30, out=22, modstart=0.5, modsust=2, moddecay=1.5, sust=1.5, dec=1|
	var sound = Splay.ar(SinOsc.ar([freq1,freq2]).distort*LFTri.kr(Line.kr(t.tempo*modstart, t.tempo*modsust, t.tempo*moddecay)), 0)*amp;
	var env = EnvGen.kr(Env.linen(0.01, t.tempo*sust, t.tempo*dec), doneAction:2);
	Out.ar(out, sound*env);
}).store;

SynthDef(\bassV1, {|amp=0.6, length=2, freq1=61, freq2=30, out=22, modstart=0.25, modend=0.25, sust=1.5, dec=1|
	var sound = Splay.ar(SinOsc.ar([freq1,freq2]*EnvGen.kr(Env([1, 9/8], [t.tempo*modstart, t.tempo*modend]))).distort, 0)*amp;
	var env = EnvGen.kr(Env.linen(0.1, t.tempo*sust, t.tempo*dec), doneAction: 2);
	Out.ar(out, sound * env);
}).store;

SynthDef(\bassVPulse, {|amp=0.6, rate=2, freq1=61, freq2=30, out=22, sust=1.5, dec=0.1|
	var sound = Splay.ar(SinOsc.ar([freq1,freq2]).distort*LFPulse.kr(t.tempo*rate), 0)*amp;
	var env = EnvGen.kr(Env.linen(0.1, t.tempo*sust, dec) , doneAction: 2);
	Out.ar(out, sound*env);
}).store;

);

/*(
t.playNextBar{
~pRevL = Synth.tail(s, \pingRev, [\amp, 1, \in, 60, \out, 8]);
~pRevR = Synth.tail(s, \pingRev, [\in, 61, \out, 9, \amp, 1]);
};
);

~postB = Synth.tail(s, \postBass, [\in, 20, \out, 14, \gain, 9, \amp, 2]);
//~leadVerb = Synth.tail(s, \verblead)

~postB.free; ~leadVerb.free; ~pRevL.free;~pRevR.free;*/
///              ///
///    //////  ///////   ///////    //////
///   ///////   ///      //   //   //  //
///   ///  //  ///       //       //  //
///   ///  //  ///////  ///      //////

// i like -->  4, 5, 6, 7, 8, 11, 12, 14  | 9 = anchovies, 11 = presentator
// for intro --> 11, 4, 12, 15
/*~sx3 = Synth(\ppizza, [\buf, b[15], \reverse, -2, \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);
~sx3.set(\rateh, 1/2, \cutV, 1, \ratecut, 1, \ratel, 1/2, \speed, 1, \nspeed, 1/16, \reverse, -2, \forward, 2.5);
~sx3.release;

~sx1 = Synth(\ppizza, [\buf, b[11], \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);
~sx1.set(\rateh, 1/8, \cutV, 0.5, \ratecut, 4, \ratel, 1/2, \speed, 12, \nspeed, 1/8);

~sx2 = Synth(\ppizza, [\buf, b[12], \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);
~sx2.set(\rateh, 1/8, \cutV, 0.5, \ratecut, 4, \ratel, 1/2, \speed, 12, \nspeed, 1/8);

~sx2 = Synth(\ppizza, [\buf, b[4], \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);
~sx2.set(\rateh, 1/8, \cutV, 0.5, \ratecut, 4, \ratel, 1/2, \speed, 12, \nspeed, 1/8);


~sx2 = Synth(\ppizza, [\buf, b[12], \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);

~sx2.set(\rateh, 4, \buf, b[12], \cutV, 0.4, \ratecut, 8, \ratel, 2, \speed, 8, \nspeed, 1/8, \reverse, 1, \forward, 1.5, \amp, 0.5);

~sx2.set(\buf, b[15], \reverse, -2, \ratel, 1/2, \rateh, 6, \cutV, 0, \ratecut, 4, \speed, 3, \nspeed, 1/8, \forward, 6)*/

// variation more hiphop
(t.playNextBar{
	Tdef(\zero, {
		var amp=0.4, out=24, rl=2;
		x = Pseq([0.75, 0.75,0.75, 0.25, 0.5, 0.5, 0.25, 0.25]*1, inf).asStream;
		loop{
			Ndef(\pizza, {amp*SinOsc.ar(["eb3".namecps, "gb3".namecps, "b3".namecps]*2)*EnvGen.kr(Env.perc(0.01, rl))}).play(out,2); //0.2
			(x.next).wait;
			// Ndef(\pizza, {amp*GVerb.ar(SinOsc.ar(["eb3".namecps, "gb3".namecps, "b3".namecps]))*EnvGen.kr(Env.perc(0.01, 0.2))}).play(0,2);
			Ndef(\pizzaL, {amp*SinOsc.ar(["eb3".namecps, "gb3".namecps, "b3".namecps])*EnvGen.kr(Env.perc(0.01, rl))}).play(out+2,2);
			(x.next).wait;
			Ndef(\pizza, {amp*SinOsc.ar(["eb3".namecps, "gb3".namecps, "b3".namecps])*EnvGen.kr(Env.perc(0.01, rl))}).play(out,2);
			(x.next).wait;
			Ndef(\pizzaL, {amp*SinOsc.ar(["eb3".namecps, "gb3".namecps, "b3".namecps])*EnvGen.kr(Env.perc(0.01, rl))}).play(out+2,2);
			(x.next).wait;
		};
	}).play;
});

(t.playNextBar{
	Tdef(\hhIntroD, {
		var out = Pseq([Pseq([31], 4), Pseq([31], 4)], inf).asStream;
		var rel = Pseq([Pwhite(0.1, 0.01, 10), Pwhite(0.01, 0.03, 6)], inf).asStream;
		z = Pseq([Pseq([1/4], 8), Pseq([1], 1), Pseq([1/4], 1), Pseq([1/8], 6)], inf).asStream;

		loop{
			Ndef(\hhID, {~mamp * 1 *HPF.ar(WhiteNoise.ar(1), 15899.rrand(3456))*EnvGen.kr(Env.perc(0.01, rel.next ))}).play(out.next, 1);
			(z.next).wait;
		};
	}).play;
});

(t.playNextBar{
~pRevRI = Synth.tail(s, \pingRev, [\in, 31, \out, 6, \amp, Ndef(\kr, {Line.kr(0,1, t.tempo*2)})]);
~pRevI = Synth.tail(s, \pingRev, [\in, 31, \out, 7, \amp, Ndef(\kr2, {Line.kr(0,1, t.tempo*4)})]);
	Tdef(\hhIntro, {
		var out = Pseq([Pseq([4], 4), Pseq([5], 4)], inf).asStream;
		var rel = Pseq([Pwhite(0.4, 0.01, 10), Pwhite(0.01, 0.03, 6)], inf).asStream;
		z = Pseq([Pseq([1], 8), Pseq([1], 1), Pseq([1/4], 1), Pseq([1], 6)], inf).asStream;

		loop{
			Ndef(\hhI, {~mamp * 1 *HPF.ar(WhiteNoise.ar(1), 15899.rrand(3456))*EnvGen.kr(Env.perc(0.01, rel.next ))}).play(out.next, 1);
			(z.next).wait;
		};
	}).play;
});


(t.playNextBar{Tdef(\introSnare, {
		loop{
			1.wait;
	Ndef(\snare2, {~mamp * 2 * LPF.ar(WhiteNoise.ar(1), 1897)*EnvGen.kr(Env.perc(0.01, 0.2))}).play(2,2);
			(1).wait;
	}}).play;
	Ndef(\gverbitch, {GVerb.ar(In.ar(24)*LFPulse.kr(LFNoise1.kr(t.tempo*1).range(1, 14)), 10, 0.2)*0.5}).play(8).quant_(1);
Ndef(\combbitch, {Pan2.ar(LFPulse.kr(t.tempo*2).range(0, 1).lag(0.2) * 8 * CombN.ar(In.ar(16)+FreqShift.ar(In.ar(26), LFSaw.kr(t.tempo*2).range(200, 121).lag(0.4)).distort, t.tempo/2, t.tempo/4, 1).distort*0.2, LFPulse.kr(t.tempo*1/2).range(-1, 1).lag(0.2))*LFPulse.kr(t.tempo*1).range(0,1).lag(0.2)}).play(10).quant_(1);
});

~pRevRI.free; ~pRevI.free;

Ndef(\pizzaCh).play(1,1);


/*
(t.playNextBar{
	Tdef(\toVerse, {
	1.wait;
			Tdef(\zero).stop; 	Ndef(\combbitch).stop;
1.wait;
			Ndef(\gverbitch).stop;
	1.wait;
	1.wait;
		~sx2.release;
	}).play;
});*/

///              ///
///    //////  ///////   ///////    //////
///   ///////   ///      //   //   //  //
///   ///  //  ///       //       //  //
///   ///  //  ///////  ///      //////

~leadVerb = Synth.tail(s, \verblead, [\amp, 0.3, \in, 80, \out, 10]);

(t.playNextBar{
		Tdef(\toChorus, {
				~lead = Synth(\leadp, [\out, 80, \amp, Ndef(\krleadamp, {Line.kr(0, 1, t.tempo*2)}), \rate, Ndef(\krlead, {Line.kr(1/4, 2, t.tempo*8)})]);
		(4*7).wait;
		~lead.release;
		~sx2 = Synth(\ppizza, [\amp, 0, \out, 15, \buf, b[12], \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);
		Tdef(\hhIntro).stop;Tdef(\zero).stop;Tdef(\hhIntroD).stop;Tdef(\introSnare).stop;
1.wait;
		1.wait;
	~sx2.set(\rateh, 2, \buf, b[12], \cutV, 0.3, \ratecut, 8, \ratel, 2, \speed, 8, \nspeed, 1, \reverse, 1, \forward, 1, \amp, 2);
		Ndef(\line, {SinGrain.ar(Impulse.kr(t.tempo*19), 0.01, Line.kr(100, 3988, t.tempo*2))*1*EnvGen.kr(Env.perc(0.2, t.tempo*2))}).play(18,2);
~pRevL = Synth.tail(s, \pingRev, [\amp, 1, \in, 30, \out, 8]);
~pRevR = Synth. tail(s, \pingRev, [\in, 31, \out, 9, \amp, 1]);
~postB = Synth.tail(s, \postBass, [\in, 22, \out, 14, \gain, 9, \amp, 2]);
		2.wait;
		~sx2.release;
	}).play
});

/////   ////  /////     /////      ////   //////
///    ///   /  ///   //////   ///      //  //
////  //     ////     //   //   /////   //////
//////      ///////  //     / //////    //////////
(t.playNextBar{
	Tdef(\breakc, {
		Tdef(\hhIntro).stop;Tdef(\p).stop;
		~lead = Synth(\leadp, [\out, 80]);
		Tdef(\hh).play;Tdef(\bdrumC).play;Tdef(\snareCh).play;Tdef(\one).play;Tdef(\bassV).play;
		Tdef(\bassV).play; Tdef(\hit2).play;
	}).play;
});

// (t.playNextBar{
// 	Tdef(\break, {
// 		Tdef(\hhIntro).stop;Tdef(\p).stop; ~lead.release;
// 		Tdef(\hhC).play;Tdef(\bdrum).play;Tdef(\snareC).play;Tdef(\two).play;Tdef(\bass).play;Tdef(\p).play;
// 	}).play;
// });

(
(t.playNextBar{
		~pRevRI.free; ~pRevI.free; Tdef(\hhIntro).stop;

	Tdef(\two, {
		var amp=0.5;
		x = Pseq([Pseq([4], 4)], inf).asStream;
		loop{
			Ndef(\pizzaC, {~mamp * 1 * amp *Pulse.ar(80, 0.2, EnvGen.kr(Env.perc(0.01, 0.2)))+PinkNoise.ar(2)*GVerb.ar(SinOsc.ar(["db3".namecps, "f3".namecps, "b3".namecps]*9/8*LFTri.kr(t.tempo*8).range(1, 3/2))*EnvGen.kr(Env.perc(0.01, 0.2)), 114, t.tempo/2)}).play(12,2);
			(x.next).wait;
/*						Ndef(\pizza, {1*amp*Pulse.ar(180, 0.2, EnvGen.kr(Env.perc(0.01, 0.2)))+PinkNoise.ar(2)*GVerb.ar(SinOsc.ar(["db3".namecps, "f3".namecps, "b3".namecps]*LFTri.kr(t.tempo*8).range(1, 4))*EnvGen.kr(Env.perc(0.01, 0.2)), 144, t.tempo/2)}).play(0,2);
			(x.next).wait;*/
		};
	}).play;
});


t.playNextBar{
	Tdef(\p, {
	var outP = Pseq([30,31], inf).asStream;
	loop{
			//0.5.wait;
~ping = Synth.head(s, \pingInM, [\out, outP.next, \amp, 4]);
		8.wait;
}}).play;
};

(t.playNextBar{
Tdef(\snareC, {
		var out = 2;
		y = Pseq([0.75, 0.25, 2, 0.75, 0.25], inf).asStream;
	loop{
			(y.next).wait;
			Ndef(\snare0, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo*4).range(1287, 1797))*LFPulse.kr(t.tempo*4, width: 0.2)*EnvGen.kr(Env.linen(0.01, 0.1, 0.2))}).play(out,2);
			(y.next).wait;
			Ndef(\snare1, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo*8).range(1287, 1797))*LFPulse.kr(t.tempo*8, width: 0.2)*EnvGen.kr(Env.linen(0.01, 0.1, 0.2))}).play(out,2);
			(y.next).wait;
		Ndef(\snare2, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), 1897)*EnvGen.kr(Env.perc(0.01, 0.2))}).play(out,2);
			Ndef(\snare1, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFTri.kr(t.tempo*3).range(1287, 4797))*LFPulse.kr(t.tempo*4, width: 0.2)*EnvGen.kr(Env.linen(0.01, 0.1, 0.2))}).play(out,2);
			//Tdef(\hit2).play;
			(y.next).wait;
							(y.next).wait;

		            //if 1 loop:	//(y.next).wait;
/*			// Ndef(\snare0, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo*4).range(1287, 1797))*LFPulse.kr(t.tempo*4, width: 0.2)*EnvGen.kr(Env.linen(0.01, 0.1, 0.2))}).play(0,2);
			(y.next).wait;
						Ndef(\snare1, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo*8).range(1287, 1797))*LFPulse.kr(t.tempo*2, width: 0.2)*EnvGen.kr(Env.linen(0.01, 0.1, 0.2))}).play(0,2);
			(y.next).wait;
			(y.next).wait;
			Ndef(\snare0, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo*4).range(1287, 1797))*LFPulse.kr(t.tempo*4, width: 0.2)*EnvGen.kr(Env.linen(0.01, 0.1, 0.2))}).play(0,2);
			(y.next).wait;
		Ndef(\snare2, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), 1897)*EnvGen.kr(Env.perc(0.01, 0.2))}).play(0,2);
			Ndef(\snare1, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFTri.kr(t.tempo*3).range(1287, 4797))*LFPulse.kr(t.tempo*4, width: 0.2)*EnvGen.kr(Env.linen(0.01, 0.1, 0.2))}).play(0,2);
			//Tdef(\hit2).play;
			(y.next).wait;
			(y.next).wait;*/
	};
}).play;
});



(t.playNextBar{
	Tdef(\hhC, {
		var out = Pseq([Pseq([4], 4), Pseq([5], 4)], inf).asStream;
		z = Pseq([Pseq([1/2, 1/2, 1/2, 1/2], 1), Pseq([1/2, 0.25, 0.125, 0.125],1)], inf).asStream;
		loop{
			Ndef(\hhC, {~mamp * 2*HPF.ar(WhiteNoise.ar(1), 7899)*EnvGen.kr(Env.perc(0.01, 0.05.rrand(0.01)))}).play(out.next, 1);
			(z.next).wait;
		};
	}).play;
});

(t.playNextBar{
Tdef(\bass, {
		var freq = Pseq(["eb1".namecps, "cb1".namecps, "b0".namecps, "db0".namecps]*1, inf).asStream;
		var freqS = Pseq(["eb1".namecps, "cb1".namecps, "b0".namecps, "ab0".namecps]*1, inf).asStream;
		var rit = Pseq([2, 2.5, 1.5, 2], inf).asStream;
		var leg = Pxrand([1.5, 1, 0.75, 1/2, 0.2, 0.1, 0.6, 0.2]+0.3, inf).asStream;
		var legS = Pseq([0.8, 1, 0.75, 1/2, 0.2, 0.1, 0.6, 0.2]+0.3, inf).asStream;

		loop{
			Ndef(\bassC, {HPF.ar(LPF.ar(Saw.ar(freq.next).tanh, 280), 20)*LFPulse.kr(Line.kr(t.tempo*4, t.tempo*2, t.tempo/2))*EnvGen.kr(Env.perc(0.01, t.tempo*legS.next))*1}).play(14,2);
			Ndef(\bassS, {HPF.ar(SinOsc.ar(freqS.next).distort, 10)*LFPulse.kr(Line.kr(t.tempo*1/2, t.tempo*1, t.tempo/2))*EnvGen.kr(Env.perc(0.01, t.tempo*legS))*1}).play(15,2);
			(rit.next).wait;
		}
	}).play;
});

(t.playNextBar{
	Tdef(\bdrum, {
		loop{
						Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			2.wait;
			Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			0.5.wait;
			Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			0.5.wait;

			0.5.wait;
			Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			1.wait;
			Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.2)), 0.99)}).play(0,2);
			Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);

			0.5.wait;
			1.wait;
						Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.2)), 0.99)}).play(0,2);
1.5.wait;
						Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.2)), 0.99)}).play(0,2);
0.25.wait;
						Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.2)), 0.99)}).play(0,2);
0.25.wait;
		};
	}).play;
});
);


/////////      //
/////////      //
///           //                //                 /////////
///           //////    /////  ///////  //   //    ///
///          ///////   //  //  //   //  //   //     ///////
/////////   //    //   //  //  //       //   //       ////
/////////   //    //   /////   //       //////    ///////
(t.playNextBar{
	Tdef(\breakc, {
		1.wait;
		~lead.release;
		~leadVerb.release;
		Tdef(\bdrum).stop;Tdef(\bass).stop;
		1.wait;
		Tdef(\snareC).stop;Tdef(\two).stop; // special bass for break
		1.wait;
		Tdef(\hhC).stop;
		1.wait;
		~lead = Synth(\leadp, [\out, 80]);
		Tdef(\hh).play;Tdef(\bdrumC).play;Tdef(\snareCh).play;Tdef(\one).play;Tdef(\bassV).play;
	//	Ndef(\verb, {GVerb.ar(In.ar(40,2), 13, 4).distort*0.6}).play;
		~leadVerb = Synth.tail(s, \verblead, [\amp, 0.3, \in, 80, \out, 10]);
		Tdef(\bassV).play; Tdef(\hit2).play;
		Tdef(\hhC).stop;Tdef(\p).stop;
		//Tdef(\bass).play;
	}).play;
});

(
// hit on 2
(t.playNextBar{
Tdef(\hit2, {
	var out = Pseq([18,19], inf).asStream;
	inf.do{|i|
			//i = i+1;
		//1.wait;
			if (i%1==0) {Ndef(\narcode, {Saw.ar(["f4".namecps*LFTri.kr(t.tempo*4).range(9/8, 1), "f#4".namecps])* 1 * EnvGen.kr(Env.perc(t.tempo/2, 0.01))}).play(out.next,1);};
			if (i%8==0) {Ndef(\narcode, {Saw.ar(["g4".namecps*LFTri.kr(t.tempo*4).range(9/8, 1), "g#4".namecps])* 1  * EnvGen.kr(Env.perc(t.tempo/2, 0.1).circle)}).play(18,1);};
	2.wait;
	}
}).play;
});

(t.playNextBar{
	Tdef(\hh, {
		inf.do{|i|
			if (i%4==0) {
			Ndef(\hh, {HPF.ar(WhiteNoise.ar(1), 11899)*3*EnvGen.kr(Env.perc(0.01, 0.6))}).play(4,2);
			} {
			Ndef(\hh, {HPF.ar(WhiteNoise.ar(1), 11899)*2*EnvGen.kr(Env.perc(0.01, 0.2))}).play(4,2);
			};
			1.wait;
		}
	}).play;
});

// snare:
(t.playNextBar{
	Tdef(\one, {
		var amp=0.5;
		var out = Pseq([12,13], inf).asStream;
		x = Pseq([1], inf).asStream;
		loop{
				(x.next).wait;
			Ndef(\pizzaCh, {Mix.new([~mamp * 1*amp*Pulse.ar(80, 0.2, EnvGen.kr(Env.perc(0.01, 0.2)))+PinkNoise.ar(2)*GVerb.ar(SinOsc.ar(["db3".namecps, "f3".namecps, "b3".namecps]*9/8*LFTri.kr(t.tempo*8).range(1, 3/2))*EnvGen.kr(Env.perc(0.01, 0.2)), 114, t.tempo/2)])}).play(out.next,1);
			(x.next).wait;
/*						Ndef(\pizza, {1*amp*Pulse.ar(180, 0.2, EnvGen.kr(Env.perc(0.01, 0.2)))+PinkNoise.ar(2)*GVerb.ar(SinOsc.ar(["db3".namecps, "f3".namecps, "b3".namecps]*LFTri.kr(t.tempo*8).range(1, 4))*EnvGen.kr(Env.perc(0.01, 0.2)), 144, t.tempo/2)}).play(0,2);
			(x.next).wait;*/
		};
	}).play;
});

// bdrum
(t.playNextBar{
	Tdef(\bdrumC, {
		loop{
						Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			1.wait;
			// Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.2)), 0.99)}).play(0,2);
				1.wait;
			Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			0.5.wait;
			Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			0.5.wait;
						Ndef(\bdrum, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			1.wait;
		};
	}).play;
});

//snare:
(t.playNextBar{
Tdef(\snareCh, {
		var out = 2;
		y = Pseq([2], inf).asStream;
	loop{
			4.do{|i|
			(1).wait;
			Ndef(\snare0, {~mamp * 2 * LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo*4).range(1287, 1797))*EnvGen.kr(Env.linen(0.01, 0.2, 0.2))}).play(out,2);
			(y.next).wait;
			Ndef(\snare1, {~mamp * 2 * LPF.ar(WhiteNoise.ar(1), LFNoise0.kr(t.tempo*8).range(1287, 1797))*EnvGen.kr(Env.linen(0.01, 0.2, 0.2))}).play(out,2);
			(y.next).wait;
		Ndef(\snare2, {~mamp * 2 * LPF.ar(WhiteNoise.ar(1), 1897)*EnvGen.kr(Env.perc(0.01, 0.8))}).play(out,2);
				if (i == 3) {
		Ndef(\snare1, {~mamp * 2*LPF.ar(WhiteNoise.ar(1), LFTri.kr(t.tempo*3).range(1287, 6797))*LFPulse.kr(t.tempo*2, width: 0.2).range(0,1)*EnvGen.kr(Env.linen(0.01, t.tempo/2, 0.2))}).play(out,2);
				};
				1.wait;
			}
				};
}).play;
});

// bass:
(t.playNextBar{
	Tdef(\bassV, {
		var out = 22;
		loop{
			Ndef(\bdrumB, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
			// Ndef(\bassV0, {Splay.ar(SinOsc.ar(["B0".namecps,"B-1".namecps]), 0)*0.6*EnvGen.kr(Env.perc(0.01, t.tempo*2)) }).play(0,1);
			Synth(\bassV0, [\out, out, \freq1, "B0".namecps, \freq2, "B-1".namecps, \length, 2, \amp, 0.6]);

			Synth(\bassV, [\out, out, \freq1, "B0".namecps, \freq2, "B-1".namecps, \sust, 1.5, \dec, 1, \amp, 0.6, \modstart, 1/2, \modsust, 2, \moddecay, 1.5]);

			// Ndef(\bassV, {Splay.ar(SinOsc.ar(["B0".namecps,"B-1".namecps]).distort*LFTri.kr(Line.kr(t.tempo*1/2, t.tempo*2, t.tempo*1.5)), 0)*0.6*EnvGen.kr(Env.linen(0.01, t.tempo*1.5, t.tempo*1)) }).play(0,1);
		4.wait;
			// bar 2
			2.5.wait;
			Ndef(\bdrumB, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);

			Synth(\bassV1, [\out, out, \freq1, "D1".namecps, \freq2, "D0".namecps, \sust, 1, \dec, 1, \amp, 0.6, \modstart, 1/4, \modend, 1/4]);
			// Ndef(\bassV, {Splay.ar(SinOsc.ar(["D1".namecps,"D0".namecps]*EnvGen.kr(Env([1, 9/8], [t.tempo*1/4, t.tempo*1/4]))).distort, 0)*0.5*EnvGen.kr(Env.linen(0.1, t.tempo*1, t.tempo*1)) }).play(0,1);
1.5.wait;
			// bar 3
			4.wait;
			// bar 4
			//0.5.wait; //?
			Ndef(\bdrumB, {Limiter.ar(Compander.ar(LPF.ar(BrownNoise.ar(EnvGen.kr(Env.perc(0.01, 0.05)))+Pulse.ar(Line.kr(110, 20, 0.1)), 122), WhiteNoise.ar(1), 0.1, 1, 10)*EnvGen.kr(Env.perc(0.01, 0.05)), 0.99)}).play(0,2);
		Synth(\bassVPulse, [\out, out, \freq1, "c#0".namecps, \freq2, "C#1".namecps, \sust, 1.5, \dec, 0.1, \amp, 0.6, \rate, 2]);
			Ndef(\bassV, {Splay.ar(SinOsc.ar(["c#0".namecps,"C#1".namecps]).distort*LFPulse.kr(t.tempo*2), 0)*0.6*EnvGen.kr(Env.linen(0.1, t.tempo*1.5, 0.1)) }).play(0,1);
4.wait;
		};
	}).play;
});
);
/*s.latency=0;*/

s.latency=0
///              ///
///    //////  ///////   ///////    //////
///   ///////   ///      //   //   //  //
///   ///  //  ///       //       //  //
///   ///  //  ///////  ///      //////

~leadVerb = Synth.tail(s, \verblead, [\amp, 0.3, \in, 80, \out, 10]);

(t.playNextBar{
		Tdef(\toChorus, {
				~lead = Synth(\leadp, [\out, 80, \amp, Ndef(\krleadamp, {Line.kr(0, 1, t.tempo*4)}), \rate, Ndef(\krlead, {Line.kr(1/4, 2, t.tempo*4)})]);
		(4*7).wait;
		~lead.release;
		~sx2 = Synth(\ppizza, [\amp, 0, \out, 15, \buf, b[12], \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);
		Tdef(\hhIntro).stop;Tdef(\zero).stop;Tdef(\hhIntroD).stop;Tdef(\introSnare).stop;
1.wait;
		1.wait;
	~sx2.set(\rateh, 2, \buf, b[12], \cutV, 0.3, \ratecut, 8, \ratel, 2, \speed, 8, \nspeed, 1, \reverse, 1, \forward, 1, \amp, 2);
		Ndef(\line, {SinGrain.ar(Impulse.kr(t.tempo*19), 0.01, Line.kr(100, 3988, t.tempo*2))*1*EnvGen.kr(Env.perc(0.2, t.tempo*2))}).play(18,2);
~pRevL = Synth.tail(s, \pingRev, [\amp, 1, \in, 30, \out, 8]);
~pRevR = Synth. tail(s, \pingRev, [\in, 31, \out, 9, \amp, 1]);
~postB = Synth.tail(s, \postBass, [\in, 22, \out, 14, \gain, 9, \amp, 2]);
		2.wait;
		~sx2.release;
	}).play
});

/////////      //
/////////      //
///           //                //                 /////////
///           //////    /////  ///////  //   //    ///
///          ///////   //  //  //   //  //   //     ///////
/////////   //    //   //  //  //       //   //       ////
/////////   //    //   /////   //       //////    ///////
(t.playNextBar{
	Tdef(\breakc, {
		Tdef(\hhIntro).stop;Tdef(\p).stop;
		~lead = Synth(\leadp, [\out, 80]);
		Tdef(\hh).play;Tdef(\bdrumC).play;Tdef(\snareCh).play;Tdef(\one).play;Tdef(\bassV).play;
		Tdef(\bassV).play; Tdef(\hit2).play;
	}).play;
});



/////   ////  /////     /////      ////   //////
///    ///   /  ///   //////   ///      //  //
////  //     ////     //   //   /////   //////
//////      ///////  //     / //////    //////////
(t.playNextBar{
	Tdef(\break, {
				~leadVerb.release;
				~sx2 = Synth(\ppizza, [\amp, 0, \out, 15, \buf, b[12], \ratel, 1/2, \rateh, 6, \cutV, 1, \ratecut, 4, \speed, 3, \nspeed, 1/8]);
~lead.release;
		Tdef(\hh).stop;Tdef(\bdrumC).stop;Tdef(\snareCh).stop;Tdef(\one).stop;Tdef(\hit2).stop;Tdef(\bassV).stop;
		1.wait;
		Tdef(\bdrum).stop;Tdef(\bass).stop;		Ndef(\leadp).stop; 		Ndef(\verb).clear;
		1.wait;
		Tdef(\hhC).stop;
		Ndef(\narcode).stop;
		Tdef(\snareC).stop;Tdef(\two).stop; // special bass for break
		1.wait;
		//Tdef(\hhC).play;
			~sx2.set(\rateh, 2, \buf, 14, \cutV, 0.3, \ratecut, 8, \ratel, 2, \speed, 8, \nspeed, 1, \reverse, -1, \forward, 1.2, \amp, 2);

				Ndef(\line, {SinGrain.ar(Impulse.kr(t.tempo*19), 0.01, Line.kr(100, 3988, t.tempo*2))*1*EnvGen.kr(Env.perc(0.2, t.tempo*2))}).play(18,2);

		1.wait;
				~sx2.release;
		Tdef(\hhC).play;Tdef(\bdrum).play;Tdef(\snareC).play;Tdef(\two).play;Tdef(\bass).play;Tdef(\p).play;
	}).play;
});


// LC
Ndef(\line, {SinGrain.ar(Impulse.kr(t.tempo*19), 0.01, Line.kr(100, 3988, t.tempo*2))*1*EnvGen.kr(Env.perc(0.2, t.tempo*2))}).play(18,2);

~sx3 = Synth(\ppizza, [\buf, b[15], \reverse, -2, \ratel, 1/2, \rateh, 6, \cutV, 0.3, \ratecut, 8, \speed, 3, \nspeed, 1/8, \amp, 2, \out, 16]);

~sx3.set(\rl, 3, \gate, 0);

/////////      //
/////////      //
///           //                //                 /////////     2222222
///           //////    /////  ///////  //   //    ///               222
///          ///////   //  //  //   //  //   //     ///////         22
/////////   //    //   //  //  //       //   //       ////         22
/////////   //    //   /////   //       //////    ///////         22222222
(t.playNextBar{
	Tdef(\breakc, {
		1.wait;
		~lead.release;
		~leadVerb.release;
		Tdef(\bdrum).stop;Tdef(\bass).stop;
		1.wait;
		Tdef(\snareC).stop;Tdef(\two).stop; // special bass for break
		1.wait;
		1.wait;
		~lead = Synth(\leadp, [\out, 80, \at, t.tempo*2]);
				Tdef(\hhC).stop;
		Tdef(\hh).play;Tdef(\bdrumC).play;Tdef(\snareCh).play;Tdef(\one).play;Tdef(\bassV).play;
	//	Ndef(\verb, {GVerb.ar(In.ar(40,2), 13, 4).distort*0.6}).play;
		~leadVerb = Synth.tail(s, \verblead, [\amp, 0.3, \in, 80, \out, 10]);
		Tdef(\bassV).play; Tdef(\hit2).play;
		Tdef(\hhC).stop;Tdef(\p).stop;
		//Tdef(\bass).play;
	}).play;
});

