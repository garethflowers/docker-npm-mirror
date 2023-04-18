#!/bin/sh
set -xe
export IMAGE_NAME=garethflowers/npm-mirror

docker build --no-cache --progress plain --tag $IMAGE_NAME .
docker run --rm $IMAGE_NAME verdaccio --version

echo "\nOK"
