FROM alpine:3.12.0

COPY requirements.txt .

# SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN set -ex \
	&& apk --no-cache add tzdata python3 py3-multidict py3-yarl \
	&& export PIP_DISABLE_PIP_VERSION_CHECK=1 \
	&& pip3 --no-cache-dir install --upgrade --requirement requirements.txt \
	&& rm requirements.txt
	# See AzisabaNetwork/azifry#39
	# && find /usr/lib/python* -type f -iname '*.py[co]' -print0 | xargs -0 rm \
	# && find /usr/lib/python* -type d -iname '__pycache__' -prune -print0 | xargs -0 rm -r

ENTRYPOINT ["python3"]
