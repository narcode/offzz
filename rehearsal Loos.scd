///// ckalculator rehearsal

// first a groovey groove krob dick
(
OSCdef(\rhyt, {|msg|
	var val = msg[1].asInt;
	// val.postln;
	if (val.odd) {
		"odd".postln;
		Tdef(\r1, {
			loop{
				Ndef(\r1, {HPF.ar(WhiteNoise.ar(0.5), 8989)*EnvGen.kr(Env.perc(0.01,0.1))}).play(0,2);
				(1/4).wait;
		}}).play;
	} {
		Tdef(\r1, {
			loop{
				Ndef(\r1, {LPF.ar(WhiteNoise.ar(1)+SinOsc.ar(78), 150)*EnvGen.kr(Env.perc(0.01,0.1))}).play(0,2);
				(1/2).wait;
		}}).play;
	}
}, '/ck');
);

// fx
(
OSCdef(\fx, {|msg|
		var val = msg[1].asInt;
	if (val.odd) {
Ndef(\anne, {CombN.ar(FreqShift.ar(SoundIn.ar(8), LFTri.kr(1/90).range(-100,982)), 0.01, 0.4,5)}).play(0,2);
	} {
		Ndef(\anne, {SinOsc.ar("B2".namecps)}).stop;
	}
}, '/ck');
)


//// hellow....

/// lets code a simple responder for Anne's numbers:
(
OSCdef(\ck1, {|msg|
	var val = msg[1].asInt;
	if (val.odd) {
		Tdef(\r, {
			loop{
				Ndef(\r, {(SinOsc.ar(89)+LPF.ar(WhiteNoise.ar(1), 123))*EnvGen.kr(Env.perc)}).play(0,2);
				1.wait;
			}
		}).play;
	} {
				Tdef(\r, {
			loop{
				Ndef(\r, {HPF.ar(WhiteNoise.ar(1), 8980)*EnvGen.kr(Env.perc(0.01, 0.1))}).play(0,2);
				(1/4).wait;
			}
		}).play;
	}
}, '/ck');
)

/// now an fx:
(
OSCdef(\ck1, {|msg|
	var val = msg[1].asInt;
	if (val < 50) {
		Ndef(\an, {CombN.ar(FreqShift.ar(SoundIn.ar(8), LFTri.kr(-10, 898)), 0.1, 0.1, 4)}).play;
	};
	if (val.odd) { Ndef(\an).stop; };
	if (val > 50 && val < 150) {
		Ndef(\an, {FreeVerb.ar(PitchShift.ar(SoundIn.ar(8), [1, 3/2, 6/5]), 0.7, 0.5, 8)}).play;
	};
		if (val > 50 && val < 150) {
		Ndef(\an, {FreeVerb.ar(PitchShift.ar(SoundIn.ar(8), [1, 3/2, 6/5]), 0.7, 0.5, 8)}).play;
	}
}, '/ck');
);


//////////
(
OSCdef(\n, {|msg|
	var val = msg[1].asInt;
	if (val.odd) {
		Tdef(\r, {loop{
			Ndef(\r, {HPF.ar(WhiteNoise.ar(1), 8989) * EnvGen.kr(Env.perc(0.01,0.1))}).play([0,1].choose,1);
			(1/2).wait;}}).play;
	} {
			Tdef(\r, {loop{
			Ndef(\r, {(SinOsc.ar(189*Line.kr(1, 1/2, 0.3), mul:1.2)+WhiteNoise.ar(1)) * EnvGen.kr(Env.perc(0.01,0.2))}).play([0,1].choose,1);
			(1/2).wait;}}).play;
	}
}, '/ck')
);

/// now define var
~gt = false;
~lt = false;
~equal = false;



///////// Rehearsal June 14th 2018


/// first a sound responder..
// works on oddss...

// now ill  make this a loop"
(
//make this more complex:
OSCdef(\1, {|msg|
	var val = msg[1].asInt;
	if (val.odd) {
		if (val < 50) {
		Tdef(\o, {
			loop{
		Ndef(\o, {SinOsc.ar(["B2".namecps, "D2".namecps])*0.2 * EnvGen.kr(Env.perc)}).play;
				1.wait;
			}
		}).play;
		} {
				Tdef(\o, {
			loop{
					Ndef(\o, {SinOsc.ar(["B2".namecps, "D2".namecps]*LFPulse.kr(4).range(1, 4))*0.2 * EnvGen.kr(Env.perc(0.01, 0.1))}).play;
					(1/4).wait;
			}
		}).play;
		}
	} {
		if (val > 200) {
		Tdef(\o, {
			loop{
		Ndef(\o, {SinOsc.ar(["B2".namecps, "D2".namecps]+val)*0.2 * EnvGen.kr(Env.perc)}).play;
				(1/2).wait;
			}
		}).play;
		} {
			Tdef(\o).stop;
		}
	}
}, '/ck');
);


/// now an fx for the piano:

/// nos lets anne control params of the fx:
( /// anne can contrl amp of noise and delaytime
OSCdef(\fx, {|msg|
	var val = msg[1].asInt;
	Ndef(\fx, {CombN.ar(WhiteNoise.ar(val.clip(1, 100, 1, 1)) * FreqShift.ar(SoundIn.ar(8), LFNoise0.kr(3).range(-100, 776)), 0.2, val.reciprocal.clip(0.02, 1, 0.02, 1), 8)*0.1}).play;
}, '/ck');
)

// now more rhythms... so up again:

~comparisons.on("tri", "vi", "prin");


