////
"pkill scsynth".unixCmd;
/*NetAddr.localAddr*/

Ndef(\n).fadeTime = 5;

Ndef(\n, {BPF.ar(SinOsc.ar(["f#2".namecps, "d#1".namecps])*LFNoise2.kr(4).range(1.25,0.7), 899)*0.15*LFPulse.kr(0.2, width:0.8)}).play(0,2);

Ndef(\a, {LPF.ar(SinOsc.ar(["a2".namecps, "a1".namecps]*Line.kr(1, 0.5, 0.6)), 220)*0.7*EnvGen.kr(Env.perc(0.01, 1).circle(2))}).stop(0,1);

Ndef(\r, {LPF.ar(SinOsc.ar(["c2".namecps, "f1".namecps]*Line.kr(1, 2, 0.6)), 320)*0.7*EnvGen.kr(Env.perc(0.01, 1).circle(1))}).stop(1,1);

{
	inf.do{
		Ndef(\c, {BPF.ar(WhiteNoise.ar(0.3), 555)*EnvGen.kr(Env.perc(0.01, 0.4))}).play(0,1);
		2.wait;
	}
}.fork;

/// fx
f = CkpianoFX(2,0);

f.delayCK(0.35, 0.4, 3);

~f2.typicalCK(0.1, [3/2, 9/2, 5/4], 4, 0.4);
f.typicalCK.stop(4)

p = PZ_machine(s);
p.ignite;

t.tempo=40/60;
~view = 1;
~scale = Pseq(["b4".namecps, "c4".namecps, "d4".namecps, "e4".namecps],inf).asStream;
~scale2 = Pseq(["f#4".namecps, "g#4".namecps, "d4".namecps],inf).asStream;
~s1 = {arg intensity; {Impulse.ar(LFSaw.kr(1/3).range(1,19))+SinOsc.ar([~scale.next, ~scale2.next, "c1".namecps]*1)*0.01*EnvGen.kr(Env.perc(0.01, 6), doneAction:2)}.play();
	n.sendMsg("/py", "intensity", ~view, intensity); };

~s2 = { {SinOsc.ar(["e#2".namecps, "B2".namecps]*1*LFNoise0.kr(1).(4, 0.4.rrand(0.1)))*0.1*EnvGen.kr(Env.perc(0.01, 0.3), doneAction:2)}.play() }

~b = { {LPF.ar(SinOsc.ar(["f#2".namecps, "c1".namecps]*Line.kr(1, 0.5, 1)), 220)*0.2*EnvGen.kr(Env.perc(1, 0.1), doneAction:2)}.play() }

~funcs[1] = { PZ_layer(~s1, 0.0.rrand(1)).rhythm([3],1,1,[3])};
~funcs[2] = { PZ_layer(~s2).rhythm([0], [0], 3.rrand(0).round(), [0])};
~funcs[3] = { PZ_layer(~b).rhythm(1,0,1,0)};


~funcs = ();


Ndef(\explode, {CombN.ar(BrownNoise.ar(LFNoise2.ar(2).range(0.01, 0.4)*EnvGen.kr(Env.perc(1, 0.3)))+SinOsc.ar(Line.kr(50, [~toWholeTones.(345),~toWholeTones.(456.rrand(578))], 1), mul:0.1)*LFSaw.kr(Line.kr(1,4,[3,5.rrand(3.0)]).range(0.001, 0.4)), 0.2, 0.2, 4)*EnvGen.kr(Env.perc(0.2, 8))}).play(0,2);

// c,d,e,f#,g#,bb == 60,62,64,66,68,70,72
~toWholeTones = {|freq| freq.cpsmidi.round(2).midicps}
~toWholeTones.(100)
/// objective is water.

Ndef.all.do{|n| n.clear};
Tdef.all.do{|n| n.clear};

t.tempo = 90/60;
Ndef(\anne).fadeTime_(4);

// FX:
Ndef(\anne, {FreeVerb1.ar(Limiter.ar(SoundIn.ar(2, 0.4), 0.9)*LFTri.kr(2).range(0.1, 2), 7)*0.3}).play(0,1);
Ndef(\anne2, {FreeVerb1.ar(FreqShift.ar(Limiter.ar(SoundIn.ar(3, 0.4), 0.9), LFSaw.kr(4).range(10, 1400)), 4)*0.3}).play(1,1);

Ndef(\a, {FreeVerb1.ar(Impulse.ar(LFSaw.kr(0.3).range(0.2, LFTri.kr(1/10).range(1, 20)))+SinOsc.ar("b3".namecps*LFSaw.kr(LFSaw.kr(3).range(0.001, 0.2)).range(0.5, LFSaw.kr(1).range(0.1, 1)), mul:0.7)*0.3, 0.2)*0.2}).play(0,1);

// backgrd
Ndef(\background).fadeTime_(3);
Ndef(\background, {BPF.ar(WhiteNoise.ar(1*Impulse.kr(2))*LFNoise1.kr(1/4).range(0.1, 0.2), [100,456], [0.1, 0.3])*15}).play(0,2);

Tdef(\s, {
	loop{
		Ndef(\n, {BPF.ar(WhiteNoise.ar(LFNoise0.kr(1).range(0.1, 0.8))*LFNoise1.kr(1/4).range(0.1, 0.2), [1000,7456], LFSaw.kr(1).range(0.001, 0.2))*EnvGen.kr(Env.perc(0.1, 0.3))}).play([0,1].choose,1);
		[1/5, 1/8].choose.wait;
	}
}).stop;


/// tranform sounds

OSCdef(\ckar2, {arg msg;
			var key = msg[1].asString.split($,);
			var tree = key[0].findRegexpAt("[0-9]+")[0];
			var room = msg[2].linlin(-1, 1, 1, 30);
			msg.postln;
	  Ndef(\explodeT, {CombN.ar(BrownNoise.ar(LFNoise2.ar(2).range(0.01, 0.4)*EnvGen.kr(Env.perc(1, 0.3)))+SinOsc.ar(Line.kr(50, 345, 1), mul:0.8)*LFSaw.kr(Line.kr(1,4, 3).range(0.001, 0.4)), 0.2, 0.2, 4)*2*EnvGen.kr(Env.perc(0.2, 8))}).play(2,2);
}, 'ckartreetransform');

OSCdef(\ckar1, {arg msg;
			// ("VIEW: " + msg).postln;
	~view = msg[1].asInteger;
	~view.postln;
}, 'ckartreeview');

// public
OSCdef(\arquatic_public, {arg msg;
			msg.postln;
		  Ndef(\explodeT, {CombN.ar(BrownNoise.ar(LFNoise2.ar(2).range(0.01, 0.4)*EnvGen.kr(Env.perc(1, 0.3)))+SinOsc.ar(Line.kr(50, 345, 1), mul:0.8)*LFSaw.kr(Line.kr(1,4, 3).range(0.001, 0.4)), 0.2, 0.2, 4)*2*EnvGen.kr(Env.perc(0.2, 8))}).play(2,2);
}, 'public_transform');

// OSC addresses:
// l-system rule:
'ckartree'
// continous msgs:
'ckarvalue'




//// color and intensity
n = NetAddr("127.0.0.1",1111);
n.sendMsg("/py", "color", 1, 0);

"python3 /Users/narcodeb/arquatic_lc.py --key=color --tree=1 --val=0".unixCmd;



/// performance checklist
- book server
- boot relay
- boot CK
- check osc port
- check ip address
- hi-midi res off
- keyboard lock
- volumes



OSCdef(\test, {arg msg;
			msg.postln;
}, 'noise');

