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

tmux new -d -s minecraft java $JVM_ARGS -jar $JAR_PATH
tail -n 0 -F ./proxy.log.0 ./logs/latest.log ./gc.log &

until pgrep java > /dev/null; do
  sleep 1
done

jwait &
wait $!
