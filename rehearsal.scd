/// reharsal for 28th..."

// what to do? ... mmmmmmmmm m mm m m m mm m m mm

(
a = Window.new('visuals', 400@400);
a.background = Color.rand;
a.drawFunc = {Pen.stringAtPoint(n, 100@100, Font('Courier New', 45))};
a.view.alwaysOnTop_(true);
a.front;
)

(
Tdef(\m, {
	var i=0, string="";
	loop{
		i=i+1;
		i.postln;
		string = "mmmangoaasdaskasd".rotate(i);
	"narcode".setenv(string);
		"say -v vic -r 299 $narcode".unixCmd;
		if (i > string.size) {i=0};
	3.wait;
}}).play;
)


(
Tdef(\m2, {
	var i=0, string="";
	loop{
		i=i+1;
		i.postln;
		string = "clouds and dragons".rotate(i);
	"nar".setenv(string);
		"say -v vic -r 89 $nar".unixCmd;
		if (i > string.size) {i=0};
		[1, 2, 3].choose.wait;
}}).play;
)

Tdef(\m2).stop;

//// this is cool...

Ndef(\n, {|ff=234, freq=32| SawPad.ar(freq.midicps, ff, 0.1)*1}).play(0,2);

Ndef(\n).set(\ff, Ndef(\kr, {LFTri.kr(4).range(89, 456)}));

Ndef(\n).set(\freq, Ndef(\krf, {EnvGen.kr(Env([LFPulse.kr(4).range(32, 36), 75, 31], [1, 0.1], 'hold').circle(1/2))}));


Ndef(\n2, {|ff=234, freq2=32| SawPad.ar(freq2.midicps, 400, 0.01, 0, 2)*1}).play(0,2);
Ndef(\n2).set(\freq2, Ndef(\krf2, {Demand.kr(Impulse.kr(6), 0, Dseq([30, 21, 31, 21, 37, 21, 32, 12, 33]+15, inf))}));

Ndef(\n).quant=1


Quarks.gui

