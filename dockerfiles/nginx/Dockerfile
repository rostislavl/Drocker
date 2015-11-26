# Official build of Nginx https://hub.docker.com/_/nginx/

FROM nginx

RUN apt-get update && apt-get upgrade -y


#-------------------- PHP --------------------------------

RUN apt-get install -my \
    php5-fpm \
    php5-mysql \
    php-apc \
    php5-curl \
    php5-gd \
    pwgen \
    curl \
    git \
    unzip \
    mc

#-------------------- Configs --------------------------------

# Remove default nginx configs.
RUN rm -f /etc/nginx/conf.d/*


#-------------------- Volumes --------------------------------

VOLUME ["/var/www", "/etc/nginx/conf.d"]


