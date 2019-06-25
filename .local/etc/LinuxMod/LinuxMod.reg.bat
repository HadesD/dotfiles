reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor" /v AutoRun /d "@ECHO OFF & @title %CD% & call LinuxMod.bat" & ECHO ON"
