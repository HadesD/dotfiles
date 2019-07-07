@echo off
if %1.==. cd /d %HOMEDRIVE%%HOMEPATH% && goto end
cd /d %1
:end
title %CD%