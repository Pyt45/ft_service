#!/bin/sh
# /etc/init.d/telegraf start
# SERVICE_IP=`echo $(kubectl get svc nginx | awk '{print $4}' | tr -d 'EXTERNAL-IP')`
# sed -i "s/urls=["http://influxdb_ip:8086"]/urls=["http://$SERVICE_IP:8086"]/g" /etc/telegraf/telegraf.conf
telegraf &> /dev/null
# tail -f /dev/null