FROM alpine:3.12.3
# update , remove cache to keep the conatiner small and install nginx

RUN apk update
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN apk add openrc supervisor --no-cache
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

# install openssl and generate ssl certificate

RUN apk add openssl
RUN yes "" | openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt;

# Setting up a ssh-server

RUN apk add openssh
RUN rc-status
# RUN mkdir /run/openrc/
RUN mkdir /run/openrc/softlevel
RUN /etc/init.d/sshd start

# Create a user
RUN adduser -D user
RUN echo "user:pass1234" | chpasswd
RUN ssh-keygen -A

# copy files
ADD ./src/index.html /www/index.html
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/supervisord.conf

# define port

EXPOSE 80
EXPOSE 443
EXPOSE 22

ENTRYPOINT ["/usr/bin/supervisord"]
