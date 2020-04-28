FROM alpine:3.11.6

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		libwebp-tools \
	\
	&& cwebp -version \
	&& gif2webp -version

COPY run.sh /
COPY run-with-cron.sh /

CMD ["ash", "/run-with-cron.sh"]
