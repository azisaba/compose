#!/bin/ash

(
  set -u
  : "$JAR_PATH"
)

close() {
  if [ -n "$STOP_CMD" ]; then
    screen -S minecraft -p 0 -X stuff "\n$STOP_CMD\n"
  else
    kill -SIGINT "$(pgrep java)"
  fi
  while pgrep java > /dev/null; do
    sleep 1
  done
  exit 0
}

trap 'close' TERM

if [ -n "$JAR_DOWNLOAD_URL" ]; then
  SIZE=$(curl -fsSI "$JAR_DOWNLOAD_URL" | grep -i Content-Length | awk '{ print $2 }')

  if [ -n "$SIZE" ]; then
    if [ ! -f "$JAR_PATH" ] || [ ! "$SIZE" = "$(stat -c %s "$JAR_PATH")" ]; then
      wget -O "$JAR_PATH" "$JAR_DOWNLOAD_URL"
    fi
  fi
fi

if [ -n "$LAZY_STARTUP" ] && [ "$LAZY_STARTUP" = "yes" ]; then
  if [ "$(echo "$(cut -d ' ' -f 1 < /proc/uptime)" / 1 | bc)" -lt $(( 5 * 60 )) ]; then
    sleep "$(shuf -n 1 -i 30-$(( 2 * 60 )))"
  fi

  if [ "$(echo "$(cut -d ' ' -f 1 < /proc/loadavg)" / 1 | bc)" -ge $(( $(nproc --all) / 4 )) ]; then
    sleep "$(shuf -n 1 -i 30-$(( 2 * 60 )))"
  fi
fi

tail -n 0 -F ./logs/latest.log 2> /dev/null &

screen -ADmS minecraft java $(echo "$JVM_ARGS") -jar "$JAR_PATH" &
wait $!
