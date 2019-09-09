@echo off
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force}
powershell -command "& ""%~d0\GetWMIPCInfo.ps1"""
powershell -command "& {Set-ExecutionPolicy -ExecutionPolicy Default -Scope CurrentUser -Force}
pause