@echo off
title Task and Services Manager [TASM 1.1]
color 0d
rem Task and Services Manager created by TommyBlack (05/26/2013)
rem Support (english and german) -> supportstube@hotmail.de
rem Thanks to my friend and neighbour Saiyanator
:task
cls
echo Currently running tasks:
echo;
tasklist
echo;
echo;
echo [1] Refresh
echo [2] Kill Task
echo [3] Exit
echo;
echo [4] Switch to services
echo;
echo;
set choice=
set /p choice=: 
if "%choice%"=="1" goto task
if "%choice%"=="2" goto killta
if "%choice%"=="3" goto end
if "%choice%"=="4" goto service
goto task
:killta
cls
echo Currently running tasks:
echo;
tasklist
echo;
echo Name the Task or the PID for killing!
echo [/x] to abort
echo;
set killtask=
set /p killtask=: 
echo;
if "%killtask%"=="/x" goto task
if "%killtask%"=="/X" goto task
taskkill /IM %killtask% /T /F
echo;
echo %killtask% should be killed. Otherwise it's a pretty annoying task.
pause>nul
goto task
:service
cls
net start
echo;
echo;
echo [1] Refresh
echo [2] Kill service
echo [3] Exit
echo;
echo [4] Switch to tasks
echo;
echo;
set choice=
set /p choice=: 
if "%choice%"=="1" goto service
if "%choice%"=="2" goto killse
if "%choice%"=="3" goto end
if "%choice%"=="4" goto task
goto service
:killse
cls
net start
echo;
echo Name the Service for killing!
echo [/x] to abort
echo;
set killserv=
set /p killserv=: 
echo;
if "%killserv%"=="/x" goto service
if "%killserv%"=="/X" goto service
net stop "%killserv%"
echo;
echo %killserv% should be killed. Otherwise it's a pretty annoying service.
pause>nul
goto service
:end
exit