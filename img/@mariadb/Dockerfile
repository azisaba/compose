FROM jbergstroem/mariadb-alpine:10.4.12
USER root
RUN set -ex \
	&& apk --no-cache add tzdata \
	&& sed -i 's,\(/usr/bin/mysqld\),exec \1,g' /run.sh
USER mysql
