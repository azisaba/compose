#!/bin/ash

cat << EOT > /etc/crontabs/root
0 */12 * * * cd "$PWD" && /run.sh
EOT

close() {
  kill -SIGTERM "$(pgrep crond)"
  exit 0
}

trap 'close' TERM

crond -f -d 8 & wait $!
