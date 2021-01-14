FROM alpine:latest
ARG user
# update , remove cache to keep the conatiner small and install nginx

RUN apk update
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN apk add openrc supervisor --no-cache
RUN apk add nginx && mkdir /run/nginx && rc-update add nginx default
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
RUN rc-status
RUN apk add php7-common php7-iconv \
    php7-json php7-gd php7-curl php7-xml php7-mysqli \
    php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
    php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom
RUN apk add php7 php7-fpm php7-opcache php7-session php7-mbstring
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN rc-status
RUN touch /run/openrc/softlevel
# RUN rc-update add nginx default
RUN rc-update add php-fpm7 default

RUN cd www/ && wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz \
    && tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz \
    && rm phpMyAdmin-5.0.4-all-languages.tar.gz \
    && mv phpMyAdmin-5.0.4-all-languages phpmyadmin
ADD ./src/config.sample.inc.php /www/phpmyadmin/config.inc.php
RUN cd /www/phpmyadmin/ && mkdir tmp && chmod 777 tmp
# copy files

ADD ./src/index.html /www/index.html
ADD ./src/test1.php /www/test1.php
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/supervisord.conf
RUN rc-status
RUN touch /run/openrc/softlevel
# RUN /usr/sbin/php-fpm7
RUN rc-service php-fpm7 restart

# define port

EXPOSE 80
EXPOSE 5000

ENTRYPOINT ["/usr/bin/supervisord"]
