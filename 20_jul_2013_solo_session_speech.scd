/// good

Tdef(\rep, {
	loop({Speech.channels[4].voice_(13).pitch_(["g1".namemidi, "d#4".namemidi, "c4".namemidi, "b2".namemidi].choose).rate_(1000).volume_(0.1).speak("oofz"); 4.wait});
	}
).play;

Tdef(\rep2, {	inf.do({Speech.channels[5].voice_(8).pitch_("bb0".namemidi).rate_(8000).volume_(0.3).speak("ooooofz ... i say... i love"); 0.3.wait});
	}
).play;

Tdef(\repP, {	inf.do({Speech.channels[9].voice_(8).pitch_("bb1".namemidi).rate_(8000).volume_(0.3).speak("ooooofz ... i say... i love"); [0.2, 0.3, 0.3, 0.3, 0.3].choose.wait});
	}
).play;

Tdef(\repP2, {	inf.do({Speech.channels[8].voice_(3).pitch_("bb2".namemidi).rate_(8000).volume_(0.12).speak("cinthya ballerina i love you yeah!"); [0.3, 0.3, 0.3, 0.6].choose.wait});
	}
).play;


r = Pseq(["f4".namemidi, "bb4".namemidi, "bb4".namemidi, "f#".namemidi], inf).asStream;
r.next;

Tdef(\repM, {	inf.do({Speech.channels[7].voice_(17).pitch_(r.next.postln).rate_(5).volume_(0.3).speak("cinthy cinthy cin"); 3.wait});
	}
).play;

Tdef(\rep1, {	loop({Speech.channels[2].voice_(13).pitch_("d#4".namemidi).rate_(1000).volume_(0.1).speak("ooooofz, oofz oofz ofz"); 3.wait});
	}
).play;


Tdef(\rep12, {	loop({Speech.channels[3].voice_(13).pitch_("d#4".namemidi).rate_(100).volume_(0.1).speak("oofz oofz oooofz ofz"); 3.wait});
	}
).play;

Tdef(\repM).stop(2);

Speech.init(16);

Ndef(\test, {var in; in=Speech.channels[7].voice_(13).speak("offz");}).fadeTime_(2);

