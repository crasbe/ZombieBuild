@echo off
rem
rem
rem
rem
rem

echo Stopping the container if it is already running...
echo:

docker stop ZombieContainer

echo Starting the container...
echo:

rem docker run -t -d --name ZombieContainer --mount type=bind,source=%cd%/code,target=/app zombiebuild:latest 
docker start ZombieContainer