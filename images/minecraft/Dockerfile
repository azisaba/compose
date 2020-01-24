FROM alpine:3

RUN set -ex \
	\
	&& apk add --no-cache \
		tzdata \
		tmux \
		coreutils \
		openjdk8-jre \
	\
	&& tmux -V \
	&& java -version
COPY launcher.sh /

CMD ["sh", "/launcher.sh"]
