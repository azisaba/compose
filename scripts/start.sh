#!/bin/bash

set -e

script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
root_dir=$(realpath "$script_dir"/..)

(
  cd "$root_dir"

  export COMPOSE_FILE=apps/web/zones.yml:apps/web/restarts.yml:apps/web/compose.yml
  docker-compose up -d

  export COMPOSE_FILE=apps/minecraft/zones.yml:apps/minecraft/restarts.yml:apps/minecraft/compose.yml
  docker-compose up -d
)
