(
OSCdef(\voices, {|msg|
	var num = msg[1];
	if (num.asInt.odd) {
	("say -v pri -r 89 " ++ num ++ "").unixCmd;
		Tdef(\w, {
			20.do{
		Ndef(\w, {BPF.ar(WhiteNoise.ar(1), 789)*EnvGen.kr(Env.perc)}).play(0,1);
				1.wait // uuuff that was no loop. otherwise bye bye
		}}).play;
	} {
	("say -v tri -r 89 " ++ num ++ "").unixCmd;
				Tdef(\w2, {
			10.do{
				Ndef(\w2, {HPF.ar(WhiteNoise.ar(1), 8989)*EnvGen.kr(Env.perc(0.01, 0.1))}).play(0,1);
				(1/4).wait;
		}}).play;
	}
}, "/ck");
);

// ok... so anne is controlling all this. u get the idea. lets do some number comparisons to stop

~comparisons.on("xa", "pau", "al");

// if anne makes an error we stop...
and juan talks
/// anne force an error... that would be: make a functions that is not a number...
OSCdef(\juan, {|msg|
	("say -v juan error bye bye adios. ciao").unixCmd;
	Tdef.all.do{|i| i.stop};
		Ndef.all.do{|i| i.stop};
}, "ck_error");





// that one os ok. lets add some rhythm
// i think i had a voice that doest exist
// i want the computer to say the numbers... ok. that worked.
// lets ,make the algor more complex.
