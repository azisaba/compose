FROM alpine:3.11.3

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH
RUN set -ex \
	\
	&& apk --no-cache --virtual .builddeps add \
		curl \
	\
	&& curl -s -o openjdk-shenandoah-jdk8.tar.xz https://builds.shipilev.net/openjdk-shenandoah-jdk8/openjdk-shenandoah-jdk8-latest-linux-x86_64-release.tar.xz \
	&& mkdir -p /opt/jdk \
	&& tar -xJ -f openjdk-shenandoah-jdk8.tar.xz -C /opt/jdk --strip-components 1 \
	&& rm -f openjdk-shenandoah-jdk8.tar.xz \
	&& find /opt/jdk -type f -iname '*.log' -delete \
	\
	&& curl -sL -o glibc-2.30-r0.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk \
	&& curl -s -o /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	\
	&& apk --no-cache add \
		glibc-2.30-r0.apk \
	\
	&& rm -f glibc-2.30-r0.apk \
	\
	&& apk --no-cache del \
		.builddeps \
	\
	&& apk --no-cache add \
		tzdata \
		tmux \
		coreutils \
		sudo \
		iptables \
		ipset \
	\
	&& tmux -V \
	&& java -version
COPY launcher.sh /

CMD ["sh", "/launcher.sh"]
