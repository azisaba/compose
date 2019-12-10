#!/bin/bash

set -eux

docker-compose down --remove-orphans
docker-compose up -d
