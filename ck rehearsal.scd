//// rehearsal ckalc

// see if ck results come in...
(
OSCdef(\ck, {|msg|
	// msg.postln;
	if (msg[1].asInt.odd) {
	("say -v tri -r 88 " ++ msg[1]).unixCmd;
		Tdef(\oddr, {
			var rit = Pseq([1,2,1/2, 1/3, 1/2, 4], inf).play;
			loop{
		Ndef(\odd, {SinOsc.ar(123*LFPulse.kr(3).range(1, 4))*0.4*EnvGen.kr(Env.perc)}).play(1);
				(rit.next).wait;
		}}).play;
	} {
	("say -v vi -r 88 " ++ msg[1]).unixCmd;
	};
}, "ck");
);

/// lets make some rhythms...











// sept 6:

