#!/bin/sh
echo "Wordpress Starting..."
rc-service mariadb restart
rc-status
/usr/sbin/php-fpm7
nginx -g "daemon off;"