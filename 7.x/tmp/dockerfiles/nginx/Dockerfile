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

RUN sed -i 's/^listen.owner =.*$/listen.owner = nginx/g' /etc/php5/fpm/pool.d/www.conf && \
	sed -i 's/^listen.group =.*$/listen.group = nginx/g' /etc/php5/fpm/pool.d/www.conf && \
	sed -i 's/^;listen.mode =.*$/listen.mode = 0660/g' /etc/php5/fpm/pool.d/www.conf


#-------------------- Volumes --------------------------------

VOLUME ["/var/www", "/etc/nginx/conf.d", "/var/log/nginx"]

RUN service php5-fpm restart
RUN service nginx stop
CMD ["nginx", "-g", "daemon off;"]
