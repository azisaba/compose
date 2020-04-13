FROM alpine:3.11.5

COPY requirements.txt .

RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		python3 \
		certbot \
	\
	&& pip3 install --upgrade --requirement requirements.txt \
	\
	&& python3 --version \
	&& pip3 list \
	&& certbot --version \
	&& certbot plugins \
	\
	&& rm requirements.txt \
	&& rm -r /root/.cache/pip \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -exec rm {} \; \
	&& find /usr/lib/python* -type d -iname '__pycache__' -prune -exec rm -r {} \; \
	&& rm -r /var/log/letsencrypt

COPY run-with-cron.sh /

CMD ["ash", "/run-with-cron.sh"]
