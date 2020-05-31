FROM alpine:3.12.0 as builder

COPY run.sh /
RUN chmod +x /run.sh

RUN wget https://raw.githubusercontent.com/AzisabaNetwork/docker-wrapper.sh/v1.1/docker-wrapper.sh
RUN chmod +x docker-wrapper.sh
RUN mv docker-wrapper.sh /usr/local/bin/wrapper

FROM alpine:3.12.0

COPY crontab /var/spool/cron/crontabs/root
COPY --from=builder /run.sh /
COPY --from=builder /usr/local/bin/wrapper /usr/local/bin

RUN apk --no-cache add tzdata libwebp-tools

ENTRYPOINT ["wrapper", "crond", "-f", "-L", "/dev/stderr"]
