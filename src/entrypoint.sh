#!/bin/sh

set -e
export PS1="\h \w \$ "

exec "$@"
