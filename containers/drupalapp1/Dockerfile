FROM php:5.6-fpm

# Install Git, Composer & Drush (https://www.linode.com/docs/websites/cms/drush-drupal)
RUN apt-get update && apt-get install -y git curl \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && ln -s /usr/local/bin/composer /usr/bin/composer \
    && git clone https://github.com/drush-ops/drush.git /usr/local/src/drush \
    && cd /usr/local/src/drush \
    && git checkout 7.1.0 \
    && ln -s /usr/local/src/drush/drush /usr/bin/drush \
    && composer update \
    && composer install

COPY ./drush.make /var/www/
COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
