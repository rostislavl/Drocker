#!/bin/bash
set -e

if [ ! -f /var/www/$DRUPAL_BASE_DIR/www/index.php ]; then

    # Install Drupal codebase
    drush make -y /var/www/drush.make /var/www/$DRUPAL_BASE_DIR/www
    chown -R www-data:www-data /var/www/$DRUPAL_BASE_DIR/www
    echo "=========================================================================="
    echo "Drupal codebase successfully installed in /var/www/$DRUPAL_BASE_DIR/www"
    echo "=========================================================================="

    # Install Drupal site
    #cd /var/www/$DRUPAL_BASE_DIR/www
    #drush site-install standard --account-name=admin --account-pass=admin --db-url=mysql://YourMySQLUser:RandomPassword@localhost/YourMySQLDatabase

fi

#/usr/bin/supervisord
php-fpm
