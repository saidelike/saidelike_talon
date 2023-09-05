not mode: sleep
-

# XXX move to core/parrot/parrot2.talon or other

parrot(cluck):
	#app.notify("cluck")
	print("cluck")
	core.repeat_phrase(1)
	# temporary way to use a direct hardcoded command with "cluck"
	# as I wanted to avoid the double repeat due to cluck having false positives
	# Also required in patterns.json "throttle": { "cluck": 0.6 } instead of default: "throttle": { "cluck": 0.12 } to avoid double execution
	#mimic("full stop go right format title at this")

parrot(tut):
	#app.notify("tut")
	print("tut")
	user.cancel_in_flight_phrase_loud()

# was calling into knausj. Disabled as using one to call into Andreas' code now
# parrot(pop):
# 	print("pop")
# 	user.noise_trigger_pop()
