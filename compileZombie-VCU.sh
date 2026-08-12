#!/bin/bash 

set -euo pipefail

docker exec -t --workdir /app/Stm32-vcu ZombieContainer sh -c "make get-deps"

docker exec -t --workdir /app/Stm32-vcu ZombieContainer sh -c "make"

if [ $? -eq 0 ]; then
    echo
    echo "Compilation complete. The binary is: code/Stm32-vcu/stm32_vcu.bin"
    echo
fi
