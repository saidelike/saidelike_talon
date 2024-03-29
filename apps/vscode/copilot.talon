# https://github.com/pokey/pokey_talon/blob/f301385f5a2bf96331e73ac4d23da4f03c9e7624/apps/vscode/copilot.talon
# https://github.com/AndreasArvidsson/andreas-talon/blob/a2fa56197009e077363ab31a34049533474870d4/apps/vscode/vscode.talon#L277
# https://github.com/C-Loftus/talon-ai-tools/tree/1370bb3d6e1571b30e7fc7f92f946f1be4161484/copilot
app: vscode
-
pilot jest: user.vscode("editor.action.inlineSuggest.trigger")
pilot next: user.vscode("editor.action.inlineSuggest.showNext")
pilot last: user.vscode("editor.action.inlineSuggest.showPrevious")
pilot yes: user.vscode("editor.action.inlineSuggest.commit")
pilot yes word: user.vscode("editor.action.inlineSuggest.acceptNextWord")
pilot undo: user.vscode("editor.action.inlineSuggest.undo")
pilot (cancel | stop): user.vscode("editor.action.inlineSuggest.hide")
pilot block last: user.vscode("workbench.action.chat.previousCodeBlock")
pilot block next: user.vscode("workbench.action.chat.nextCodeBlock")
pilot new file <user.ordinal_or_last>:
    user.copilot_focus_code_block(ordinal_or_last)
    user.vscode("workbench.action.chat.insertIntoNewFile")
pilot copy <user.ordinal_or_last>:
    user.copilot_focus_code_block(ordinal_or_last)
    edit.copy()
pilot bring <user.ordinal_or_last>: user.copilot_bring_code_block(ordinal_or_last)
pilot bring <user.ordinal_or_last> {user.makeshift_destination} <user.cursorless_target>:
    user.cursorless_command(makeshift_destination, cursorless_target)
    user.copilot_bring_code_block(ordinal_or_last)
pilot chat [<user.prose>]$:
    user.copilot_chat(prose or "")
pilot {user.copilot_slash_command} <user.cursorless_target> [to <user.prose>]$:
    user.cursorless_command("setSelection", cursorless_target)
    user.copilot_inline_chat(copilot_slash_command or "", prose or "")
pilot make [<user.prose>]:
    user.copilot_inline_chat("", prose or "")
