reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor" /v AutoRun /d "@ECHO OFF & call %CD%\LinuxMod.bat" & ECHO ON"
