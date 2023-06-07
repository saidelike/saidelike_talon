not mode: sleep
-

parrot(pop):
    #print("pop {power}")
    user.debug("pop {power}")
    user.noise_pop()

# parrot(cluck):
#     user.debug("cluck {power}")
#     user.noise_cluck()

parrot(shush):
    #print("shush {power}")
    user.debug("shush {power}")
    user.noise_debounce("shush", true)
parrot(shush:stop):
    #print("shush stop {power}")
    user.debug("shush stop {power}")
    user.noise_debounce("shush", false)

parrot(hiss):
    #print("hiss {power}")
    user.debug("hiss {power}")
    user.noise_debounce("hiss", true)
parrot(hiss:stop):
    #print("hiss stop {power}")
    user.debug("hiss stop {power}")
    user.noise_debounce("hiss", false)
