FROM alpine:3.10

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata=2019c-r0 \
		tmux=2.9a-r0 \
		coreutils=8.31-r0 \
		openjdk8-jre=8.222.10-r0 \
	\
	&& tmux -V \
	&& java -version
COPY launcher.sh /

CMD ["sh", "/launcher.sh"]
