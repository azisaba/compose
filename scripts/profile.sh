#!/bin/bash

azifry() {
  (
    set -ex

    cd /srv/azifry

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
}

alias web='COMPOSE_FILE=apps/web/zones.yml:apps/web/restarts.yml:apps/web/compose.yml azifry'
alias mc='COMPOSE_FILE=apps/minecraft/zones.yml:apps/minecraft/restarts.yml:apps/minecraft/compose.yml azifry'

alias server='echo "Run: mc screen <Container>" && :'
alias servers='echo "Run: mc ls" && :'
alias sv-log='echo "Run: mc logs [Container...]" && :'
alias sv-logf='echo "Run: mc logs -f --tail=0 [Container...]" && :'
alias sv-start='echo "Run: mc up -d [Container..]" && :'
alias sv-stop='echo "Run: mc downof <Container>" && :'
alias sv-restart='echo "Run: mc rebootof <Container>" && :'
alias sv-full-restart='echo "Run: mc rebootof <Container>" && :'
alias sv-top='echo "Run: mc ps" && :'
