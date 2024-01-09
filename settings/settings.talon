-
settings():

    # increase the width for "command history" so we can print full paths
    user.gui_max_cols = 180

    # Pretty print spoken phrases - Andreas command history
    #user.pretty_print_phrase = true
    # temporarily disable it so we can actually see things in the talon log window    
    user.pretty_print_phrase = false

    # Show parrot sounds being said and regular talon debug logs
    #user.log_level = "debug"
    # disable it so we can actually see other things in the talon log window
    user.log_level = "info"

    # Mouse scroll speed
    user.scroll_speed = 0.7