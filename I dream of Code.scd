////  Off<>zz  ---> we are back.

///// Birthday Edition! Anne's birthday...


It's Anne's birthday (June 10th) :) ---> she turns 19!


////// session 1:

Ndef(\n, {FreeVerb.ar(SinOsc.ar(LFSaw.kr([1, 1/8]).range("g4".namecps, LFNoise1.kr(4).range(1230, 4567)).cpsmidi.round(3).midicps), 0.8, 0.9)*0.2*LFPulse.kr(4)}).play(0,2);

Ndef(\n).stop(6);

//// to C minor //// :( --- again...
Ndef(\a, {|ratio=1, rit=2|FreeVerb.ar(SinOsc.ar(["c1".namecps, "eb2".namecps]*ratio*LFPulse.kr(rit, width:0.1).range(1, 1.5).lag(0.01)), 0.2, 0.4)*0.9}).play(0,2);

///change the rhythm;;;
Pdef(\r, {Pbind(\type, \set, \args, [\rit, \ratio], \rit, Pseq([2, 4, 2, 5], inf), \delta, 1)}).play;

Ndef(\n).quant_(1);

/// maybe now an fx for Anne...

/// birthday effect:   //// ///
Ndef(\anne, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [2, 4/3]), 1/2, 1/4, 6)*1.3}).play(0,2);

Ndef(\anne2, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, [2, 4/3]*LFSaw.kr(1/4).range(1, 1.5)), 1/2, 1/4, 6)*1}).play(0,2);  /// ?

Ndef(\a).stop(4);


///////
We are going to livecode on LIEBESTRAUM (A dream of Love) by Liszt
////////

OUR VERSION IS CALLED ---> "I DREAM OF CODE"

Tdef(\dream, {
	loop{
"say -v vicki -r 90 I dream of...".unixCmd;
20.wait;
	}
}).play;


/// my arppeggio
Ndef(\n).fadeTime_(4);
Ndef(\n, {|freq=415| SinOsc.ar(freq)*LFNoise1.kr(6).range(0.4, 0.8)}).play(0,2);

Pdef(\arp, {Pbind(\type, \set, \freq, Pseq(["ab-1".namecps, "eb3".namecps, "ab3".namecps, "c4".namecps, "ab3".namecps, "eb3".namecps]/3, inf), \delta, 1/3)}).play;

t = TempoClock.default;
t.tempo_(105/60);

Ndef(\n).stop(4);

Ndef(\a, {|freq=415| CombN.ar(SinOsc.ar(freq/2)*LFNoise1.kr(6).range(0.2, 0.5), 0.5, t.tempo/2, 3)*0.7}).play(0,2);

//// bass...
Tdef(\b, {
	var melody = Pseq(["ab1".namecps, "g1".namecps, "f1".namecps, "b0".namecps, "eb1".namecps], inf).asStream;
	loop{
Ndef(\b, {Saw.ar([melody.next, melody*2])*0.8*EnvGen.kr(Env.perc(0.1, 6))}).play(0,2);
		4.wait;
	}
}).stop;

/// little pause ///

///////
We are going to livecode on LIEBESTRAUM (A dream of Love) by Liszt
////////

OUR VERSION IS CALLED ---> "I DREAM OF CODE"

~string = " I... dream...";
~string;

~marian = " thanks for joining...";


Tdef(\dream, {
	loop{
		("say -v vicki -r 50"++~string).unixCmd;
		// -> YES!
		60.wait;
	}
}).play;

Tdef(\marian, {
	loop{
		("say -v vicki -r 100"++~marian).unixCmd;
		// -> YES!
		4.wait;
	}
}).play;

///// bass...

Tdef(\b, {
	var melody = Pseq(["ab1".namecps, "f1".namecps, "eb1".namecps, "b0".namecps, "eb0".namecps], inf).asStream;
		var melody2 = Pseq(["db1".namecps, "fb1".namecps, "db1".namecps, "c0".namecps, "eb0".namecps], inf).asStream;

	loop{
		Ndef(\b, {Saw.ar([melody2.next, melody.next*2.01])*0.5*EnvGen.kr(Env.perc(0.6, 6))*0.4}).play(0,2);
		4.wait;
};
}).play;

/// beach sounds...

Ndef(\beach, {LPF.ar(WhiteNoise.ar(0.5), LFNoise1.kr(1/6).range(80, 456))*1}).play(0,2);


Ndef(\beach).stop(5);








