FROM alpine:3.11.6 as builder
COPY run.sh /
COPY run-with-cron.sh /
RUN set -ex && chmod +x /*.sh

FROM alpine:3.11.6
RUN set -ex && apk --no-cache add tzdata restic openssh-client mariadb-client
COPY --from=builder /*.sh /
ENTRYPOINT ["/run-with-cron.sh"]
