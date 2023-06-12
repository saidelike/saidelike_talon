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


def control_toggle(enable: bool) -> bool:
    global vlc_control
    vlc_control = not vlc_control
    if vlc_control:
        ctx.tags = ["user.vlc_control"]
        return True
    else:
        ctx.tags = []
        return False


@mod.action_class
class Actions:
    def vlc_control_toggle(enable: Optional[bool] = None):
        """Toggle enable/disable for the global VLC control"""
        vlc_control_toggle(enable if enable is not None else True)


def vlc_control_toggle(enable: bool):
    enabled = control_toggle(enable)
    actions.user.notify(f"Control VLC: {enabled}")
