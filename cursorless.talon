tag: user.cursorless
-

# adapted from cursorless-talon\src\cursorless.talon
# faster way to use "format title at", see in cursorless-talon\src\cursorless.talon
# {user.cursorless_reformat_action} <user.formatters> at <user.cursorless_target>
# NOTE: we are using an internal api so it could break in the future
# the proper approach is to implement https://github.com/cursorless-dev/cursorless/issues/492 
# so we can do whatever we want
turtle <user.cursorless_target>:
    user.cursorless_reformat(cursorless_target, "title")

# Command to repeat the last action on a new target
# proper approach is to implement https://github.com/cursorless-dev/cursorless/issues/455
# hacky way as long as you didn't provide targets, and only used "this"
# in the original command, e.g. "pre air", "format title at this", "also bat"
also <user.cursorless_target>:
    prev_command = user.history_get(1)
    # XXX - could move that code to Python and have it check that prev_command contains "this" before doing anything?
    user.cursorless_command("setSelectionBefore", cursorless_target)
    user.engine_mimic(prev_command)