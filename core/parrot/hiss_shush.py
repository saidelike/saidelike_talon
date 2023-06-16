from talon import (
    Context,
    Module,
    actions,
)
from typing import Optional

mod = Module()
mod.tag("hiss_shush_frozen", "Indicates that the hiss / shush parrot noises are disabled")

ctx = Context()

# if hiss/shush noises are currently disabled
hiss_shush_frozen = False

@mod.action_class
class Actions:
    def hiss_shush_frozen_toggle(enable: Optional[bool] = None):
        """Toggle frozen state for the hiss/shush noises"""
        global hiss_shush_frozen
        if enable is None:
            hiss_shush_frozen = not hiss_shush_frozen
        else:
            hiss_shush_frozen = enable
        if hiss_shush_frozen:
            ctx.tags = ["user.hiss_shush_frozen"]
        else:
            ctx.tags = []
        actions.user.notify(f"Hiss/shush enabled? {not hiss_shush_frozen}")
