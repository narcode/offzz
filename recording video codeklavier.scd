// and with this anne can make numbers. if she actually decides to play.

c = Ckalculator.new("xa", "pau", "an");
/// lets wait and see...
"say -v vi numbers are nice but they are nicer if we have an fx for the piano. true or false anne?".unixCmd;
c.hi_amp;
d = CkpianoFX.new(0, 4);  one.
d.delayCK(0.4, 0.2, 5); // bad variable name but
(OSCdef(\anne, {
	f.lrit_(c.num);
	if (c.num.odd) {
		c.set_hi_(c.boolean);
		c.hi_freq_(c.num+233);
	} { // anne controls the rhythms of the electrosounds
		c.laser_noise_freq_(c.num+100);
	}
}, 'ck')
); // better.
f = Ckalculator.new;
f.voices_(false);

f.laser_amp_(0.55);
f.laser_noise_freq_(420);
f.set_l_(false);
f.lrit_(1);
f.lasers;
f.laser_rel_(1);
f.laser_dec_(0.1);
f.laser_saw_freq_(87); /// im trying to make a bass
// getting there. slowly. oh yes

/// lets start an end.
//// Anne can you make 1024 ??? (viva la FARM2019)
OSCdef(\end, {
	if (c.num==1024) {
		Tdef.all.do{arg t; t.stop;};
				Ndef.all.do{arg t; t.stop;};
		"say -v juan aaaaaaay mamacita, this is the end!".unixCmd;
		Ndef(\e, {Saw.ar(Line.kr(80, 2345, 10))*Line.})
	};
}, 'ck'); // that was quick. didnt expet that.


/// ckalculator.2019.09.11

// wanna undertand this?
// true or false anne?

c = Ckalculator.new();
//// then just google for Peano numbers.
//// and lambda calculus.

/// basically anne is making lambda functions. which represent numbers. but what to do with those nums? rhythm is obvious.

/// anne can you make a 1 ?
c.hi_noise; /// the 3 is also obvious. now do whateve you want with the rhythm.
c.hi_amp_(0.2);

( // now anne can decide if she sets the rhythm of the noise of not.
OSCdef(\anne, {
	c.set_hi_(c.boolean);
	c.hi_freq_(c.num+120); // and the freq is your num + 120hz ///
	c.laser_saw_freq_(c.num*4); ///whenever u ready.
}, 'ck');
);
c.hirit_(1/3); // emergency overrride!
c.hi_rel_(1);
b = Ckalculator.new();
c.voices_(false);

/// is this clear? true or false?

//// meanwhile in boring world.
f = CkpianoFX.new(0, 4);
f.delayCK(0.2, 0.5, 7);

c.lasers;
c.lrit_(4);
c.laser_rel_(4);
c.laser_saw_freq_(100);
c.laser_dec_(0.2);
c.laser_amp_(0.4);
c.hi_rel_(0.2);
c.hirit_(8);

b.lasers;
b.lrit_(2);
b.set_l_(false);
b.laser_rel_(4);
b.laser_dec_(4);
b.laser_amp_(0.35);
b.laser_noise_freq_(80);
b.laser_saw_freq_(678);

//// oooooooooooooooo. shiiiiiiit.

/// i guess it chocked for a minute. and ots probably time to stop. so why dont you just make 3 errors.











/// this is a lambda calculus calculator.

s.reboot;




//// this is a lambda calculus calculator for the piano. phew i wrote it, now anne please play.

c = Ckalculator.new("xa");


(
OSCdef(\anne, {
	var rit = 0.5.rrand(4);
	var rel = 0.1.rrang(2);
	g.laser_rel_(rel);
	c.laser_saw_freq_(c.num);
	c.lrit_(rit);
}, 'ck'); // ok they have a freq of 33hz. maybe higher? or low? you decide it. but play and listen.
);

c.laser_dec_(1);
c.laser_amp_(0.4);
c.set_hi_(false);
c.hirit_(1/5);
c.hi_noise;
c.hi_amp_(0.3);
c.hi_freq_(467);
c.hi_rel_(0.2);
c.hi_attack_(0.3);

