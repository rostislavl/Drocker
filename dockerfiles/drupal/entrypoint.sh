#!/bin/bash

#if [ ! -f /var/lib/mysql/ibdata1 ]; then

# Install Drupal.
    drush make -y /var/www/drush.make /var/www/default/www
    chown -R www-data:www-data /var/www/default/www
    echo "OK"

#fi

