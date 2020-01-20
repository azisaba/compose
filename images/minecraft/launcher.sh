#!/bin/sh

close() {
  tmux send -t minecraft ENTER `echo "$STOP_CMD" | fold -w 1 | paste -s -d ' '` ENTER
}
trap 'close' SIGTERM

tmux new -d -s minecraft java -Dminecraft@`basename $PWD` -jar "$JAR_PATH"

while true
do
  sleep 0.05
done
