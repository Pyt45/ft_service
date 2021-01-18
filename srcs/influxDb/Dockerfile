FROM alpine:3.12.3

RUN apk update
RUN apk add openrc influxdb supervisor
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
RUN mkdir -p /etc/telegraf
RUN mkdir -p /etc/influxdb
ADD ./src/influxdb.conf /etc/influxdb/influxdb.conf
ADD ./src/telegraf.conf /etc/telegraf/telegraf.conf
ADD ./src/supervisord.conf /etc/
RUN openrc && touch /run/openrc/softlevel

EXPOSE 8086
ENTRYPOINT /usr/bin/supervisord
