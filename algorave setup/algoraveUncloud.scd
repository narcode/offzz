a = PZ_machine(s);
a.ignite;

t.tempo = 340/60;

a.dict['bd'] = { PZ_layer2(~bd, 1, 0).rhythm(1,0,1,0) } // back to the beggining
a.dict['h2'] = { PZ_layer2(~hh, 0.6, {0.rrand(1)}).rhythm(4,[4],2,[0,2, 0, 4]) };
a.dict['sn'] = { PZ_layer(~sn, 0.6, 0).rhythm(1,[0,1],0,1) }

a.dict['saw'] = { PZ_layer(~bubbles, {0.2.rrand(1)}, 1/1, {10.rrand(150)}, 1/10).rhythm([1,0,1,1], [4],0,2) }
a.dict['azb'] = { PZ_layer2(~azB, 0.8, 2, {~notes.next.namecps},2,9, 0).rhythm([0,0,0,2], [0,3]) }

a.dict['azb2'] = { PZ_layer2(~azB, 0.4, 2, {~notes2.next.namecps},2,9, 0).rhythm([0,2], [0,2]) }

~notes = Pseq(["a3", "a4", "a2", "a1", "d3"]/2, inf).asStream;
~notes2 = Pseq(["c3", "d4", "c2", "a1", "c5"]/2, inf).asStream // nah.
~a = { arg freq, amp;  { Saw.ar(freq)*amp * EnvGen.kr(Env.perc(0.01, 1), doneAction: 2);}.play };

a.dict = ();

a.dict['sn'] = ();

a.dict['saw'] = ();
a.dict['bd'] = ();

~bubbles = {arg rl, start=0.0125, end=60, rate=0.25; {SinOsc.ar(Phasor.ar(LFPulse.kr(t.tempo*rate), start, end, ["eb4".namecps, "d5".namecps]*4)) * 0.2 * EnvGen.kr(Env.linen(0.01, 0.0, rl), doneAction:2)*LFPulse.kr(t.tempo*16)}.play; }

~bubbles.(2);

~azB = { arg amp=1, rl=2, freq=110, rate=4, dec=1, out=0; Synth(\animals_bass, [\amp, amp, \rl, rl, \out, out, \freq, freq, \rate, rate, \dec, dec]) };

~azB.();

~narcodesample = {arg buf, here=1, there=1, rate=12, rl=1; {PlayBuf.ar(1, buf, BufRateScale.kr(buf)*Line.kr([1,here], [2/30, there], 1), LFPulse.kr(rate), loop:0)*1*EnvGen.kr(Env.perc(0.1, rl), doneAction:2)}.play };

~narcodesample.(b['sexy'], 1, 0.1, 1/4, 3);

// ej

~ejk = {arg amp, rl, at, out; Synth(\k, [\amp, amp, \freqk, 90, \freqh,120, \rt, rl, \ar, at, \out, out]) };

a.dict['azb'] = ();
a.dict['azb2'] = ()
a.dict['k'] = { PZ_layer2(~k, {5.rrand(30)}, 0.01, 0.8, 4).rhythm([2]) }


~resonate = {arg amp, rl, f1,f2,f3; {var in=In.ar(4,2); FreeVerb.ar(Resonz.ar(in, Demand.kr(Impulse.kr((160*1)/60), 0, Drand([f1,f2,f3], inf)), 0.001, 200), 0.3, 1, 0.1)*amp*EnvGen.kr(Env.perc(0.01, rl), doneAction:2)}.play }

~resonate.(0.9, 20, "cb3".namecps, "eb3".namecps, "ab2".namecps);

~ejh = {arg amp, rl, st, root, ratio, out; Synth(\hhEj, [\amp, amp, \f1, 500, \root, root, \ratio, ratio, \rt, rl, \at, 0.1, \sust, st]) };

~ejh.(0.1,0.01, 0.1, 32, 8, 0); //
~ejh.(0.1,0.01, 1, 1/2, 1/2, 0);


