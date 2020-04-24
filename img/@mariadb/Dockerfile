FROM jbergstroem/mariadb-alpine:10.4.12

USER root

RUN set -ex \
	\
	&& sed -i 's,\(/usr/bin/mysqld\),exec \1,g' /run.sh \
	\
	&& apk --no-cache add tzdata

USER mysql
