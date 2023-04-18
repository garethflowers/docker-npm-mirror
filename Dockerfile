FROM node:19.9.0-alpine

CMD [ "node", "verdaccio" ]
ENTRYPOINT [ "/opt/docker/entrypoint.sh" ]
EXPOSE 4873
HEALTHCHECK CMD netstat -ln | grep 4873 || exit 1
VOLUME [ "/var/opt/verdaccio" ]
WORKDIR /var/opt/verdaccio

COPY [ "src/entrypoint.sh", "/opt/docker/entrypoint.sh" ]
COPY [ "src/config.yaml", "/var/opt/verdaccio" ]

RUN npm --global install verdaccio@5.20.1 \
	&& chown -R node:node /var/opt/verdaccio \
	&& chmod -R 700 /var/opt/verdaccio

USER node
