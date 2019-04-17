
c = Ckalculator.new();
c.voicevol_(0.4); // that was a bit too loud sorry.

f = CKpianoFX.new(2);
f.delayCK(0.8, [0.2, 1], 4);
c.easter_eggs

c.hiamp_(0.15);
c.hi_noise;
c.hirit_(1/4); /// oooooo anne is making a function. is she? let's see///
c.set_hi_(false); // no more setting for anne she is ignoring me

c.laser_amp_(0.04);
c.lasers
c.laser_noise_freq_(c.num); // c.num is her number btw
c.set_l_(false);
 //// ANNNE MAKE AN 8 ???
c.lrit_(2);
OSCdef(\anne, {
	if (msg[1].asInt == 8) {
		Ndef.all.do{|n| n.stop};
				Tdef.all.do{|n| n.stop}
	}
}, '/ck');

c.lrit_(5); // i was liking the 5.
f.typicalCK(0.1, [1/2, 3/2, 5/4], 21, 8);

/// mmm lets put more easter eggs and see if anne can end this.






