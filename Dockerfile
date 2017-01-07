FROM node:7-alpine

RUN npm install -g npm-lazy-mirror

WORKDIR /var/opt/npm-lazy-mirror

COPY [ "config.json", "/var/opt/npm-lazy-mirror/config.json" ]

VOLUME [ "/var/opt/npm-lazy-mirror" ]
EXPOSE 2000

CMD [ "node", "/usr/local/lib/node_modules/npm-lazy-mirror/server.js", "-C", "/var/opt/npm-lazy-mirror/config.json" ]
