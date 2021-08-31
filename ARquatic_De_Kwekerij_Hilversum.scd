// 2nd
"pkill scsynth".unixCmd;
// init
p = PZ_machine(s);
p.ignite;
t.tempo = 70/60;
n = NetAddr("127.0.0.1", 1111); // Python osc server for color and intensity
n.sendMsg("/py", "color", 1, 0);
~funcs=();
~view=1;



// buses (clean is 0)
~fx1 = Bus.audio(s,2); // reverb
~fx2 = Bus.audio(s,2); // fx2
~fxb = Bus.audio(s,2); // bass

"say -v tri ladies and germs. welcome to arquatic!".unixCmd;

// funcs
(
~toWholeTones = {|freq|
	freq.cpsmidi.round(2).midicps};
h = { arg arr;
	var harmony = [];
	arr.do{|a,i| harmony = harmony.add(arr[i].next)}; harmony  };
);

// my sounds my fx
Ndef(\verb, {CombN.ar(In.ar(~fx1,2), 0.5, 0.3, 3)}).fadeTime_(1).play(2,2);
Ndef(\fx2, {BPF.ar(GVerb.ar(In.ar(~fx2,2).distort, 100, 4), ~toWholeTones.(500), 0.4).distort*0.4}).fadeTime_(1).play(2,2);
Ndef(\fxbass, { var in;
	in = LPF.ar(HPF.ar(In.ar(~fxb, 2), 25), 140);
	Limiter.ar(Compander.ar(in, in, 0.1, 1, 2, 0.01, 0.02) + in, 0.9);
}).fadeTime_(1).play(2,2);

// streams
~notes = ();
~bass = ();
~notes[0] = Pseq(["e3".namecps, "c4".namecps, "e5".namecps],inf).asStream;
~notes[1] = Pseq(["e2".namecps, "g#5".namecps],inf).asStream;
~notes[2] = Pseq(["e3".namecps],inf).asStream;
~notes[3] = Pseq(["e1".namecps],inf).asStream;

~bass[0] = Pseq(["e1".namecps, "e0".namecps, "e1".namecps],inf).asStream;

~notes[0] = Pseq([Pfunc{~toWholeTones.(899)}], inf).asStream;

~bass[0] = Pseq([Pfunc{"e2".namecps}], inf).asStream;
~bass[1] = Pseq([Pfunc{~toWholeTones.(345)}], inf).asStream;

// Pfunc{~toWholeTones.(100.rrand(560))}

/// routines
~s1 = {arg ratio, rl, amp; {Splay.ar([LFPulse.ar(~toWholeTones.(400)*LFSaw.kr(2).range(1/2, 1), 0, LFSaw.kr(1).range(0.1,0.9), mul:0.02)+SinOsc.ar(h.(~notes)*ratio)*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)].sum)}.play(s, ~fx1);};

~sbass = {arg ratio, rl, amp; {Splay.ar([Saw.ar(h.(~bass)*Line.kr(3,1,1), mul:EnvGen.kr(Env.perc(0.01, 3))*ratio)+SinOsc.ar(h.(~bass)*Line.kr(ratio,1,1))*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)].sum)*amp}.play(s, ~fxb);};

~s2 = {arg intensity, rl, amp; {[LFPulse.ar(100, 0, LFSaw.kr(1).range(0.01,0.9), mul:0.1).distort+SinOsc.ar(h.()*1)*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)].sum.sum}.play();};

~intensity = {arg intensity; n.sendMsg("/py", "intensity", ~view, intensity);}
~color = {arg intensity; n.sendMsg("/py", "color", ~view, intensity);}

~b = { {LPF.ar(BPF.ar(WhiteNoise.ar(0.7), 300, 0.1), 820)*1*EnvGen.kr(Env.perc(0.1, 0.1), doneAction:2)}.play(s, 2) }

~b.();
p.beats_(4);

// start
~funcs[1] = { PZ_layer(~s1, 1, 0.8, 0.7).rhythm([2], 1, 0 ,[3])};

~funcs[0] = { PZ_layer(~b).rhythm(1, 1, 0, 1)};

~funcs[2] = { PZ_layer(~sbass, 1, 0.5, 0.7).rhythm(1, 0, 1, 0)};

~funcs[3] = { PZ_layer(~sbass, 1.5, 10, 0.9).rhythm(1, 0, 0, 0)};
~funcs[4] = { PZ_layer(~s1, 1, 2, 0.4).rhythm([1])};

~funcs['i'] = { PZ_layer(~intensity, 0.4.rrand(0.7)).rhythm(0, [1]) };
~funcs['c'] = { PZ_layer(~color, 0.3.rrand(1.0)).rhythm([1]); };
~funcs=();

~funcs[4] = ();

~s1.(1, 1, 0.2);

~r = Pseq([1,1/2,1.5, 1/2, 1/3,1/3,1/3], inf).asStream;

Tdef(\s, {
	loop{
	~s1.(1, 3, 0.5);
		~r.next.wait;
	}
}).play;

Tdef(\b, {
	loop{
	~sbass.(1, 2, 5);
		(1).wait;
	}
}).play;

Tdef.all.do{|t| t.stop;}

// fx piano

f = CkpianoFX(2, 4, 4);
f.noisy(0.6, 1, 79, 3, 1, "e7".namecps, 0.2, 1200, 0.14, 0.1);
f.delayCK(1, 1, [0.2, 0.8], 15, 1);

f.noisy.stop(10);
f.delayCK.stop(1);


// explode sound:
Ndef(\explode, {0.8*CombN.ar(BrownNoise.ar(LFNoise2.ar(1/8).range(0.01, 0.8)*EnvGen.kr(Env.perc(0.3, 0.9)))+SinOsc.ar(Line.kr(50, [~toWholeTones.(345),~toWholeTones.(456.rrand(1578))], 3), mul:0.4)*LFSaw.kr(Line.kr(1,7,[3,5.rrand(3.0)]).range(0.01, 0.6)), 0.2, 0.2, 19)*EnvGen.kr(Env.perc(0.3, 14))}).play(2,2);


Ndef(\a1).fadeTime_(9);
Ndef(\anne, {CombN.ar(SoundIn.ar(2,2), 1, [0.3, 0.6], 6)*1}).play(4,2);

Ndef(\a1, {PitchShift.ar(Ndef(\anne), 0.002, [1/2, 3/2, 5/4, 6/5]*LFPulse.kr(4, width: 0.1).range(1/4, 8))*0.4}).play(4,2);

Ndef(\a1).stop(4);

Ndef.all.do{arg n; n.stop(20);}