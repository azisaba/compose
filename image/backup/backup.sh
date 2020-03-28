#!/bin/ash

set -u
: $RESTIC_PASSWORD_FILE
: $SFTP_PRIVATE_KEY
: $SFTP_HOSTS
set +u

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp $SFTP_PRIVATE_KEY ~/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519

echo $'Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile /dev/null' > ~/.ssh/config

for REPO in $(cat $SFTP_HOSTS); do
  export RESTIC_REPOSITORY=$REPO

  if ! restic stats 2> /dev/null; then
    restic init
  fi
done
