# enable foot pedal to control VLC globally
player control enable: 
    user.vlc_control_toggle(true)

player control disable:
    user.vlc_control_toggle(false)

player control [switch|toggle]:
    user.vlc_control_toggle()

# global shortcuts but not ideal as takes a long time to say
# play/pause VLC
video [switch|toggle]: key(shift-ctrl-f12)
# to navigate left
video last: key(shift-ctrl-f10)
# to navigate right
video next: key(shift-ctrl-f11)