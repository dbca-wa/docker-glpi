FROM php:7-apache
ENV GLPI_VERSION "9.5.1"

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN install-php-extensions gd mysqli intl xmlrpc apcu

ADD https://github.com/glpi-project/glpi/releases/download/$GLPI_VERSION/glpi-$GLPI_VERSION.tgz /var/www/html
RUN tar xvf glpi-$GLPI_VERSION.tgz; rm glpi-$GLPI_VERSION.tgz
