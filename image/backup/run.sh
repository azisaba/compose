#!/bin/ash

(
  set -u
  : "$RESTIC_PASSWORD_FILE" "$SFTP_PRIVATE_KEY" "$SFTP_HOSTS"
)

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp "$SFTP_PRIVATE_KEY" ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

cat <<EOT > ~/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile /dev/null
  LogLevel ERROR
EOT

cat "$SFTP_HOSTS" | while IFS= read -r REPO; do
  export RESTIC_REPOSITORY=$REPO

  if ! restic snapshots > /dev/null; then
    restic init
  fi

  find . -mindepth 1 -maxdepth 1 | while IFS= read -r TARGET; do
    restic backup "$TARGET"
  done
done
