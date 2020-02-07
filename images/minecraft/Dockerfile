FROM frolvlad/alpine-glibc:alpine-3.11_glibc-2.30

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH

RUN set -ex \
	\
	&& apk --no-cache --virtual .builddeps add \
		ca-certificates \
		wget \
	\
	&& wget -O openjdk-shenandoah-jdk8.tar.xz https://builds.shipilev.net/openjdk-shenandoah-jdk8/openjdk-shenandoah-jdk8-latest-linux-x86_64-release.tar.xz \
	&& mkdir -p /opt/jdk \
	&& tar -xJv -f openjdk-shenandoah-jdk8.tar.xz -C /opt/jdk --strip-components 1 \
	&& rm -f openjdk-shenandoah-jdk8.tar.xz \
	&& find /opt/jdk -type f -iname '*.log' -delete \
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
