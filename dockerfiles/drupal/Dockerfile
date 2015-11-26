FROM debian:jessie

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -my \
    php5-fpm \
    php5 \
    git \
    curl \
    unzip \
    mc

#--------------------  Install Composer ------------------------------

RUN curl -s https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

#--------------------  Install Drush 7 --------------------------------

RUN composer global require drush/drush:7.* \
    && composer global update \
    && ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

#-------------------- Copy Drush make file ----------------------------

RUN mkdir -p /var/www/default
ADD ./drush.make /var/www

#--------------------  Volume -----------------------------------------

VOLUME ["/var/www/default"]

#--------------------  Entrypoint -------------------------------------

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]