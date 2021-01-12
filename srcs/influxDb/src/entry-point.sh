#!/bin/sh

rc-service influxdb start &> /dev/null
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf --config-directory /etc/telegraf.conf.d
/usr/sbin/influxd -config /etc/influxdb/influxdb.conf
# influx -execute 'create database influxdb'
tail -f /dev/null