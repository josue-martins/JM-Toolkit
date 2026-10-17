@echo off
setlocal EnableDelayedExpansion
color 0A
title Network Troubleshoot Toolkit
:MENU
cls
echo.
echo ============================================================
echo NETWORK TROUBLESHOOT TOOLKIT
echo ============================================================
echo.
echo 1. Show IP Configuration
echo 2. Flush DNS Cache
echo 3. Release IP Address
echo 4. Renew IP Address
echo 5. Reset Winsock
echo 6. Reset TCP/IP Stack
echo 7. Ping Google
echo 8. Network Statistics
echo 9. Open Network Connections
echo 10. Open Wi-Fi Settings
echo 11. Full Network Repair
echo 12. Exit
echo.
echo ============================================================
echo.
set /p CHOICE=" Enter your choice [1-12]: "
if "%CHOICE%"=="1" goto IPCONFIG
if "%CHOICE%"=="2" goto FLUSHDNS
if "%CHOICE%"=="3" goto RELEASEIP
if "%CHOICE%"=="4" goto RENEWIP
if "%CHOICE%"=="5" goto WINSOCK
if "%CHOICE%"=="6" goto TCPIP
if "%CHOICE%"=="7" goto PING
if "%CHOICE%"=="8" goto NETSTATS
if "%CHOICE%"=="9" goto NETCONNECTIONS
if "%CHOICE%"=="10" goto WIFISETTINGS
if "%CHOICE%"=="11" goto FULLREPAIR
if "%CHOICE%"=="12" goto EXIT
echo.
echo [!] Invalid choice. Please enter a number between 1 and 12.
timeout /t 2 >nul
goto MENU
:: ─────────────────────────────────────────────
:IPCONFIG
cls
echo.
echo [ 01 ] Show IP Configuration
echo ============================================================
echo.
ipconfig /all
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:FLUSHDNS
cls
echo.
echo [ 02 ] Flush DNS Cache
echo ============================================================
echo.
ipconfig /flushdns
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:RELEASEIP
cls
echo.
echo [ 03 ] Release IP Address
echo ============================================================
echo.
ipconfig /release
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:RENEWIP
cls
echo.
echo [ 04 ] Renew IP Address
echo ============================================================
echo.
ipconfig /renew
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:WINSOCK
cls
echo.
echo [ 05 ] Reset Winsock
echo ============================================================
echo.
netsh winsock reset
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:TCPIP
cls
echo.
echo [ 06 ] Reset TCP/IP Stack
echo ============================================================
echo.
netsh int ip reset
netsh int ipv6 reset
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:PING
cls
echo.
echo [ 07 ] Ping Google
echo ============================================================
echo.
ping 8.8.8.8
echo.
ping www.google.com
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:NETSTATS
cls
echo.
echo [ 08 ] Network Statistics
echo ============================================================
echo.
netstat -ano
echo.
netstat -e
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:NETCONNECTIONS
cls
echo.
echo [ 09 ] Open Network Connections
echo ============================================================
echo.
start ncpa.cpl
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:WIFISETTINGS
cls
echo.
echo [ 10 ] Open Wi-Fi Settings
echo ============================================================
echo.
start ms-settings:network-wifi
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:FULLREPAIR
cls
echo.
echo [ 11 ] Full Network Repair
echo ============================================================
echo.
set /p CONFIRM=" Proceed? (Y/N): "
if /i not "%CONFIRM%"=="Y" goto MENU
echo.
echo [1/6] Releasing IP Address…
ipconfig /release >nul 2>&1
echo [2/6] Flushing DNS Cache…
ipconfig /flushdns >nul 2>&1
echo [3/6] Resetting Winsock…
netsh winsock reset >nul 2>&1
echo [4/6] Resetting TCP/IP Stack (IPv4)…
netsh int ip reset >nul 2>&1
echo [5/6] Resetting TCP/IP Stack (IPv6)…
netsh int ipv6 reset >nul 2>&1
echo [6/6] Renewing IP Address…
ipconfig /renew >nul 2>&1
echo.
echo Full Network Repair Completed. Please restart your computer.
echo.
set /p RESTART=" Restart now? (Y/N): "
if /i "%RESTART%"=="Y" shutdown /r /t 10 /c "Restarting after Full Network Repair"
echo.
pause
goto MENU
:: ─────────────────────────────────────────────
:EXIT
cls
echo.
echo Goodbye!
echo.
timeout /t 2 >nul
exit