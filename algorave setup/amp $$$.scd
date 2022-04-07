//// follow us on soundcloud
a.pop;

("/Users/fina/Desktop/Panda Zooicide/panda_synths.scd").load;

/// Animalzz
(
b = ();
b[1] = Buffer.read(s, "/Users/fina/Desktop/Panda Zooicide/animalz/eagle.wav");
b[2] = Buffer.read(s, "/Users/fina/Desktop/Panda Zooicide/animalz/tiger.wav");
b[3] = Buffer.read(s, "/Users/fina/Desktop/Panda Zooicide/animalz/horse.wav");
b[4] = Buffer.read(s, "/Users/fina/Desktop/Panda Zooicide/animalz/sex.wav");
);

a = ProxySpace.push(s);
//a.pop;
a.quant_(0);
t = TempoClock.default;
t.tempo = 77/60;

//Ndef(\end2, {Out.ar([0,1], Limiter.ar(In.ar(2,1), 0.9))}).play;

Ndef(\fx, {CombC.ar(In.ar(6,2), 0.2, 0.2, 1);}).play;
Ndef(\fx1, {CombC.ar(In.ar(4,2), 0.2, 0.2, 2);}).play;
//Ndef(\fxr, {GVerb.ar(In.ar(18), 60, 18);}).play;
Ndef(\endD, {CombN.ar(LPF.ar(In.ar(20,2), LFTri.kr(t.tempo*1/4).range(100, 2800)), 0.2, 1/14.2, 1)}).play(0,2).quant_(1);


a[\pad] = {|freq0=493, freq1=293, freq2=293, amp=0.5| FreeVerb.ar(Saw.ar([freq0, freq1, freq2], LFTri.kr(6).range(0.1, 0.2)), 0.7, 0.5)*amp};

// INTRO
(
t.beats_(0);
t.playNextBar({
Pdef(\hi, {Pbind(\instrument, \animals_hi, \delta, Pseq([1], inf), \amp, 0.4, \freq, Pwhite(14230, 11202))}).play.quant_(1);
t.sched(4, {
a[\pad].play(0,2); //1-0-(0,2)

		Pdef(\pad, {Pbind(\type, \set, \args, [\freq0, \freq1, \freq2], \freq0, Pseq(["d3".namecps, "c#3".namecps, "b2".namecps, "a2".namecps], inf), \freq1, Pseq(["e3".namecps, "f3".namecps, "e3".namecps, "d2".namecps], inf), \freq2, Pseq(["f3".namecps, "g3".namecps, "f3".namecps, "e2".namecps], inf), \delta, Pseq([3,5]/2, inf))}).play.quant_(1);
});
});
);
// VERSE
(
Ndef(\endL, {Limiter.ar(In.ar(2,1), 0.8)}).play(0,1);
Ndef(\endR, {Limiter.ar(In.ar(3,1), 0.8)}).play(1,1);


t.playNextBar({
	a[\pad].play();

	t.sched(1, {Pdef(\snare, {Pbind(\instrument, \animals_snare, \out, 2, \delta, Pseq([2], inf), \amp, 1)}).play.quant_(0)});

	Pdef(\bdrum, {Pbind(\instrument, \animals_bdrum, \tempo, 77/60, \out, [2,3], \delta, Pseq([Pseq([2], 2), Pseq([0.5, 1.25, 0.25, 2], 1)], inf), \freq, 100, \amp, Pseq([Pseq([1]+1, 2), Pseq([0,2,2,2], 1)], inf))}).play.quant_(0); // ----> quant 1 ~ 0
Pdef(\hi, {Pbind(\instrument, \animals_hi, \delta, Pseq([1/2], inf), \out, 2, \amp, 0.5, \freq, Pwhite(14230, 11202))}).play.quant_(0); /// ----> quant 1 ~ 0
	Pdef(\bass, {Pbind(\instrument, \animals_bass, \delta, Pseq([Pseq([0.5,0.5, 0.5, 1.5,0.25,0.25,0.5,2,2], 1)], inf), \amp, Pseq([4,4,4,4,0.5,4,4,4,4],inf), \freq, Pseq(["d0".namecps,"eb0".namecps,"f0".namecps, "c-2".namecps, "f5".namecps, Pseq(["d0".namecps], 4)], inf), \out, Pseq([0,0,0,0,2,0,0,0,0]+2, inf), \rl, Pseq([0.5,0.35,0.2, 1.5, 0.1, 0.2, 0.4, 2,1], inf), \rate, Prand([1/2,1/4, 3], inf) ) }).play.quant_(0);
});
Pdef(\bdrum0).stop.quant(0.1);
Pdef(\toms).stop.quant(0.1);
Pdef(\tomhi).stop.quant(0.1);
Pdef(\tomta).stop.quant(0.1);
Ndef(\sex).stop(3);
Ndef(\eag).stop(0.5);
Ndef(\tiger).stop(0.5);
Ndef(\horse).stop(0.5);
); // verse1

