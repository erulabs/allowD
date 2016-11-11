#!/bin/bash

if ! [ -x "$(command -v jq)" ]; then
  echo "Please install 'jq' - brew install jq, apt install jq..."; exit 1
elif ! [ -x "$(command -v yarn)" ]; then
  echo "Please install 'yarn' - sudo npm install -g yarn"; exit 1
elif ! [ -f "package.json" ]; then
  echo "This script needs to be run from the root of the repository"; exit 1
fi
if ! [ -d "node_modules" ]; then
  yarn
fi

export NODE_ENV=development


COMPOSE_CMD="docker-compose up -d --remove-orphans"
${COMPOSE_CMD} redis statsd > /dev/null

. ./bin/find_compose_services.sh

set -x

REDIS_URIS="${DOCKER_SRV}:${REDIS_PORT}" \
STATSD_URIS="${DOCKER_SRV}:${STATSD_PORT}" \
./node_modules/.bin/gulp watch
