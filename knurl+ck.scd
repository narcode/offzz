// Put Rafaele's firewall off
// Check port  - now 8000
// "pkill scsynth".unixCmd;
t.tempo_(80/60);


Ndef(\r).fadeTime_(5);
Ndef(\r, {LFPulse.kr(5)*PitchShift.ar(SoundIn.ar(2,2), 0.2, [3/2, 5/4])*0.45}).play(0,2);
Ndef(\r).stop(15);

Ndef(\ra, {PitchShift.ar(SoundIn.ar(5,1), 0.2, [3/2, 5/4]*LFSaw.kr(1/8).range(1, 1/2))*0.3}).play(0,1);

Ndef(\an, {Impulse(10)+SoundIn.ar(1,1)*0.4}).play(0,1);

// delay
Ndef(\c, {CombN.ar(Ndef(\r), 0.2, 0.35, 6)*0.3}).play(0,2);

Ndef(\cr, {CombN.ar(Ndef(\ra), 0.2, 9)*0.5}).play(0,2);

p = PZ_machine(s);
p.ignite;
p.dict = ();

~f = {arg amp, rl, rate; {Saw.ar(["d0".namecps, "d1".namecps(23)]*rate)*EnvGen.kr(Env.perc(0.01, rl), doneAction: 2)*amp}.play };

~f = {arg amp, rl, rate; {Saw.ar(["d0".namecps, "d1".namecps(23)]*rate)*EnvGen.kr(Env.perc(0.01, rl), doneAction: 2)*amp}.play };

p.dict['a'] = { PZ_layer(~f, 0.4, 0.1, 4.rrand(8.0)).rhythm([0,0], [0,1], [0,0], [0, 0, 1]) } // without { } is 1 shot
p.dict['b'] = PZ_layer(~f, 0.1, 8, 1).rhythm(1,0,0,0);

p.dict['c'] = { PZ_layer(~f, 0.2, 1, 1).rhythm(0,0,[0],0); }

p.dict = ();

t.tempo_(130/60)

PZ_layer.debug = true;


s.meter
Ndef(\h).fadeTime_(3);
t.tempo_(80/60);
Ndef(\h, {LFTri.kr(0.8)*SinOsc.ar(["f4".namecps, "a1".namecps(23)]*2)*0.02*LFNoise1.kr(2).range(0.1,1)}).play(0,2);

Ndef(\h).stop(10);


/// knurl

m = NetAddr.new("192.168.2.6", 8000 );
m.sendMsg('/knurl/trigger', 'Ambience', 0);
m.sendMsg('/knurl/trigger', 'Reus', 0);

m.sendMsg('/knurl/change', 'Ambience', 'amp', 1)
m.sendMsg('/knurl/change', 'Ambience', 'freq', 0.7);

// anne:

f = CkpianoFX(0, 0);
f.delayCK(0.5, 1, 0.5, 7);
f.typicalCK(0.15, freqs: [1/2, 9/2], dec:5);

f.typicalCK.stop(10);
f.delayCK.stop(4);

"say -v whi -r 160 nevermind".unixCmd;
