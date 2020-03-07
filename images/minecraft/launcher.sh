#!/bin/ash

close() {
  tmux send -t minecraft ENTER $(echo $STOP_CMD | fold -w 1 | paste -s -d ' ') ENTER
  jwait
  exit 0
}

jwait() {
  tail --pid=$(pgrep java) -f /dev/null
}

trap 'close' SIGTERM

if [ ! -z $JAR_DOWNLOAD_URL ]; then
  SIZE=$(curl -fsSI $JAR_DOWNLOAD_URL | grep -i Content-Length | awk '{ print $2 }')

  if [ ! -f $JAR_PATH ] || [[ $SIZE != $(stat -c %s $JAR_PATH) ]]; then
    wget -O $JAR_PATH $JAR_DOWNLOAD_URL
  fi
fi

if [ $(echo $(cat /proc/uptime | cut -d ' ' -f 1) / 1 | bc) -lt $((5 * 60)) ]; then
  sleep $(shuf -n 1 -i 30-$((2 * 60)))
fi

if [ $(echo $(cat /proc/loadavg | cut -d ' ' -f 1) / 1 | bc) -ge $(($(nproc --all) / 4)) ]; then
  sleep $(shuf -n 1 -i 30-$((2 * 60)))
fi

tmux new -d -s minecraft java $JVM_ARGS -jar $JAR_PATH
tail -n 0 -F ./proxy.log.0 ./logs/latest.log ./gc.log 2> /dev/null &

until pgrep java > /dev/null; do
  sleep 1
done

jwait &
wait $!
