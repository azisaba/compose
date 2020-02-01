FROM alpine:3.11

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		python3 \
		py3-multidict \
		py3-yarl \
	\
	&& pip3 install --upgrade \
		pip==20.0.2 \
		discord.py==1.3.1 \
	\
	&& python3 --version \
	&& pip3 list \
	\
	&& rm -rf /root/.cache/pip/* \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -delete \
	&& find /usr/lib/python* -type d -iname '__pycache__' -delete

CMD ["sh", "-c", "python3 -u $SCRIPT_PATH"]
