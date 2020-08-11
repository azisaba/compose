#!/bin/bash

(
  cd "$DIR"

  cmds=$*

  case "$1" in
    ls ) cmds='config --services' ;;
    reboot ) cmds='down|up -d' ;;
    rebootof ) cmds="stop ${2?}|rm -f ${2?}|up -d ${2?}" ;;
    downof ) cmds="stop ${2?}|rm -f ${2?}" ;;
    screen ) cmds="exec ${2?} screen -rx" ;;
  esac

  export IFS='|'
  for cmd in $cmds; do
    eval sudo COMPOSE_FILE="$COMPOSE_FILE" docker-compose "$cmd"
  done
)
