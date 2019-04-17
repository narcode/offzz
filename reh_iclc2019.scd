//////// why ?

c = Ckalculator.new();
f = CKpianoFX.new(2);
f.delay(); // --> add amp and par control
f.typicalCK(1, [4/2, 5/4, 3], 8, 9);
f.noisy(1);

c.hi_noise(); /// this func grabbes anne's num. ah thats clear there.
c.hi_lock_(true); // damn i need to check this.
c.hirit_(1/9);
c.harmony(0);
c.lasers.stop;
c.set_freq1_(c.boolean.asString.interpret); // anne you can set the root freq of the chord.
/// try again... // ah this one is nice.
c.set_freq2_(false);
c.set_freq3_(false); // now the last freq if u want.

/// let's try some comparisons. so u set the harmony urself.
c.boolean;
// can u please do some comparisons?

c.non_number_count;
c.num

///// trying to make an algo
/// with this you can set true or false and change the harmony (or not) and also lock the hi hat ryhtm or not... try it?
OSCdef(\anne_solo, {
	// c.lasers;
if (c.boolean.asString.interpret) {
	c.set_hi_(c.boolean.asString.interpret);
	c.set_freq1_(c.boolean.asString.interpret);
} { c.set_hi_(c.boolean.asString.interpret); c.set_freq1_(c.boolean.asString.interpret);}
}, '/ck');
c.hirit_(1);
c.lasers;
c.set_l_(false); c.lrit_(2);
c.laser_dec_(0.2); c.laser_rel_(0.1); c.laser_noise_freq_(6234); c.laser_amp_(0.6);





