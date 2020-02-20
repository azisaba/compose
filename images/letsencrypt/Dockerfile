FROM alpine:3.11.3

COPY requirements.txt .
SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN set -ex \
	\
	&& apk --no-cache add \
		tzdata \
		python3 \
		certbot \
	\
	&& pip3 install --upgrade \
		-r requirements.txt \
	\
	&& python3 --version \
	&& pip3 list \
	&& certbot --version \
	&& certbot plugins \
	\
	&& rm -fv requirements.txt \
	&& rm -rfv /root/.cache/pip \
	&& find /usr/lib/python* -type f -iname '*.py[co]' -print0 | xargs -0 rm -fv \
	&& find /usr/lib/python* -type d -iname '__pycache__' -print0 | xargs -0 rm -rfv \
	&& rm -rfv /var/log/letsencrypt
COPY renew.sh /

CMD ["ash", "/renew.sh"]
