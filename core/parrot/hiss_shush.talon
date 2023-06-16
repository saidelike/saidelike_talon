not mode: sleep
not tag: user.hiss_shush_frozen
-

parrot(shush):
    #print("shush {power}")
    user.debug("shush {power}")
    user.noise_debounce("shush", true)

parrot(shush:repeat):
    #print("shush repeat {power}")
    user.debug("shush repeat {power}")

parrot(shush:stop):
    #print("shush stop {power}")
    user.debug("shush stop {power}")
    user.noise_debounce("shush", false)

parrot(hiss):
    #print("hiss {power}")
    user.debug("hiss {power}")
    user.noise_debounce("hiss", true)

parrot(hiss:repeat):
    #print("hiss repeat {power}")
    user.debug("hiss repeat {power}")

parrot(hiss:stop):
    #print("hiss stop {power}")
    user.debug("hiss stop {power}")
    user.noise_debounce("hiss", false)
