# NPM Mirror

An NPM mirror registry server, using `verdaccio`.

## How to use this image

### Start a NPM Mirror Server instance

To start a container, with data stored in `/home/storage` on the host, use the
following:
```sh
docker run
	--name my-npm-mirror \
	--detach \
	--volume /home/storage:/var/opt/verdaccio \
	--publish 4873:4873 \
	garethflowers/npm-mirror
```

## License

*	This image is released under the [MIT License](https://raw.githubusercontent.com/garethflowers/npm-mirror/master/LICENSE).
