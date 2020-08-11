#!/bin/bash

set -e

script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
root_dir=$(realpath "$script_dir"/..)

(
  cd "$root_dir"

  export COMPOSE_FILE=web/docker-compose.yml
  docker-compose down

  export COMPOSE_FILE=apps/minecraft/zones.yml:apps/minecraft/restarts.yml:apps/minecraft/compose.yml
  docker-compose down
)
