Ndef(\an, {FreeVerb.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFNoise0.kr(3).range(0.9,1.1)), 0.9, 0.6) * 0.6}).play(0, 4);

Ndef(\me).fadeTime_(5);

Ndef(\me, {|freq=110, rit=0.5| SinOsc.ar(freq).clip(0.01) * LFPulse.kr(rit).range(0, 0.1) * 0}).play(0, 4);


Pdef(\me, {Pbind(\type, \set, \args, [\freq, \shift], \rit, Pseq([0.2, 0.2, 0.4, 0.2, 0.5, 0.5]+1, inf), \freq, Pseq(["g#1".namecps, "c#1".namecps*1.01, "e1".namecps*1.02], inf), \delta, 0.2)}).play.fadeTime_(4);



Ndef(\an, {CombN.ar(PitchShift.ar(SoundIn.ar(0), 0.2, LFNoise0.kr(3).range(1,1.01)), 0.9, 0.6, 2) * 0.2}).play(0, 4);


Tdef(\sn, {
	inf.do({ Ndef(\sn, {BrownNoise.ar([0, 0, 1].choose) * EnvGen.ar(Env.perc(0.01, 0.2), doneAction: 2)}).play; 0.5.wait});
}).stop;

Ndef(\last, {var input; input = In.ar(0, 4); ReplaceOut.ar(0, CombL.ar(input, 1, 1, 2)*0.9)}).play(0, 4);

Ndef(\last).stop(4);



//////////////////////////////////////////////////////////////////////////////////////////////////////////

Tdef(\me, {
	inf.do({	Ndef(\me, {|amp=2|BPF.ar(WhiteNoise.ar(amp), [115, 223*3/2, 217*6/5]*1*[1, 1.01, 0.9].choose, 0.01) * EnvGen.ar(Env.perc(0.1, 0.5), doneAction: 2)}).play(0, 2); 0.4.wait});
}).play;

Ndef(\an, {CombN.ar(BPF.ar(SoundIn.ar(0), "c#4".namecps, 0.01), 0.2, 0.2, 10) * LFPulse.ar(4).range(0.5, 3) * 1 }).play;

Tdef(\me2, {
	inf.do({	Ndef(\me2, {|amp=5|BPF.ar(WhiteNoise.ar(amp), [110, 220*3/2, 220*6/5]*5*[1, 3/2, 5/4].choose, 0.001) * EnvGen.ar(Env.perc(0.1, 0.5), doneAction: 2)}).play(0, 2); 0.3.wait});
}).play;


Ndef(\an2, {CombN.ar(BPF.ar(SoundIn.ar(1), "c3".namecps, 0.1), 0.2, 0.2, 10) * LFPulse.ar(4).range(0.5, 3) * 1 }).play;

Tdef(\me3, {
	inf.do({	Ndef(\me3, {|amp=8|BPF.ar(WhiteNoise.ar(amp), [110, 220*3/2, 220*6/5]*2.5*[1, 3/2, 5/4].choose, 0.001) * EnvGen.ar(Env.perc(0.1, 0.5), doneAction: 2)}).play(0, 2); 1.wait});
}).play;

Tdef(\meb, {
	inf.do({Ndef(\meb, {|amp=17|BPF.ar(WhiteNoise.ar(amp), [110, 220*3/2, 220*6/5]*1/4*[1, 3/2, 5/4].choose, 0.1) * EnvGen.ar(Env.perc(0.01, 0.1), doneAction: 2)}).play(0, 2); 0.2.wait});
}).play;


Ndef(\last, {var sig; sig=FreeVerb.ar(In.ar(0,2), 1, 1, 0, 1); ReplaceOut.ar(0, sig)}).play;


///////////////////////////////////////////////////////////////////////////////////////////////////////

"say -v tri sorry".unixCmd;
Ndef(\me).play.fadeTime_(10);

Ndef(\me, {PinkNoise.ar(0.3) * LFTri.ar(0.2).range(0.1, 1)}).play;

~pond = ();
Tdef(\rain, {
	20.do({|i|
		~pond[i] = Ndef(\drop, {(PinkNoise.ar(LFPulse.ar(420, width: 0.2))*LFNoise0.kr(7).range(0.1, 1)) * EnvGen.kr(Env.perc(0.01,0.5), doneAction:2)}).play; 0.1.wait})
}).play;

SynthDef(\drop, {|freq = 420, amp = 1, out=0|
var sig, env;
	sig = PinkNoise.ar(LFPulse.ar(420, width: 0.2))*LFPulse.kr(7).range(LFNoise0.kr(3).range(0.1, 0.8), amp);
	env = EnvGen.kr(Env.perc(0.01,0.5), doneAction:2);
	Out.ar(out, sig * env);
}).add;

Tdef(\rain, {
	20.do({|i|
		~pond[i] = Synth(\drop); 0.1.wait});
}).play;

Ndef(\me).stop;
...........

