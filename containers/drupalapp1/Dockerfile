FROM php:5.6-fpm

# Install Git, Composer & Drush (https://www.linode.com/docs/websites/cms/drush-drupal)
RUN apt-get update && apt-get install -y git curl \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install iconv mcrypt mbstring mysql mysqli pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
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
