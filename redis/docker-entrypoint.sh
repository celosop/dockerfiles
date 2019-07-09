#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
    set -- redis-server "$@"
fi

# change to redis user to run
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
    echo "redis -s /bin/bash -c \"$0 $@\"" | xargs su
fi

exec "$@"