/// bridge
(
t.playNextBar({
	//Ndef(\end2).stop(0.1);
a[\pad].stop(1);
Pdef(\bass).stop;
Pdef(\bdrum).stop;
Pdef(\snare).stop;
Ndef(\fxr, {GVerb.ar(In.ar(18), 60, 18);}).play;
//Pdef(\hi).stop;
	t.sched(2, {Ndef(\eagb, {|buf=1| GVerb.ar(PlayBuf.ar(2, b[1], BufRateScale.kr(b[1])*1, loop:0)*0.1, 250, 8, 1)*2}).play.quant_(0)});
	t.sched(4, {Ndef(\tigerb, {|buf=1| PlayBuf.ar(2, b[2], BufRateScale.kr(b[2])*[1, 5/4], loop:0)*[0.5, 1]/2}).play(18).quant_(0)});
});
); //// bridge
/////////
///////// wardrums
(
t.playNextBar({
	Pdef(\bass).stop;

	Ndef(\endL, {Limiter.ar(HPF.ar(In.ar(22,2), 50), Line.kr(0, 0.99, 0.2))}).play(0,2);
Ndef(\endR, {Limiter.ar(HPF.ar(In.ar(33,1), 50), Line.kr(0, 0.99, 0.2))}).play(0,1);

	t.sched(1, {Pdef(\snare, {Pbind(\instrument, \animals_snare, \delta, Pseq([2], inf), \out, [0,1], \amp, Pxrand([1,1,1,1]/1,inf) )}).play.quant_(0)});

	a[\pad].stop;

	Pdef(\bdrum, {Pbind(\instrument, \animals_bdrum, \tempo, 77/60, \delta, Pseq([Pseq([1/6], 6), Pseq([1/2, 1/4, 1/4], 1)], inf), \freq, Pseq(["g0".namecps, "c0".namecps, "g0".namecps, "c0".namecps]*[1/2, 1], inf), \out, Pseq([0],inf ), \amp, Pseq([Pseq([1]*2, 6), Pseq([0, 0.5, 0.5]*1, 1)], inf))}).play.quant_(0); // bdrum extra

	Pdef(\bdrum0, {Pbind(\instrument, \animals_bdrum, \tempo, 77/60, \delta, Pseq([Pseq([1/9], 9), Pseq([1/2, 1/4, 1/4], 1)], inf), \freq, Pseq(["c1".namecps, "e1".namecps],inf), \out, Prand([0,1]+22,inf), \amp, Pseq([Pseq([1]/1, 9), Pseq([0, 1, 1]/1, 1)], inf))}).play.quant_(0); // bdrum extra


	Pdef(\toms, {Pbind(\instrument, \animals_bdrum, \delta, Pseq([Pseq([1], 1), Pseq([1/6],6)], inf), \freqb, Pseq(["f5".namecps, "f#5".namecps], inf), \lof, Pseq([1280, 580], inf), \freq, Prand([7900, 800],inf),\out, Prand([0,1],inf), \amp, Pseq([Pseq([0], 1), Pseq([0.4], 4), Pseq([0, 0.4], 1)], inf), \rl, 0.02)}).play.quant_(0); // bdrum extra

	Pdef(\tomhi, {Pbind(\instrument, \animals_bdrum, \freqb, Pseq(["ab4".namecps, "eb5".namecps], inf), \lof, Pseq(["f3".namecps, "f5".namecps], inf), \delta, Pxrand([1.5, 1.5, 1]*1, inf), \freq, 600, \amp, 0.2, \rl, Pseq([2, 0.9],inf),\out, Prand([0,1]+20,inf)) }).play.quant_(0); // bdrum extra

	Pdef(\tomta, {Pbind(\instrument, \animals_bdrum, \freqb, 600, \lof, 6000, \delta, Pseq([1/6,1/6,1/6,1/6,1/6,1/6], inf), \freq, 800, \amp, Pseq([0, 0.4,0.4,0.4,0,0.4]/2, inf), \rl, 0.02, \out, Prand([0,1],inf))}).play.quant_(0); // bdrum extra

	Pdef(\hi, {Pbind(\instrument, \animals_hi, \delta, Pseq([Pseq([1], 3),Pseq([1/2],1), Pseq([1/14], 14/2)], inf), \amp, Prand([0, 0.5,1/2,1/2,Pseq([1/2],7)], inf), \freq, 17580, \at, 0.01, \rl, 0.1, \out, [0,1])}).play.quant_(0);

Ndef(\fxc, {CombC.ar(In.ar(5,2), 0.2, t.tempo/8, 2)*2}).play;
Ndef(\eag, {|buf=1| PlayBuf.ar(2, b[1], BufRateScale.kr(b[1])*Line.kr([1,1/10], [2/10, 1], 1), loop:0)*1/12}).play(0).quant_(1);
Ndef(\tiger, {|buf=1| PlayBuf.ar(2, b[2], BufRateScale.kr(b[2])*Line.kr([1,1], [1, 3/20], 1/2) loop:0)*[0.5, 0.4]}).play(5).quant_(4).play;
Ndef(\horse, {|buf=1| PlayBuf.ar(2, b[3], BufRateScale.kr(b[3])*Line.kr(1/18, 1, 0.6), loop:1)*0.2}).play(0,1).quant_(5);
});
);

