FROM adoptopenjdk/openjdk8-openj9:alpine

RUN apk add --no-cache tzdata
RUN set -ex \
        \
        && apk add --no-cache \
                tmux \
        \
        && tmux -V \
        && java -version

COPY launcher.sh /
CMD ["sh", "/launcher.sh"]
