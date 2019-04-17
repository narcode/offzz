~dump_messages = ();
~count = 0;
(
g = Group.head;
e = Group.head;
f = Group.head;
i = Group.head;
j = Group.head;
~amp = 0.5;
~amph = 0.1;
OSCdef(\sound, {|msg|
	var num, total = 0, items=0, average=0;
	// msg.postln;
	msg.removeAt(0);
	~dump_messages[~count] = msg;
	{
	msg.do{|item|
	item.asString.do{|sub|
	num = sub.asString.asInt;
	total = total + num;
				// total.postln;
		items = items+1;
		average = total/items;
				// ("average " ++ average).postln;
	}
}
	}.fork;

Tdef(\beat, {
		msg.do{|sub|
			var nums;
			sub.asString.do{|char|
				// ("char: " ++ char).postln;
				nums = char.asString.asInt;
				// nums.postln;
				switch(nums,
				0, {Ndef(\3, {
						~amp * LPF.ar(Saw.ar(["B1".namecps, "F#0".namecps]+((("B0".namecps*2)/12)*nums)), 378)*EnvGen.kr(Env.perc(4, 0.2.rrand(20)))}).play(44,2,g);
					},
				4, {Ndef(\34, {
						~amp * 0.5 * LPF.ar(Saw.ar(["B1".namecps, "F#0".namecps]+((("B0".namecps*2)/12)*0)), 378)*EnvGen.kr(Env.perc(4, 0.2.rrand(10)))}).play(44,2,g);
					},
				2, {Ndef(\32, {
						~amp * 0.2 * LPF.ar(Saw.ar(["B1".namecps, "F#0".namecps]+((("B0".namecps*2)/12)*nums)), 378)*EnvGen.kr(Env.perc(4, 0.2.rrand(30)))}).play(44,2,g);
				});
				d[nums].value;
				(1/average).wait;
				}
}
	}).play;

	Tdef(\texture, {
		var layer = 0, rel=20, comparelayer;
		rel = 20.rrand(30);
		msg.do{|sub|
			var nums, length;
			length = sub.asString.size;
sub.asString.do{|char|
				// ("char: " ++ char).postln;
				nums = char.asString.asInt;
				layer.postln;
				if (comparelayer != layer) {"play".postln;
				comparelayer = layer;
				switch(layer,
					0, {Synth(\ckh0, [0, length*1, nums, rel,amp:0.2], e);},
					1, {Synth(\ckh1, [0, length*1, nums, rel,amp:0.2], e);},
					2, {Synth(\ckh2, [0, length*1, nums, rel,amp:0.2], e);},
					3, {Synth(\ckh3, [0, length*1, nums, rel,amp:0.1], e);},

					4, {Synth(\ckh0, [0, length*1, nums, rel, 32,amp:0.2], e);},
					5, {Synth(\ckh1, [0, length*1, nums, rel, 63,amp:0.2], e);},
					6, {Synth(\ckh2, [0, length*1, nums, rel, 67,amp:0.2], e);},
					7, {Synth(\ckh3, [0, length*1, nums, rel, 832,amp:0.1], e);},

					8, {Synth(\ckh0, [0, length*1, nums, rel, 44,amp:0.2], e);},
					9, {Synth(\ckh1, [0, length*1, nums, rel, 44,amp:0.2], e);},
					10, {Synth(\ckh2, [0, length*1, nums, rel, 63,amp:0.2], e);},
					11, {Synth(\ckh3, [0, length*1, nums, rel, 67,amp:0.1], e);},

					12, {Synth(\ckh0, [0, length*1, nums, rel, 90,amp:0.2], e);},
					13, {Synth(\ckh1, [0, length*1, nums, rel, 61,amp:0.2], e);},
					14, {Synth(\ckh2, [0, length*1, nums, rel, 62,amp:0.2], e);},
					15, {Synth(\ckh3, [0, length*1, nums, rel, 63,amp:0.1], e);},

				);
				};
				};
			layer = layer + 1;
		}
	}).play;

	~count = ~count + 1;
}, '/cktree');

(// fx
Ndef(\del, {CombN.ar(In.ar(22,2), 0.2, 0.18, 4)}).play(0,2);
Ndef(\rev, {GVerb.ar(In.ar(44,2), 200, 0.1, 1, drylevel:0.2 )}).play(0,2);
)
);

