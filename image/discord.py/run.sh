#!/bin/ash

(
  set -u
  : $SCRIPT_PATH
)

exec python3 -u $SCRIPT_PATH
