#!/bin/bash
/etc/init.d/sshd start
nginx -g 'daemon off;'
