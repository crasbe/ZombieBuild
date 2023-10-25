@echo off
rem
rem
rem

docker exec -t --workdir /app/Stm32-vcu ZombieContainer sh -c "make get-deps"
docker exec -t --workdir /app/Stm32-vcu ZombieContainer sh -c "make"

pause