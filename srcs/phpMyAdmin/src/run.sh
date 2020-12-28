#!/bin/sh
echo "Starting"
/usr/sbin/php-fpm7
nginx -g 'daemon off;'