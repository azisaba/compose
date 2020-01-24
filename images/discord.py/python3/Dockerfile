FROM alpine:latest

RUN set -ex \
	\
	&& apk add --no-cache \
		tzdata \
		python3 \
		py3-multidict \
		py3-yarl \
	\
	&& pip3 install --upgrade \
		pip \
		discord.py \
	\
	&& python3 --version \
	&& pip3 list \
	\
	&& rm -rf /root/.cache/pip/* \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -delete \
	&& find /usr/lib/python* -type d -iname '__pycache__' -delete

CMD ["sh", "-c", "python3 -u $SCRIPT_PATH"]
