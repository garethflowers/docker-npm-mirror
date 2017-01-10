# NPM Mirror Server

A NPM Mirror server, using `sonopia`.

## How to use this image

### Start a NPM Mirror Server instance

To start a container, with data stored in /home/storage on the host, use the
following:
```sh
docker run --name some-npm-mirror-server \
           --detach \
           --volume /home/storage:/var/opt/sinopia \
           --publish 2000:2000 \
           garethflowers/npm-mirror
```

## License

* This image is released under the [MIT License][1]

 [1]: https://raw.githubusercontent.com/garethflowers/npm-mirror/master/LICENSE
