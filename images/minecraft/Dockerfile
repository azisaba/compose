FROM frolvlad/alpine-glibc:alpine-3.11_glibc-2.30

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN set -ex \
	\
	&& ln -sfv /lib64/ld-linux-x86-64.so.2 /usr/glibc-compat/lib/ld-linux-x86-64.so.2 \
	\
	&& apk --no-cache --virtual .builddeps add \
		curl \
	\
	&& curl -fsS -o openjdk-shenandoah-jdk8.tar.xz https://builds.shipilev.net/openjdk-shenandoah-jdk8/openjdk-shenandoah-jdk8-latest-linux-x86_64-release.tar.xz \
	&& mkdir -pv /opt/jdk \
	&& tar -xJv -f openjdk-shenandoah-jdk8.tar.xz -C /opt/jdk --strip-components 1 \
	\
	&& apk --no-cache del \
		.builddeps \
	\
	&& apk --no-cache add \
		tzdata \
		tmux \
		coreutils \
		\
		sudo \
		iptables \
		ipset \
	\
	&& java -version \
	\
	&& rm -fv openjdk-shenandoah-jdk8.tar.xz \
	&& find /opt/jdk -type f -iname '*.log' -print0 | xargs -0 rm -fv
COPY launcher.sh /

CMD ["sh", "/launcher.sh"]
