tag: user.cursorless
-

# adapted from cursorless-talon\src\cursorless.talon
# faster way to use "format title at", see in cursorless-talon\src\cursorless.talon
# {user.cursorless_reformat_action} <user.formatters> at <user.cursorless_target>
# NOTE: we are using an internal api so it could break in the future
turtle <user.cursorless_target>:
    user.cursorless_reformat(cursorless_target, "title")