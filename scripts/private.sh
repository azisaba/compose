#!/bin/bash

set -e

docker run -it -d --restart=always --name parkour -v /srv/parkour:/app -w /app \
  -p 50001:25565 openjdk:13 java -jar paper-1.13.2.jar

docker run -it -d --restart=always --name rzh -v /srv/rzh:/app -w /app \
  -p 50003:25565 openjdk:15 java -jar paper-1.12.2.jar

docker run -it -d --restart=always --name pvp -v /srv/pvp:/app -w /app \
  -p 50004:25565 openjdk:8 java -jar paper-1.8.8.jar

docker run -it -d --restart=always --name chibi -v /srv/chibi:/app -w /app \
  -p 50005:25565 openjdk:14 java -jar paper-1.15.2.jar

docker run -it -d --restart=always --name afk -v /srv/afk:/app -w /app \
  -p 50006:25565 openjdk:8 java -jar paper-1.8.8.jar

docker run -it -d --restart=always --name fsw -v /srv/fsw:/app -w /app \
  -p 50007:25565 openjdk:15 java -jar paper-1.12.2.jar

docker run -it -d --restart=always --name lgwf -v /srv/lgwf:/app -w /app \
  -p 50008:25565 openjdk:13 java -jar paper-1.14.4.jar

docker run -it -d --restart=always --name coretol -v /srv/coretol:/app -w /app \
  -p 50009:25565 openjdk:14 java -jar paper-1.15.2.jar

docker run -it -d --restart=always --name mksrv -v /srv/mksrv:/app -w /app \
  -p 50010:25565 openjdk:15 java -jar paper-1.16.3.jar

docker run -it -d --restart=always --name lifebuild -v /srv/lifebuild:/app -w /app \
  -p 50011:25565 openjdk:14 java -jar paper-1.15.2.jar

docker run -it -d --restart=always --name mts -v /srv/mts:/app -w /app \
  -p 50012:25565 openjdk:14 java -jar paper-1.15.2.jar

docker run -it -d --restart=always --name conquest -v /srv/conquest:/app -w /app \
  -p 50013:25565 openjdk:13 java -jar paper-1.14.4.jar
