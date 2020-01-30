#!/bin/sh

close() {
  tmux send -t minecraft ENTER `echo $STOP_CMD | fold -w 1 | paste -s -d ' '` ENTER

  jwait

  echo
  exit 0
}

jwait() {
  tail --pid=`pgrep java` -f /dev/null
}

trap 'close' SIGTERM

tmux new -d -s minecraft java $JVM_ARGS -jar $JAR_PATH
tail -F ./proxy.log.0 &
tail -F ./logs/latest.log &
tail -F ./gc.log &

{
  until pgrep java > /dev/null; do
    sleep 1
  done

  jwait
} &
wait $!
