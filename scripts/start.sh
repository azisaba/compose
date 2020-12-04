#!/bin/bash

set -e

docker-compose build
docker-compose up -d --scale azisaba-bungee=5
