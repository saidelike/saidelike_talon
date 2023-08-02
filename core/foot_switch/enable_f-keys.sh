#!/bin/bash
#
# Workaround to enable F16 to F19 keys on Linux if they are not detected automatically
# This is required as otherwise we won't be able to use key(f16:down) in a .talon file
# and an error like the below will trigger when Talon loads that .talon file:
# ```
# 2023-07-27 11:11:04.249 DEBUG User modules loaded at 6.1619s
# 2023-07-27 11:11:04.475 ERROR invalid hotkey f16
#    18:      lib/python3.11/threading.py:995 * # loader thread
#    17:      lib/python3.11/threading.py:1038* 
#    16:      lib/python3.11/threading.py:975 * 
#    15:          app/resources/loader.py:853 | 
#    14:          app/resources/loader.py:793 | 
#    13:      talon/scripting/registry.py:213 | 
#    12:      talon/scripting/registry.py:224 | 
#    11:      talon/scripting/dispatch.py:134 | # 'update_decls' main:Scope.update_decls()
#    10:         talon/scripting/scope.py:150 | 
#     9:         talon/scripting/scope.py:134 | 
#     8:      talon/scripting/dispatch.py:134 | # 'change' main:Scope._registry_update_contexts()
#     7:         talon/scripting/scope.py:62  | 
#     6:      talon/scripting/registry.py:597 | 
#     5:      talon/scripting/dispatch.py:134 | # 'update_hotkeys' talon_plugins.hotkey_system:BaseHotkeySystem._update()
#     4: talon/scripting/hotkey_system.py:70  | 
#     3:      talon/scripting/dispatch.py:134 | # 'update' talon_plugins.hotkey_system:HotkeySystem.update()
#     2:     talon/linux/hotkey_system.py:172 | # [stack splice]
#     1:     talon/linux/hotkey_system.py:59  | 
# ValueError: could not find keycode for key: 'f16'
# ```
#
# Useful resources:
# https://github.com/talonvoice/talon/issues/540 : output of `xmodmap -pk` used by talon to detect f16 and co keys
# http://xahlee.info/linux/linux_xmodmap_f13_f14_f15.html : on Linux, f16 is keycode 194, not 186
# https://wiki.archlinux.org/title/xmodmap : xmodmap usage
# https://www.x.org/archive/X11R6.8.1/doc/xmodmap.1.html : xmodmap usage
# https://github.com/tolga9009/sidewinderd/issues/52 : `xev` command to view the key codes of key you press (better than evtest which gives invalid info on Linux (WTF?))

echo Fixing f16 to f19 keys so we can use the foot switch...

echo -------------
echo Before:
xmodmap -pk | grep -E "KeyCode|Value|194|195|196|197|F10|F11|F12|F16|F17|F18|F19"

echo -------------
echo Trying to fix it
xmodmap .Xmodmap

echo -------------
echo After:
xmodmap -pk | grep -E "KeyCode|Value|194|195|196|197|F10|F11|F12|F16|F17|F18|F19"

echo -------------
echo Now restart talon and use your foot switch!
