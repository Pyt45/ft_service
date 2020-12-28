FROM alpine:latest

RUN apk update
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN apk add openrc wget --no-cache
RUN apk add nginx && mkdir /run/nginx

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

RUN apk add php7-common php7-iconv \
    php7-json php7-gd php7-curl php7-xml php7-mysqli \
    php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
    php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom
RUN apk add php7 php7-fpm php7-opcache php7-session php7-mbstring
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl
RUN rc-status
RUN touch /run/openrc/softlevel
# RUN rc-service lighttpd start && rc-update add lighttpd default
# RUN apk add wget php5-mysql mysql mysql-client php5-zlib
# RUN /etc/init.d/lighttpd restart
# RUN mkdir -p /usr/share/webapps/
# RUN cd /usr/share/webapps/
# RUN wget http://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz
# RUN rm latest.tar.gz
# RUN chown -R lighttpd /usr/share/webapps/
# RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
# Config and start MySql
# /usr/bin/mysql_install_db --user=mysql
# /etc/init.d/mariadb start && rc-update add mariadb default
# /usr/bin/mysqladmin -u root password 'password'
# Create the WordPress database
# mysql -u root -p
# CREATE DATABASE wordpress;
# GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'wordpress password';
# FLUSH PRIVILEGES;
# EXIT

# copy files

ADD ./src/index.html /www/index.html
ADD ./src/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

# define port

EXPOSE 80
EXPOSE 443

ENTRYPOINT /usr/bin/run.sh