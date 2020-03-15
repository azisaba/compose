#!/bin/ash

set -u
: $SCRIPT_PATH
set +u

exec python3 -u $SCRIPT_PATH
