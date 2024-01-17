from talon import Module, Context, actions
from typing import Callable
from abc import ABC, abstractmethod
import re

mod = Module()
ctx = Context()


@mod.action_class
class Actions:
    def de_camel(text: str) -> str:
        """Replacing camelCase boundaries with blank space"""
        Ll = "a-zåäö"
        Lu = "A-ZÅÄÖ"
        L = f"{Ll}{Lu}"
        low_to_upper = rf"(?<=[{Ll}])(?=[{Lu}])"  # camel|Case
        upper_to_last_upper = rf"(?<=[L{Lu}])(?=[{Lu}][{Ll}])"  # IP|Address
        letter_to_digit = rf"(?<=[{L}])(?=[\d])"  # version|10
        digit_to_letter = rf"(?<=[\d])(?=[{L}])"  # 2|x
        return re.sub(
            rf"{low_to_upper}|{upper_to_last_upper}|{letter_to_digit}|{digit_to_letter}",
            " ",
            text,
        )
