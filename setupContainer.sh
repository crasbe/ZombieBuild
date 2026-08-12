#!/bin/bash 

set -euo pipefail

echo "============================================="
echo "===  ZombieVerter Docker Container Setup  ==="
echo "============================================="
echo "Stopping and removing any old containers which might still be present."
echo "This will delete any changes made outside of the /app folder!"
echo "Close this window if you want to make any changes before (re-)installation!"

read -rp "Press any key to continue..." -n1 -s

# check if docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Error: Docker is not running. Please start Docker and try again."
    exit 1
fi

echo
echo Cleaning any old containers. This might take a short while...

docker stop ZombieContainer >/dev/null 2>&1 || true
docker rm ZombieContainer >/dev/null 2>&1 || true

echo "Beginning the setup for the new container image."
echo "This can take 10-30 minutes."

if ! docker build -t zombiebuild:latest . ; then
    echo "Error: Failed to build the Docker image."
    exit 1
fi

echo "Creating persistent folder for the code to be stored in..."

mkdir -p code

echo "Starting the ZombieContainer container..."

if ! docker run -t -d --name ZombieContainer --mount type=bind,source="$(pwd)"/code,target=/app zombiebuild:latest >/dev/null 2>&1 ; then
    echo "Error: Failed to start the ZombieContainer container."
    exit 1
fi

# Clone the code if we don't already have it
if [ ! -d "code/Stm32-vcu" ]; then
    echo "Cloning the Stm32-vcu repository into the code folder..."
    if ! docker exec -t --workdir /app ZombieContainer sh -c "git clone https://github.com/damienmaguire/Stm32-vcu" >/dev/null 2>&1; then
        echo "Error: Failed to clone the Stm32-vcu repository."
        exit 1
    fi
else
    echo "Stm32-vcu repository already exists in the code folder. Skipping clone."
fi

echo "Setup complete. You can now run compileZombie-VCU.sh to compile the code."
