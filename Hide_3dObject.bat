@echo off

whoami /priv | find "SeDebugPrivilege"  > nul
if %errorlevel% neq 0 (
　@powershell start-process %~0 -verb runas
　exit
)

set RegKey="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"

reg delete %RegKey% /f

pause