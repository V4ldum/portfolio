#!/usr/bin/env bash

HOME="/root/portfolio"

cd "$HOME/portfolio"
git pull

BUILD_VERSION=$(git rev-parse HEAD)
echo "$(date --utc +%FT%TZ): Releasing new portfolio version : $BUILD_VERSION"

echo "$(date --utc +%FT%TZ): Running build..."
docker build -t portfolio .

echo "$(date --utc +%FT%TZ): Running container..."
cd /root
OLD_CONTAINER=$(docker ps -aqf "name=portfolio")

docker container rm -f $OLD_CONTAINER > /dev/null
docker compose up -d --no-deps --no-recreate portfolio