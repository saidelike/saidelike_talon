not mode: sleep
-

parrot(pop):
    user.debug("pop {power}")
    user.noise_pop()

# parrot(cluck):
#     user.debug("cluck {power}")
#     user.noise_cluck()

# allow controlling if hiss/shush should be disabled
(his|shush) enable: 
    user.hiss_shush_frozen_toggle(false)

(his|shush) disable:
    user.hiss_shush_frozen_toggle(true)

# we don't support just the "his/shush" command without saying
# "switch" or "toggle" to avoid false positives
# especially because we don't use it that often
(his|shush) (switch|toggle):
    user.hiss_shush_frozen_toggle()

parrot(cluck):
	#app.notify("cluck")
	user.debug("cluck")
	core.repeat_phrase(1)
	# temporary way to use a direct hardcoded command with "cluck"
	# as I wanted to avoid the double repeat due to cluck having false positives
	# Also required in patterns.json "throttle": { "cluck": 0.6 } instead of default: "throttle": { "cluck": 0.12 } to avoid double execution
	#mimic("full stop go right format title at this")

parrot(tut):
	#app.notify("tut")
	user.debug("tut")
	user.cancel_in_flight_phrase_loud()

# was calling into knausj. Disabled as using one to call into Andreas' code now
# parrot(pop):
# 	user.debug("pop")
# 	user.noise_trigger_pop()
