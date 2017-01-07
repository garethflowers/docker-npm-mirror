# NPM Mirror Server

A NPM Mirror server, using `npm-lazy-mirror`.

## How to use this image

### Start a NPM Mirror Server instance

To start a container, with data stored in /home/npmdata on the host, use the
following:
```sh
docker run --name some-npm-mirror-server \
           --detach \
           --volume /home/npmdata:/var/opt/npm-lazy-mirror \
           --publish 2000:2000 \
           garethflowers/npm-mirror
```

## License

* NPM Lazy Mirror is released under the [MIT License][1]
* This image is released under the [MIT License][2]

 [1]: https://github.com/hpcloud/npm-lazy-mirror/blob/master/LICENSE.txt
 [2]: https://raw.githubusercontent.com/garethflowers/docker-svn-server/master/LICENSE
