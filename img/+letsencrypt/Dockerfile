FROM alpine:3.11.6 as builder
COPY run.sh /
COPY run-with-cron.sh /
RUN chmod +x /*.sh

FROM alpine:3.11.6
COPY requirements.txt .
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN set -ex \
	&& apk --no-cache add tzdata python3 py3-cryptography \
	&& export PIP_DISABLE_PIP_VERSION_CHECK=1 \
	&& pip3 --no-cache-dir install --requirement requirements.txt \
	&& rm requirements.txt \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -print0 | xargs -0 rm \
	&& find /usr/lib/python* -type d -iname '__pycache__' -prune -print0 | xargs -0 rm -r
COPY --from=builder /*.sh /
ENTRYPOINT ["/run-with-cron.sh"]
