FROM alpine:3.11

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		tmux \
		coreutils \
		openjdk8-jre \
		sudo \
		iptables \
		ipset \
	\
	&& tmux -V \
	&& java -version
COPY launcher.sh /

CMD ["sh", "/launcher.sh"]
