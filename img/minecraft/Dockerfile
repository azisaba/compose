FROM shipilev/openjdk-shenandoah:8 as jdk

RUN java -version

FROM alpine:3.11.6 as builder

COPY run.sh /
RUN chmod +x /run.sh

FROM frolvlad/alpine-glibc:alpine-3.11_glibc-2.31

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:/usr/glibc-compat/bin:$PATH
ENV MALLOC_ARENA_MAX 2

COPY --from=jdk /opt/jdk /opt/jdk
COPY --from=builder /run.sh /

RUN apk --no-cache add tzdata curl screen bash

ENTRYPOINT ["/run.sh"]
