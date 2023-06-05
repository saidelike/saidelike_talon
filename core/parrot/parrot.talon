not mode: sleep
-

parrot(pop):
    print("pop")
    user.debug("pop {power}")
    user.noise_pop()

# parrot(cluck):
#     user.debug("cluck {power}")
#     user.noise_cluck()

parrot(shush):
    print("shush")
    user.noise_debounce("shush", true)
parrot(shush:stop):         user.noise_debounce("shush", false)

parrot(hiss):
    print("hiss")
    user.noise_debounce("hiss", true)
parrot(hiss:stop):          user.noise_debounce("hiss", false)