// pad
p = Synth(\pad1000, [\amp, 4, \rate, 1/2, \freq, "c2".namecps, \lf, 200, \out, 99]);
p.set(\lf, 100, \rate, 4, \freq, "g3".namecps);
p.set(\amp, 10, \out, 0);
p.free;


~pad = {arg amp, lf, rate, freq; p.set(\amp, amp, \lf, lf, \rate, rate, \freq, freq); }

~pad.(200, 8, "c3");

a.dict['pad'] = { PZ_layer(~pad, 10, 100, 2, {~padmel.next.namecps}).rhythm([4],0,[0,1],0); }
~padmel = Pseq(["c3", "g3", "f2", "f4"],inf).asStream;

~samplerStr = {|amp=1, buf, rate,rl,pos=0,out=0| Synth(\sampleNarcodeStr, [\buf, buf, \amp, amp, \rate, rate, \pos, pos, \at, 0.01, \rl, rl, \out, out])};

~sampler = {|amp=1, buf, rate,rl,pos=0,out=0| Synth(\sampleNarcode, [\buf, buf, \amp, amp, \rate, rate, \pos, pos, \at, 0.01, \rl, rl, \out, out])};


~samplerStr.(0.5, b[12], 1, 4, 0, 0);
a.dict['pizza'] = { PZ_layer(~samplerStr, 0.5, b[12],1,4,0,0).rhyhtm(1,0,1,0) };


~samplerStr.(0.5, b['sexy'], 1, 8, 0, 0);

t.tempo = 135/60;
~booty = {|amp=1, freq, fmod, rl,out=0| Synth(\booty_k, [\out, out, \freqk, freq, \amp, amp, \fmod, fmod, \release, rl])};
~booty.(0.4, 60, 4, 0.1, 0);
a.dict['a'] = ();
a.dict['a'] = { PZ_layer(~sampler, 1, b['twins'], 1, 1, 1, 0).rhythm(1,1,1,1) };
a.dict['bd'] = { PZ_layer(~bd, 1, 0).rhythm(4,0,0,0) };
a.dict['h'] = { PZ_layer2(~hh, 0.3, {0.rrand(1)}).rhythm(4) };
a.dict['sn'] = { PZ_layer(~sn, 0.5, 0).rhythm(1,[0,1],1,[0,1]) };
a.dict['bass'] = { PZ_layer(~azB, 2, {0.5.rrand(4)}, {~bassm.next.namecps}, 3, 4, 0).rhythm([0,1],2,1,[0,1]) };

a.dict['booty'] = { PZ_layer2(~booty, 0.6, 60, 4, 0.1, 0).rhythm(1,1,0,0) };

~bassm = Pseq(["a1", "c3", "d0"], inf).asStream;

['bd', 'h'].do{|n| a.dict[n] = (); }

~b1000 = {|amp, freq, rl, out| Synth(\bs1000, [\freq, freq, \amp, amp, \rt, rl, \out, out])};
~b1000.(1, "f2".namecps, 3, 0);

a.dict['b10'] = { PZ_layer2(~b1000, 0.4, ~mel1000.next.namecps, 4, 0.1, 0).rhythm(2, 0, 1, 0) };
~mel1000 = Pseq(["c1", "f1", "c1", "g1"], inf).asStream;

// pza
~scratch = {arg buf,out,rate,rateh,cut,speed; Synth(\ppizza, [\buf, buf, \reverse, 1, \ratel, rate, \rateh, rateh, \cutV, 1, \ratecut, cut, \speed, speed, \nspeed, 1/8, \out, out]); }

a.dict['scratch'] = { PZ_layer(~scratch, b[5], 44, 1, 1, 1, 1/2).rhythm(1) }

~reverb = {arg amp, rl, gate; x = {var in=In.ar(44,2); GVerb.ar(In.ar(44,2), 156, 2)*amp*EnvGen.kr(Env.adsr(0.01, 0.1, 1, rl),gate, doneAction:2)}.play }
~reverb.(0.1, 4, 1);
x.release;