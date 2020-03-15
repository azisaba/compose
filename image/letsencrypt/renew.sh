#!/bin/ash

set -u
: $DOMAINS
: $DNS_CLOUDFLARE_CREDENTIALS
set +u

DOMAIN_CN=$(echo $DOMAINS | cut -d , -f 1)

if [ -f /etc/letsencrypt/renewal/$DOMAIN_CN.conf ]; then
  certbot renew \
    --dns-cloudflare \
    --dns-cloudflare-credentials $DNS_CLOUDFLARE_CREDENTIALS
else
  certbot certonly \
    --dns-cloudflare \
    --dns-cloudflare-credentials $DNS_CLOUDFLARE_CREDENTIALS \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --domains $DOMAINS
fi
