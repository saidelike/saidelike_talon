# https://github.com/AndreasArvidsson/andreas-talon/blob/3f27d1de3a08773de885f37bc4c19759b198782b/misc/talon_helpers/talon_helpers.talon
talon print context:
    name = app.name()
    executable = app.executable()
    title = win.title()
    print("Name: {name}")
    print("Executable: {executable}")
    print("Title: {title}")

talon print title:          print(win.title())
talon print name:           print(app.name())
talon print tags:           print(" \n{user.talon_get_tags()}")
talon print modes:          print(" \n{user.talon_get_modes()}")
talon print captures:       print(" \n{user.talon_get_captures()}")
talon print lists:          print(" \n{user.talon_get_lists()}")
talon print actions:        print(" \n{user.talon_get_actions()}")
talon print actions long:   print(" \n{user.talon_get_actions_long()}")
talon print <user.text> actions: print(" \n{user.talon_get_actions_search(text)}")
talon print list problems:  user.talon_print_list_problems()
talon print core:           print(" \n{user.talon_get_core()}")

talon copy title:           clip.set_text(win.title())
talon copy name:            clip.set_text(app.name())
talon copy tags:            clip.set_text(user.talon_get_tags())
talon copy modes:           clip.set_text(user.talon_get_modes())
talon copy captures:        clip.set_text(user.talon_get_captures())
talon copy actions:         clip.set_text(user.talon_get_actions())
talon copy actions long:    clip.set_text(user.talon_get_actions_long())
talon copy <user.text> actions: clip.set_text(user.talon_get_actions_search(text))
talon copy core:            clip.set_text(user.talon_get_core())

talon copy python context:  user.talon_add_context_clipboard_python()
talon copy context:         user.talon_add_context_clipboard()
talon copy commands:        user.help_copy_all_commands()

talon open log:             menu.open_log()
talon open repl:            menu.open_repl()
talon open home:            menu.open_talon_home()
talon open debug:           menu.open_debug_window()
talon check updates:        menu.check_for_updates()

talon sim <phrase>$:        user.talon_sim_phrase(phrase)

talon restart:              user.talon_restart()