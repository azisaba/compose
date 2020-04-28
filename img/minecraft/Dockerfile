FROM shipilev/openjdk-shenandoah:8 as jdk

FROM frolvlad/alpine-glibc:alpine-3.11_glibc-2.31

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:/usr/glibc-compat/bin:$PATH
ENV MALLOC_ARENA_MAX 2

COPY --from=jdk /opt/jdk /opt/jdk

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		curl \
		screen \
	\
	&& java -version

COPY run.sh /

CMD ["ash", "/run.sh"]
