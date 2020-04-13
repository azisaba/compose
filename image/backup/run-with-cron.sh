#!/bin/ash

EXEC_LINE="0 */8 * * * cd \"$PWD\" && ash /run.sh"
grep -qxF "$EXEC_LINE" /etc/crontabs/root || echo "$EXEC_LINE" >> /etc/crontabs/root

close() {
  kill -s SIGTERM "$(pgrep crond)"
}
trap 'close' TERM
crond -f -d 8 &
wait $!
