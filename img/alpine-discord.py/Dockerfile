FROM alpine:3.11.5

ARG PIP_DISABLE_PIP_VERSION_CHECK 1

COPY requirements.txt .

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		python3 \
		py3-multidict \
		py3-yarl \
	\
	&& pip3 install --upgrade --requirement requirements.txt \
	\
	&& python3 --version \
	&& pip3 list \
	\
	&& rm requirements.txt \
	&& rm -r /root/.cache/pip \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -print0 | xargs -0 rm \; \
	&& find /usr/lib/python* -type d -iname '__pycache__' -prune -print0 | xargs -0 rm -r \;

COPY run.sh /

CMD ["ash", "/run.sh"]
