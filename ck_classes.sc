//// Ckalculator Classes 2019

/*
CK helper classes. Now for Ckalculator only
*/

//////////////////////////////

CkpianoFX {
	classvar <>in=0, <>fadeT=4, <>out=0;

	*new {|input=0, output=0|
		in = input;
		out = output;
		^super.new.init(input, output);
	}

	init {|input, output|
		("FX node started with input channel " ++ input).postln;
	}

	typicalCK {|amp=0.2, amp_in=1, freqs=0.5, size=4, dec=4|
		^Ndef("typicalFX".asSymbol, {GVerb.ar(PitchShift.ar(SoundIn.ar(in, amp_in), 0.02, freqs),size, dec)*amp}).play(out,2).fadeTime_(fadeT);
	}

	delayCK {|amp=0.2, amp_in=1, time=0.2, dec=3, tempo=1|
		^Ndef("delay".asSymbol, {CombC.ar(SoundIn.ar(in, amp_in), tempo, time, dec)*amp}).play(out,2).fadeTime_(fadeT);
	}

	noisy {|amp=0.2, amp_in=1, room=78, dec=1, drive=0.2, freq=189, q=0.2, noise_freq=100, noise_q=0.1, rate=2|
		("sniff " ++ this).postln;
		^Ndef("noisy".asSymbol, {GVerb.ar(SoundIn.ar(in,amp_in)*RHPF.ar(LFSaw.kr(rate)*BPF.ar(ClipNoise.ar(drive.clip(0.01, 1)), noise_freq, noise_q),freq,q), room, dec)*amp}).play(out,2).fadeTime_(fadeT);
	}

}


