# FROM alpine:latest

# RUN apk update
# RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
# RUN apk add openrc wget --no-cache
# RUN apk add nginx && mkdir /run/nginx

# # # setup nginx

# RUN adduser -D -g 'www' www
# RUN mkdir www
# RUN chown -R www:www /var/lib/nginx
# RUN chown -R www:www www
# RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
# COPY ./src/nginx.conf /etc/nginx/nginx.conf

# RUN apk update
# RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl \
#     php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
#     php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

# RUN apk add php7 php7-fpm php7-opcache php7-session php7-mbstring
# RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
# RUN rc-status
# RUN touch /run/openrc/softlevel
# RUN rc-update add nginx default
# RUN apk add php7-gd php7-mysqli php7-zlib php7-curl

# RUN rc-update add php-fpm7 default

# RUN apk add mysql mysql-client
# RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
# RUN rc-update add mariadb default
# # Create database
# ADD ./src/database.sh /usr/bin/
# RUN chmod +x /usr/bin/database.sh
# RUN rc-service mariadb restart && ./usr/bin/database.sh

# # Install wordpress

# RUN cd www/ && wget http://wordpress.org/latest.tar.gz \
#     && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
# RUN cd www/wordpress && rm -f wp-config-sample.php

# ADD ./src/wp-config-sample.php /www/wordpress/wp-config-sample.php

# # copy files

# ADD ./src/index.html /www/index.html
# ADD ./src/run.sh /usr/bin/run.sh
# RUN chmod +x /usr/bin/run.sh

# # define port

# EXPOSE 80

# ENTRYPOINT ./usr/bin/run.sh



FROM    alpine

RUN apk upgrade --available && apk add openrc
RUN apk add nginx && mkdir /run/nginx/ && \ 
    adduser -D -g 'www' www \
    && mkdir www && chown -R www:www /var/lib/nginx && chown -R www:www www

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
ADD ./src/nginx.conf /etc/nginx/nginx.conf
ADD ./src/index.html www/index.html
RUN rc-update add nginx default

RUN apk add mysql mysql-client

RUN apk add wget php7-common php7-fpm php7-opcache php7-session php7-mbstring \
    php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi \
    fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
    php7-ldap php7-ctype php7-dom

RUN rc-status && touch /run/openrc/softlevel

RUN cd www && wget http://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql/
RUN rc-update add mariadb default && rc-update add php-fpm7 default \
    && rc-service php-fpm7 start

ADD ./src/database.sh /usr/bin/
RUN chmod +x /usr/bin/database.sh
RUN rc-service mariadb start && ./usr/bin/database.sh
RUN cd /www/wordpress/ && rm -rf wp-config-sample.php
ADD ./src/wp-config-sample.php /www/wordpress/wp-config-sample.php

ADD ./src/run.sh /usr/bin/
RUN chmod +x /usr/bin/run.sh

EXPOSE    80

ENTRYPOINT ./usr/bin/run.sh