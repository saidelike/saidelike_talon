mode: sleep
-

# settings():
#     speech.timeout = 0.1

# NOTE: disable this if it triggers when I unpower X2U but seems solved with new model now
# XXX - this triggers now when I move my headset a bit so this needs to be fixed too
#parrot(cluck):
#   user.debug("Talon wake parrot noise. Power: {power}")
#    user.talon_wake()

# ^talon wake up$:
#     user.debug("Talon wake voice command")
#     user.talon_wake()

# ^talon status$:             user.talon_sleep_status()

#this exists solely to prevent talon from waking up super easily in sleep mode at the moment with wav2letter
# <phrase>:                   skip()
