not mode: sleep
not tag: user.hiss_shush_frozen
-

parrot(shush):
    user.debug("shush {power}")
    user.noise_debounce("shush", true)

parrot(shush:repeat):
    user.debug("shush repeat {power}")

parrot(shush:stop):
    user.debug("shush stop {power}")
    user.noise_debounce("shush", false)

parrot(hiss):
    user.debug("hiss {power}")
    user.noise_debounce("hiss", true)

parrot(hiss:repeat):
    user.debug("hiss repeat {power}")

parrot(hiss:stop):
    user.debug("hiss stop {power}")
    user.noise_debounce("hiss", false)
