FROM alpine:3.11.3

ENV LANG C.UTF_8
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
	&& GLIBC_VERSION='2.30-r0' \
	\
	&& wget \
		https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-$GLIBC_VERSION.apk \
		https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-bin-$GLIBC_VERSION.apk \
		https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-i18n-$GLIBC_VERSION.apk \
	&& wget -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	\
	&& apk --no-cache add \
		glibc-$GLIBC_VERSION.apk \
	\
	&& apk --no-cache --virtual .locale-builddeps add \
		glibc-bin-$GLIBC_VERSION.apk \
		glibc-i18n-$GLIBC_VERSION.apk \
	\
	&& /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 $LANG || true \
	\
	&& rm -f \
		glibc-$GLIBC_VERSION.apk \
		glibc-bin-$GLIBC_VERSION.apk \
		glibc-i18n-$GLIBC_VERSION.apk \
	&& rm -f /etc/apk/keys/sgerrand.rsa.pub \
	\
	&& apk --no-cache del \
		.builddeps \
		.locale-builddeps \
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
