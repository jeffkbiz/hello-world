
Get-ExecutionPolicy
set-executionpolicy remotesigned
set-executionpolicy unrestricted

powershell.exe -noprofile -executionpolicy bypass -file .\script.ps1
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force;

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;
Set-ExecutionPolicy Bypass
set-executionpolicy remotesigned -Scope CurrentUser

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass # worked for Masoud