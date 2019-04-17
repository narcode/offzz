//// CKALCULATOR ENV:

(
{
	// global vars:
~gt = 'false';
~lt = 'false';
~equal = 'false';
	~path = thisProcess.nowExecutingPath.dirname;
~hugbuf = Buffer.read(s, ~path++"/Samples/huygens.wav");
~hugbuf2 = Buffer.read(s, ~path++"/Samples/huygens2.wav");
~gongamp = 1.6;
~huygensamp = 5;
~sustain = 1;
~names = Pseq([\huyg1, \huyg2, \huyg3, \huyg4], inf).asStream;
~chunk = 123;
	"global vars loaded".postln;
s.sync;

~comparisons = Environment[
'on' -> {|self, voice1, voice2, voice3|
		{
		OSCdef(\ckgt, {|msg|
	msg.postln;
	~gt = msg[1];
			("say -v" ++ voice1 ++ "-r 70 " ++ msg[1] ++ "").unixCmd;
}, '/ck_gt');

OSCdef(\ckequal, {|msg|
	msg.postln;
		~equal = msg[1];
		("say -v " ++ voice2 ++ " -r 70 " ++ msg[1] ++ "").unixCmd;
}, '/ck_equal');

OSCdef(\cklt, {|msg|
	msg.postln;
		~lt = msg[1];
			("say -v " ++ voice3 ++ " -r 70 " ++ msg[1] ++ "").unixCmd;
}, '/ck_lt');
		}.fork;
	}
];
~comparisons.know = true;
s.sync;
"comparisons loaded".postln;

	if (thisProcess.openUDPPort(57120)) {
"UDP port is fine...".postln;
	};
s.sync;


(
OSCdef(\ck_huyg, {|msg, time, addr, recvpPort|
	msg[1].postln;
~chunk = ~chunk+1;
	Ndef(~names.next, {FreeVerb.ar(~huygensamp*PlayBuf.ar(2, ~hugbuf.bufnum, -1, startPos: BufFrames.kr(~hugbuf)*(~chunk/90)).sum*EnvGen.kr(Env.perc(0.1, ~sustain)), 0.5, 0.95)}).play([0,1].choose,1);
~sustain = ~sustain*1.1;
}, '/ck_easteregg');
);

	s.sync;
"easter eggs loaded!".postln;
s.sync;
"Ckalculator ready".postln;
}.fork;
);