n = NetAddr("localhost", 57120);
n.sendMsg("/cktree", "189", "2385", "16015217846", "2302539710162364", "1019214801016217542306231012144", "23023101263408230652371012341660812140101662142355460231012344");
n.sendMsg("/cktree", "189", "2385", "16015217846", "1010012031");
n.sendMsg("/cktree", "1", "2385", "101", "101", "1231", "101", "101", "123", "101", "10155", "101", "1401", "101", "101", "101", "001026002");

o = s.options;
o.maxSynthDefs = (64*64)
s.reboot;
t = TempoClock.default.tempo_(90/60);

( // beat
d = (
	0 : {},
	1 : {Ndef(\1, {~amp * HPF.ar(WhiteNoise.ar, 7878)*EnvGen.kr(Env.perc(0.01, 0.01))}).play(0,2, g)},
	2: {Ndef(\2, {~amp * (HPF.ar(LPF.ar(SinOsc.ar(["B0".namecps, 99]*Line.kr(1,1/2, 1/2)), 178), 20) + BPF.ar(WhiteNoise.ar*EnvGen.kr(Env.perc(0.01,0.01)), 1788, 0.6))*EnvGen.kr(Env.perc(0.01, 0.4))}).play(0,2,g)},
	3 : {Ndef(\31, {~amp * BPF.ar(WhiteNoise.ar, 541, 0.1)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.01.rrand(0.1)))}).play(0,2);},
	4: {Ndef(\4, {~amp * BPF.ar(Saw.ar(["B1".namecps, 99])*BrownNoise.ar(2), 578)*EnvGen.kr(Env.perc(0.01, 0.25.rrand(1)))}).play(0,2,g)},
	5: {Ndef(\5, {~amp * 2 * BPF.ar(PinkNoise.ar(2), LFSaw.kr(1/2).range(899, 45).lag(0.1), 0.1)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.1.rrand(1)))}).play(22,2,g)},
	6 : {Ndef(\6, {~amp * BPF.ar(Saw.ar(["G#1".namecps, "g#2".namecps, "f#1".namecps], 0.5)*LFTri.kr(8), 3278)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.1))}).play(44,2, g)},
	7 : {
		Tdef(\7, {
			var rep = [2,4,3].choose;
			rep.do{
				Ndef(\7, {~amp * (HPF.ar(WhiteNoise.ar, 11878.rrand(8567))*EnvGen.kr(Env.perc(0.01, 0.01.rrand(0.001))))}).play(0,2, g);
				(1/rep).wait;
			}
	}).play; },
	8 : {Ndef(\8, {~amp * 2 * BPF.ar(SinGrain.ar(Impulse.kr(20.rrand(8)), 0.01, 178.rrand(5563).cpsmidi.round(3).midicps, 1), 688, 0.5)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.25.rrand(8)))}).play(0,2,g)},
	9 : {
		{
		Tdef(\9, {
			2.do{
				Ndef(\2, {~amp * (HPF.ar(LPF.ar(SinOsc.ar(["B0".namecps, 99]*Line.kr(1,1/2, 1/2)), 178), 20) + BPF.ar(WhiteNoise.ar*EnvGen.kr(Env.perc(0.01,0.01)), 1788, 0.6))*EnvGen.kr(Env.perc(0.01, 0.4))}).play(0,2,g);
				(1/2).wait;
			}
	}).play; }
	}
)
);


