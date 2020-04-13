FROM alpine:3.11.5

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		libwebp-tools \
	\
	&& cwebp -version \
	&& gif2webp -version

COPY run.sh /
COPY crontab /etc/crontabs/root

CMD ["crond", "-f"]
