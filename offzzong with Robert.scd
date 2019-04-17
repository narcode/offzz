//// Robert + Anne + me = ??

// i guess i can start. this saves me typing time.


/// thats better...

/// ping pong balls -> tennis balls -> Federer won today! :D

// ball need to bounce:
(
Tdef(\match, {
	loop{
Ndef(\ball, {CombN.ar(LPF.ar(WhiteNoise.ar(1), 2644)*EnvGen.kr(Env.perc(0.01, 0.2)), 0.5, 0.25, 20)*1}).play(1);
		1.wait;
Ndef(\ball2, {CombN.ar(LPF.ar(WhiteNoise.ar(1), 3644)*EnvGen.kr(Env.perc(0.01, 0.2)), 0.5, 0.25, 10)*1}).play(0);
		100.wait;
}}).play;
);

// lets make a cool beat my friends!

//// i will as a 'swoosh' to it...
(
Tdef(\sw, {
	var rhythm = Pxrand([1/2, 1/2, 2+2/5, 1/6, 1/6, 1/6, 1/6]/2, inf).asStream;
	loop{
Ndef(\swoosh, {FreeVerb.ar(WhiteNoise.ar(1) *4*EnvGen.kr(Env.perc(0.01, 0.01)), 0.1, 1)}).play([0,1].choose,1);
		(rhythm.next).wait;
	}
}).play;
)
//// ok lets make a beat!

t = TempoClock.default;
t.tempo_(60/60);


//works
Tdef(\s, {
	loop{
"say -v xa -r 111 Bravo, Dank jullie wel".unixCmd;
	2.wait;
	}
}).st;


