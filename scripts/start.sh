#!/bin/bash

set -e

docker-compose build

docker-compose config --services | grep -E 'nginx|azisaba-(mariadb|redis|bungee|lobby)' | xargs docker-compose up -d --scale azisaba-bungee=5
for service in $(docker-compose config --services | grep -vE 'nginx|azisaba-(mariadb|redis|bungee|lobby)'); do
  ( sleep "$(shuf -i 60-300 -n 1)" && docker-compose up -d "$service" ) &
done
wait
