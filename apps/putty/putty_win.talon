# https://github.com/Leeft/knausj_talon/blob/853a3edb/apps/putty/putty_win.talon#L1
os: windows
and app.exe: putty.exe
-
# makes the commands in terminal.talon available
tag(): terminal

# activates the implementation of the commands/functions in terminal.talon
tag(): user.generic_unix_shell

# makes commands for certain applications available
# you can deactivate them if you do not use the application
tag(): user.git
#tag(): user.tig
tag(): user.file_manager
#tag(): user.sql
