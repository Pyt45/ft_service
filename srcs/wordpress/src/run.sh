#!/bin/sh
echo "Wordpress Starting..."
/usr/sbin/php-fpm7
rc-service mariadb restart &> /dev/null
nginx -g "daemon off;"