#!/bin/ash

set -eu

if [[ $USER != root ]]; then
  echo 'エラー: root権限で実行してください。'
  return
fi

apk --no-cache --virtual .builddeps add parallel

chmod -c 666 /opt/resourcepacks/*.zip
setfacl -d -m u::rwX,g::rwX,o::rwX /opt/resourcepacks

parallel -v -j 1 'addgroup -S {/} || :' ::: /opt/minecraft/*
parallel -v 'find {} -type d -print0 | xargs -0 chmod -c g+s' ::: /opt/minecraft/*
parallel -v 'chgrp -Rc {/} {}' ::: /opt/minecraft/*
parallel -v 'chmod -c o-rwx {}' ::: /opt/minecraft/*
parallel -v 'chmod -Rc g+w {}' ::: /opt/minecraft/*
parallel -v 'find {} -type d -print0 | xargs -0 setfacl -d -m u::rwX,g::rwX,o::rX' ::: /opt/minecraft/*

chmod -c 700 /srv/discord/logger
chmod -c 700 /srv/discord/support

chmod -c 600 /srv/secrets/wordpress.txt
chmod -c 600 /srv/secrets/dns-cloudflare.txt

apk --no-cache del .builddeps
