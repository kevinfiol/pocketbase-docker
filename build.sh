#!/usr/bin/env bash

# for pi, use TARGETARCH=arm64
docker build --tag pocketbase --build-arg TARGETARCH=amd64 .
