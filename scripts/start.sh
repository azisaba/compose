#!/bin/bash

set -e

script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
root_dir=$(realpath "$script_dir"/..)

docker_compose_random_up() {
  for service in $(docker-compose config --services); do
    (
      sleep "$(shuf -i 0-300 -n 1)"
      docker-compose up -d "$service"
    ) &
  done
  wait
}

(
  cd "$root_dir"

  export COMPOSE_FILE=web/docker-compose.yml
  docker-compose up -d

  export COMPOSE_FILE=apps/minecraft/zones.yml:apps/minecraft/restarts.yml:apps/minecraft/compose.yml
  docker-compose up -d mcredis database bungee lobby
  docker_compose_random_up
)
