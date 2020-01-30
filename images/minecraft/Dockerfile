FROM alpine:3.11

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata=2019c-r0 \
		tmux=3.0a-r0 \
		coreutils=8.31-r0 \
		openjdk8-jre=8.242.08-r0 \
		sudo=1.8.29-r0 \
		iptables=1.8.3-r1 \
		ipset=7.4-r0 \
	\
	&& tmux -V \
	&& java -version
COPY launcher.sh /

CMD ["sh", "/launcher.sh"]
