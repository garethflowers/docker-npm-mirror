# NPM Mirror

[![Build Status](https://travis-ci.org/garethflowers/npm-mirror.svg?branch=master)](https://travis-ci.org/garethflowers/npm-mirror)
[![Image Layers](https://images.microbadger.com/badges/image/garethflowers/npm-mirror.svg)](https://microbadger.com/images/garethflowers/npm-mirror)
[![Docker Pulls](https://img.shields.io/docker/pulls/garethflowers/npm-mirror.svg)](https://store.docker.com/community/images/garethflowers/npm-mirror)

A NPM Mirror server, using `verdaccio`.

## How to use this image

### Start a NPM Mirror Server instance

To start a container, with data stored in /home/storage on the host, use the
following:
```sh
docker run
	--name some-npm-mirror-server \
	--detach \
	--volume /home/storage:/var/opt/verdaccio \
	--publish 4873:4873 \
	garethflowers/npm-mirror
```

## License

*	This image is released under the [MIT License](https://raw.githubusercontent.com/garethflowers/npm-mirror/master/LICENSE).
