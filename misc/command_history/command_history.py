from talon import Module, ui, settings, actions, app
from dataclasses import dataclass
import time, os
from ..analyze_phrase.types import AnalyzedPhraseWithActions
from ...imgui import imgui

mod = Module()
size_setting = mod.setting("command_history_size", int, default=50)
display_size_setting = mod.setting("command_history_display", int, default=10)
ttl_setting = mod.setting("command_history_ttl", float, default=-1)
history = []
display_size = None
# If true ttl(time to live) is used to auto hide older history entries
use_ttl = True


# Wrapping in a data class is a simple solution to get a unique identifier for each string even if they are identical
@dataclass
class HistoryEntry:
    phrase: str
    actions: list
    ttl: int
    phrase_start: bool
    path: str
    rule: str


# This means that it will always open in the top left corner of the main screen
# @imgui.open(x=ui.main_screen().x, y=ui.main_screen().y)
# this prints it in the top left corner of my right screen for whatever reason?
# @imgui.open(x=1.0, y=0.0)
# I don't really understand the x/y parameters but this puts it close to the top right corner
# of my left screen so it does the job
# @imgui.open(screen=ui.screen.screens()[1], x=0.2, y=0.0)
# this opens it in the top left corner of my left screen
@imgui.open(screen=ui.screen.screens()[1], x=0.0, y=0.0)
def gui(gui: imgui.GUI):
    t = time.monotonic()
    add_line = False
    # Hide entries outside of display size
    for entry in history[-display_size:]:
        # If ttl is disabled or time hasn't passed yet: show command.
        if not use_ttl or entry.ttl < 0 or entry.ttl >= t:
            if add_line and entry.phrase_start:
                gui.line()
            add_line = True
            gui.header(entry.phrase)
            gui.text(f"{os.path.relpath(entry.path, 'user')} \"{entry.rule}\"")
            for action in entry.actions:
                gui.text(f"    {action.name}: {action.get_explanation_or_desc()}")


@mod.action_class
class Actions:
    def command_history_append(analyzed_phrase: AnalyzedPhraseWithActions):
        """Append command to history"""
        global history
        ttl = settings.get("user.command_history_ttl")
        ttl = time.monotonic() + ttl if ttl > -1 else -1
        for i, cmd in enumerate(analyzed_phrase.commands):
            history.append(
                HistoryEntry(cmd.phrase, cmd.actions, ttl, i == 0, cmd.path, cmd.rule)
            )
        history = history[-settings.get("user.command_history_size") :]

    def command_history_toggle():
        """Toggles viewing the history"""
        global display_size
        if not display_size:
            display_size = settings.get("user.command_history_display")
        if gui.showing:
            gui.hide()
        else:
            gui.show()

    def command_history_toggle_ttl(enabled: bool = None):
        """Toggle if command history should use TTL"""
        global use_ttl
        if enabled == None:
            enabled = not use_ttl
        use_ttl = enabled

    def command_history_clear():
        """Clear the history"""
        global history
        history = []

    def command_history_set_size(size: int):
        """Set command history size"""
        global display_size
        if size == 0:
            gui.hide()
        else:
            display_size = size
            if not gui.showing:
                gui.show()

    def command_history_more():
        """Show more history"""
        global display_size
        if not gui.showing:
            gui.show()
            return
        if display_size < 3:
            display_size = 3
        elif display_size < 5:
            display_size = 5
        else:
            display_size += 5

    def command_history_less():
        """Show less history"""
        global display_size
        if not gui.showing:
            return
        if display_size == 1:
            gui.hide()
        elif display_size < 4:
            display_size = 1
        elif display_size < 6:
            display_size = 3
        else:
            display_size -= 5


def on_ready():
    actions.user.command_history_toggle()


app.register("ready", on_ready)