( // harmony
h = (
	1: (
	0 : {},
	1 : {Ndef(\1, {~amp * HPF.ar(WhiteNoise.ar, 7878)*EnvGen.kr(Env.perc(0.01, 0.01))}).play(0,2, g)},
	2: {Ndef(\2, {~amp * (HPF.ar(LPF.ar(SinOsc.ar(["b0".namecps, 99]*Line.kr(1,1/2, 1/2)), 178), 20) + BPF.ar(WhiteNoise.ar*EnvGen.kr(Env.perc(0.01,0.01)), 1788, 0.6))*EnvGen.kr(Env.perc(0.01, 0.4))}).play(0,2,g)},
	3 : {Ndef(\31, {~amp * BPF.ar(WhiteNoise.ar, 541, 0.1)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.01.rrand(0.1)))}).play(0,2);},
	4: {Ndef(\4, {~amp * BPF.ar(Saw.ar(["b1".namecps, 99])*BrownNoise.ar(2), 578)*EnvGen.kr(Env.perc(0.01, 0.25.rrand(1)))}).play(0,2,g)},
	5: {Ndef(\5, {~amp * 2 * BPF.ar(PinkNoise.ar(2), LFSaw.kr(1/2).range(899, 45).lag(0.1), 0.1)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.1.rrand(1)))}).play(22,2,g)},
	6 : {Ndef(\6, {~amp * BPF.ar(Saw.ar(["g1".namecps, "g2".namecps, "f1".namecps], 0.5)*LFTri.kr(8), 3278)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.1))}).play(44,2, g)},
	7 : {
		Tdef(\7, {
			var rep = [2,4,3].choose;
			rep.do{
				Ndef(\7, {~amp * (HPF.ar(WhiteNoise.ar, 11878.rrand(8567))*EnvGen.kr(Env.perc(0.01, 0.01.rrand(0.001))))}).play(0,2, g);
				(1/rep).wait;
			}
	}).play; },
	8 : {Ndef(\8, {~amp * 2 * BPF.ar(SinGrain.ar(Impulse.kr(20.rrand(8)), 0.01, 178.rrand(5563).cpsmidi.round(3).midicps, 1), 688, 0.5)*EnvGen.kr(Env.perc(0.01.rrand(1), 0.25.rrand(8)))}).play(0,2,g)},
	9 : {
		{
		Tdef(\9, {
			2.do{
				Ndef(\2, {~amp * (HPF.ar(LPF.ar(SinOsc.ar(["b0".namecps, 99]*Line.kr(1,1/2, 1/2)), 178), 20) + BPF.ar(WhiteNoise.ar*EnvGen.kr(Env.perc(0.01,0.01)), 1788, 0.6))*EnvGen.kr(Env.perc(0.01, 0.4))}).play(0,2,g);
				(1/2).wait;
			}
	}).play; }
	}
	),
	2 : {}
	)
);

a = ["1", "23", "101214", "23023101234", "1012140101214230231012144", "230231012340230231012341012140101214230231012344"];

a.do{|item|
		var num, total = 0, items=0;
	item.do{|sub|
	num = sub.asString.asInt;
	total = total + num;
	total.postln;
		items = items+1;
		(total/items).postln;
	}
}

/// synthdefs
(
SynthDef(\ckh0, {|out=0, length=1, nums=1, rel=20, root=60, filterfreq=688, amp=0.5|
	var sound, env;
	sound = amp * 0.8/length * BPF.ar(SinGrain.ar(Impulse.kr(nums), 0.01, (root+nums).midicps, 1), filterfreq, 0.5);
	env = EnvGen.kr(Env.perc(2, rel),doneAction:2);
	Out.ar(0, (sound*env)!2);
}).add;

SynthDef(\ckh1, {|out=0, length=1, nums=1, rel=20, root=65, filterfreq=888, amp=0.5|
	var sound, env;
	sound = amp * 0.8/length * BPF.ar(SinGrain.ar(Impulse.kr(nums), 0.09, (root+nums).midicps, 1), filterfreq, 0.05);
	env = EnvGen.kr(Env.perc(2, rel),doneAction:2);
	Out.ar(0, (sound*env)!2);
}).add;

SynthDef(\ckh2, {|out=0, length=1, nums=1, rel=20, root=85, filterfreq=1888, amp=0.5|
	var sound, env;
	sound = amp * 0.8/length * BPF.ar(SinGrain.ar(Impulse.kr(2*nums), 0.001, (root+nums).midicps, 1), filterfreq, 0.05);
	env = EnvGen.kr(Env.perc(2, rel),doneAction:2);
	Out.ar(0, (sound*env)!2);
}).add;

SynthDef(\ckh3, {|out=0, length=1, nums=1, rel=20, root=32, filterfreq=200, amp=0.5|
	var sound, env;
	sound = amp * 0.8/length * LPF.ar(SinOsc.ar(root.midicps+nums, 0, 0.5), filterfreq);
	env = EnvGen.kr(Env.perc(2, rel),doneAction:2);
	Out.ar(0, (sound*env)!2);
}).add;
);

c = Ckalculator.new();
x = CKpianoFX.new(0);
x.delayCK(1, 0.7, 16);
x.noisy(13, 0.5, 0.9, 345);
x.typicalCK(1.4, [1/2, 9/8, 5/4], 123, 6);


c.lasers;
c.laser_amp_(0.5);
c.laser_dec_(4);
c.laser_rel_(0.1);
c.laser_noise_freq_(567);
c.lrit_(4);
c.lasers.stop

Synth(\ckh3, [amp: 0.1])

///

Ndef(\3, {~amp * LPF.ar(Saw.ar(["B1".namecps, "F#0".namecps]+((("B0".namecps*2)/12)*3)), 378)*EnvGen.kr(Env.perc(4, 0.2.rrand(8)))}).play(44,2,g)

~dump_messages[11]