@echo off
rem
rem
rem

docker exec -t --workdir /app/Tesla-M3-Bms-Software ZombieContainer sh -c "make get-deps"
docker exec -t --workdir /app/Tesla-M3-Bms-Software ZombieContainer sh -c "make"

pause