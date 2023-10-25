@echo off
rem ZombieBuild "Tesla Model 3 BMS" Compile Script
rem ==============================================
rem
rem This script is used to compile the "Tesla M3 BMS" project from Damien Maguire.
rem It can be used to integrate into an IDE or editor to ease the work flow.
rem
rem The code is located in the "code/Tesla-M3-Bms-Software" subdirectory.
rem
rem For more information about the project see...
rem   https://github.com/damienmaguire/Tesla-M3-Bms-Software
rem 
rem Author: crasbe, Tom-evnut
rem Date: 2023

docker exec -t --workdir /app/Tesla-M3-Bms-Software ZombieContainer sh -c "make clean"
docker exec -t --workdir /app/Tesla-M3-Bms-Software ZombieContainer sh -c "make get-deps TARGETS=stm32/f1"
docker exec -t --workdir /app/Tesla-M3-Bms-Software ZombieContainer sh -c "make -j4"

pause