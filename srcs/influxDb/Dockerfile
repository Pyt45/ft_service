FROM alpine:latest

RUN apk update
RUN apk add openrc influxdb
RUN mkdir -p /etc/influxdb
ADD ./src/influxdb.conf /etc/influxdb/influxdb.conf
RUN openrc && touch /run/openrc/softlevel
ADD ./src/entry-point.sh /usr/bin/entry-point.sh
RUN chmod +x /usr/bin/entry-point.sh

EXPOSE 8086
ENTRYPOINT /usr/bin/entry-point.sh