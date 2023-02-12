#!/bin/sh
set -xe
export IMAGE_NAME=garethflowers/npm-mirror

docker build --tag $IMAGE_NAME .
docker run --publish 4873:4873 --rm $IMAGE_NAME verdaccio --version

echo "\nOK"
