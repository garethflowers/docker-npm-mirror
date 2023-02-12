#!/bin/sh
set -xe
export IMAGE_NAME=garethflowers/npm-mirror

docker build --tag $IMAGE_NAME .
docker run --rm $IMAGE_NAME verdaccio --version

echo "\nOK"
