#!/bin/ash

(
  set -u
  : "$RESTIC_PASSWORD_FILE" "$SFTP_PRIVATE_KEY" "$SFTP_HOSTS"
)

mkdir -m 700 ~/.ssh

touch ~/.ssh/id_ed25519
chmod 600 "$_"
cp "$SFTP_PRIVATE_KEY" "$_"

cat << EOT > ~/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
  LogLevel ERROR
EOT

cat << EOT > ~/.my.cnf
[mysqldump]
host = $DB_HOST
user = $DB_USER
password = $(cat "$DB_PASSWORD_FILE")
EOT

while IFS= read -r REPO; do
  export RESTIC_REPOSITORY=$REPO

  if ! restic snapshots > /dev/null; then
    restic init
  fi

  mysqldump \
    --quote-names \
    --quick \
    --all-databases \
    --verbose \
    --order-by-primary \
    --ignore-database=mysql \
    --ignore-database=information_schema \
    --ignore-database=performance_schema \
  > dump.sql

  find . -mindepth 1 -maxdepth 1 | while IFS= read -r TARGET; do
    restic backup "$TARGET"
  done
done < "$SFTP_HOSTS"
