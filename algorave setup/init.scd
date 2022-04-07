s.waitForBoot{
~path = thisProcess.nowExecutingPath.dirname ++ "/samples/";

b = ();
b['agnes'] = ();
b['jenny'] = ();
b['flower'] = ();
b['guard'] = ();
b['perc'] = ();
b['perc']['bells'] = ();
b['perc']['ghatam'] = ();
b['perc']['kick'] = ();
b['perc']['hh'] = ();
b['perc']['tabla'] = ();
b['bigeye'] = ();
b['bigeye']['dialogue'] = ();
b['mum'] = ();
b['bells'] = ();
b['poster'] = ();
b['unicorn'] = ();
b['eagle'] = Buffer.read(s, ~path ++ "animalz/eagle.wav");
b['tiger'] = Buffer.read(s, ~path ++ "animalz/tiger.wav");
b['horse'] = Buffer.read(s, ~path ++ "animalz/horse.wav");
b['sexy'] = Buffer.read(s, ~path ++ "animalz/sex.wav");


[\kid, \twins, \totalrecall, \travolta].do({|key| b[key] = Buffer.read(s, ~path++key.asString++".wav");});

(15.do{|i|
	var num = i+1;
	b[num] = Buffer.read(s, ~path ++ "pizza/pizza"++num++".aif");
});

// percussion
b['perc']['bells'][0] = Buffer.read(s, ~path ++ "perc/bell0.wav");
b['perc']['bells'][1] = Buffer.read(s, ~path ++ "perc/bell1.wav");
b['perc']['bells'][2] = Buffer.read(s, ~path ++ "perc/bell2.wav");
b['perc']['clap'] = Buffer.read(s, ~path ++ "perc/clap.wav");
b['perc']['dholak'] = Buffer.read(s, ~path ++ "perc/dholak.wav");
b['perc']['ghatam'][0] = Buffer.read(s, ~path ++ "perc/ghatam0.wav");
b['perc']['ghatam'][1] = Buffer.read(s, ~path ++ "perc/ghatam1.wav");
b['perc']['ghatam'][2] = Buffer.read(s, ~path ++ "perc/ghatam2.wav");
b['perc']['kick'][0] = Buffer.read(s, ~path ++ "perc/kick0.wav");
b['perc']['kick'][1] =Buffer.read(s, ~path ++ "perc/kick1.wav");
b['perc']['hh'][0] = Buffer.read(s, ~path ++ "perc/hh0.wav");
b['perc']['hh'][1] =Buffer.read(s, ~path ++ "perc/hh1.wav");
b['perc']['hh'][2] =Buffer.read(s, ~path ++ "perc/hh2.wav");
b['perc']['rim'] = Buffer.read(s, ~path ++ "perc/rim.wav");
b['perc']['snare'] = Buffer.read(s, ~path ++ "perc/snare.wav");
b['perc']['tabla'][0] = Buffer.read(s, ~path ++ "perc/tabla0.wav");
b['perc']['tabla'][1] = Buffer.read(s, ~path ++ "perc/tabla1.wav");
b['perc']['tabla'][2] = Buffer.read(s, ~path ++ "perc/tabla2.wav");
b['perc']['tabla'][3] = Buffer.read(s, ~path ++ "perc/tabla3.wav");
b['perc']['tanpura'] = Buffer.read(s, ~path ++ "perc/tanpura.wav");

4.do{|i| b['agnes'][i] = Buffer.read(s, ~path ++ "agnes/pippi" ++ i.asString ++ ".wav"); };

4.do{|i| b['jenny'][i] = Buffer.read(s, ~path ++ "jenny/jenny" ++ i.asString ++ ".wav"); };

3.do{|i| b['flower'][i] = Buffer.read(s, ~path ++ "flower/flower" ++ i.asString ++ ".wav"); };

7.do{|i| b['guard'][i] = Buffer.read(s, ~path ++ "guard/guard" ++ i.asString ++ ".wav"); };

8.do{|i| b['bigeye'][i] = Buffer.read(s, ~path ++ "bigeye/" ++ i.asString ++ ".wav"); };

3.do{|i| b['bigeye']['dialogue'][i] = Buffer.read(s, ~path ++ "bigeye/dialogue/bigeye" ++ i.asString ++ ".wav"); };

b['perc']['dad'] = Buffer.read(s, ~path ++ "dad/cash.wav");

5.do{|i| b['mum'][i] = Buffer.read(s, ~path ++ "mum/mum" ++ i.asString ++ ".wav"); };

3.do{|i| b['bells'][i] = Buffer.read(s, ~path ++ "bells/" ++ i.asString ++ ".wav"); };

// poster
4.do{|i| b['poster'][i] = Buffer.read(s, ~path ++ "poster/" ++ i.asString ++ ".wav"); };

// unicorn:
b['unicorn']['dad'] = Buffer.read(s, ~path ++ "dad/father.wav");
b['unicorn']['mamma'] = Buffer.read(s, ~path ++ "mum/mamma.wav");
b['unicorn']['viktoria'] = Buffer.read(s, ~path ++ "victoria/victoria v6 celeste.wav");
b['unicorn']['viktoria_e'] = Buffer.read(s, ~path ++ "victoria/electro.wav");
b['unicorn']['criminal'] = Buffer.read(s, ~path ++ "dad/1b.wav");

// chords:
(
~gm7M = ["g0".namecps, "b1".namecps, "d1".namecps];
~gm9M = ["g0".namecps, "b1".namecps, "d1".namecps, "a1".namecps];
~cm7 = ["c0".namecps, "b1".namecps, "eb1".namecps];
~gM7M = ["g0".namecps, "B1".namecps, "d1".namecps];
~gM9M = ["g0".namecps, "B1".namecps, "d1".namecps, "a1".namecps];
~cM7 = ["c0".namecps, "B1".namecps, "e1".namecps];
~cM = ["c0".namecps, "g1".namecps, "e1".namecps];
~fM = ["f1".namecps, "a1".namecps, "c2".namecps];
~em = ["e1".namecps, "g1".namecps, "B1".namecps];
~eb = ["eb1".namecps, "g1".namecps, "b1".namecps];
~dm = ["d1".namecps, "f1".namecps, "a1".namecps];
~dM7 = ["d1".namecps, "f#1".namecps, "a1".namecps];
~d7 = ["d1".namecps, "f#1".namecps, "a1".namecps, "c2".namecps];
~am7 = ["c1".namecps, "g1".namecps, "a1".namecps];
~eb7 = ["c#1".namecps, "g1".namecps, "eb2".namecps];
~c_dM7 = ["c1".namecps, "f#1".namecps, "d2".namecps];
~ab7 = ["c1".namecps, "g1".namecps, "ab2".namecps];
~d_dM7 = ["d0".namecps, "f#2".namecps, "d2".namecps];
~b_gm7 = ["b0".namecps, "g2".namecps, "d1".namecps];
~a_dM7 = ["a0".namecps, "f#1".namecps, "d1".namecps];
~a7 = ["a0".namecps, "c1".namecps, "e1".namecps, "g1".namecps];
~g_g = ["g0".namecps, "g1".namecps, "g1".namecps];

~g5 = ["g0".namecps, "g1".namecps, "d0".namecps];
~f5 = ["f0".namecps, "f1".namecps, "c0".namecps];
~a5 = ["a0".namecps, "a1".namecps, "e0".namecps];
~c5 = ["c0".namecps, "c1".namecps, "g0".namecps];
~d5 = ["d0".namecps, "d1".namecps, "a0".namecps];
~b5 = ["B0".namecps, "B1".namecps, "f#0".namecps];
~fs5 = ["f#0".namecps, "f#1".namecps, "c#0".namecps];
~a5 = ["a0".namecps, "a1".namecps, "e0".namecps];
~e5 = ["e0".namecps, "e1".namecps, "B0".namecps];
~cs5 = ["c#0".namecps, "c#1".namecps, "g#0".namecps];
);
s.sync;
// beat functions
(
~bd = {|amp=1,out=0| Synth(\sampleNarcodeStr, [\buf,b['perc']['kick'][0], \amp, amp, \out, out])};
~hh = {|amp=1,out=0| Synth(\sampleNarcode, [\buf, b['perc']['hh'][0], \amp, amp, \out, out])};
~hh2 = {|amp=1,out=0| Synth(\sampleNarcode, [\buf, b['perc']['kick'][1], \amp, amp, \rate, 0.8, \at, 0.01, \rl, 0.01, \out, out])};
~sn = {|amp=1,out=0| Synth(\sampleNarcodeStr, [\buf, b['perc']['snare'], \amp, amp, \out, out])};
);
s.sync;
"Preload complete".postln;
}