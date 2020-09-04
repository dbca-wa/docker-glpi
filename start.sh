#!/bin/bash
set -e
shopt -s dotglob

# Download and extract glpi unless index.php exists
# To overwrite/upgrade existing install rename index.php in your persistent dir
if [ ! -f "index.php" ]; then
  curl -o /tmp/glpi.tgz -L https://github.com/glpi-project/glpi/releases/download/$GLPI_VERSION/glpi-$GLPI_VERSION.tgz
  tar xvf /tmp/glpi.tgz; rm /tmp/glpi.tgz
  mv -v glpi/* .; rmdir glpi
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- apache2-foreground "$@"
fi
exec "$@"
