#!/bin/ash

(
  set -u
  : $RESTIC_PASSWORD_FILE $SFTP_PRIVATE_KEY $SFTP_HOSTS
)

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp $SFTP_PRIVATE_KEY ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

echo $'Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile /dev/null\n\tLogLevel ERROR' > ~/.ssh/config

for REPO in $(cat $SFTP_HOSTS); do
  export RESTIC_REPOSITORY=$REPO

  if ! restic snapshots > /dev/null; then
    restic init
  fi

  for TARGET in $(find . -mindepth 1 -maxdepth 1); do
    restic backup $TARGET
  done
done