//
Ndef(\sex1, {|buf=1| PlayBuf.ar(2, b[4], BufRateScale.kr(b[4])*1, loop:1)*0.5}).play;
Ndef(\sex1).stop(4);


/// bridge
(
t.playNextBar({
	//Ndef(\end2).stop(0.1);
a[\pad].stop(1);
Pdef(\bass).stop;
Pdef(\bdrum).stop;
Pdef(\snare).stop;
Ndef(\fxr, {GVerb.ar(In.ar(18), 60, 18);}).play;
//Pdef(\hi).stop;
	t.sched(2, {Ndef(\eagb, {|buf=1| GVerb.ar(PlayBuf.ar(2, b[1], BufRateScale.kr(b[1])*1, loop:0)*0.1, 250, 8, 1)*2}).play.quant_(0)});
	t.sched(4, {Ndef(\tigerb, {|buf=1| PlayBuf.ar(2, b[2], BufRateScale.kr(b[2])*[1, 5/4], loop:0)*[0.5, 1]/2}).play(18).quant_(0)});
});
); //// bridge


// VERSE 2
(
Ndef(\fxr, {GVerb.ar(In.ar(18), 111, 1);}).play;
Ndef(\endL, {Limiter.ar(In.ar(2,1), 0.8)}).play(0,1);
Ndef(\endR, {Limiter.ar(In.ar(3,1), 0.8)}).play(1,1);
	Tdef(\a).stop;
	Tdef(\b).stop;

t.playNextBar({
	Pdef(\bdrum).stop.quant(0);
	a[\pad].play();

	t.sched(1, {Pdef(\snare, {Pbind(\instrument, \animals_snare, \out, 2, \delta, Pseq([2], inf), \amp, 1)}).play.quant_(0)});

	Pdef(\bdrum, {Pbind(\instrument, \animals_bdrum, \tempo, 77/60, \out, [2,3], \delta, Pseq([Pseq([2], 2), Pseq([0.5, 1.25, 0.25, 2], 1)], inf), \freq, 100, \amp, Pseq([Pseq([1]+1, 2), Pseq([0,2,2,2], 1)], inf))}).play.quant_(2); // bdrum extra
Pdef(\hi, {Pbind(\instrument, \animals_hi, \delta, Pseq([1/2], inf), \out, 2, \amp, 0.5, \freq, Pwhite(14230, 11202))}).play.quant_(1); /// 2 freq ~c0
	Pdef(\bass, {Pbind(\instrument, \animals_bass, \delta, Pseq([Pseq([0.5,0.5, 0.5, 1.5,0.25,0.25,0.5,2,2], 1)], inf), \amp, Pseq([4,4,4,4,0.5,4,4,4,4],inf), \freq, Pseq(["d0".namecps,"eb0".namecps,"f0".namecps, "c-2".namecps, "f5".namecps, Pseq(["d0".namecps], 4)], inf), \out, Pseq([0,0,0,0,2,0,0,0,0]+2, inf), \rl, Pseq([0.5,0.35,0.2, 1.5, 0.1, 0.2, 0.4, 2,1], inf), \rate, Prand([1/2,1/4, 3], inf) ) }).play.quant_(1);
});
Pdef(\bdrum0).stop.quant(0.1);
Pdef(\toms).stop.quant(0.1);
Pdef(\tomhi).stop.quant(0.1);
Pdef(\tomta).stop.quant(0.1);
Ndef(\sex).stop(3);
Ndef(\eag).stop(2);
Ndef(\tiger).stop(2);
Ndef(\horse).stop(0.5);
);


