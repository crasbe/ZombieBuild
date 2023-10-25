#!/bin/bash 

echo Stopping the container if it is already running...
echo

docker stop ZombieContainer

echo Starting the container...
echo

docker start ZombieContainer