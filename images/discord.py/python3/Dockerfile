FROM alpine:latest

RUN apk add --no-cache tzdata
RUN set -ex \
	\
	&& apk add --no-cache \
		python3 \
		py3-multidict \
		py3-yarl \
	\
	&& pip3 --no-cache-dir install --upgrade pip \
	&& pip3 --no-cache-dir install --upgrade \
		discord.py \
	&& python3 --version

CMD ["sh", "-c", "python3 -u $SCRIPT_PATH"]
