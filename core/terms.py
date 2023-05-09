# https://github.com/pokey/pokey_talon/blob/8c969de3b3148ad844413bd34fcf7415f5faa6e9/core/terms.py
"""
Stores terms that are used in many different places
"""
from talon import Module

mod = Module()

SELECT = "take"
TELEPORT = "pop"
OPERATOR = "make"
DELETE = "chuck"
FIND = "scout"
SHOW_LIST = "list"


@mod.capture(rule=SELECT)
def select(m) -> str:
    """Term for select"""
    return str(m)


@mod.capture(rule=TELEPORT)
def teleport(m) -> str:
    """Verb to use for commands that teleport the cursor to another place"""
    return str(m)


@mod.capture(rule=OPERATOR)
def operator(m) -> str:
    """Prefix for operators"""
    return str(m)


@mod.capture(rule=DELETE)
def delete(m) -> str:
    """Verb to use for commands that delete things"""
    return str(m)


@mod.capture(rule=FIND)
def find(m) -> str:
    """Verb to use for commands that find things"""
    return str(m)


@mod.capture(rule=SHOW_LIST)
def show_list(m) -> str:
    """Verb to use for commands that show lists"""
    return str(m)
