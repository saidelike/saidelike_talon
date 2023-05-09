# OBS focus is needed even though the hotkey
# works fine from the keyboard without OBS focus, wtf?
# but it works if you say "focus obs" first
# commented for now as I would need to put talon in sleep mode too or wake him up since I record myself in between...
# ^(start|stop) recording$:
#     user.switcher_focus("OBS Studio")
#     key(f13)
#     key(alt-tab)
# solved in https://github.com/talonvoice/talon/issues/591#issuecomment-1482285829
# I think it's an OBS bug, OBS won't respond to global hotkeys unless they're held down for longer.
#^(start|stop) recording$:
#    key(f13:down)
#    sleep(100ms)
#    key(f13:up)