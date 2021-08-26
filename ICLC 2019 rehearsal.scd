// rehearsal iclc 2019 (vodka in our veins) 1 2 3 !!!!!

// fx
Ndef(\anne_is_not_drunk).fadeTime_(2);

Ndef(\clean, {SoundIn.ar(0,2)}).play(0,2).play; // solo reh

Ndef(\anne_is_not_drunk, {GVerb.ar(PitchShifter.ar(SoundIn.ar(0,2), 0.02, [3,4,3/2]),78, 4)*0.2}).play(0,2);

Ndef(\anne_is_not_drunk, {LFPulse.kr(4)*GVerb.ar(PitchShift.ar(SoundIn.ar(2,2), 0.02, [5/4,1/2,3/2]*LFNoise1.kr(1/3).range(1/2, 4).lag(3)),78, 8)*0.3}).play(0,2);


Ndef(\anne_is_drunk).fadeTime_(3);
Ndef(\anne_is_drunk, {GVerb.ar(PitchShift.ar(SoundIn.ar(2,2), 0.02, [10/4,1/2,3/2]*LFPulse.kr(2).range(2, 6)),178, 28)*0.3}).play(0,2);


// so this session i will try to find stuff i like for iclc... so let's start with an fx...

(
OSCdef(\n, {|msg, time, addr, recvpPort|
	~num = msg[1].asInt;
	if (~num.odd) {
		~odd = True;
		~even = False;
	("say -v karen " ++ ~num.asString).unixCmd;
	} {
		~even = True;
		~odd = False;
		("say -v oliver " ++ ~num.asString).unixCmd;
	}
}, '/ck');
);


~comparisons.on("vi", "xa", "ju"); // to shout out trues and falses. Like JUAN == "cool" -> True

t = TempoClock.default.tempo = 110/60;

(
OSCdef(\a, {|msg, time, addr, recvpPort|
	var rit = [4,8];
	Tdef(\a, {
		(~num.clip(1, 12)).do{
			Ndef(\hi, {HPF.ar(WhiteNoise.ar(1), 8989)*1*EnvGen.kr(Env.perc(0.01, 0.01))}).play([4,5].choose,1);
			(1/rit[~num%2]).wait;
	}
	}).play;
}, '/ck');
);

n = NetAddr("127.0.0.1", 57120)
n.sendMsg("/ck", "1");

// make the sound better (with delay and reverb):
Ndef(\hi_out, {GVerb.ar(CombN.ar(In.ar(4,1), 0.25, 0.25, 6.rrand(1)), 44, 2, 1).sum}).play(0);
Ndef(\hi_outr, {GVerb.ar(CombN.ar(In.ar(5,1), 0.25, 0.25, 3.rrand(1)), 44, 2, 1).sum}).play(1);


~counter = 0;
~time = Pseq([1], inf).asStream;
(
OSCdef(\r, {|msg, time, addr, recvpPort|
	// ~num = msg[1].asInt;
	if (~counter < 1) {
	Tdef(\r, {
	loop{
				Ndef(\ba, {HPF.ar(LPF.ar( CombN.ar(WhiteNoise.ar(EnvGen.kr(Env.perc(0.01, 0.01))*0.3), 0.2, 0.2, 0.1) + SinOsc.ar(\freq.kr(~num.clip(27, 47).midicps)), 3230), 60)*\amp.kr(1)*EnvGen.kr(Env.perc(0.1, 8))}).play(0,2);
			(~time.next).wait;
	}
		}).play;
	} {
		// "say -v vi now i am modifying bass...".unixCmd;
		Ndef(\ba).set(\freq, ~num.clip(27, 47).midicps);
		if (~num > 37) {
		Ndef(\ba).set(\amp, 0.6);
		} {
					Ndef(\ba).set(\amp, 0.8);
		}
	};
	~counter=~counter+1;
}, '/ck');
);

/// NOTE: ostinatos are cool to write the functions


/// easter eggs:

(
OSCdef(\r, {|msg, time, addr, recvpPort|
	// ~num = msg[1].asInt;
	var cmd = msg[1];
	cmd.asString.interpret;
}, '/ck_easteregg');
)

// fill in:

(
	~array = [];
OSCdef(\fill, {|msg, time, addr, recvpPort|
	~array = ~array.add(~num);
	~array.postln;
	if (~array.size == 4) {
		var array = ~array;
		~time = Pseq(1/array, inf).asStream;
		~array = [];
	}
}, '/ck');
)

Tdef(\r).stop;



// 12,01,2019





"Hello ICLC"

"..."

CKpianoFX(2).typicalCK(0.3, [3/2,4/3,2],76, 4);

// we need to know the numbers of course...
c = Ckalculator.new("pau", "juan")
// now we can make more stuff. maybe another fx:

~fx2 = CKpianoFX(2).delay();

///

// TODO: check hi_noise synthesis
c.hi_noise();



c.reciprocal_(true);

c.hi_lock_(true);

c.set_freq1_(false);

c.set_freq2_(false);

c.set_freq3_(false);


/// let's musa

c = Ckalculator.new("paulina", "juan");

/// aaah yes spanish

// not 5 ?

// ok everything seems to be working.
// let's put an fx.
f = CKpianoFX.new(2);
f.delay();

// a chord
c.harmony();

c.set_freq1_(false); // locked at 9

c.set_freq2_(false); // now the 2nd freq.. -> DONE at 589

// and the 3rd freq now:
c.set_freq3_(false);

t = CKpianoFX.new(2);
t.typicalCK(0.2, [5/4, 3/2, 5/6, 4], 107, 9);

/// of course we need some rhythm:
h = Ckalculator();
h.hi_noise();

















