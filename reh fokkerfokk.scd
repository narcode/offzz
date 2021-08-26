// 2

t.tempo=1;


// i will try to make a glissando... yes its almost there.

Pdef(\n, { Pbind(\dur, Pseq([4], inf), \stepsPerOctave, 31, \midinote, ["c1".namemidi, "e1".namemidi, "g1".namemidi], \legato, 4, \chan, Pseq([0],inf), \type, \midi, \midiout, m) }).stop;

// nos gliss down
Pdef(\nd, { Pbind(\dur, Pseq([4], inf), \stepsPerOctave, 31, \midinote, Pseq([53], inf), \legato, 1, \chan, Pseq((0..2),inf), \type, \midi, \midiout, m) }).stop;

// gliss in the bass
Pdef(\nd2, { Pbind(\dur, Pseq([4], inf), \stepsPerOctave, 31, \midinote, Pseq((37..52).reverse, inf), \legato, 1, \chan, Pseq((3..4),inf), \type, \midi, \midiout, m) }).stop;


/// omg. maybe just a pretty chord? THIS SHOULD BE C MAJOR! yeah :)