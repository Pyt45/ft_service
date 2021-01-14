#!/bin/sh
if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
    echo "------------INSTALL------------"
    /etc/init.d/mariadb setup &> /dev/null
    #/usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
    echo "------------SETUP  ------------"
    rc-service mariadb restart &> /dev/null
    /usr/bin/create-admin.sh &> /dev/null
    mysql -u root < /wordpress.sql
    echo "Done"
fi
sed -i "s/skip-networking/#skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart &> /dev/null
/usr/bin/supervisord
