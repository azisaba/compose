#!/bin/ash

close() {
  kill -2 $(pgrep java)
  while pgrep java > /dev/null; do
    sleep 1
  done
  exit 0
}

trap 'close' SIGHUP

if [ ! -z $JAR_DOWNLOAD_URL ]; then
  SIZE=$(curl -fsSI $JAR_DOWNLOAD_URL | grep -i Content-Length | awk '{ print $2 }')

  if [ ! -z $SIZE ]; then
    if [ ! -f $JAR_PATH ] || [[ $SIZE != $(stat -c %s $JAR_PATH) ]]; then
      wget -O $JAR_PATH $JAR_DOWNLOAD_URL
    fi
  fi
fi

if [ $(echo $(cat /proc/uptime | cut -d ' ' -f 1) / 1 | bc) -lt $(( 5 * 60 )) ]; then
  sleep $(shuf -n 1 -i 30-$(( 2 * 60 )))
fi

if [ $(echo $(cat /proc/loadavg | cut -d ' ' -f 1) / 1 | bc) -ge $(( $(nproc --all) / 4 )) ]; then
  sleep $(shuf -n 1 -i 30-$(( 2 * 60 )))
fi

tail -n 0 -F ./proxy.log.0 ./logs/latest.log 2> /dev/null &

screen -ADmS minecraft java $JVM_ARGS -jar $JAR_PATH &
wait $!
