//// PZ Beat machine 2021 v0.2

/// changelog: PZ_layer now supports 6 args

/*
Class for custom functional beat machine
*/

//////////////////////////////

PZ_machine {
	var <>beats=4, <>server=nil, <>routine, <>dict;

	*new {arg server, dict;
		 ^super.new.init(server, dict);
	}

	init {arg server;
		this.server = server;
		this.routine = TaskProxy.new;
		this.routine.quant = 0;
		this.dict = ()
	}

	ignite {arg server=this.server, beats=this.beats;
		this.routine.source = {
			inf.do{
				server.bind{
					// audio
					dict.do{|f|
						// TODO: could put hiphpop breaks here...
						f.();
					};
				};
				(this.beats).wait;
			}
		};
		this.routine.play;
	}

}

PZ_layer {
	 classvar <>maxsubdiv=12, <>debug=false;
	 var <>item=nil, <>itemargs=nil;

	*new {arg ... args;

		 ^super.new.init(args[0], args);
	}

	init {arg ... args;
		this.item = args[0];
		this.itemargs = args;
	}

	rhythm {arg ... args;
		var beats=args;
		// beats.postln;
		 ^Routine{
			if (debug) {
				item.postln; beats.asString.postln;
				"******".postln;
				itemargs.postln;
				"******".postln;
			};
			beats.do{arg beat, index;
				if (beat.isArray.not) { // single:
					if (beat > 0) {
						if (debug) {(index.asString ++ " = " ++ beat.asString).postln;};
						(beat.clip(1, maxsubdiv)).do{
							item.(itemargs[1][1].(), itemargs[1][2].(), itemargs[1][3].(), itemargs[1][4].(), itemargs[1][5].(), itemargs[1][6].());
							(beat.reciprocal.clip(maxsubdiv.reciprocal, 1)).wait;
						};
					} {1.wait};
				} { // array:
					{
						beat.do{arg sub;
							if (sub > 0) {
								if (debug) {(beat.asString ++ " = " ++ beat.asString ++ sub.asString).postln;};
								((sub).clip(1, maxsubdiv)).do{
									item.(itemargs[1][1].(), itemargs[1][2].(), itemargs[1][3].(), itemargs[1][4].(),itemargs[1][5].(), itemargs[1][6].());
									if (sub == 1) {
										(sub/beat.size).wait;
									} {(beat.size.reciprocal/sub).wait;}
							}} {(beat.size.reciprocal).wait;}
						};

						(beat.size.reciprocal).wait;

					}.fork;
					1.wait;
				};
			};
		}.play;
	}

}

PZ_layer2 {
	 classvar <>maxsubdiv=12, <>debug=false;
	 var <>item=nil, <>itemargs=nil, <>debug=false;

	*new {arg ... args;

		 ^super.new.init(args[0], args);
	}

	init {arg ... args;
		this.item = args[0];
		this.itemargs = args;
	}

	rhythm {arg ... args;
		var beats=args;
		// beats.postln;
		 ^Routine{
			if (debug) {
				item.postln; beats.asString.postln;
				"******".postln;
				itemargs.postln;
				"******".postln;
			};
			(beats.size/4).reciprocal.do{
			beats.do{arg beat, index;
				if (beat.isArray.not) { // single:
					if (beat > 0) {
						if (debug) {(index.asString ++ " = " ++ beat.asString).postln;};
						(beat.clip(1, maxsubdiv)).do{
							item.(itemargs[1][1].(), itemargs[1][2].(), itemargs[1][3].(), itemargs[1][4].(), itemargs[1][5].(), itemargs[1][6].());
							(beat.reciprocal.clip(maxsubdiv.reciprocal, beat.reciprocal)).wait;
						};
					} {1.wait};
				} { // array:
					{
						beat.do{arg sub;
							if (sub > 0) {
								if (debug) {(beat.asString ++ " = " ++ beat.asString ++ sub.asString).postln;};
								((sub).clip(1, maxsubdiv)).do{
									item.(itemargs[1][1].(), itemargs[1][2].(), itemargs[1][3].(), itemargs[1][4].(), itemargs[1][5].(), itemargs[1][6].());
									if (sub == 1) {
										(sub/beat.size).wait;
									} {(beat.size.reciprocal/sub).wait;}
							}} {(beat.size.reciprocal).wait;}
						};

						(beat.size.reciprocal).wait;

					}.fork;
					1.wait;
				};
			};
			}
		}.play;
	}

}
