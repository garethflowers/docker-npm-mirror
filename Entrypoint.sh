#!/bin/sh

set -e
export PS1="\h \w \$ "

chown -R node:node /var/opt/verdaccio
chmod -R 700 /var/opt/verdaccio

exec "$@"
