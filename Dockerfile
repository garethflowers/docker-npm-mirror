FROM node:8.4.0-alpine

CMD [ "sinopia" ]
EXPOSE 4873
HEALTHCHECK CMD netstat -ln | grep 4873 || exit 1
VOLUME [ "/var/opt/sinopia" ]
WORKDIR /var/opt/sinopia

RUN adduser -DH nodeuser \
    && npm update npm \
    && npm install --global sinopia2 \
    && chown nodeuser:nodeuser /var/opt/sinopia

USER nodeuser

COPY [ "./config.yaml", "/var/opt/sinopia" ]
