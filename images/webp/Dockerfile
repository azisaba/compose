FROM alpine:3.11.3

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		libwebp-tools \
	\
	&& cwebp -version \
	&& gif2webp -version
COPY convert.sh /

CMD ["sh", "/convert.sh"]
