mode: sleep
-

# settings():
#     speech.timeout = 0.1

# NOTE: disable this if it triggers when I unpower X2U or when I move my headset a bit
# but both seem solved now
parrot(cluck):
    print("cluck")
    user.debug("Talon wake parrot noise. Power: {power}")
    user.talon_wake()

# ^talon wake up$:
#     user.debug("Talon wake voice command")
#     user.talon_wake()

# ^talon status$:             user.talon_sleep_status()

#this exists solely to prevent talon from waking up super easily in sleep mode at the moment with wav2letter
# <phrase>:                   skip()
