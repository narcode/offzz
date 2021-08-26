/// chan 4~5
Pdef(\n, {Pbind(\dur, (1/32), \stepsPerOctave, 31, \midinote, Pseq([53], inf), \amp, 1, \legato, 0.9, \chan, Pseq([4,5], inf), \type, \midi, \midiout, m)}).play;


/// chan 0~3
Pdef(\n, {Pbind(\dur, Pseq([1/2,1/2, 1]/1, inf), \stepsPerOctave, 31, \midinote, 37, \legato, 0.5, \chan, Pseq([0,0], inf), \type, \midi, \midiout, m)}).play;




///////////////// BAd AZZ Piece



Pdef(\n, {Pbind(\dur, (1/21), \stepsPerOctave, 31, \midinote, Pseq([[37, 51, 43]], inf), \amp, 1, \legato, Pseq([0.5, 1], inf), \chan, 4, \type, \midi, \midiout, m)}).play;

Pdef(\a, {Pbind(\dur, (1/14), \stepsPerOctave, 31, \midinote, Pseq([43, 44], inf), \legato, 0.9, \chan, 5, \type, \midi, \midiout, m)}).play;


Pdef(\r, {Pbind(\dur, Pseq([1, Pseq([1/8], 4)]), \stepsPerOctave, 31, \midinote, Pseq([[37, 51, 43]+21, 76], inf), \amp, 1, \legato, Pseq([0.5, 0.1], inf), \chan, 1, \type, \midi, \midiout, m)}).play;

Pdef(\c, {Pbind(\dur, Pxrand([1/2, 1, 1/2, 1/4, 1/4, 1/4, 1/4]), \stepsPerOctave, 31, \midinote, Pseq([[37, 51, 43]+23, 38], inf), \legato, Pseq([0.8, 1], inf), \chan, Prand([0,1,2],inf), \type, \midi, \midiout, m)}).play;

Pdef(\n, {Pbind(\dur, (2), \stepsPerOctave, 31, \midinote, (47..52), \amp, 1, \legato, 0.1, \chan, Pseq([4, 5], inf), \type, \midi, \midiout, m)}).play;

Pdef(\a, {Pbind(\dur, (4), \stepsPerOctave, 31, \midinote,  (37..40), \amp, 1, \legato, 0.1, \chan, Prand([5, 4], inf), \type, \midi, \midiout, m)}).play;

Pdef(\r, {Pbind(\dur, (1/62), \stepsPerOctave, 31, \midinote, 65, \amp, 1, \legato, 0.9, \chan, 0, \type, \midi, \midiout, m)}).play;

Pdef(\c, {Pbind(\dur, Pseq([1, 1/2, 1/8]*8, inf), \stepsPerOctave, 31, \midinote, [65, 43, 78, 42]+Pwhite(1, 40), \amp, 1, \legato, 0.1, \chan, 1, \type, \midi, \midiout, m)}).play;

Pdef(\o, {Pbind(\dur, (1/41), \stepsPerOctave, 31, \midinote, Pseq((36..91).stutter(2), inf), \legato, 1, \chan, Pseq([0,0,1,1,2,2], inf), \type, \midi, \midiout, m)}).play;

Pdef.all.do{|p| p.stop};

/////////  Fokk my offzz *** session #2 - Muziekgebouw aan't IJ - Fokker Organ :)

/// structure: start glissandi -> rhythmic, groovy ->


//// gliss:


Pdef(\g, {Pbind(\dur, (1/16), \stepsPerOctave, 31, \midinote, Pseq((36..53), inf), \legato, 1, \chan, 4, \type, \midi, \midiout, m)}).play;

Pdef(\g, {Pbind(\dur, (1), \stepsPerOctave, 31, \midinote, Pseq((36..53).takeThese({|i| i.odd}).stutter(2), inf), \legato, 1, \chan, Pseq([4], inf), \type, \midi, \midiout, m)}).play;

Pdef(\gl, {Pbind(\dur, (1/2), \stepsPerOctave, 31, \midinote, [Pseq((36..91).takeThese({|i| i%5==0}).scramble.stutter(1), inf), Pseq(["a1".namemidi, "c1".namemidi], inf)], \legato, 1, \chan, Pseq([1], inf), \type, \midi, \midiout, m)}).play;



Pdef(\g, {Pbind(\dur, (1/2), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi], inf), \legato, 1, \chan, Prand([4, 5], inf), \type, \midi, \midiout, m)}).play;

Pdef(\gl, {Pbind(\dur, (1/8), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi]*2, inf), \legato, 1, \chan, Prand([0, 1, 2], inf), \type, \midi, \midiout, m)}).play;

Pdef(\gli, {Pbind(\dur, Pxrand([1/2, 1/2, 1/4, 1]/2, inf), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi, "e1".namemidi], inf), \legato, Pwhite(0.6, 0.1), \chan, Pseq([1], inf), \type, \midi, \midiout, m)}).play;

Pdef(\gli, {Pbind(\dur, Pxrand([1/2, 1/2, 1/4, 1]/2, inf), \stepsPerOctave, 31, \midinote, Pseq(["a1".namemidi, "B1".namemidi, "e1".namemidi], inf)*Pkey(\dur), \legato, 1, \chan, Pseq([1], inf), \type, \midi, \midiout, m)}).play;



/// harmonic exercise -> clusters to harmony


Pdef(\h, {Pbind(\type, \midi, \midiout, m, \dur, 2, \stepsPerOctave, 31, \midinote, Pseq([["g4".namemidi, "B1".namemidi, "eb2".namemidi, "b2".namemidi, "c1".namemidi], ["g4".namemidi, "B1".namemidi, "eb2".namemidi, "b2".namemidi, "c1".namemidi]*5/6*2], inf), \legato, 0.9, \chan, Prand([1], inf))}).play;

Pdef(\b, {Pbind(\type, \midi, \midiout, m, \dur, (8), \stepsPerOctave, 31, \midinote, ["c1".namemidi, "c1".namemidi], \legato, 0.8, \chan, [4, 5])}).play;

Pdef(\b).stop;


m.allNotesOff(0);


/// rhytmic 4 bar groove -> sync

t = TempoClock.default.tempo_(35/60);

Pdef(\rit, {Pbind(\type, \midi, \midiout, m, \dur, 1/4, \midinote, Pwhite(80, 90), \chan, Pseq([1,2], inf), \legato, 0.04)}).play;

Pdef(\kick, {Pbind(\type, \midi, \midiout, m, \dur, Pseq([2, 1.5, 0.5]/2, inf), \midinote, [40, 36, 38]+10, \legato, 0.1, \chan, 4)}).play;


Pdef(\snare, {Pbind(\type, \midi, \midiout, m, \dur, 2, \midinote, [67, 78, 79], \legato, 0.05)}).play;


Pdef(\snareAll, {Pbind(\type, \midi, \midiout, m, \dur, Pseq([1/41], 1), \midinote, Pseq((36..91), 1), \chan, 0, \legato, 1)}).play;





















































