///

/// nou... dit in loop:

~stem = "mooooooiiiii" // works. :)

// een loop om de stem te ontwikkelen
Tdef(\stem, {
	loop{
		~stem = ~stem.scramble; // yes.
		3.wait;
	}
}).play;

Tdef(\p, {
	loop{
		("say -v vi -r 10 " ++ "bedankt").unixCmd;
		(5).wait; // elke 0.2 seconden
		("say -v al -r 8" ++ "the end").unixCmd;
	}
}).play;

Tdef.do.all{|t| t.stop}; // genoeg stem

// nu mss de stem ontwikkelen..

// nu effecten voor de piano:
f = CkpianoFX(0, 0);

f.delayCK(1.0, 1.8, 0.3, 2);
f.typicalCK(1.6, 1, [3/2, 5/4, 4], 4, 8);

///  waar zijn mijn stemmen!

//
Ndef(\s, {Saw.ar(["c2".namecps, "g3".namecps, "a2".namecps]) * EnvGen.kr(Env.perc(0.01, 83)) * 0.8}).play(0,2);



