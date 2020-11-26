FROM alpine:3.12 as base

ARG JAVA_VERSION

RUN set -e \
	&& echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
	&& echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add --no-cache \
		bash \
		coreutils \
		libstdc++ \
		screen \
	&& ( apk add --no-cache openjdk"$JAVA_VERSION"-jre-headless \
		|| apk add --no-cache openjdk"$JAVA_VERSION"-jre )

FROM base as builder

ARG SOFTWARE_URL
ARG SOFTWARE_PORT
ARG SOFTWARE_STOP_COMMAND
ARG SOFTWARE_LOG_FILE
ARG SOFTWARE_EULA

WORKDIR /build

COPY . /

RUN apk add --no-cache \
	moreutils \
	parallel \
	wait4ports \
	yq

RUN wget -O server.jar "$SOFTWARE_URL"

RUN cp -aTv /libs .

RUN if [ -n "$SOFTWARE_EULA" ]; then echo 'eula=true' > eula.txt; fi

RUN printf \
	'#!/bin/bash\n\
	_stop() {\n\
	  screen -X stuff "%s\n"\n\
	  tail --pid="$(pgrep screen)" -f /dev/null\n\
	  exit 0\n\
	}\n\
	screen -dm -- java -jar server.jar\n\
	trap "_stop" TERM INT\n\
	tail --pid="$(pidof -s screen)" -n 0 -F %s &\n\
	wait $!\n\
	' "$SOFTWARE_STOP_COMMAND" "$SOFTWARE_LOG_FILE" > launcher.sh

RUN set -e \
	&& bash launcher.sh & : \
	&& wait4ports -s 1 tcp://localhost:"$SOFTWARE_PORT" \
	&& kill -15 "$(jobs -p)" \
	&& wait "$(jobs -p)"

RUN cp -aTv /assets .

WORKDIR /parts

RUN find . -type f -iname '*.yml' -or -iname '*.yaml' > yaml.txt
RUN find . -type f -iname '*.properties' > prop.txt

WORKDIR /build

RUN parallel -a /parts/yaml.txt -v 'yq m -x {} /parts/{} | sponge {}'
RUN parallel -a /parts/prop.txt -v 'awk -F = "!a[$1]++" /parts/{} {} | sponge {}'

FROM base

WORKDIR /app

COPY --from=builder /build /app

CMD ["bash", "launcher.sh"]
