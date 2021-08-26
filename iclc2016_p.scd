~timer = "curl http://webtimer.eu-west-1.elasticbeanstalk.com/getData | grep -o ' [0-9][0-9],'".unixCmdGetStdOut;

~timerCheck = "curl http://webtimer.eu-west-1.elasticbeanstalk.com/getData".unixCmdGetStdOut;


Tdef(\updateTimer, {
	loop{
~timer = "curl http://webtimer.eu-west-1.elasticbeanstalk.com/getData | grep -o ' [0-9],'".unixCmdGetStdOut;
		1.wait;
	}
}).play;


Tdef(\warnMe, {
	loop{
		if ("[0-9]".matchRegexp(~timer)) {
			("say -v vicki"+~timer).unixCmd;
			Ndef(\w, {Resonz.ar(SinOsc.ar(456, mul:0.3), LFTri.kr(1/4).range(100, 1000))}).play;
		} {
			Ndef(\w, {LPF.ar(WhiteNoise.ar(0.2), 345.rrand(800)) * LFSaw.kr(1.rrand(2))}).play(0,2);
		};
		1.wait;
	}
}).play;


///////// sounds:

/// prestado de los mandelbrots :)

// thanks Foxy Juan and Friends!

Tdef(\a, {
	loop{
		Ndef(\a, { 18.collect{SinOsc.ar(300.rrand(567))*0.01*EnvGen.kr(Env.sine(1.rrand(10), 1).circle(1))} }).play;  // quick nice sounds! shit
		12.wait;
}}).play;


// from Andrew S first spatial sounds:
Ndef(\w, {|rate=2| 9.collect{ GVerb.ar(Impulse.ar(3.rrand(34)), 123, 3)*0.03*LFPulse.kr(rate).range(0, 1)} }).play

Pdef(\w, {Pbind(\type, \set, \args, [\rate], \rate, Pseq(1/[2, 1/2, 1/7, 1/2, 1/2], inf), \delta, 1)}).play;

// ahora unos ritmos para Anne

/// ahora si podemos itentar hacer un ritmo mas interesante. Alguien tiene ideas???

// va pues, especial para LuiZ@ regeton! lets make in in 5
Tdef(\n, {
	var rit = Pseq([0.75, 0.25, 0.5, 1, 1/4, 1/8, 1/8], inf).asStream;
	var ket = Pseq([\n, \r], inf).asStream;
	loop{
		Ndef(ket.next, {|freq=320| SinOsc.ar(Line.kr(freq * ~freq, 60.rrand(190), 0.2)) * 1 * ~env }).play;
		(rit.next).wait;
	}
}).play;


Ndef(\n, {|freq=230| SinOsc.ar(freq) * 0.1 }).stop;

~env = {EnvGen.kr(Env.perc(0.1, 2))};

~freq = Ndef(\f, {LFPulse.kr(18).range(2, 1)});

Ndef(\c, {CombN.ar(SoundIn.ar(0)* WhiteNoise.ar(~env), 0.3, 0.23, 10)}).play

t = TempoClock.default;
t.tempo_(84/60);

Ndef(\b, {FreqShift.ar(SoundIn.ar(0), LFTri.kr(1/4).range(100, 898)) * 0.3}).stop;






