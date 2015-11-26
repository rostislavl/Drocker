#!/bin/bash
set -e

if [ ! -f /var/www/$DRUPAL_INSTALL_DIR/www/index.php ]; then

    # Install Drupal.
    drush make -y /var/www/drush.make /var/www/$DRUPAL_INSTALL_DIR/www
    chown -R www-data:www-data /var/www/$DRUPAL_INSTALL_DIR/www
    echo "=========================================================================="
    echo "Drupal codebase successfully installed in /var/www/$DRUPAL_INSTALL_DIR/www"
    echo "=========================================================================="

fi

