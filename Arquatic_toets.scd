// Toets des tijds
// init
p = PZ_machine(s);
p.ignite;
t.tempo = 70/60;
n = NetAddr("127.0.0.1", 1111); // Python osc server for color and intensity
n.sendMsg( "/py", "color", 8, 0.99);
~funcs=();
~view=1;

// buses (clean is 0)
~fx1 = Bus.audio(s,2); // reverb
~fx2 = Bus.audio(s,2); // fx2
~fxb = Bus.audio(s,2); // bass

"say -v tri ladies and germs. welcome to arquatic!".speak;

// funcs
(
~toWholeTones = {|freq| freq.cpsmidi.round(2).midicps};
h = { arg arr;
	var harmony = [];
	arr.do{|a,i| harmony = harmony.add(arr[i].next)}; harmony  };
);

// my sounds my fx
Ndef(\verb, {CombN.ar(In.ar(~fx1,2), 0.5, 0.3, 10)}).fadeTime_(1).play(0,2);
Ndef(\fx2, {BPF.ar(GVerb.ar(In.ar(~fx1,2).distort, 100, 7), ~toWholeTones.(200), 0.4).distort*1.5}).fadeTime_(1).play(0,2);
Ndef(\fxbass, { var in;
	in = LPF.ar(HPF.ar(In.ar(~fxb, 2), 25), 140);
	Limiter.ar(Compander.ar(in, in, 0.1, 1, 2, 0.01, 0.02) + in, 0.9);
}).fadeTime_(1).play(0,2);

// streams
~notes = ();
~notes2 = ();
~bass = ();
~notes[0] = Pseq(["e5".namecps, "e3".namecps, "e5".namecps],inf).asStream;
~notes[1] = Pseq(["e4".namecps, "e3".namecps],inf).asStream;
~notes[2] = Pseq(["e4".namecps],inf).asStream;
~notes[3] = Pseq(["e2".namecps],inf).asStream;

~bass[0] = Pseq(["e1".namecps, "e1".namecps],inf).asStream;

~notes2[0] = Pseq([Pfunc{~toWholeTones.(2000.rrand(1678))}], inf).asStream;

~bass[0] = Pseq([Pfunc{51}], inf).asStream;
~bass[1] = Pseq([Pfunc{55}], inf).asStream;

// Pfunc{~toWholeTones.(100.rrand(560))}

/// routines
~s1 = {arg ratio, rl, amp; {Splay.ar([LFPulse.ar(~toWholeTones.(400)*LFSaw.kr(2).range(1/2, 1), 0, LFSaw.kr(1).range(0.1,0.9), mul:0.02)+SinOsc.ar(h.(~notes)*ratio)*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)].sum)}.play(s, ~fx1);};

~sbass = {arg ratio, rl, amp; {Splay.ar([Saw.ar(h.(~bass)*Line.kr(3,1,1), mul:EnvGen.kr(Env.perc(0.01, 3))*ratio)+SinOsc.ar(h.(~bass)*Line.kr(ratio,1,1))*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)].sum)}.play(s, ~fxb);};


~s2 = {arg ratio, rl, amp; {Splay.ar([LFPulse.ar(~toWholeTones.(800)*LFSaw.kr(2).range(1/2, 1), 0, LFSaw.kr(1).range(0.1,0.9), mul:0.02)+SinOsc.ar(h.(~notes2)*ratio)*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)].sum)}.play(s, ~fx1);};

~intensity = {arg intensity; n.sendMsg("/py", "intensity", ~view, intensity);}
~color = {arg intensity; n.sendMsg("/py", "color", ~view, intensity);}

~b = { {LPF.ar(SinOsc.ar(["f#2".namecps, "c1".namecps]*Line.kr(1, 0.5, 1)), 220)*0.2*EnvGen.kr(Env.perc(0.01, 0.1), doneAction:2)}.play() }

p.beats_(4);

// start
~funcs[1] = { PZ_layer(~s1, 1, 0.01, 0.3).rhythm([5,0,2,1,1], [2,1,0], [1,0,1], [0,0,1])};
~funcs[2] = { PZ_layer(~s2, 1, 0.01, 0.4).rhythm([9,1,0], 1, 0, 1)};
~funcs[3] = { PZ_layer(~sbass, 5, 0.2, 0.1).rhythm([1,0,1,0,1,1])};
~funcs['i'] = { PZ_layer(~intensity, 0.2.rrand(0.4)).rhythm(1) };
~funcs['c'] = { PZ_layer(~color, 0.1.rrand(0.4)).rhythm(1); };
~funcs=();

~funcs[1] = ();
~funcs[2] = ();
~funcs[2] = ();


// fx piano

f = CkpianoFX(2,0);
f.noisy(0.2, 1, 89, 38, 0.1, "c4".namecps, 0.01, 500, 0.14, 4);
f.delayCK(0.3, 1, 0.3, 4, 1);
f.typicalCK(0.3, 1, [1/2, 3/2, 5/4], 4, 18);

f.noisy.stop(10);
f.delayCK.stop(10);
f.typicalCK.stop(10);


// explode sound:
Ndef(\explode, {0.01*CombN.ar(BrownNoise.ar(LFNoise2.ar(1/8).range(0.01, 0.4)*EnvGen.kr(Env.perc(0.3, 0.9)))+SinOsc.ar(Line.kr(50, [~toWholeTones.(345),~toWholeTones.(456.rrand(3578))], 3), mul:0.4)*LFSaw.kr(Line.kr(1,4,[3,5.rrand(3.0)]).range(0.001, 0.6)), 0.2, 0.2, 19)*EnvGen.kr(Env.perc(0.2, 34))}).play(0,2);
