FROM alpine:3.12.0 as builder

COPY run.sh /
RUN chmod +x /run.sh

RUN wget https://raw.githubusercontent.com/AzisabaNetwork/docker-wrapper.sh/v1.1/docker-wrapper.sh
RUN chmod +x docker-wrapper.sh
RUN mv docker-wrapper.sh /usr/local/bin/wrapper

FROM alpine:3.12.0

COPY requirements.txt .
COPY crontab /var/spool/cron/crontabs/root
COPY --from=builder /run.sh /
COPY --from=builder /usr/local/bin/wrapper /usr/local/bin

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN set -ex \
	&& apk --no-cache add tzdata python3 py3-cryptography \
	&& export PIP_DISABLE_PIP_VERSION_CHECK=1 \
	&& pip3 --no-cache-dir install --requirement requirements.txt \
	&& rm requirements.txt \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -print0 | xargs -0 rm \
	&& find /usr/lib/python* -type d -iname '__pycache__' -prune -print0 | xargs -0 rm -r

ENTRYPOINT ["wrapper", "crond", "-f", "-L", "/dev/stderr"]