(
OSCdef(\say, {|msg|
	var val = msg[1].asInt;
	if (val.odd) {
	("say -v vi -r 123 " ++ val.asString ++ "").unixCmd;
	} {
		("say -v xa -r 123 " ++ val.asString ++ "").unixCmd;
	}
}, '/ck');
);


///// Try 5:


(
~error_count = 0;
OSCdef(\errorC, {|msg|
	msg.postln;
	~error_count = ~error_count+1;
		("say -v juan -r 89 ztraik " ++ ~error_count.asString ++ "").unixCmd;
	if (~error_count == 3) {
		Tdef.all.do{|i| i.stop};
		OSCdef.all.do{|i| i.free};
		Ndef(\end, {LPF.ar(SinOsc.ar("Bb4".namecps, mul:0.2), 7878)}).play;
		Ndef(\end).stop(0.3);
	}
}, '/ck_error');
);



/// try #6:

/// 0 - anne
/// 1 - voices
/// 2 - rhythm
/// 3 - fx
/// 4 - error
/// 5 - develop




// voices:
(
OSCdef(\n, {|msg|
	var val = msg[1].asInt;
	if (val.odd) {
	("say -v tri -r 110 " ++ val.asString ++ "").unixCmd;
		Tdef(\n , {
			var name = Pseq([\n, \n1, \n2, \n4], inf).asStream;
			loop{
		Ndef(name.next, {WhiteNoise.ar(0.3)*EnvGen.kr(Env.perc)}).play([0,1].choose, 1);
				if (~equal == 'false') {
				(0.7).wait;
				} {
				(0.2).wait;
				}
		}}).play;
	} {
		("say -v pri -r 110 " ++ val.asString ++ "").unixCmd;
				Tdef(\n , {
			loop{
				Ndef(\nh, {HPF.ar(WhiteNoise.ar(1), 8989)*EnvGen.kr(Env.perc(0.01, 0.1))}).play([0,1].choose, 1);
				if (~equal == 'false') {
				(0.7).wait;
				} {
					(0.45).wait;
				}
		}}).play;
	}
},'/ck')
);

// lets add a rhythm...
				Tdef(\na , {
			loop{
		Ndef(\na, {LPF.ar(WhiteNoise.ar(0.4)+SinOsc.ar(Line.kr(80, 45, 0.2)), 989)*EnvGen.kr(Env.perc(0.01, 4))}).play(0, 2);
				(0.45*4).wait;
		}}).play;


// fx:

Ndef(\a, {CombN.ar(FreqShift.ar(SoundIn.ar(8), LFTri.kr(1/90).range(-100, 989)), 0.01, 0.3, 5)*1}).play(0,2);


// erorrs
~error = 0;
OSCdef(\e, {
	~error = ~error + 1;
	("say -v juan -r 110 ztraik " ++ ~error.asString ++ "").unixCmd;
	if (~error == 7) {
		OSCdef.all.do{|o| o.free};
		Tdef.all.do{|o| o.stop};
		Ndef(\end, {SinOsc.ar("Bb4".namecps, "Bb4".namecps(-89))*0.2 * EnvGen.kr(Env.linen(0.01, 1, 0.01))}).play(0,2);
	}
}, '/ck_error');


~comparisons.on("xa", "alex", "vi");



//// last before concert:

(
OSCdef(\v, {|msg|
	var val = msg[1].asInt;
	if (val.odd) {
	("say -v tri -r 100 " ++ msg[1] ++ "").unixCmd;
		Tdef(\n, {
			var names = Pseq([\n, \n1, \n2, \n3], inf).asStream;
			loop{
				if (~equal == 'true') {
			Ndef(names.next, {BPF.ar(WhiteNoise.ar, 567, 0.3)*EnvGen.kr(Env.perc)}).play(0,2);
				} {
					Ndef(names.next, {FreeVerb.ar(BPF.ar(WhiteNoise.ar, 567, 0.3)*EnvGen.kr(Env.perc), 0.9)}).play(0,2);
				};
				if (~gt == 'true') {
				1.wait;
				} {
					2.wait;
				}
			}
		}).play;
	} {
	("say -v princess -r 100 " ++ msg[1] ++ "").unixCmd;
				Tdef(\n, {
						var names = Pseq([\n, \n1, \n2, \n3], inf).asStream;

			loop{
				Ndef(names.next, {HPF.ar(WhiteNoise.ar, 9999)*EnvGen.kr(Env.perc(0.01,0.1))}).play(0,2);
				if (~gt == 'true') {
				(0.5).wait;
				} {
					if (~equal == 'true') {
					(1/4).wait;
					} {
						(1/8).wait;
					}
				}
			}
		}).play;
	}
}, '/ck');
);


// now an rhythm...  ok... ow an fx

Ndef(\fx, {CombN.ar(FreqShift.ar(SoundIn.ar(8), LFTri.kr(1/90).range(-100, 898)), 0.01, 0.4, 5)}).play([0,1].choose, 1).play;

// now error handling... no better a baass drum..

Tdef(\b, {
	loop{
Ndef(\b, {LPF.ar(WhiteNoise.ar+SinOsc.ar(Line.kr(80, 45, 0.2)), 123)*EnvGen.kr(Env.perc(0.01, 4))}).play(0,2);
		4.wait;
}
}).play;

~comparisons.on("xa", "pau", "zor");

// errors...
~e = 0;
OSCdef(\e, {
	~e = ~e + 1;
	("say -v juan -r 89 ztreik" ++ ~e.asString ++ "").unixCmd;
	if (~e == 3) {
		OSCdef.all.do{|o| o.free;};
				Tdef.all.do{|o| o.stop;};
		Ndef(\fx).stop(4);
	}
}, '/ck_error');



















































