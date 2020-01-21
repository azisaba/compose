#!/bin/sh

close() {
  tmux send -t minecraft ENTER `echo "$STOP_CMD" | fold -w 1 | paste -s -d ' '` ENTER

  while pgrep java > /dev/null; do
    sleep 0.05
  done

  echo
  exit 0
}

trap 'close' SIGTERM

tmux new -d -s minecraft 'java -Dminecraft@`basename $PWD` -jar "$JAR_PATH" | tee /tmux.log'
tail -F /tmux.log 2> /dev/null &

tail -f /dev/null &
wait $!
