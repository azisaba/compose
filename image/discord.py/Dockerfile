FROM alpine:3.11.3

COPY requirements.txt .

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
	&& find /usr/lib/python* -type f -iname '*.py[co]' -exec rm {} \; \
	&& find /usr/lib/python* -type d -iname '__pycache__' -prune -exec rm -r {} \;

COPY run.sh /

CMD ["ash", "/run.sh"]
