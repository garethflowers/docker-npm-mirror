FROM node:9.8.0-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.docker.cmd="docker run -d -p 4873:4873 -v $PWD:/var/opt/verdaccio garethflowers/npm-mirror" \
	org.label-schema.description="NPM Mirror" \
	org.label-schema.name="npm-mirror" \
	org.label-schema.schema-version="1.0" \
	org.label-schema.url="https://www.verdaccio.org" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vcs-url="https://github.com/garethflowers/docker-npm-mirror" \
	org.label-schema.vendor="garethflowers" \
	org.label-schema.version="0.0.1"

CMD [ "verdaccio" ]
EXPOSE 4873
HEALTHCHECK CMD netstat -ln | grep 4873 || exit 1
VOLUME [ "/var/opt/verdaccio" ]
WORKDIR "/var/opt/verdaccio"

RUN apk add --no-cache --virtual .build-deps \
	make \
	python \
	&& npm install verdaccio \
	&& apk del .build-deps \
	&& chown node:node /var/opt/verdaccio

USER node

COPY [ "config.yaml", "/var/opt/verdaccio" ]
