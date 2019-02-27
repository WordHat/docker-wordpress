#!/bin/bash
set -e

echo "[info] System information $(uname -a)"
mkdir -p /var/www/html/wp-content/{uploads,upgrade,languages}

# Set www-data's user ID.
if [ ! -z "${PUID}" ]; then
    echo "[info] PUID defined as '${PUID}'"
    # set user www-data to specified user id (non unique)
    usermod -o -u "${PUID}" www-data &>/dev/null
fi

# Set www-data's group ID.
if [ ! -z "${PGID}" ]; then
    echo "[info] PGID defined as '${PGID}'"
    # set group www-data to specified group id (non unique)
    groupmod -o -g "${PGID}" www-data &>/dev/null
fi

chown -R www-data:www-data /var/www/html/wp-content/{uploads,upgrade,languages}

# WordPress image
bash /usr/local/bin/docker-entrypoint.sh apache2-foreground

exec "$@"
