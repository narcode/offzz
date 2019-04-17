~narcode = "curl --location https://duckduckgo.com/?q=soep | grep -o -e '[a-zA-Z]* '".unixCmdGetStdOut(1);

~narcode = ~narcode.split($\n);

~narcode

(
Tdef(\s, {
	~narcode.scramble.collect{arg i, num;
		if ("(js|html|IE|div|script)".matchRegexp(i)) {0.wait;} {
		if (i.size > 1) {
				// num.postln;
				{
				n = {
						Pen.stringAtPoint(i, 0.rrand(900)@0.rrand(800), Font('Courier New', 85.rrand(289)), Color.rand);
						Pen.stringAtPoint(~narcodenoise, 100@100, Font('Courier New', 299), Color.rand);
						if (num%3==0) {
							~narcodenoise = ~narcode[num];
						}
					};
					w.drawFunc = n;
					w.refresh;
				}.defer;
		(1/4).wait;
		} {0.wait;
			};
		};
	}
}).play;
);

~noiseword = "NBARCODE";

( // visuals
w = Window("noise", Rect(0,0,1200,900)).alwaysOnTop_(true);
	w.drawFunc = n;
w.front;
);

