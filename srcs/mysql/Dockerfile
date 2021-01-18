FROM alpine:3.12.3

RUN apk update && \
    apk upgrade && \
    apk add openrc supervisor mariadb mariadb-client --no-cache

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir -p /etc/telegraf


RUN openrc && touch /run/openrc/softlevel

ADD ./src/entry-point.sh /usr/bin/entry-point.sh
ADD ./src/create-admin.sh /usr/bin/create-admin.sh
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/supervisord.conf
ADD ./src/wordpress.sql /
RUN chmod +x /usr/bin/entry-point.sh
RUN chmod +x /usr/bin/create-admin.sh

EXPOSE 3306
ENTRYPOINT /usr/bin/entry-point.sh
