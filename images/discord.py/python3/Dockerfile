FROM alpine:3.10

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata=2019c-r0 \
		python3=3.7.5-r1 \
		py3-multidict=4.5.2-r1 \
		py3-yarl=1.3.0-r1 \
	\
	&& pip3 install --upgrade \
		pip==20.0.2 \
		discord.py==1.2.5 \
	\
	&& python3 --version \
	&& pip3 list \
	\
	&& rm -rf /root/.cache/pip/* \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -delete \
	&& find /usr/lib/python* -type d -iname '__pycache__' -delete

CMD ["sh", "-c", "python3 -u $SCRIPT_PATH"]
