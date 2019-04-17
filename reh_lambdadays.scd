// lambda rehearsal:

c = Ckalculator.new("tri", "xa", "whi");

c.easter_eggs

c.laser_amp_(0.01);
c.lrit_(1);
c.laser_rel_(4);
c.lasers;
c.set_l_(false);

c.hi_noise
c.hirit_(1/5);

Tdef(\a, {
	loop{
if (c.num.odd) {
c.set_hi_(false);
} {
c.set_hi_(true);
};
		0.2.wait;
	}
}).stop;


f = CKpianoFX(0);

f.typicalCK(0.8, [4/2, 3/2, 4/3], 123, 2);


f.delayCK(1, 0.12, 8);

c.harmony();
c.harmony_amp_(1);
c.set_freq1_(false);
c.set_freq2_(false);
c.override_freqs(345,123,12);

c.laser_noise_freq_(434)
c.laser_amp_(0.2)
c.laser_saw_freq_(123)
c.laser_rel_(0.1);
c.lrit_(8);
c.hirit_(1/5)
c.lasers.stop;
c.hi_noise.stop
("say -v oliver " ++ c.egg_text ++ "").unixCmd;
Ndef.all.do{|n| n.stop(0.1.rrand(2))};



//////


// lambda days rehearsal

c = Ckalculator.new("vicki", "karen", "tri");

c.harmony_amp_(0.5); // check the set

c.harmony(0);
c.set_freq1_(false);
c.set_freq2_(false);
c.set_freq3_(false);

f = CKpianoFX(0);

f.noisy(8, 0.2, 0.9, 4345, 0.05);

c.hi_noise();
c.hiamp_(0.9);
c.set_hi_(false);
Tdef(\b, {
	loop{
		c.hirit_((1/9).rrand(2));
		2.wait;
	}
}).play;

f.delayCK(1, 0.2, 5);

c.easter_eggs

c.laser_amp_(0.1)
c.lasers;
c.laser_dec_(1);
c.laser_rel_(0.1);
c.laser_saw_freq_(10);
c.set_l_(false);
c.lrit_(2);
c.laser_noise_freq_(Ndef(\a, {LFTri.kr(1/8).range(234, 7)}));


c.override_freqs(123, 234, 1345);
c.harmony_amp_(1);

~count = 10;
Tdef(\c, {
	loop{
	if (c.num.odd) {
		~count = ~count - 1;
		("say -v juan " ++ ~count.asString).unixCmd;
		if (~count == 0) {
			Ndef.all.do{|n| n.stop};
						Tdef.all.do{|n| n.stop};
		}
	};
		0.5.wait;
	};
}).play;

c.harmony.stop


///// LAMBDA DAYS rehearsal

c = Ckalculator.new();
f = CKpianoFX(0);

c.harmony(0)
c.harmony_amp_(0.8);
c.set_freq1_(false);
c.set_freq2_(true);
c.override_freqs(12, 245, 89);


f.delayCK(0.6, [0.123, 2], 8, 4);

c.easter_eggs;

