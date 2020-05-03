FROM alpine:3.11.6

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		curl \
		screen \
		openjdk8-jre \
	\
	&& java -version

COPY run.sh /

CMD ["ash", "/run.sh"]
