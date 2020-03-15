FROM alpine:3.11.3

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		curl \
		screen \
		openjdk8-jre \
	\
	&& java -version

COPY launcher.sh /

CMD ["ash", "/launcher.sh"]
