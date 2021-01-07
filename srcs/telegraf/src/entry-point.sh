#!/bin/sh
# /etc/init.d/telegraf start
ip=``
/telegraf/usr/bin/telegraf &> /dev/null
tail -f /dev/null