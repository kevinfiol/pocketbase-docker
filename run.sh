#!/usr/bin/env bash

POCKETBASE_PORT="${POCKETBASE_PORT:-8090}"
DATA_DIR="$(pwd)/pb_data"
PUBLIC_DIR="$(pwd)/pb_public"

if [ ! -d $DATA_DIR ]; then
    mkdir $DATA_DIR
fi

if [ ! -d $PUBLIC_DIR ]; then
    mkdir $PUBLIC_DIR
fi

docker run --detach \
    --name=pocketbase \
    --publish 8090:8090 \
    --restart unless-stopped \
    --mount type=bind,source=$DATA_DIR,target=/pb_data \
    --mount type=bind,source=$PUBLIC_DIR,target=/pb_public \
    pocketbase