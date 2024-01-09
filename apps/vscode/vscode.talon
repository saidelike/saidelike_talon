# custom vscode commands go here
app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
# comment user.snippets tag when doing development in Cursorless to avoid warnings
tag(): user.snippets
tag(): user.splits
tag(): user.tabs

settings():
    key_wait = 2

# https://github.com/pokey/pokey_talon/blob/1b959c03ab1bd9d90e3b6c044db700b9bb75c289/apps/vscode/vscode.talon#L209-L219
# allow to use "pop sesh" and "list sesh" commands to switch between vscode workspaces/windows
<user.show_list> sesh [<user.text>] [halt]:
    user.vscode("workbench.action.openRecent")
    sleep(250ms)
    user.insert_formatted(text or "", "DASH_SEPARATED,ALL_LOWERCASE")
    sleep(250ms)
<user.teleport> sesh [<user.text>] [halt]:
    user.vscode("workbench.action.openRecent")
    sleep(250ms)
    user.insert_formatted(text or "", "DASH_SEPARATED,ALL_LOWERCASE")
    key(enter)
    sleep(250ms)