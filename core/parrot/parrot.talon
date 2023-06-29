not mode: sleep
-

parrot(pop):
    #print("pop {power}")
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