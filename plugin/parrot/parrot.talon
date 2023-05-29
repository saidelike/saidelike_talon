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
