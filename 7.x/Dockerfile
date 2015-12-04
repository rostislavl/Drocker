################################################################################
# Base image
################################################################################

FROM nginx

################################################################################
# Build instructions
################################################################################

# Remove default nginx configs.
RUN rm -f /etc/nginx/conf.d/*

# Install packages
RUN apt-get update && apt-get install -my \
  supervisor \
  curl \
  wget \
  php5-curl \
  php5-fpm \
  php5-gd \
  php5-memcached \
  php5-mysql \
  php5-mcrypt \
  php5-sqlite \
  php5-xdebug \
  php-apc \
  git \
  curl \
  unzip \
  mc

# Ensure that PHP5 FPM is run as root.
RUN sed -i "s/user = www-data/user = root/" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "s/group = www-data/group = root/" /etc/php5/fpm/pool.d/www.conf

# Pass all docker environment
RUN sed -i '/^;clear_env = no/s/^;//' /etc/php5/fpm/pool.d/www.conf

# Get access to FPM-ping page /ping
RUN sed -i '/^;ping\.path/s/^;//' /etc/php5/fpm/pool.d/www.conf
# Get access to FPM_Status page /status
RUN sed -i '/^;pm\.status_path/s/^;//' /etc/php5/fpm/pool.d/www.conf

# Prevent PHP Warning: 'xdebug' already loaded.
# XDebug loaded with the core
RUN sed -i '/.*xdebug.so$/s/^/;/' /etc/php5/mods-available/xdebug.ini

# Install HHVM
#RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
#RUN echo deb http://dl.hhvm.com/debian jessie main | tee /etc/apt/sources.list.d/hhvm.list
#RUN apt-get update && apt-get install -y hhvm

#--------------------  Install Composer ------------------------------

RUN curl -s https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

#--------------------  Install Drush 7 --------------------------------

RUN composer global require drush/drush:7.* \
    && composer global update \
    && ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

#-------------------- Copy Drush make file ----------------------------

RUN mkdir -p -m 777 /var/www/drupal

ADD ./drush.make /var/www

#-------------------- Add configuration files--------------------------

COPY conf/nginx.conf /etc/nginx/
COPY conf/supervisord.conf /etc/supervisor/conf.d/
COPY conf/php.ini /etc/php5/fpm/conf.d/40-custom.ini

#--------------------  Volume -----------------------------------------

VOLUME ["/var/www/drupal", "/etc/nginx/conf.d"]

#--------------------  Install Drupal ---------------------------------

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
#CMD ["/bin/bash", "/start.sh"]
#CMD ["/start.sh"]

#--------------------  Ports -----------------------------------------

EXPOSE 80 443 9000

#--------------------  Entrypoint ------------------------------------

#ENTRYPOINT ["/usr/bin/supervisord"]
ENTRYPOINT ["/entrypoint.sh"]