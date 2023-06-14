from talon import Module

mod = Module()


@mod.action_class
class Actions:
    def dictation_get_context() -> tuple[str, str]:
        """Returns the text before and after the current selection"""
        return (None, None)
