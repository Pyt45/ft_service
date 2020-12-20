FROM alpine:latest

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

# install openssl and generate ssl certificate

RUN apk add openssl
RUN yes "" | openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt;

# copy files

ADD ./src/index.html /www/index.html
ADD ./src/run.sh /bin/run.sh
RUN chmod +x /bin/run.sh

# define port

EXPOSE 80
EXPOSE 443
# EXPOSE 22

ENTRYPOINT /bin/run.sh