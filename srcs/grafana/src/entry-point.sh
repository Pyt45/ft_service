#!/bin/sh
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf --config-directory /etc/telegraf.conf.d
/grafana/bin/grafana-server --config "/grafana/conf/defaults.ini" -homepath "/grafana"
tail -f /dev/null