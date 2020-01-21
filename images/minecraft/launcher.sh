#!/bin/sh

close() {
  tmux send -t minecraft ENTER `echo "$STOP_CMD" | fold -w 1 | paste -s -d ' '` ENTER

  jwait

  echo
  exit 0
}

jwait() {
  tail --pid=`pgrep java` -f /dev/null
}

trap 'close' SIGTERM

tmux new -d -s minecraft 'java -Dminecraft@`basename $PWD` -jar "$JAR_PATH" | tee /tmux.log'
tail -F /tmux.log 2> /dev/null &

{
  until pgrep java > /dev/null; do
    sleep 1
  done

  jwait
} &
wait $!
