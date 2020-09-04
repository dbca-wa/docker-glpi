FROM php:7-apache
ENV GLPI_VERSION "9.5.1"

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/
RUN install-php-extensions gd mysqli intl xmlrpc apcu

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

ENTRYPOINT ["start.sh"]
CMD ["apache2-foreground"]
