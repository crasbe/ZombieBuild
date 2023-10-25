@echo off
rem ZombieBuild Starting Script
rem ===========================
rem
rem This script is used to start an existing container. If this container does not exist,
rem  it should be created with the "setupContainer.bat" script. The start script will
rem  start an existing container and can be used instead of the Docker Desktop 
rem  application.
rem 
rem Author: crasbe
rem Date: 2023

echo Restarting the ZombieContainer...
echo:

docker restart ZombieContainer

rem Give the user a chance to see the output of docker :)
pause