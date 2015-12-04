FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV PHP_FPM_CONF /etc/php5/fpm/pool.d/www.conf

RUN apt-get update && apt-get -y install \
	php5 \
	php-pear \
	php5-gd \
	php5-sqlite \
	php5-pgsql \
	php5-mysql \
	php5-mcrypt \
	php5-xcache \
	php5-xmlrpc \
	php5-fpm \
    git \
    curl \
    unzip \
    mc

RUN sed -i '/^listen /c listen = 0.0.0.0:9000' $PHP_FPM_CONF && \
    sed -i '/^cgi.fix_pathinfo /c cgi.fix_pathinfo = 0;' $PHP_FPM_CONF && \
    mkdir -p /srv/www && \
    echo "<?php phpinfo(); ?>" > /srv/www/index.php && \
    chown -R www-data:www-data /srv/www && \
    ln -sf /dev/stdout /var/log/php5-fpm.log


CMD ["php5-fpm", "--nodaemonize"]

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

COPY start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/bin/bash", "/start.sh"]


EXPOSE 9000