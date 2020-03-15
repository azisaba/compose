#!/bin/ash

echo RESOLVER:
cat /etc/resolv.conf

echo CREDENTIALS:
cat $DNS_CLOUDFLARE_CREDENTIALS

echo DOMAINS: $DOMAINS
echo DOMAIN_CN: $(echo $DOMAINS | cut -d , -f 1)

if [ -f /etc/letsencrypt/renewal/$(echo $DOMAINS | cut -d , -f 1).conf ]; then
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
