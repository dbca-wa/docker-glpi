# docker-glpi
GLPI ITSM Software built with docker

To use, persist /var/www/html (will be extracted to on first run) and expose port 80. Then use GLPI installer (`/install/install.php`) to point to a separate database. Note .htaccess should be updated for security after install.
