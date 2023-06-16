from talon import (
    Context,
    Module,
    actions,
)
from typing import Optional

mod = Module()
mod.tag("vlc_control", "Indicates that the global VLC control is enabled")

ctx = Context()

# if global VLC control is currently enabled or disabled
vlc_control = False

@mod.action_class
class Actions:
    def vlc_control_toggle(enable: Optional[bool] = None):
        """Toggle enable/disable for the global VLC control"""
        global vlc_control
        if enable is None:
            vlc_control = not vlc_control
        else:
            vlc_control = enable
        if vlc_control:
            ctx.tags = ["user.vlc_control"]
        else:
            ctx.tags = []
        actions.user.notify(f"Control VLC: {vlc_control}")