Ckalculator {
	classvar <count=0;
	var <>num, <>voices=true, <>hirit=1, <>lrit=1, <>lout=0, <>hiout=0, <>hi_amp=0.1, <>hi_freq=8989, <>hi_attack=0.01, <>hi_rel=0.01;
	var <>reciprocal=true, <>set_hi=true, <>set_l=true, <>voicevol=0.7;
	var <>harm_f1=261, <>harm_f2=1200, <>harm_f3=300, <>set_freq1=false, <>set_freq2=false, <>set_freq3=false;
	var <>harmony_freqs, <harmony_amp=0.1, <>laser_noise_freq=7989, <>laser_saw_freq=1889, <>laser_rel=0.2, <>laser_dec=0.1;
	var <>laser_amp=0.1, <instance_count=0;
	var <non_number_count=0, <boolean, <>chunk=123, <>eggbuf, <>egg_text="", <fxbus_in, <fxbus_out, <fx1;

	*new {|voice1="karen", voice2="oliver", voice3="tri"|
		count = count + 1;
		^super.new.init(voice1, voice2, voice3)
	}

	init {|voice1, voice2, voice3|
		instance_count = count;
		harmony_freqs = [harm_f1, harm_f2, harm_f3];

		// buffers
		eggbuf = Buffer.read(path:"/Users/narcodeb/Development/Repos/codeklavier-supercollider/Samples/huygens.wav");

		// comparisons
		OSCdef(('ckgt'++instance_count).asSymbol, {|msg|
			boolean = msg[1].asString.interpret;
			if (count-1 == 0) {
			("say [[volm " ++ voicevol ++"]] -v " ++ voice1 ++ " -r 70 " ++ boolean.asString ++ "").unixCmd;
			} {
			{
				(count-1).wait;
			("say [[volm " ++ voicevol ++"]] -v " ++ voice1 ++ " -r 70 " ++ boolean.asString ++ "").unixCmd;
			}.fork;
			};
		}, '/ck_gt');

		OSCdef(('ckequal'++instance_count).asSymbol, {|msg|
			boolean = msg[1].asString.interpret;
			("say [[volm " ++ voicevol ++"]] -v " ++ voice2 ++ " -r 70 " ++ boolean.asString ++ "").unixCmd;
		}, '/ck_equal');

		OSCdef(('cklt'++instance_count).asSymbol, {|msg|
			boolean = msg[1].asString.interpret;
			("say [[volm " ++ voicevol ++"]] -v " ++ voice3 ++ " -r 70 " ++ boolean.asString ++ "").unixCmd;
		}, '/ck_lt');


		////////////////////////////// non sound \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

		OSCdef(('ckcalc_error'++instance_count).asSymbol, {|msg|
			// msg.postln;
			non_number_count = non_number_count + 1;
		}, '\ck_error');


		////////////////////////////////// sound \\\\\\\\\\\\\\\\\\\\\\\\\\

		// Synths
		SynthDef(\ck_hi, {arg out=2, amp=0.1, freq=789, at=0.01, rl=1;
			var in, env;
			in = HPF.ar(WhiteNoise.ar(1), freq);
			env = EnvGen.kr(Env.perc(at, rl), doneAction:2);
			Out.ar(out, in*amp*env);
		}).store;

		SynthDef(\ck_lasers, {arg out=2, amp=0.1, freq1=789, freq2=789, at=0.01, rl=0.1, dec=0.1, pos=1;
			var in, env, fx;
			in = Saw.ar(freq1*Line.kr(4,1/2,dec), 1)+RHPF.ar(WhiteNoise.ar(1).distort,freq2, 0.2);
			env = EnvGen.kr(Env.perc(at, rl), doneAction:2);
			Out.ar(out, Pan2.ar(in, pos)*amp);
		}).store;

		SynthDef(\laser_del, {|in, out=2, delayt=0.1, decayt=1|
			var env, fx;
			env = EnvGen.kr(Env.asr(1, 1, 6), doneAction:2);
			fx = CombN.ar(In.ar(in,2), 0.2, delayt, decayt);
			Out.ar(out, fx*env);
		}).store;
/*
		SynthDef(\ck_busplay, {arg out=0, bus=50, amp=1;
			var ins = In.ar(bus, 2);
			Out.ar(out, ins*amp);
		}).store;*/

		// Buses
		fxbus_in = Bus.audio(numChannels:2);
		fx1 = Synth(\laser_del, [\in, fxbus_in, \out, 0]);

		// hihats
		Tdef(('ck_hi'++instance_count).asSymbol, {
			loop{
				Synth(\ck_hi, [\freq, hi_freq, \amp, hi_amp, \at, hi_attack, \rl, hi_rel, \out, [hiout, hiout+1].choose]);
				(hirit.clip(0.01, 10)).wait;
			}
		});

		// hi lasers
		Tdef(('ck_lasers'++instance_count).asSymbol, {
			loop{
				Synth(\ck_lasers, [\out, fxbus_in, \pos, -1.0.rrand(1), \amp, laser_amp, \freq1, laser_saw_freq, \freq2, laser_noise_freq, \rl, laser_rel, \dec, laser_dec]);
				(lrit.clip(0.05, 40)).wait;
		}});

		// harm
		Ndef(('ck_harm'++instance_count).asSymbol, {
			harmony_amp * GVerb.ar(Saw.ar(harm_f1/2).distort*SinOsc.ar([harm_f1*2*LFPulse.kr(1/2).range.(1, 3/2).lag(1), harm_f1, harm_f2*Line.kr(1/2, 1, 8), harm_f3]*1, mul:0.1), 88, 2, drylevel:LFNoise0.kr(2).range(0.1, 1));
		}).fadeTime_(3);

			// voices
		OSCdef(('cklac_voices'++instance_count).asSymbol, {|msg, time, addr, recvpPort|
			num = msg[1].asInteger;

			if (reciprocal.not) {
				if (set_hi) { hirit = num; };
				if (set_l) { lrit = num; }
			} {
				if (set_hi) { hirit = num.reciprocal; };
				if (set_l) { lrit = num.reciprocal; }
			};

			if (num.odd) {
				if (voices) {	("say [[volm " ++ voicevol ++"]] -v " ++ voice1 ++ " " ++ num.asString).unixCmd; };
			} {
				if (voices) { ("say [[volm " ++ voicevol ++"]] -v " ++ voice2 ++ " " ++ num.asString).unixCmd; };
			};

			if (set_freq1 || set_freq2 || set_freq3) {
				[set_freq1, set_freq2, set_freq3].do{|val, freq|
					if (val) {
						harmony_freqs[freq] = num;
					};

					Ndef(('ck_harm'++instance_count).asSymbol, {
						harmony_amp * GVerb.ar(Saw.ar(harmony_freqs[0]/2).distort*SinOsc.ar([harmony_freqs[0]*2*LFPulse.kr(1/2).range.(1, 3/2).lag(1), harmony_freqs[0], harmony_freqs[1]*Line.kr(1/2, 1, 8), harmony_freqs[2]]*1, mul:0.1), 88, 2, drylevel:LFNoise0.kr(2).range(0.1, 1));
					});
				};
			};

		}, '/ck');

		this.easter_eggs(5, 1, false);

	}

	free {|fadeTime=10|
		{Ndef(('ck_harm'++instance_count).asSymbol).stop(fadeTime);
			1.wait;
		Tdef(('ck_hi'++instance_count).asSymbol).stop;
						1.wait;
		Tdef(('ck_lasers'++instance_count).asSymbol).stop;
						1.wait;
		Ndef(('ck_harm'++instance_count).asSymbol).stop(fadeTime);
						1.wait;
		OSCdef(('ck_huyg'++instance_count).asSymbol).free;
						1.wait;
		OSCdef(('cklac_voices'++instance_count).asSymbol).free;
						1.wait;
		Tdef(('ck_lasers'++instance_count).asSymbol).stop;
						1.wait;
		OSCdef(('ckcalc_error'++instance_count).asSymbol).free;
						1.wait;
		fx1.free;
						1.wait;
		fxbus_in.free;
						1.wait;
		OSCdef(('ckgt'++instance_count).asSymbol).free;
						1.wait;
		OSCdef(('ckequal'++instance_count).asSymbol).free;}.fork;
	}

	harmony_amp_ {|amp|
		Ndef(('ck_harm'++instance_count).asSymbol, {
			amp * GVerb.ar(Saw.ar(harm_f1/2).distort*SinOsc.ar([harm_f1*2*LFPulse.kr(1/2).range.(1, 3/2).lag(1), harm_f1, harm_f2*Line.kr(1/2, 1, 8), harm_f3]*1, mul:0.1), 88, 2, drylevel:LFNoise0.kr(2).range(0.1, 1));
		}).fadeTime_(3);
	}

	hi_noise {
		^Tdef(('ck_hi'++instance_count).asSymbol).play;
	}

	lasers {|dec=1, del=0.2|
		fx1.set(\decayt, dec, \delayt, del);
		^Tdef(('ck_lasers'++instance_count).asSymbol).play;
	}

	harmony {|out=0|
		^Ndef(('ck_harm'++instance_count).asSymbol).play(out,2);
	}

	override_freqs {|freq1, freq2, freq3|
		harmony_freqs = [freq1, freq2, freq3];
		Ndef(('ck_harm'++instance_count).asSymbol, {
			harmony_amp * GVerb.ar(Saw.ar(harmony_freqs[0]/2).distort*SinOsc.ar([harmony_freqs[0]*2*LFPulse.kr(1/2).range.(1, 3/2).lag(1), harmony_freqs[0], harmony_freqs[1]*Line.kr(1/2, 1, 8), harmony_freqs[2]]*1, mul:0.1), 88, 2, drylevel:LFNoise0.kr(2).range(0.1, 1));
		});
	}

	// easter eggs
	easter_eggs {|amp=5, sustain=1, interpret=false|
		var names = Pwhite(0, 10).asStream;
		^OSCdef(('ck_huyg'++instance_count).asSymbol, {|msg, time, addr, recvpPort|
			"easter egg in".postln;
			egg_text = msg[1];
			chunk = chunk + 1;
			sustain = sustain*1.1;
			Ndef(('huyg_'++names.next).asSymbol, {FreeVerb.ar(amp*PlayBuf.ar(2, eggbuf.bufnum, -1, startPos: BufFrames.kr(eggbuf)*(chunk/90)).sum*EnvGen.kr(Env.perc(0.1, sustain)), 0.5, 0.95)}).play([2,3].choose,1);
			if (interpret) {egg_text.asString.interpret};
		}, '/ck_easteregg');
	}

}
