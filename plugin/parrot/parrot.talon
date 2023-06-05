not mode: sleep
-
parrot(cluck):
	#app.notify("cluck")
	print("cluck")
	core.repeat_phrase(1)

parrot(tut):
	#app.notify("tut")
	print("tut")
	user.cancel_in_flight_phrase_loud()

# was calling into knausj. Disabled as using one to call into Andreas' code now
# parrot(pop):
# 	print("pop")
# 	user.noise_trigger_pop()
