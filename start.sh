#!/bin/bash
if [ ! -d "glpi" ]; then
  curl -o /tmp/glpi.tgz -L https://github.com/glpi-project/glpi/releases/download/$GLPI_VERSION/glpi-$GLPI_VERSION.tgz
  tar xvf /tmp/glpi.tgz
  shopt -s dotglob
  mv glpi/* .
fi
apache2-foreground