c.laser_rel_(0.01)`
c.lasers;
c.laser_amp_(0.1);
c.set_l_(true)
c.lrit_(0.2)


/////// LAMDA DAYS NO AUTOPILOT


c = Ckalculator.new();

f = CKpianoFX();

f.delayCK(0.5, [1, 0.33], [10, 3], 1);

c.easter_eggs
OSCdef(\n, {
c.laser_amp_(0.1)
}, 'ck').oneShot

c.set_freq1_(true)
c.set_freq2_(true)
c.set_freq2_(true)

c.harm_f2_(12);
c.harmony_amp_(2);
c.override_freqs(122,213,415);
f.typicalCK(1, [3/2, 4/3, 5/6]);
c.laser_rel_(0.1);
c.laser_amp_(0.25)
c.laser_saw_freq_(Ndef(\na, {LFTri.kr(1).range(1200, 77)}));
c.laser_noise_freq_(123)
c.lrit_(1)
c.set_l_(false)
c.lasers

c.hi_noise;
c.set_hi_(false)
c.hirit_(1/1)

~count = 3;
OSCdef(\n, {

	("say -v juan " ++ ~count.asString).unixCmd;
	if (~count == 0) {
		"say -v vi THE END!".unixCmd;
		Ndef.all.do{|n| n.stop(4)};
				Tdef.all.do{|n| n.stop};
	};
	~count = ~count - 1;

}, 'ck_error');



////////////////////////////////////////
/////// 18 feb 2019 Lambda days rehearsal
//////////////////////////////

/// recording... im so proud of anne. She is so dutch

c = Ckalculator.new();

f = CKpianoFX.new();

f.delayCK(1, 0.3, 2);

c.hiamp_(Ndef(\hm2, {LFNoise0.kr(1/5).range(0.01, 0.2)}));
c.laser_amp_(Ndef(\hm, {LFNoise0.kr(1).range(0.01, 0.4)}));

OSCdef(\o, {
	c.laser_saw_freq_(c.num);
}, 'ck');

c.hi_noise.stop
c.laser_dec_(0.001);
c.laser_amp_(0.6);
c.laser_dec_(8);
c.set_hi_(false);
c.set_l_(false);
c.lrit_(1/6);
c.lasers.stop

f.typicalCK(0.6, [3/2, 5/6, 7/6], 78, 4);
c.set_hi_(false);

c.harmony;
c.set_freq1_(true);
c.set_freq_2_(true);
c.set_freq_2_(true);
c.harmony_amp_(0.9);
c.override_freqs(23, 234, 13);


OSCdef(\e, {
	("say -v juan " ++ c.num).unixCmd;
	Ndef.all.do{|n| n.stop(5)};
		Tdef.all.do{|n| n.stop()};
}, 'ck');

// next number it stops...



//////////// Lambda days


// so anne is above im here.

c = Ckalculator.new(); // this is to just "say" the nums anne generates...

/// mmmm now chill and listen to anne
f = CKpianoFX(0);

// but lets add delay.
f.delayCK(0.5, [1, 0.25], [8, 1]); /// nice...

c.easter_eggs /// let's see...

// Anne can u do 42 again?? < ANNE!!!!!!!! say true at least. damn she is ignoring me big time.

c.lasers;
c.set_l_(false);
c.lrit_(1/2);
c.laser_amp_(0.03);

/// anne do a 42 again??? so 16 works but not 42? not cool
c.laser_dec_(3);
OSCdef(\a, {
	if (c.num == 8) {
		Ndef.all.do{|n| n.stop(2)};
				Tdef.all.do{|n| n.stop(2)}
	}
}, 'ck');

// anne make a 9????
c.harmony(0);
c.set_freq1_(true)  // set a freq
c.harmony_amp_(0.7);
c.set_freq2_(true)
c.lasers.stop();
c.hi_noise.stop(6);
c.set_hi_(false);
c.hirit_(1/4);
c.hiamp_(0.3);   /// now i just listen to anne and focus on what she is doing... and add easter eggs... anne crashed our inneffient calculator...


/// WHERE ARE MY EASTER EGGSSSS? Anne make 100!!!!
"say -v vi Anne can u make 100?".unixCmd;


////// rehearsal in Krakow (20 feb 2019)
c = Ckalculator.new();
c.voicevol_(0.9);

f = CKpianoFX(2);
f.typicalCK(0.8, [3/2, 5/6, 1/2], 56).play(7,2); // let's see what Anne does...
f.delayCK(1.4, [0.2, 0.6]);
c.easter_eggs

Ndef(\fx, {In.ar(7)*LFPulse.kr(c.num).range(1/2, 8)}).play(0,2);

c.hi_noise;
c.hiamp_(0.7);
OSCdef(\compare, {
	if (c.boolean.interpret) {
c.hifreq_(Ndef(\hf, {LFNoise0.kr(c.num).range(345, 9878)}));
c.hirel_(Ndef(\hr, {LFNoise0.kr(c.num).range(0.01, 0.5)}));
	}
}, '\ck');

/// MAKE A COMPARISON
c.set_hi_(false);
Tdef.all.do{|t| t.stop}
Ndef.all.do{|t| t.stop}



//////// check again:

c = Ckalculator.new();

c.boolean

if (c.boolean != nil) {
	if (c.boolean) {"say -v ju true".unixCmd} {"say [[volm 2]] -r 134 -v al Anne! come on twerk! twerk! please twerk!!".unixCmd; "me".postln;}
} {
	(c.boolean.interpret).postln;
}


n = NetAddr.new("127.0.0.1", 57120);


n.sendMsg('/ck_gt', "false");

c.boolean.asString.interpret.asString;


c.harmony(0).stop



c = Ckalculator.new();
c.easter_eggs

f = CKpianoFX.new(2);
f.delayCK(0.3);
c.voicevol_(0.4);
f.typicalCK(0.1, [3/2, 1/2, 4/3]).stop;


















