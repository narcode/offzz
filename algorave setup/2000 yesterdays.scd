a.pop;
t= TempoClock.default;
t.tempo_((75*2)/60);

(
MIDIdef.noteOn(\1000, {|val, num, chan|
	[val, num, chan].postln;
	p.set(\freq, num.midicps);
});

MIDIdef.cc(\yesterday, {|val, num, chan|
	//[val, num, chan].postln;
	if (num==1) {p.set(\rate, val.linlin(0, 127, 0.5, 300)).postln; };
});
);

//t.beatsPerBar;

~vp = 1.3

(
t.tempo_(150/60);
t.playNextBar({
Pdef(\b1, {Pbind(\instrument, \drum1000, \delta, Pseq([1/2], 8), \amp, 10)}).play(quant: Quant(1));

Pdef(\s, {Pbind(\instrument, \snare1000, \freq2, Pseq([Pseq(6200!4, 7), Pseq([780, 5800, 3200, 7000], 1)], inf), \delta, Pseq(Array.series(32, 1, 0)*1,inf),\out, 0, \amp, Pseq([Pseq([0, 2, 0, 2], 7), Pseq([0, 4, 4, 4], 1)], inf)*Pfunc({~vp}) )}).play(quant: Quant(1, 4)); // SOUNDCHECK SNARE LEVEL!

Pdef(\b, {Pbind(\instrument, \drum1000, \delta, Pseq([Pseq([31/8, 1/8]*2,2), Pseq([4],1)], inf), \amp, 10 )}).play(quant: Quant(1, 4));

Pdef(\h, {Pbind(\instrument, \hi1000, \delta, Pseq([Pseq(1/2!4, 3), Pseq([1], 1)], inf), \amp, 20)}).play(quant: Quant(1, 4));

Pdef(\bs, {Pbind(\instrument, \bs1000, \freq, Pseq(["f1".namecps, "f1".namecps, "f1".namecps, "ab1".namecps, "eb1".namecps, "eb1".namecps, "eb1".namecps]*3/4, inf), \delta, Pseq([Pseq([31/8, 1/8], 1), Pseq([4], 1), Pseq([3, 1/3, 1/3, 1/3], 1)]*2, inf), \legato, 0.01, \amp, 2, \rt, Pseq([2, 0.2, 2, 2, 0.5, 0.5, 0.5], inf))}).play(quant: Quant(1, 4)); /// relasetime details
});
);

Pdef(\b1, {Pbind(\instrument, \drum1000, \delta, Pseq([1/4], 8), \amp, 10)}).play(quant: Quant(1));

Pdef(\s1, {Pbind(\instrument, \snare1000, \freq2, Pseq([Pseq(6200!4, 7), Pseq([2780, 5800, 3200, 7000], 1)], inf), \delta, Pseq(Array.series(8, 1/4, 0), 1),\out, 0, \amp, Pseq([Pseq([0, 1, 0, 1], 2), Pseq([0, 1, 0, 1], 1)], inf)*1 )}).play(quant: Quant(1));

Pdef(\h1, {Pbind(\instrument, \hi2000, \rate, 5, \delta, Pseq([Pseq(1/10!4, 2), Pseq([1/12], 2)], 1), \amp, 90)}).play(quant: Quant(0.25));



( // cut in 4
Ndef(\n, { var in = PinkNoise.ar(0.1)*LFSaw.ar([12, 1]).range(0.1, 1); in = CombL.ar(RHPF.ar(in, XLine.kr(30, 19020, 1.5), Line.kr(0.5, 0.1, 2)), 0.1, 0.4, 4); Out.ar(0, in*EnvGen.kr(Env.linen(0, 0.5, 2, 3)) )}).play;

[\s, \bs, \h, \b].do({|key| Pdef(key).stop(0)});
Ndef(\rev).free;
);

(
t.tempo_(75/60);
[\s, \bs, \h, \b].do({|key| Pdef(key).play(quant:(0))});

/*Pdef(\s).play(quant:0);
Pdef(\bs).play(quant:0);
Pdef(\h).play(quant:0);
Pdef(\b).play(quant:0);*/

Ndef(\rev, {|time =2| var sig = BPF.ar(CombC.ar(In.ar(0, 2), 0.2, 1/5, time), LFTri.kr(1/(time*4)).range(300, 2700), 0.1); Out.ar(0, sig*4)});
);


//fill

p = Synth(\pad1000, [\amp, 4, \rate, 1/2, \freq, "c2".namecps, \lf, 300, \out, 99]);

p.set(\lf, 400, \rate, 4, \freq, "g3".namecps);
p.set(\amp, 20, \out, 99);
Ndef(\fxmil, {LPF.ar(In.ar(99, 2), 430)*0.4}).play;
p.free;

s.sendMsg(\n_free, 11621)

// IMPRO
Ndef(\n, { var in = PinkNoise.ar(0.2)*LFSaw.ar([6, 13]).range(0.1, 1); in = CombL.ar(RHPF.ar(in, Line.kr(3300, 600, 5), Line.kr(0.5, 0.1, 1, doneAction:0)), 0.2, 0.1, 0.1); Out.ar(0, in*EnvGen.kr(Env.linen(1, 4, 18, level: 1), doneAction:2))}).play;

Ndef(\n2, { var in = PinkNoise.ar(0.2)*LFSaw.ar([3, 5]).range(0.1, 1); in = CombL.ar(RHPF.ar(in, Line.kr(1300, 120, 4), Line.kr(0.5, 0.1, 1, doneAction:0)), 0.2, 0.1, 0.1); Out.ar(0, in*EnvGen.kr(Env.linen(1, 0.2, 17, level: 1), doneAction:2))}).play;



//// midi yo
MIDIIn.connectAll;
(
MIDIdef.noteOn(\1000, {|val, num, chan|
	[val, num, chan].postln;
	p.set(\freq, num.midicps);
});

MIDIdef.cc(\yesterday, {|val, num, chan|
	//[val, num, chan].postln;
	if (num==1) {p.set(\rate, val.linlin(0, 127, 0.5, 300)).postln; };
});
);


// 1- delay snare; 2- cut; 3- vocoder;

thank you
//// CODE END AS in Album