////
/// LIVE CODING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$$$$$$$$$$$$$$$$
/////
///////
// solo
Ndef(\eag, {|buf=1| PlayBuf.ar(1, b[1], BufRateScale.kr(b[1])*Line.kr([1,1], [2/4, 1], 1), loop:0)*1/4}).play(0).quant_(1);

Ndef(\lc, {|buf=1| PlayBuf.ar(2, b[4], BufRateScale.kr(b[3])*Line.kr([1,1], [1.6, 1], 1), loop:0)*1/2}).play(0).quant_(4);

Ndef(\lc2, {|buf=1| PlayBuf.ar(2, b[2], BufRateScale.kr(b[3])*Line.kr([1,1], [1.2, 1], 1), loop:0)*1/2}).play(0).quant_(1);


Ndef(\lc).stop;

Ndef(\sex1).stop(4);

Ndef(\sex).play(0);


Tdef(\a, {
	loop{
		var ch = Pseq([0,1], inf).asStream;
		Ndef(\eag, {|here=1, there=1| PlayBuf.ar(1, b[1], BufRateScale.kr(b[1])*Line.kr([1,here], [2/30, there], 1), LFPulse.kr(12), loop:0)*1}).play(ch.next).quant_(1); // out
	2.wait;}
}).play;

Tdef(\b, {
	loop{
		Ndef(\sex, {|here=1, there=1| PlayBuf.ar(2, b[4], BufRateScale.kr(b[4])*LFSaw.kr(here, there), LFPulse.kr(2), loop:0)*1}).play(0);
	4.wait;}
}).play;

// original
Pdef(\solo, {Pbind(\type, \set, \args, [\here, \there], \here, 1/15, \there, 1/7, \delta, 1)}).play.quant_(1);

Ndef(\sex1).stop;

Tdef(\b).stop

/// harmony dmin7
Pdef(\harmony, {Pbind(\instrument, \animals_bass, \amp, Prand([1, 0, 1/2, 0]*1,inf), \freq, Pseq([Pseq(["d5".namecps, "f5".namecps]/2, 4), Pseq(["d5".namecps, "g#5".namecps]/3, 4) ],inf), \out, Pseq([0,0,1], inf), \rl, 1, \rate, 2, \delta, Pseq([Pseq([1/4], 2), Pseq([1/2], 2)], inf)) }).play.quant_(1);

Pdef(\harmony2, {Pbind(\instrument, \animals_bass, \amp, Prand([1, 0, 1/2, 0]*1,inf), \freq, Pseq([Pseq(["d4".namecps, "c4".namecps], 4), Pseq(["b4".namecps, "a4".namecps], 4)]/2 ,inf), \out, Pseq([4, 0,0,4,0,0], inf), \rl, Pseq([1, 0.5, 0.5]+0.8, inf), \rate, 2, \delta, 1) }).play.quant_(1);

Pdef(\harmony3, {Pbind(\instrument, \animals_bass, \amp, Prand([1, 0, 1/2, 0]*1,inf), \freq, Pseq([Pseq(["d4".namecps, "c4".namecps], 4), Pseq(["b4".namecps, "a4".namecps], 4)]/4 ,inf), \out, Pseq([4, 0,0,4,0,0], inf), \rl, Pseq([1, 0.5, 0.5]+3.8, inf), \rate, 2, \delta, 4) }).play.quant_(1);

/// outro
(
Pdef(\hi, {Pbind(\instrument, \animals_hi, \delta, Pseq([2], inf), \amp, 0.5, \freq, "c0".namecps)}).play.quant_(1);
Pdef(\harmony2).stop;
Pdef(\harmony).stop;
Pdef(\bass, {Pbind(\instrument, \animals_bass, \delta, Pseq([Pseq([8], 1)], 1), \amp, Pseq([4,4,0.5,4,0.2,4,4,4,4],inf), \freq, "c#0".namecps, \out, 6, \rl, 7, \rate, Prand([1], inf) ) }).play.quant_(1);
a[\pad].play(1);
);


Pdef(\hi).stop;

a[\pad].stop(10);

// f!@#$% you dave...
Ndef(\endspin, {ReplaceOxxut.ar(0, PitchShift.ar(In.ar(0,2), 0.01, LFNoise1.kr(LFNoise0.kr(6).range(8, 1)).range(4, -1/16))*Line.kr(4, 0, 1))}).play(0,2);


