FROM jbergstroem/mariadb-alpine:10.4.12

USER root

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata

USER mysql
