FROM alpine:3.11.5

ENV LANG C.UTF-8
ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:/usr/glibc-compat/bin:$PATH
ENV MALLOC_ARENA_MAX 2

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		curl \
		screen \
	\
	&& wget --output-document /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& wget \
		https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk \
		https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-bin-2.31-r0.apk \
		https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-i18n-2.31-r0.apk \
	&& apk --no-cache add glibc-*.apk \
	&& localedef --inputfile POSIX --charmap UTF-8 "$LANG" || : \
	&& apk --no-cache del glibc-i18n \
	\
	&& wget --output-document openjdk-shenandoah-jdk8.tar.xz https://builds.shipilev.net/openjdk-shenandoah-jdk8/openjdk-shenandoah-jdk8-latest-linux-x86_64-release.tar.xz \
	&& mkdir /opt/jdk \
	&& tar --extract --xz --file openjdk-shenandoah-jdk8.tar.xz --directory /opt/jdk --strip-components 1 \
	\
	&& java -version \
	\
	&& rm /etc/apk/keys/sgerrand.rsa.pub \
	&& rm glibc-*.apk \
	&& rm openjdk-shenandoah-jdk8.tar.xz \
	&& rm /opt/jdk/*.log \
	\
	&& find /opt/jdk -type f -exec chmod -x {} \; \
	&& chmod +x /opt/jdk/bin/* \
	&& chmod +x /opt/jdk/jre/bin/*

COPY run.sh /

CMD ["ash", "/run.sh"]