g = Ckalculator.new();
g.voices_(false);

g.hi_noise;
g.hirit_(1/4);
g.hi_amp_(0.7);
g.lasers
g.laser_saw_freq_(60);
g.lrit_(1/2);
g.laser_dec_(0.3);
g.laser_noise_freq_(10);

f.typicalCK(0.3, [1/2, 3/4, 5/6], 4);
g.lasers.stop;

OSCdef(\e, {
	if (c.num == 8) { /// the magic num is 8
		Ndef.all.do{arg n; n.stop;};
				Tdef.all.do{arg n; n.stop;};
	}
}, 'ck'); // anne now its an 8! you were struggling too much.

c.harmony; //// anne do you need help?
c.harmony_amp_(0.5);
c.set_freq1_(true);
g.laser_rel_(0.02);
c.hi_noise;
c.hi_rel_(0.1);
c.hirit_(1/3);
c.hi_attack_(0.01);

////////// ... / /. /./sa./s.d/sa. d/.sa/d. /d./sa .d/a.sd/.sad/. a/s. d/as.d/.end









































c = Ckalculator.new("xa");
// the ckalculator is a lambda calculus calculator. FOR THE PIANO. USING functions to make PREANO numbers. as we hear...
f = CkpianoFX.new(0, 4);
OSCdef(\an, {
c.hi_freq_(c.num+45);
}, 'ck'); // oh boi, anne plays so beautifully

f.delayCK(0.4);
c.hirit_(1/3);
c.set_hi_(false);

k = Ckalculator.new();
k.harmony
k.harmony_amp_(0.4);
k.set_freq2_(true); // your next num goes here.

c.hi_amp_(0.2);
c.lrit_(1);
c.laser_saw_freq_(234);
c.lasers;

k.set_l_(false);
k.lrit_(1);
k.laser_saw_freq_(184);
k.lasers;
k.laser_amp_(0.6);
k.laser_rel_(2);
k.laser_noise_freq_(580);
k.laser_dec_(4);
c.hirit_(2);

c.lrit(2);

OSCdef(\end, {
	if (c.num == 512) { // 512 magic num
		Tdef.all.do{arg t; t.stop;};
				Ndef.all.do{arg t; t.stop;};
		Tdef(\j, {
			10.do{
					"say -v juan Di end".unixCmd;
				0.2.wait;
			}
		}).play;
	}
}, 'ck');








c = Ckalculator.new;
//// lambda calculus + piano = ckalculator

f = CkpianoFX.new(0, 4); /// fx in a bit.

(OSCdef(\anne_nums, {
	if (c.num.odd) {
		l.lasers.stop;
		c.hi_noise; //odd nums stop the bass.
	} {
		c.lasers; // TRUE STORY. on even we get a suprise. i promise.
		c.hi_noise.stop;
	}
}, 'ck');
);

c.laser_saw_freq_(80);
c.laser_amp_(0.3)
c.laser_dec_(0.3);
c.lrit_(1/2);
c.laser_rel_(0.2);
Tdef(\freq, {
	loop{
	c.laser_noise_freq_(3345.rrand(80));
		0.1.wait;
	}
}).play;

// lets prepare a trap.
OSCdef(\trap, {
	if (c.num == 1024) {
		Tdef.all.do{arg t; t.stop};
		Ndef.all.do{arg n; n.stop(6);}	};
}, 'ck');


f.delayCK(0.5);
/// anne your freq is the inital bass freq/2
Tdef(\bas, {
	loop{
Ndef(\bass, {SinOsc.ar(Line.kr(c.num/8, 60, 1))*0.5*EnvGen.kr(Env.perc(0.01, 5))}).play(0,2); 	4.wait;
	}
}).play;
c.lrit_(8);
c.laser_rel_(8);
c.laser_saw_freq_(99);
c.hirit_(2);

"jjust a picture to make a video gaaameeee where anne eats candy"
;;;

OSCdef.ar(\del, {
	loop{
		SinOsc.ar(123);
		1.wait;
}, 'ck');


