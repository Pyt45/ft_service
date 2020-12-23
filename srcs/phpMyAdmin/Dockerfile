FROM alpine:latest
ARG user
# update , remove cache to keep the conatiner small and install nginx

RUN apk update
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN apk add openrc --no-cache
RUN apk add nginx && mkdir /run/nginx
# # setup nginx

RUN adduser -D -g 'www' www
RUN mkdir www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./src/nginx.conf /etc/nginx/nginx.conf
RUN rc-status
RUN apk add lighttpd php7-common php7-iconv \
    php7-json php7-gd php7-curl php7-xml php7-mysqli \
    php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
    php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom
RUN rc-status

RUN apk add mysql mysql-client
RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN rc-status

RUN mkdir -p /usr/share/webapps/ && cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN chmod -R 777 /usr/share/webapps/
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin
RUN rc-status
# copy files

ADD ./src/index.html /www/index.html
ADD ./src/run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

# define port

EXPOSE 80
EXPOSE 5000

ENTRYPOINT /usr/bin/run.sh