#!/bin/ash

EXEC_LINE="0 */8 * * * cd \"$PWD\" && ash /run.sh"
grep -qxF "$EXEC_LINE" /etc/crontabs/root || echo "$EXEC_LINE" >> /etc/crontabs/root

close() {
  kill -SIGTERM "$(pgrep crond)"
  exit 0
}

trap 'close' TERM

crond -f -d 8 &
wait $!
