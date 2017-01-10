FROM node:7-alpine

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

CMD [ "sinopia" ]
