@echo off
rem ZombieBuild Build and Setup Script
rem ==================================
rem
rem This script creates a Docker image with all the required tools and libraries with the Dockerfile
rem  and creates a Docker container from the image, which can be executed. This script should be run
rem  first and handles everything required to get started.
rem Once the setup script ran successfully, the container can be started with the startContainer.bat
rem  script or with the Docker Desktop application.
rem 
rem
rem Author: crasbe, Tom-evnut
rem Date: 2023

echo =========================================
echo == ZombieVerter Docker Container Setup ==
echo =========================================
echo:
echo First this script will stop and remove any old containers which might still be 
echo installed on the system. This guarantees a fresh start.
echo:
echo Any changes made to the system outside of the /app directory in the container
echo or the "code" directory in the subfolder will be reverted!
echo Close this window if you want to make any changes before (re-)installation!
echo:
pause

echo:
echo ================================================================================
echo This might take a short while and might give error messages if no container
echo is present. Don't worry :)
echo:

docker stop ZombieContainer
docker rm ZombieContainer

echo:
echo ================================================================================
echo Beginning the setup for the new container image.
echo This can take a significant amount of time depending on the internet connection!
echo:

docker build -t zombiebuild:latest .

echo:
echo ================================================================================
echo Create a subfolder "code" for the code to be stored in...
if not exist code mkdir code

echo:
echo ================================================================================
echo Starting the container "ZombieContainer"...
echo:

docker run -t -d --name ZombieContainer --mount type=bind,source="%cd%/code",target=/app zombiebuild:latest

echo ================================================================================
echo Cloning the ZombieVerter and Tesla M3 BMS repository from Github...
echo:

docker exec -t --workdir /app ZombieContainer sh -c "git clone https://github.com/damienmaguire/Stm32-vcu"
docker exec -t --workdir /app ZombieContainer sh -c "git clone https://github.com/damienmaguire/Tesla-M3-Bms-Software"

echo ================================================================================
echo WE ARE DONE!
echo If no error messages occured, everything should be up and running.
echo You should see the "ZombieContainer" in the list below:
echo:

docker stats --no-stream

pause