FROM alpine:latest

RUN apk update
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN apk add openrc supervisor wget --no-cache
RUN apk add nginx && mkdir /run/nginx
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir -p /etc/telegraf
# # setup nginx

RUN adduser -D -g 'www' www
RUN mkdir www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./src/nginx.conf /etc/nginx/nginx.conf

RUN apk update
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN apk add php7 php7-fpm php7-opcache php7-session php7-mbstring
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN rc-status
RUN touch /run/openrc/softlevel
RUN rc-update add nginx default
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl

RUN rc-update add php-fpm7 default

# Install wordpress

RUN cd www/ && wget http://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
RUN cd www/wordpress && rm -f wp-config-sample.php

ADD ./src/wp-config-sample.php /www/wordpress/wp-config.php

# copy files

ADD ./src/index.html /www/index.html
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/supervisord.conf

# define port

EXPOSE 80
EXPOSE 5050

ENTRYPOINT ["/usr/bin/supervisord"]
