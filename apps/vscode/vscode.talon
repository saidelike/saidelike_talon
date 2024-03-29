# custom vscode commands go here
app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs

settings():
    key_wait = 2

# https://github.com/pokey/pokey_talon/blob/1b959c03ab1bd9d90e3b6c044db700b9bb75c289/apps/vscode/vscode.talon#L209-L219
# allow to use "sesh pop" and "sesh list" commands to switch between vscode workspaces/windows
scout sesh [<user.text>]$:
    user.vscode("workbench.action.openRecent")
    sleep(250ms)
    user.insert_formatted(text or "", "DASH_SEPARATED,ALL_LOWERCASE")
    sleep(250ms)
pop sesh [<user.text>]$:
    user.vscode("workbench.action.openRecent")
    sleep(250ms)
    user.insert_formatted(text or "", "DASH_SEPARATED,ALL_LOWERCASE")
    key(enter)
    sleep(250ms)
    key(enter)