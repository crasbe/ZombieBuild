@echo off
REM This 
REM
REM
REM
REM

echo =======================================
echo = ZombieVerter Docker Container Setup =
echo =======================================
echo Stopping and removing any old containers which might still be present.
echo This will delete any changes made outside of the /app folder!
echo Close this window if you want to make any changes before (re-)installation!
pause

echo:
echo This might take a short while...
echo:

docker stop ZombieContainer
docker rm ZombieContainer

echo:
echo Beginning the setup for the new container image.
echo This can take 10-30 minutes.
echo:

docker build -t zombiebuild:latest .

echo:
echo Create persistent folder for the code to be stored in...
echo:
if not exist code mkdir code

docker run -t -d --name ZombieContainer --mount type=bind,source=%cd%/code,target=/app zombiebuild:latest 

docker exec -t --workdir /app ZombieContainer sh -c "git clone https://github.com/damienmaguire/Stm32-vcu"
docker exec -t --workdir /app ZombieContainer sh -c "git clone https://github.com/damienmaguire/Tesla-M3-Bms-Software"

pause