Ndef(\r).fadeTime_(5);
Ndef(\r, {LFPulse.kr(4)*PitchShift.ar(SoundIn.ar(2,2), 0.2, [3/2, 5/4])*0.6}).stop(0,2);

Ndef(\ra, {LFPulse.kr(1, width: 0.1)*PitchShift.ar(SoundIn.ar(0,1), 0.2, [3/2, 5/4]*LFSaw.kr(2).range(1, 1/2))*0.7}).play(1,1);

Ndef(\an, {Impulse(10)+SoundIn.ar(1,1)*0.4}).play(0,1);

// delay
Ndef(\c, {CombN.ar(Ndef(\an), 0.2, 0.35, 6)*0.7}).play(0,2);

Ndef(\cr, {CombN.ar(Ndef(\ra), 0.2, 9)*0.5}).play(0,2);

p = PZ_machine(s);
p.ignite;

f = {SinOsc.ar(["f4".namecps, "f4".namecps(23)])*EnvGen.kr(Env.perc(0.1, 3))*0.05}.play;
~funcs[0] = PZ_layer(f).rhythm([2, 1],0,1,0);
~funcs = {};

Ndef(\h).fadeTime_(3);
t.tempo_(80/60);
Ndef(\h, {LFTri.kr(0.8)*SinOsc.ar(["f4".namecps, "a1".namecps(23)]*2)*0.02*LFNoise1.kr(2).range(0.1,1)}).play(0,2);

Ndef(\h).stop(10);


/// knurl

m = NetAddr.new("192.168.30.1", 6000 );
m.sendMsg('/knurl/trigger', 'Ambience', 1);
m.sendMsg('/knurl/trigger', 'Reus', 1);

m.sendMsg('/knurl/set', 'Ambience', 'vol', 1)
m.sendMsg('/knurl/set', 'Ambience', 'freq', 1);




