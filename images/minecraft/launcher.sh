#!/bin/ash

if [ ! -z $JAR_DOWNLOAD_URL ]; then
  SIZE=$(wget -qS --spider $JAR_DOWNLOAD_URL 2> /dev/stdout | grep -i Content-Length | awk '{ print $2 }')

  if [ ! -f $JAR_PATH ] || [[ $SIZE != $(stat -c %s $JAR_PATH) ]]; then
    wget -O $JAR_PATH $JAR_DOWNLOAD_URL
  fi
fi

if [ $(echo $(cat /proc/uptime | cut -d ' ' -f 1) / 1 | bc) -lt $(( 5 * 60 )) ]; then
  sleep $(shuf -n 1 -i 30-$(( 2 * 60 )))
fi

if [ $(echo $(cat /proc/loadavg | cut -d ' ' -f 1) / 1 | bc) -ge $(( $(nproc --all) / 4 )) ]; then
  sleep $(shuf -n 1 -i 30-$(( 2 * 60 )))
fi

rm -f screenlog.*
tail -F screenlog.0 2> /dev/null &

exec screen -ADmSL minecraft java $JVM_ARGS -jar $JAR_PATH
