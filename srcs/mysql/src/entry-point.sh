#!/bin/sh

# echo "create user admin@localhost identified by 'admin';" | mysql -u root
# echo "grant all privileges on *.* to admin@localhost;" | mysql -u root
# echo "flush privileges;" | mysql -u root
# echo "quit" | mysql -u root
# ib_buffer_pool
# mkdir -p /run/mysqld
# mkdir -p /var/lib/mysql

# if [ ! -d /var/lib/mysql/mysql ]
# then
#     echo '-----------INSTALL-----------'
#    /usr/bin/mysql_install_db --user=admin --datadir=/var/lib/mysql

#     echo '-----------SETUP-----------'
#     /usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql --bootstrap <<EOF
# CREATE DATABASE wordpress;
# CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';
# FLUSH PRIVILEGES;
# EXIT
# EOF

#     # echo '-----------SETUP WORDPRESS-----------'
#     # /usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql --bootstrap < /wordpress.sql
# fi

# echo '-----------DEAMON-----------'
# exec /usr/bin/mysqld --user=admin --datadir=/var/lib/mysql

# mkdir -p /var/lib/mysql /var/run/mysqld
# chown -R mysql:mysql /var/lib/mysql /var/run/mysqld


# mkdir -p /run/mysqld
# mkdir -p /var/lib/mysql
if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
    echo "------------INSTALL------------"
    /etc/init.d/mariadb setup &> /dev/null
    #/usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql
    echo "------------SETUP  ------------"
    rc-service mariadb restart &> /dev/null
    /usr/bin/create-admin.sh &> /dev/null
    echo "Done"
fi
sed -i "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s/skip-networking/#skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf --config-directory /etc/telegraf.conf.d
rc-service mariadb restart &> /dev/null
tail -f /dev/null
