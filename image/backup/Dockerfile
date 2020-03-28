FROM alpine:3.11.5

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		restic \
		openssh-client \
	\
	&& restic version

COPY backup.sh /

CMD ["ash", "/backup.sh"]
