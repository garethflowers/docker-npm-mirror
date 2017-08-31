FROM node:8.4.0-alpine

RUN adduser -DH nodeuser \
    && npm update npm \
    && npm install --global sinopia2 \
    && mkdir -p /var/opt/sinopia \
    && chown nodeuser:nodeuser /var/opt/sinopia

COPY [ "./config.yaml", "/var/opt/sinopia" ]

WORKDIR /var/opt
USER nodeuser

VOLUME [ "/var/opt/sinopia" ]
EXPOSE 4873

HEALTHCHECK CMD wget --spider http://localhost:4873 || exit 1

CMD [ "sinopia" ]
