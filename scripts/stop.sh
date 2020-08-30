#!/bin/bash

set -e

script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
root_dir=$(realpath "$script_dir"/..)

(
  cd "$root_dir"

  docker-compose down --timeout 60
)
