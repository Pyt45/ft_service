FROM alpine:latest

RUN apk update
RUN apk add openrc influxdb
RUN mkdir -p /etc/influxdb
# ADD ./src/influxdb.conf /etc/influxdb/influxdb.conf
RUN openrc && touch /run/openrc/softlevel

EXPOSE 8086
ENTRYPOINT /usr/bin/entry-point.sh