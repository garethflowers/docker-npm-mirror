FROM node:11.3.0-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.docker.cmd="docker run --detach --publish 4873:4873 --volume $PWD:/var/opt/verdaccio garethflowers/npm-mirror" \
	org.label-schema.description="NPM Mirror" \
	org.label-schema.name="npm-mirror" \
	org.label-schema.schema-version="1.0" \
	org.label-schema.url="https://www.verdaccio.org" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.vcs-url="https://github.com/garethflowers/docker-npm-mirror" \
	org.label-schema.vendor="garethflowers" \
	org.label-schema.version="1.1.4"

CMD [ "su-exec", "node", "verdaccio" ]
ENTRYPOINT [ "/opt/docker/entrypoint.sh" ]
EXPOSE 4873
HEALTHCHECK CMD netstat -ln | grep 4873 || exit 1
VOLUME [ "/var/opt/verdaccio" ]
WORKDIR /var/opt/verdaccio

RUN apk add --no-cache --virtual .build-deps \
	make \
	python \
	&& npm --global config set user root \
	&& npm --global install verdaccio@3.11.6 \
	&& npm --global config set user node \
	&& apk del .build-deps \
	&& apk add su-exec

COPY [ "src/entrypoint.sh", "/opt/docker/entrypoint.sh" ]
COPY [ "src/config.yaml", "/var/opt/verdaccio" ]
